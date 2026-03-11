Imports Profiles.Contracts

Public Class ProfileRoleInfo

    Private mProfileId As Guid
    Private mRole As String

    Public ReadOnly Property ProfileId() As Guid
        Get
            Return mProfileId
        End Get
    End Property

    Public ReadOnly Property Role() As String
        Get
            Return mRole
        End Get
    End Property

    Friend Sub New(ByVal data As DataContracts.ProfileRoleData)
        mProfileId = data.ProfileId
        mRole = data.Role
    End Sub

End Class
