Imports Profiles.Contracts.ServiceContracts
Imports Profiles.Contracts.DataContracts
Imports System.Data.SqlClient
Imports System.Transactions

Public Class UserMaintenanceService
    Implements IUserMaintenanceService

    Public Function VerifyDatabaseUser(ByVal request As VerifyDatabaseUserRequest) As UserVerification Implements IUserMaintenanceService.VerifyDatabaseUser

        Dim result As UserVerification = Nothing

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgUserAuthorisation"
                getCommand.Parameters.AddWithValue("@UserName", request.UserName)
                Using reader As New Data.SafeDataReader(getCommand.ExecuteReader)
                    While reader.Read()
                        result = New UserVerification
                        result.UserId = reader.GetGuid(0)
                        result.FullName = reader.GetString(1)
                        result.Organisation = reader.GetString(2)
                        result.IsSsoUser = Not reader.GetGuid(6).Equals(Guid.Empty)
                        result.IsUserManagementSystem = reader.GetBoolean(7)
                    End While
                End Using
            End Using
        End Using

        Return result

    End Function

    Public Function GetSsoMaintenance() As Contracts.DataContracts.SsoUserMaintenance Implements Contracts.ServiceContracts.IUserMaintenanceService.GetSsoUserMaintenance

        Dim dtoSsoMaintenance As New SsoUserMaintenance

        Dim userDictionary As New Dictionary(Of Guid, SsoUser)
        Dim userProfileDictionary As New Dictionary(Of String, SsoUserProfile)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgaSsoUserMaintenance"

                Using reader As New Data.SafeDataReader(getCommand.ExecuteReader)

                    While reader.Read()
                        Dim dtoSsoUser As New SsoUser()

                        With dtoSsoUser
                            .Id = reader.GetGuid(0)
                            .UserName = reader.GetString(1)
                            .FullName = reader.GetString(2)
                            .EmailAddress = reader.GetString(3)
                            .Organisation = reader.GetString(4)
                            .SubscribedToEmails = reader.GetBoolean(5)
                            .SsoUserId = reader.GetGuid(6)
                            reader.GetBytes("LastUpdated", 0, .LastUpdated, 0, 8)
                        End With

                        dtoSsoMaintenance.SsoUserList.Add(dtoSsoUser)
                        userDictionary.Add(dtoSsoUser.Id, dtoSsoUser)

                    End While

                    If reader.NextResult() Then

                        While reader.Read()

                            Dim dtoSsoProfile As New SsoProfile With { _
                            .Id = reader.GetGuid(0), _
                            .Title = reader.GetString(1) _
                            }
                            dtoSsoMaintenance.SsoProfileList.Add(dtoSsoProfile)

                        End While

                    End If

                    If reader.NextResult() Then

                        While reader.Read()

                            Dim dtoSsoProfile As New SsoUserProfile With { _
                            .UserId = reader.GetGuid(0), _
                            .ProfileId = reader.GetGuid(1), _
                            .Title = reader.GetString(2), _
                            .RoleId = reader.GetGuid(3), _
                            .RoleName = reader.GetString(4), _
                            .IsContributor = reader.GetBoolean(5) _
                            }

                            userDictionary(dtoSsoProfile.UserId).SsoUserProfileList.Add(dtoSsoProfile)
                            userProfileDictionary.Add(dtoSsoProfile.UserId.ToString().ToLower() & dtoSsoProfile.ProfileId.ToString().ToLower(), dtoSsoProfile)

                        End While

                    End If

                    If reader.NextResult() Then

                        While reader.Read()

                            Dim userId As Guid = reader.GetGuid(0)
                            Dim profileId As Guid = reader.GetGuid(1)
                            Dim sectionId As Guid = reader.GetGuid(2)
                            userProfileDictionary(userId.ToString().ToLower() & profileId.ToString().ToLower()).SectionPermissions.Add(sectionId)
                        End While

                    End If

                End Using

            End Using

        End Using

        Return dtoSsoMaintenance
    End Function

    Public Sub UpdateSsoUser(ByVal request As SsoUserDetailUpdate) Implements IUserMaintenanceService.UpdateSsoUser

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using updateCommand As SqlCommand = connection.CreateCommand
                updateCommand.CommandType = CommandType.StoredProcedure
                updateCommand.CommandText = "spiSsoUser"
                updateCommand.Parameters.AddWithValue("@UserName", request.UserName)
                updateCommand.Parameters.AddWithValue("@FullName", request.FullName)
                updateCommand.Parameters.AddWithValue("@EmailAddress", request.Email)
                updateCommand.Parameters.AddWithValue("@Organisation", request.Organisation)
                updateCommand.Parameters.AddWithValue("@SubscribedToEmails", request.SubscribedToEmails)
                updateCommand.Parameters.AddWithValue("@SsoUserId", request.SsoUserId)
                updateCommand.ExecuteNonQuery()
            End Using
        End Using

    End Sub

    Public Sub DeleteSsoUser(ByVal request As SsoUserDetailDelete) Implements IUserMaintenanceService.DeleteSsoUser

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using deleteCommand As SqlCommand = connection.CreateCommand
                deleteCommand.CommandType = CommandType.StoredProcedure
                deleteCommand.CommandText = "spdSsoUser"
                deleteCommand.Parameters.AddWithValue("@SsoUserId", request.SsoUserId)
                deleteCommand.ExecuteNonQuery()
            End Using
        End Using

    End Sub

    Public Function GetProfileUserRoles() As List(Of ProfileUserRole) Implements IUserMaintenanceService.GetProfileUserRoles

        Dim result As New List(Of ProfileUserRole)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgaluProfileUserRole"

                Using reader As New Data.SafeDataReader(getCommand.ExecuteReader)
                    While reader.Read
                        result.Add(New ProfileUserRole() With { _
                            .Id = reader.GetGuid(0), _
                            .RoleName = reader.GetString(1), _
                            .IsContributor = reader.GetBoolean(2) _
                        })
                    End While
                End Using
            End Using
        End Using

        Return result

    End Function

    Public Function GetProfileContributors(ByVal request As GetProfileContributorsRequest) As List(Of ProfileContributor) Implements IUserMaintenanceService.GetProfileContributors

        Dim contributorDictionary As New Dictionary(Of Guid, ProfileContributor)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgProfileContributorsByProfileId"
                getCommand.Parameters.AddWithValue("@ProfileId", request.ProfileId)
                Using reader As New Data.SafeDataReader(getCommand.ExecuteReader)
                    While reader.Read()

                        Dim contributor As New ProfileContributor() With { _
                            .Id = reader.GetGuid(0), _
                            .UserName = reader.GetString(1), _
                            .FullName = reader.GetString(2), _
                            .Organisation = reader.GetString(3), _
                            .RoleId = reader.GetGuid(4), _
                            .Role = reader.GetString(5), _
                            .IsContributor = reader.GetBoolean(6), _
                            .IsSsoUser = Not reader.GetGuid(7).Equals(Guid.Empty) _
                        }
                        reader.GetBytes("LastUpdated", 0, contributor.LastUpdated, 0, 8)
                        contributorDictionary.Add(contributor.Id, contributor)
                    End While

                    If reader.NextResult() Then
                        While reader.Read()
                            contributorDictionary(reader.GetGuid(0)).SectionPermissions.Add(reader.GetGuid(1))
                        End While
                    End If

                End Using
            End Using
        End Using

        Return contributorDictionary.Values.ToList()

    End Function

    Public Function GetProfileContributor(ByVal request As GetProfileContributorRequest) As ProfileContributor Implements IUserMaintenanceService.GetProfileContributor

        Dim contributor As ProfileContributor
        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgContributor"
                getCommand.Parameters.AddWithValue("@UserId", request.UserId)
                getCommand.Parameters.AddWithValue("@ProfileId", request.ProfileId)
                Using reader As New Data.SafeDataReader(getCommand.ExecuteReader)
                    If reader.Read() Then
                        contributor = New ProfileContributor With { _
                            .Id = reader.GetGuid(0), _
                            .UserName = reader.GetString(1), _
                            .FullName = reader.GetString(2), _
                            .Organisation = reader.GetString(3), _
                            .RoleId = reader.GetGuid(4), _
                            .Role = reader.GetString(5), _
                            .IsContributor = reader.GetBoolean(6), _
                            .IsSsoUser = Not reader.GetGuid(7).Equals(Guid.Empty) _
                        }
                        reader.GetBytes("LastUpdated", 0, contributor.LastUpdated, 0, 8)

                        If reader.NextResult() Then
                            While reader.Read()
                                contributor.SectionPermissions.Add(reader.GetGuid(0))
                            End While
                        End If
                    Else
                        Throw New InvalidOperationException("The supplied user Id does not match a user in the database")
                    End If

                End Using
            End Using
        End Using

        Return contributor

    End Function

    Public Function UpdateProfileContributors(ByVal request As ProfileContributorChangeset) As ChangeResult Implements IUserMaintenanceService.UpdateProfileContributors

        Dim result As New ChangeResult

        Using transaction As New TransactionScope

            Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
                connection.Open()

                For Each item As ProfileContributorDelete In request.DeleteList
                    DeleteContributor(item.Id, item.LastUpdated, request.ProfileId, connection)
                Next

                For Each item As ProfileContributorInsert In request.InsertList
                    InsertContributor(item, request, connection, result)
                Next

            End Using
            transaction.Complete()
        End Using

        Return result

    End Function

    Private Sub InsertContributor(ByVal item As ProfileContributorInsert, ByVal request As ProfileContributorChangeset, ByVal connection As SqlConnection, ByVal result As ChangeResult)

        Using insertCommand As SqlCommand = connection.CreateCommand
            insertCommand.CommandType = CommandType.StoredProcedure
            insertCommand.CommandText = "spiProfileContributor"
            insertCommand.Parameters.AddWithValue("@UserId", item.Id)
            insertCommand.Parameters.AddWithValue("@UserName", item.UserName)
            insertCommand.Parameters.AddWithValue("@FullName", item.FullName)
            insertCommand.Parameters.AddWithValue("@Organisation", item.Organisation)
            insertCommand.Parameters.AddWithValue("@RoleId", item.RoleId)
            insertCommand.Parameters.AddWithValue("@ProfileId", request.ProfileId)
            insertCommand.Parameters.AddWithValue("@LastUpdated", item.LastUpdated)
            Dim output As New SqlParameter("@NewLastUpdated", SqlDbType.Timestamp)
            output.Direction = ParameterDirection.Output
            insertCommand.Parameters.Add(output)
            insertCommand.ExecuteNonQuery()

            result.IdInsertList.Add(item.Id)
            result.LastUpdatedInsertList.Add(CType(insertCommand.Parameters("@NewLastUpdated").Value, Byte()))
        End Using

        InsertSectionPermissions(item.Id, request.ProfileId, item.SectionAddList, connection)

        DeleteSectionPermissions(item.Id, request.ProfileId, item.SectionRemoveList, connection)

    End Sub

    Private Sub InsertSectionPermissions(ByVal userId As Guid, _
                                         ByVal profileId As Guid, _
                                         ByVal sectionAddList As List(Of Guid), _
                                         ByVal connection As SqlConnection)

        If sectionAddList.Count > 0 Then

            Using insertCommand As SqlCommand = connection.CreateCommand
                insertCommand.CommandType = CommandType.StoredProcedure
                insertCommand.CommandText = "spiProfileSectionUser"
                insertCommand.Parameters.AddWithValue("@UserId", userId)
                insertCommand.Parameters.AddWithValue("@ProfileId", profileId)
                Dim parameter As SqlParameter = insertCommand.Parameters.Add("@ProfileSectionId", SqlDbType.UniqueIdentifier)
                For Each id As Guid In sectionAddList
                    parameter.Value = id
                    insertCommand.ExecuteNonQuery()
                Next

            End Using

        End If

    End Sub

    Private Sub DeleteSectionPermissions(ByVal userId As Guid, _
                                         ByVal profileId As Guid, _
                                         ByVal sectionRemoveList As List(Of Guid), _
                                         ByVal connection As SqlConnection)

        If sectionRemoveList.Count > 0 Then

            Using deleteCommand As SqlCommand = connection.CreateCommand

                deleteCommand.CommandType = CommandType.StoredProcedure
                deleteCommand.CommandText = "spdProfileSectionUser"
                deleteCommand.Parameters.AddWithValue("@UserId", userId)
                deleteCommand.Parameters.AddWithValue("@ProfileId", profileId)
                Dim parameter As SqlParameter = deleteCommand.Parameters.Add("@ProfileSectionId", SqlDbType.UniqueIdentifier)
                For Each id As Guid In sectionRemoveList
                    parameter.Value = id
                    deleteCommand.ExecuteNonQuery()
                Next

            End Using
        End If

    End Sub

    Private Sub DeleteContributor(ByVal userId As Guid, _
                                  ByVal lastUpdated As Byte(), _
                                  ByVal profileId As Guid, _
                                  ByVal connection As SqlConnection)

        Using deleteCommand As SqlCommand = connection.CreateCommand
            deleteCommand.CommandType = CommandType.StoredProcedure
            deleteCommand.CommandText = "spdProfileContributor"
            deleteCommand.Parameters.AddWithValue("@UserId", userId)
            deleteCommand.Parameters.AddWithValue("@ProfileId", profileId)
            deleteCommand.Parameters.AddWithValue("@LastUpdated", lastUpdated)
            deleteCommand.ExecuteNonQuery()
        End Using

    End Sub

    Public Function GetGlobalUsers() As List(Of GlobalUser) Implements IUserMaintenanceService.GetGlobalUsers

        Dim globalUsers As New List(Of GlobalUser)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgaGlobalUser"
                Using reader As New Data.SafeDataReader(getCommand.ExecuteReader)
                    While reader.Read()
                        Dim user As New GlobalUser With { _
                                        .Id = reader.GetGuid(0), _
                                        .UserName = reader.GetString(1), _
                                        .FullName = reader.GetString(2), _
                                        .Organisation = reader.GetString(3), _
                                        .SubscribedToReviewEmails = reader.GetBoolean(4), _
                                        .IsProfileEditor = reader.GetBoolean(5), _
                                        .IsPolicyProfileUser = reader.GetBoolean(6) _
                        }

                        reader.GetBytes("LastUpdated", 0, user.LastUpdated, 0, 8)
                        globalUsers.Add(user)
                    End While
                End Using
            End Using
        End Using

        Return globalUsers

    End Function

    Public Function GetGlobalUser(ByVal request As GetGlobalUserRequest) As GlobalUser Implements IUserMaintenanceService.GetGlobalUser

        Dim user As GlobalUser = Nothing

        Dim ssoUserId As Guid

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgUser"
                getCommand.Parameters.AddWithValue("@UserId", request.UserId)
                Using reader As New Data.SafeDataReader(getCommand.ExecuteReader)
                    While reader.Read()
                        user = New GlobalUser With { _
                            .Id = reader.GetGuid(0), _
                            .UserName = reader.GetString(1), _
                            .FullName = reader.GetString(2), _
                            .Organisation = reader.GetString(3), _
                            .SubscribedToReviewEmails = reader.GetBoolean(4), _
                            .IsProfileEditor = reader.GetBoolean(5), _
                            .IsPolicyProfileUser = reader.GetBoolean(6) _
                        }
                        ssoUserId = reader.GetGuid(7)
                        reader.GetBytes("LastUpdated", 0, user.LastUpdated, 0, 8)
                    End While
                    If user.UserName.Length = 0 Then
                        Throw New InvalidOperationException("The supplied user Id does not match a user in the database")
                    End If
                    If Not ssoUserId.Equals(Guid.Empty) Then
                        Throw New InvalidOperationException("This operation is not valid for SSO users")
                    End If
                End Using
            End Using
        End Using

        Return user

    End Function

    Public Function UpdateGlobalUsers(ByVal request As GlobalUserChangeset) As ChangeResult Implements IUserMaintenanceService.UpdateGlobalUsers

        Dim result As New ChangeResult

        Using transaction As New TransactionScope

            Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
                connection.Open()

                For Each item As GlobalUserUpdate In request.UpdateList
                    UpdateGlobalUser(item, connection, result)
                Next

                For Each item As GlobalUserInsert In request.InsertList
                    InsertGlobalUser(item, connection, result)
                Next

            End Using
            transaction.Complete()
        End Using

        Return result

    End Function

    Private Sub UpdateGlobalUser(ByVal item As GlobalUserUpdate, ByVal connection As SqlConnection, ByVal result As ChangeResult)

        Using deleteCommand As SqlCommand = connection.CreateCommand
            deleteCommand.CommandType = CommandType.StoredProcedure
            deleteCommand.CommandText = "spdGlobalUser"
            deleteCommand.Parameters.AddWithValue("@UserId", item.Id)
            deleteCommand.Parameters.AddWithValue("@LastUpdated", item.LastUpdated)
            Dim output As New SqlParameter("@NewLastUpdated", SqlDbType.Timestamp)
            output.Direction = ParameterDirection.Output
            deleteCommand.Parameters.Add(output)
            deleteCommand.ExecuteNonQuery()
            result.LastUpdatedUpdateList.Add(CType(deleteCommand.Parameters("@NewLastUpdated").Value, Byte()))
        End Using

    End Sub

    Private Sub InsertGlobalUser(ByVal item As GlobalUserInsert, ByVal connection As SqlConnection, ByVal result As ChangeResult)

        Using insertCommand As SqlCommand = connection.CreateCommand
            insertCommand.CommandType = CommandType.StoredProcedure
            insertCommand.CommandText = "spiGlobalUser"
            insertCommand.Parameters.AddWithValue("@UserId", item.Id)
            insertCommand.Parameters.AddWithValue("@UserName", item.UserName)
            insertCommand.Parameters.AddWithValue("@FullName", item.FullName)
            insertCommand.Parameters.AddWithValue("@Organisation", item.Organisation)
            insertCommand.Parameters.AddWithValue("@SubscribedToReviewEmails", item.SubscribedToReviewEmails)
            insertCommand.Parameters.AddWithValue("@IsProfileEditor", item.IsProfileEditor)
            insertCommand.Parameters.AddWithValue("@IsPolicyProfileUser", item.IsPolicyProfileUser)
            insertCommand.Parameters.AddWithValue("@LastUpdated", item.LastUpdated)
            Dim output As New SqlParameter("@NewLastUpdated", SqlDbType.Timestamp)
            output.Direction = ParameterDirection.Output
            insertCommand.Parameters.Add(output)
            insertCommand.ExecuteNonQuery()

            result.IdInsertList.Add(item.Id)
            result.LastUpdatedInsertList.Add(CType(insertCommand.Parameters("@NewLastUpdated").Value, Byte()))

        End Using

    End Sub

    Public Function UpdateSsoUsers(ByVal request As Contracts.DataContracts.SsoUserChangeset) As Contracts.DataContracts.ChangeResult Implements Contracts.ServiceContracts.IUserMaintenanceService.UpdateSsoUsers

        Dim result As New ChangeResult

        Using transaction As New TransactionScope

            Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
                connection.Open()

                For Each user As SsoUserUpdate In request.SsoUserUpdateList

                    For Each deleteProfile As SsoUserProfileDelete In user.SsoUserProfileDeleteList
                        DeleteContributor(user.Id, user.LastUpdated, deleteProfile.ProfileId, connection)
                    Next

                    For Each insertProfile As SsoUserProfileInsert In user.SsoUserProfileInsertList
                        InsertSsoUserProfile(user, insertProfile, connection)
                    Next

                    For Each updateProfile As SsoUserProfileUpdate In user.SsoUserProfileUpdateList
                        UpdateSsoUserProfile(user, updateProfile, connection)
                    Next

                    'this is to update the timestamps on the user
                    UpdateUserTimestamp(user, connection, result)

                Next

            End Using
            transaction.Complete()
        End Using

        Return result

    End Function

    Private Sub InsertSsoUserProfile(ByVal user As SsoUserUpdate, _
                                     ByVal insertProfile As SsoUserProfileInsert, _
                                     ByVal connection As SqlConnection)

        Using insertCommand As SqlCommand = connection.CreateCommand
            insertCommand.CommandType = CommandType.StoredProcedure
            insertCommand.CommandText = "spiProfileUser"
            insertCommand.Parameters.AddWithValue("@UserId", user.Id)
            insertCommand.Parameters.AddWithValue("@RoleId", insertProfile.RoleId)
            insertCommand.Parameters.AddWithValue("@ProfileId", insertProfile.ProfileId)
            insertCommand.Parameters.AddWithValue("@LastUpdated", user.LastUpdated)
            insertCommand.ExecuteNonQuery()
        End Using

        InsertSectionPermissions(user.Id, insertProfile.ProfileId, insertProfile.SectionAddList, connection)

    End Sub

    Private Sub UpdateSsoUserProfile(ByVal user As SsoUserUpdate, _
                                     ByVal updateProfile As SsoUserProfileUpdate, _
                                     ByVal connection As SqlConnection)

        Using updateCommand As SqlCommand = connection.CreateCommand
            updateCommand.CommandType = CommandType.StoredProcedure
            updateCommand.CommandText = "spuProfileUser"
            updateCommand.Parameters.AddWithValue("@UserId", user.Id)
            updateCommand.Parameters.AddWithValue("@RoleId", updateProfile.RoleId)
            updateCommand.Parameters.AddWithValue("@ProfileId", updateProfile.ProfileId)
            updateCommand.Parameters.AddWithValue("@LastUpdated", user.LastUpdated)
            updateCommand.ExecuteNonQuery()
        End Using

        InsertSectionPermissions(user.Id, updateProfile.ProfileId, updateProfile.SectionAddList, connection)
        DeleteSectionPermissions(user.Id, updateProfile.ProfileId, updateProfile.SectionRemoveList, connection)

    End Sub

    Private Sub UpdateUserTimestamp(ByVal user As SsoUserUpdate, ByVal connection As SqlConnection, ByVal result As ChangeResult)

        Using updateCommand As SqlCommand = connection.CreateCommand
            updateCommand.CommandType = CommandType.StoredProcedure
            updateCommand.CommandText = "spuUser"
            updateCommand.Parameters.AddWithValue("@UserId", user.Id)
            updateCommand.Parameters.AddWithValue("@FullName", user.FullName)
            updateCommand.Parameters.AddWithValue("@LastUpdated", user.LastUpdated)
            Dim output As New SqlParameter("@NewLastUpdated", SqlDbType.Timestamp)
            output.Direction = ParameterDirection.Output
            updateCommand.Parameters.Add(output)
            updateCommand.ExecuteNonQuery()
            result.LastUpdatedUpdateList.Add(CType(updateCommand.Parameters("@NewLastUpdated").Value, Byte()))
        End Using

    End Sub

End Class
