Imports Profiles.Contracts.ServiceContracts
Imports Profiles.Contracts.DataContracts
Imports System.Data.SqlClient

Public Class UserAuthenticationService
    Implements IUserAuthenticationService

    Public Function GetUserIdentity(ByVal request As GetUserIdentityRequest) As UserIdentityData Implements Contracts.ServiceContracts.IUserAuthenticationService.GetUserIdentity

        Dim isContributor As Boolean
        Dim profileId As Guid

        Dim userId As Guid = Guid.Empty
        Dim userName As String = String.Empty
        Dim fullName As String = String.Empty
        Dim organisation As String = String.Empty
        Dim isProfileEditor As Boolean = False
        Dim isPolicyProfileUser As Boolean = False
        Dim isSsoUser As Boolean = False
        Dim isUserManagementSystem As Boolean = False
        Dim isAuthenticated As Boolean = False
        Dim contributorRoles As New Dictionary(Of Guid, String)
        Dim reviewerRoles As New Dictionary(Of Guid, String)
        Dim contributorSections As New Dictionary(Of Guid, List(Of Guid))

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using authorisationCommand As SqlCommand = connection.CreateCommand
                authorisationCommand.CommandType = CommandType.StoredProcedure
                authorisationCommand.CommandText = "spgUserAuthorisation"
                If request.AuthenticationType = "Windows" Then
                    authorisationCommand.Parameters.AddWithValue("@UserName", request.UserId)
                Else
                    authorisationCommand.Parameters.AddWithValue("@SsoUserId", New Guid(request.UserId))
                End If

                Using reader As New Data.SafeDataReader(authorisationCommand.ExecuteReader)
                    While reader.Read()
                        userId = reader.GetGuid(0)
                        userName = reader.GetString(5)
                        fullName = reader.GetString(1)
                        organisation = reader.GetString(2)
                        isProfileEditor = reader.GetBoolean(3)
                        isPolicyProfileUser = reader.GetBoolean(4)
                        isSsoUser = Not reader.GetGuid(6).Equals(Guid.Empty)
                        isUserManagementSystem = reader.GetBoolean(7)
                        isAuthenticated = True
                    End While
                    If reader.NextResult() Then
                        While reader.Read()
                            profileId = reader.GetGuid(0)
                            isContributor = reader.GetBoolean(3)
                            If isContributor Then
                                contributorRoles.Add(profileId, reader.GetString(2))
                                contributorSections.Add(profileId, New List(Of Guid))
                            Else
                                reviewerRoles.Add(profileId, reader.GetString(2))
                            End If
                        End While
                    End If
                    If reader.NextResult() Then
                        While reader.Read()
                            contributorSections(reader.GetGuid(0)).Add(reader.GetGuid(1))
                        End While
                    End If
                End Using
            End Using
        End Using

        If request.AuthenticationType = "Windows" AndAlso Not isAuthenticated Then
            userName = request.UserId
            isAuthenticated = True
        End If

        Dim contributorRoleData As New List(Of ProfileRoleData)
        For Each profile As Guid In contributorRoles.Keys
            contributorRoleData.Add(New ProfileRoleData() With { _
                                    .ProfileId = profile, _
                                    .Role = contributorRoles(profile), _
                                    .Sections = contributorSections(profile)})
        Next

        Dim reviewerRoleData As New List(Of ProfileRoleData)
        For Each profile As Guid In reviewerRoles.Keys
            reviewerRoleData.Add(New ProfileRoleData() With { _
                                    .ProfileId = profile, _
                                    .Role = reviewerRoles(profile), _
                                    .Sections = New List(Of Guid)})
        Next

        Return New UserIdentityData() With { _
            .IsAuthenticated = isAuthenticated, _
            .UserId = userId, _
            .UserName = userName, _
            .FullName = fullName, _
            .Organisation = organisation, _
            .IsProfileEditor = isProfileEditor, _
            .IsPolicyProfileUser = isPolicyProfileUser, _
            .IsSsoUser = isSsoUser, _
            .IsUserManagementSystem = isUserManagementSystem, _
            .ContributorRoles = contributorRoleData, _
            .ReviewerRoles = reviewerRoleData}

    End Function

    Public Sub Logout() Implements Contracts.ServiceContracts.IUserAuthenticationService.Logout
        Throw New InvalidOperationException("You cannot log out using the SQL version of the data layer.")
    End Sub

End Class
