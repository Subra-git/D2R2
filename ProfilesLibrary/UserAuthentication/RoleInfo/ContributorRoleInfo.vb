Imports Profiles.Contracts

Public Class ContributorInfo
    Inherits ProfileRoleInfo

    Private mProfileSectionList As New Dictionary(Of Guid, Guid)

    Public ReadOnly Property Sections() As Guid()
        Get
            Return mProfileSectionList.Keys.ToArray()
        End Get
    End Property

    Friend Function CanAccessSection(ByVal profileSectionId As Guid) As Boolean

        If DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity).IsUserManagementSystem Then
            Return False
        End If

        Return mProfileSectionList.ContainsKey(profileSectionId)
    End Function

    Friend Sub New(ByVal data As DataContracts.ProfileRoleData)
        MyBase.New(data)
        For Each section As Guid In data.Sections
            mProfileSectionList.Add(section, section)
        Next
    End Sub

End Class
