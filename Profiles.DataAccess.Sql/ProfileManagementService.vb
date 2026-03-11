Imports Profiles.Contracts.ServiceContracts
Imports Profiles.Contracts.DataContracts
Imports System.Data.SqlClient
Imports System.Transactions

Public Class ProfileManagementService
    Implements IProfileManagementService

#Region "Delete Profile Version"

    Public Function DeleteProfileVersion(ByVal request As DeleteProfileVersionRequest) As DeleteProfileVersionResponse Implements IProfileManagementService.DeleteProfileVersion

        Dim result As New DeleteProfileVersionResponse

        Using transaction As New TransactionScope

            Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
                connection.Open()

                RemoveAffectedSpecies(request, connection)
                DeleteVersion(request, connection, result)

            End Using
            transaction.Complete()
        End Using

        Return result

    End Function

    Private Function GetAffectedSpeciesForDeletion(ByVal request As DeleteProfileVersionRequest, ByVal connection As SqlConnection) As List(Of Guid)

        Dim affectedSpecies As New List(Of Guid)

        Using getCommand As SqlCommand = connection.CreateCommand
            getCommand.CommandType = CommandType.StoredProcedure
            getCommand.CommandText = "spgProfileVersionInfoById"
            getCommand.Parameters.AddWithValue("@Id", request.ProfileVersionId)

            Using reader As New Data.SafeDataReader(getCommand.ExecuteReader)
                If Not reader.Read() Then
                    Throw New InvalidOperationException("You cannot delete this profile version because it does not exist. Another user may have altered the profile.")
                End If
                If reader.NextResult() Then
                    While reader.Read()
                        affectedSpecies.Add(reader.GetGuid(0))
                    End While
                End If
            End Using
        End Using

        Return affectedSpecies

    End Function

    Private Sub RemoveAffectedSpecies(ByVal request As DeleteProfileVersionRequest, ByVal connection As SqlConnection)

        Dim affectedSpecies As List(Of Guid) = GetAffectedSpeciesForDeletion(request, connection)

        Using deleteAffectedSpeciesCommand As SqlCommand = connection.CreateCommand
            deleteAffectedSpeciesCommand.CommandType = CommandType.StoredProcedure
            deleteAffectedSpeciesCommand.CommandText = "spdProfileVersionSpecies"
            deleteAffectedSpeciesCommand.Parameters.AddWithValue("@ProfileVersionId", request.ProfileVersionId)
            Dim speciesParameter As SqlParameter = deleteAffectedSpeciesCommand.Parameters.Add("@SpeciesId", SqlDbType.UniqueIdentifier)
            For Each speciesId As Guid In affectedSpecies
                speciesParameter.Value = speciesId
                deleteAffectedSpeciesCommand.ExecuteNonQuery()
            Next
        End Using

    End Sub

    Private Sub DeleteVersion(ByVal request As DeleteProfileVersionRequest, ByVal connection As SqlConnection, ByVal result As DeleteProfileVersionResponse)

        'delete the profile version
        Using deleteProfileVersionCommand As SqlCommand = connection.CreateCommand
            deleteProfileVersionCommand.CommandType = CommandType.StoredProcedure
            deleteProfileVersionCommand.CommandText = "spdProfileVersion"
            deleteProfileVersionCommand.Parameters.AddWithValue("@ProfileVersionId", request.ProfileVersionId)
            Dim nextLatestId As New SqlParameter("@NextLatestProfileVersionId", SqlDbType.UniqueIdentifier)
            nextLatestId.Direction = ParameterDirection.Output
            deleteProfileVersionCommand.Parameters.Add(nextLatestId)
            Dim isProfileDeleted As New SqlParameter("@ProfileDeleted", SqlDbType.Bit)
            isProfileDeleted.Direction = ParameterDirection.Output
            deleteProfileVersionCommand.Parameters.Add(isProfileDeleted)
            deleteProfileVersionCommand.ExecuteNonQuery()
            If Not TypeOf deleteProfileVersionCommand.Parameters("@NextLatestProfileVersionId").Value Is DBNull Then
                result.NextLatestProfileVersionId = CType(deleteProfileVersionCommand.Parameters("@NextLatestProfileVersionId").Value, Guid)
            End If
            result.IsProfileDeleted = CType(deleteProfileVersionCommand.Parameters("@ProfileDeleted").Value, Boolean)
        End Using

    End Sub

