Imports Profiles.Contracts.ServiceContracts
Imports Profiles.Contracts.DataContracts
Imports System.Data.SqlClient
Imports System.Transactions

Public Class SpeciesMaintenanceService
    Implements ISpeciesMaintenanceService

    Public Function GetSpeciesValidParents(ByVal request As GetSpeciesValidParentsRequest) As List(Of SpeciesValidParent) Implements ISpeciesMaintenanceService.GetSpeciesValidParents

        Dim result As New List(Of SpeciesValidParent)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgSpeciesValidParents"
                getCommand.Parameters.AddWithValue("@SpeciesId", request.SpeciesId)
                Using reader As New Data.SafeDataReader(getCommand.ExecuteReader)
                    While reader.Read
                        result.Add(New SpeciesValidParent(reader.GetGuid(0), reader.GetString(1)))
                    End While
                End Using
            End Using
        End Using

        Return result

    End Function

    Public Function GetSpeciesAuditTrail() As List(Of SpeciesAuditTrailEntry) Implements ISpeciesMaintenanceService.GetSpeciesAuditTrail

        Dim result As New List(Of SpeciesAuditTrailEntry)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()
            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgaSpeciesTableAuditLog"

                Using reader As New Data.SafeDataReader(getCommand.ExecuteReader)
                    While reader.Read
                        result.Add(New SpeciesAuditTrailEntry With { _
                                  .Id = reader.GetGuid(0), _
                        .User = reader.GetString(1), _
                        .EffectiveDate = reader.GetDateTime(2), _
                        .LogDate = reader.GetDateTime(3), _
                        .ReasonForChange = reader.GetString(4), _
                        .OldName = reader.GetString(5), _
                        .NewName = reader.GetString(6), _
                        .OldParent = reader.GetString(7), _
                        .NewParent = reader.GetString(8) _
                                   })
                    End While
                End Using
            End Using
        End Using

        Return result

    End Function

    Public Sub ChangeSpeciesPosition(ByVal request As ChangeSpeciesPositionRequest) Implements ISpeciesMaintenanceService.ChangeSpeciesPosition

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using updateCommand As SqlCommand = connection.CreateCommand
                updateCommand.CommandType = CommandType.StoredProcedure
                updateCommand.CommandText = "spuSpeciesSequenceNumber"
                updateCommand.Parameters.AddWithValue("@SpeciesId", request.SpeciesId)
                updateCommand.Parameters.AddWithValue("@IsMovingUp", request.IsMovingUp)
                updateCommand.ExecuteNonQuery()
            End Using
        End Using

    End Sub

    Public Function GetSpeciesDetail(ByVal request As GetSpeciesDetailRequest) As SpeciesDetail Implements ISpeciesMaintenanceService.GetSpeciesDetail

        Dim result As SpeciesDetail = Nothing

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgSpeciesById"
                getCommand.Parameters.AddWithValue("@SpeciesId", request.SpeciesId)
                Using reader As New Data.SafeDataReader(getCommand.ExecuteReader)
                    If reader.Read() Then
                        result = New SpeciesDetail With {
                            .Name = reader.GetString(0),
                            .ParentId = reader.GetGuid(1),
                            .IsActive = reader.GetBoolean(2),
                            .IsInUse = reader.GetBoolean(3),
                            .ChildCount = reader.GetInt32(4),
                            .ActiveChildCount = reader.GetInt32(5),
                            .ParentName = reader.GetString(7)
                        }
                        reader.GetBytes("LastUpdated", 0, result.LastUpdated, 0, 8)
                    End If
                End Using
            End Using
        End Using

        Return result

    End Function

    Public Sub UpdateSpecies(ByVal request As Contracts.DataContracts.SpeciesChange) Implements Contracts.ServiceContracts.ISpeciesMaintenanceService.UpdateSpecies

        Dim storedProcName As String = String.Empty

        Select Case request.Action
            Case ChangeActionType.Add
                storedProcName = "spiSpecies"
            Case ChangeActionType.Delete
                storedProcName = "spdSpecies"
            Case ChangeActionType.Edit
                storedProcName = "spuSpecies"
            Case ChangeActionType.Inactivate
                storedProcName = "sppSpecies"
        End Select

        Using transaction As New TransactionScope

            Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
                connection.Open()

                Using speciesCommand As SqlCommand = connection.CreateCommand
                    speciesCommand.CommandType = CommandType.StoredProcedure
                    speciesCommand.CommandText = storedProcName
                    speciesCommand.Parameters.AddWithValue("@SpeciesId", request.Id)
                    speciesCommand.Parameters.AddWithValue("@UserId", request.UserId)
                    speciesCommand.Parameters.AddWithValue("@Reason", request.ReasonForChange)

                    If request.Action = ChangeActionType.Add OrElse request.Action = ChangeActionType.Edit Then
                        If request.ParentId = Guid.Empty Then
                            speciesCommand.Parameters.AddWithValue("@ParentId", System.DBNull.Value)
                        Else
                            speciesCommand.Parameters.AddWithValue("@ParentId", request.ParentId)
                        End If
                        speciesCommand.Parameters.AddWithValue("@Name", request.Name)
                    End If

                    If request.Action <> ChangeActionType.Add Then
                        speciesCommand.Parameters.AddWithValue("@LastUpdated", request.LastUpdated)
                    End If

                    speciesCommand.ExecuteNonQuery()
                End Using
            End Using
            transaction.Complete()
        End Using

    End Sub

End Class