#End Region

    Public Function CreateNewProfileVersion(ByVal request As NewProfileVersionRequest) As NewProfileVersionResponse Implements IProfileManagementService.CreateNewProfileVersion

        Dim newVersion As New NewProfileVersionCommand(request)
        Return New NewProfileVersionResponse(newVersion.NewProfileVersionId)

    End Function

    Public Function GetProfileAttributes(ByVal request As GetProfileAttributesRequest) As ProfileAttributes Implements IProfileManagementService.GetProfileAttributes

        Dim result As New ProfileAttributes

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgProfile"
                getCommand.Parameters.AddWithValue("@ProfileId", request.ProfileId)

                Using reader As New Data.SafeDataReader(getCommand.ExecuteReader)

                    'get profile information
                    While reader.Read()
                        result.Id = reader.GetGuid(0)
                        result.Title = reader.GetString(1)
                        result.ScenarioTitle = reader.GetString(2)
                        result.ParentId = reader.GetGuid(3)
                        result.ParentTitle = reader.GetString(4)
                        result.CurrentDraftProfileVersionId = reader.GetGuid(5)
                        result.CurrentPublishedProfileVersionId = reader.GetGuid(6)
                        result.CurrentPublicVersionId = reader.GetGuid(7)
                        result.HasPublicScenarios = reader.GetBoolean(8)
                        result.ProfileStatusId = reader.GetGuid(9)
                        reader.GetBytes("LastUpdated", 0, result.LastUpdated, 0, 8)
                    End While

                    'get list of affected species
                    If reader.NextResult() Then
                        While reader.Read()
                            result.AffectedSpeciesList.Add(New AffectedSpecies With { _
                                .SpeciesId = reader.GetGuid(0), _
                                .Name = reader.GetString(1), _
                                .Type = reader.GetString(2), _
                                .IsActive = reader.GetBoolean(3) _
                            })
                        End While
                    End If

                End Using

            End Using 'getCommand

        End Using ' connection

        Return result

    End Function

    Public Function GetNewProfileDefaults(ByVal request As GetNewProfileDefaultsRequest) As NewProfileDefaults Implements IProfileManagementService.GetNewProfileDefaults

        Dim result As New NewProfileDefaults

        'read in default title and affected species from the cloned profile version
        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgProfileVersionInfoById"
                getCommand.Parameters.AddWithValue("@Id", request.CloneProfileVersionId)

                Using reader As New Data.SafeDataReader(getCommand.ExecuteReader)

                    'title information
                    While reader.Read()
                        result.ScenarioTitle = reader.GetString(9)
                        result.ProfileStatusId = reader.GetGuid(12)
                        If request.IsWhatIfScenario Then
                            'set the current situation profile id to which this new scenario will belong.
                            'If the clone profile version belongs to a scenario, then the new scenario
                            'will belong to the same current situation profile as the cloned version.
                            result.ParentId = reader.GetGuid(10)
                            'If the clone profile version doesn't belong to a scenario, then the new
                            'scenario will belong to the current situation profile to which the cloned version
                            'belongs.
                            If result.ParentId.Equals(Guid.Empty) Then
                                result.ParentId = reader.GetGuid(1)
                            End If
                            result.ParentTitle = reader.GetString(2)
                        Else
                            result.Title = reader.GetString(2)
                        End If
                    End While

                    'affected species information
                    If reader.NextResult() Then
                        While reader.Read()
                            result.AffectedSpeciesList.Add(New AffectedSpecies With { _
                                .SpeciesId = reader.GetGuid(0), _
                                .Name = reader.GetString(1), _
                                .Type = reader.GetString(2), _
                                .IsActive = reader.GetBoolean(3) _
                            })
                        End While
                    End If

                End Using

            End Using 'getCommand

        End Using ' connection

        Return result

    End Function

    Public Function CreateProfile(ByVal request As CreateProfileRequest) As CreateProfileResponse Implements IProfileManagementService.CreateProfile

        Dim result As New CreateProfileResponse

        Using transaction As New TransactionScope

            Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
                connection.Open()

                Using createProfileCommand As SqlCommand = connection.CreateCommand
                    createProfileCommand.CommandType = CommandType.StoredProcedure
                    createProfileCommand.CommandText = "spiProfile"
                    createProfileCommand.Parameters.AddWithValue("@ProfileId", request.Id)
                    If Not request.ParentId.Equals(Guid.Empty) Then
                        createProfileCommand.Parameters.AddWithValue("@ParentId", request.ParentId)
                    End If
                    If request.Title.Length > 0 Then
                        createProfileCommand.Parameters.AddWithValue("@Title", request.Title)
                    End If
                    If request.ScenarioTitle.Length > 0 Then
                        createProfileCommand.Parameters.AddWithValue("@ScenarioTitle", request.ScenarioTitle)
                    End If
                    If request.ProfileStatusId <> Guid.Empty Then
                        createProfileCommand.Parameters.AddWithValue("@ProfileStatusId", request.ProfileStatusId)
                    End If

                    Dim output As New SqlParameter("@NewLastUpdated", SqlDbType.Timestamp)
                    output.Direction = ParameterDirection.Output
                    createProfileCommand.Parameters.Add(output)
                    createProfileCommand.ExecuteNonQuery()

                    result.NewProfileId = request.Id
                    result.NewLastUpdated = CType(createProfileCommand.Parameters("@NewLastUpdated").Value, Byte())
                End Using

                Using createProfileVersionCommand As SqlCommand = connection.CreateCommand
                    createProfileVersionCommand.CommandType = CommandType.StoredProcedure
                    createProfileVersionCommand.CommandText = "spiProfileVersion"
                    createProfileVersionCommand.Parameters.AddWithValue("@ProfileVersionId", request.CurrentDraftProfileVersionId)
                    createProfileVersionCommand.Parameters.AddWithValue("@ProfileId", request.Id)
                    If request.ParentId.Equals(Guid.Empty) Then
                        createProfileVersionCommand.Parameters.AddWithValue("@Title", request.Title)
                    Else
                        createProfileVersionCommand.Parameters.AddWithValue("@Title", request.ParentTitle)
                    End If
                    If request.ScenarioTitle.Length > 0 Then
                        createProfileVersionCommand.Parameters.AddWithValue("@ScenarioTitle", request.ScenarioTitle)
                    End If
                    createProfileVersionCommand.Parameters.AddWithValue("@VersionMajor", 0)
                    createProfileVersionCommand.Parameters.AddWithValue("@VersionMinor", 1)
                    createProfileVersionCommand.Parameters.AddWithValue("@State", "Draft")
                    createProfileVersionCommand.Parameters.AddWithValue("@EffectiveDateFrom", DateTime.Now())
                    If request.CloneProfileVersionId.Equals(Guid.Empty) Then
                        createProfileVersionCommand.Parameters.AddWithValue("@CloneProfileVersionId", DBNull.Value)
                    Else
                        createProfileVersionCommand.Parameters.AddWithValue("@CloneProfileVersionId", request.CloneProfileVersionId)
                    End If
                    createProfileVersionCommand.Parameters.AddWithValue("@IsPublic", False) 'Default profile to non-public
                    createProfileVersionCommand.ExecuteNonQuery()
                End Using

                For Each speciesInsert As AffectedSpeciesInsert In request.AffectedSpeciesInsertList
                    InsertAffectedSpecies(speciesInsert, connection)
                Next

            End Using
            transaction.Complete()
        End Using

        Return result

    End Function

    Private Sub InsertAffectedSpecies(ByVal speciesInsert As AffectedSpeciesInsert, ByVal connection As SqlConnection)

        Using insertAffectedSpeciesCommand As SqlCommand = connection.CreateCommand
            insertAffectedSpeciesCommand.CommandType = CommandType.StoredProcedure
            insertAffectedSpeciesCommand.CommandText = "spiProfileVersionSpecies"
            insertAffectedSpeciesCommand.Parameters.AddWithValue("@ProfileVersionId", speciesInsert.ProfileVersionId)
            If speciesInsert.CloneProfileVersionId.Equals(Guid.Empty) Then
                insertAffectedSpeciesCommand.Parameters.AddWithValue("@CloneProfileVersionId", DBNull.Value)
            Else
                insertAffectedSpeciesCommand.Parameters.AddWithValue("@CloneProfileVersionId", speciesInsert.CloneProfileVersionId)
            End If
            insertAffectedSpeciesCommand.Parameters.AddWithValue("@SpeciesId", speciesInsert.SpeciesId)
            insertAffectedSpeciesCommand.Parameters.AddWithValue("@AffectedSpeciesTypeName", speciesInsert.Type)
            insertAffectedSpeciesCommand.ExecuteNonQuery()
        End Using

        'Here, we copy in the trade data from the species table into the profile version for the newly added species
        'if the affected species is Profiled
        'This is not the same as when we create new profile versions (see NewProfileVersionCommand)
        If speciesInsert.Type = "Profiled" Then
            Using updateSpeciesTradeDataCommand As SqlCommand = connection.CreateCommand
                updateSpeciesTradeDataCommand.CommandType = CommandType.StoredProcedure
                updateSpeciesTradeDataCommand.CommandText = "spuProfileVersionSpeciesTradeData"
                updateSpeciesTradeDataCommand.Parameters.AddWithValue("@ProfileVersionId", speciesInsert.ProfileVersionId)
                updateSpeciesTradeDataCommand.Parameters.AddWithValue("@SpeciesId", speciesInsert.SpeciesId)
                updateSpeciesTradeDataCommand.ExecuteNonQuery()
            End Using
        End If

    End Sub

    Public Function UpdateProfileAttributes(ByVal request As UpdateProfileAttributesRequest) As UpdateProfileAttributesResponse Implements IProfileManagementService.UpdateProfileAttributes

        Dim result As New UpdateProfileAttributesResponse

        Using transaction As New TransactionScope

            Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
                connection.Open()

                Using updateCommand As SqlCommand = connection.CreateCommand

                    'update the profile
                    updateCommand.CommandType = CommandType.StoredProcedure
                    updateCommand.CommandText = "spuProfile"
                    updateCommand.Parameters.AddWithValue("@ProfileId", request.Id)
                    If request.Title.Length > 0 Then
                        updateCommand.Parameters.AddWithValue("@Title", request.Title)
                    Else
                        updateCommand.Parameters.AddWithValue("@Title", DBNull.Value)
                    End If
                    If request.ScenarioTitle.Length > 0 Then
                        updateCommand.Parameters.AddWithValue("@ScenarioTitle", request.ScenarioTitle)
                    Else
                        updateCommand.Parameters.AddWithValue("@ScenarioTitle", DBNull.Value)
                    End If
                    updateCommand.Parameters.AddWithValue("@LastUpdated", request.LastUpdated)
                    Dim output As New SqlParameter("@NewLastUpdated", SqlDbType.Timestamp)
                    output.Direction = ParameterDirection.Output
                    updateCommand.Parameters.Add(output)
                    updateCommand.ExecuteNonQuery()
                    result.NewLastUpdated = CType(updateCommand.Parameters("@NewLastUpdated").Value, Byte())

                End Using

                'then update the affected species
                For Each speciesDelete As AffectedSpeciesDelete In request.AffectedSpeciesDeleteList
                    DeleteAffectedSpecies(speciesDelete, connection)
                Next

                For Each speciesInsert As AffectedSpeciesInsert In request.AffectedSpeciesInsertList
                    InsertAffectedSpecies(speciesInsert, connection)
                Next

            End Using 'connection

            transaction.Complete()
        End Using

        Return result

    End Function

    Private Sub DeleteAffectedSpecies(ByVal speciesDelete As AffectedSpeciesDelete, ByVal connection As SqlConnection)

        Using deleteAffectedSpeciesCommand As SqlCommand = connection.CreateCommand
            deleteAffectedSpeciesCommand.CommandType = CommandType.StoredProcedure
            deleteAffectedSpeciesCommand.CommandText = "spdProfileVersionSpecies"
            deleteAffectedSpeciesCommand.Parameters.AddWithValue("@ProfileVersionId", speciesDelete.ProfileVersionId)
            deleteAffectedSpeciesCommand.Parameters.AddWithValue("@SpeciesId", speciesDelete.SpeciesId)
            deleteAffectedSpeciesCommand.ExecuteNonQuery()
        End Using

    End Sub

    Public Function GetAffectedSpecies(ByVal request As GetAffectedSpeciesRequest) As AffectedSpecies Implements IProfileManagementService.GetAffectedSpecies

        Dim result As AffectedSpecies = Nothing

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgSpeciesNameById"
                getCommand.Parameters.AddWithValue("@SpeciesId", request.SpeciesId)

                Using reader As New Data.SafeDataReader(getCommand.ExecuteReader)
                    While reader.Read()
                        result = New AffectedSpecies With { _
                            .Name = reader.GetString(1), _
                            .IsActive = reader.GetBoolean(2) _
                        }
                    End While
                End Using 'reader

            End Using 'getCommand

        End Using 'connection

        Return result

    End Function

    Public Function GetProfileStatusTypes() As System.Collections.Generic.List(Of Contracts.DataContracts.ProfileStatusType) Implements Contracts.ServiceContracts.IProfileManagementService.GetProfileStatusTypes

        Dim dtoProfileStatusTypeList As New List(Of ProfileStatusType)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgaProfileStatusType"

                Using reader As New Data.SafeDataReader(getCommand.ExecuteReader)
                    While reader.Read()

                        Dim dtoProfileStatusType As New ProfileStatusType With { _
                        .Id = reader.GetGuid(0), _
                        .Name = reader.GetString(1), _
                        .IsValidationComplete = reader.GetBoolean(2) _
                        }

                        dtoProfileStatusTypeList.Add(dtoProfileStatusType)

                    End While
                End Using 'reader

            End Using 'getCommand

        End Using 'connection

        Return dtoProfileStatusTypeList

    End Function

    Public Sub SetProfileVersionPublicAccess(ByVal request As Contracts.DataContracts.SetProfileVersionPublicAccessRequest) Implements Contracts.ServiceContracts.IProfileManagementService.SetProfileVersionPublicAccess

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()
            Using setProfileVersionPublicAccess As SqlCommand = connection.CreateCommand
                setProfileVersionPublicAccess.CommandType = CommandType.StoredProcedure
                setProfileVersionPublicAccess.CommandText = "spuProfileVersionPublicFlag"
                setProfileVersionPublicAccess.Parameters.AddWithValue("@ProfileVersionId", request.ProfileVersionId)
                setProfileVersionPublicAccess.ExecuteNonQuery()
            End Using
        End Using

    End Sub

    Public Sub UpdateProfileStatus(ByVal request As Contracts.DataContracts.UpdateProfileStatusRequest) Implements Contracts.ServiceContracts.IProfileManagementService.UpdateProfileStatus

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()
            Using command As SqlCommand = connection.CreateCommand
                command.CommandType = CommandType.StoredProcedure
                command.CommandText = "spuProfileStatus"
                command.Parameters.AddWithValue("@ProfileId", request.ProfileId)
                command.Parameters.AddWithValue("@ProfileStatusId", request.ProfileStatusId)
                command.ExecuteNonQuery()
            End Using
        End Using

    End Sub

End Class
