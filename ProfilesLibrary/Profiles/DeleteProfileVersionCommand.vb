Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Friend Class DeleteProfileVersionCommand
    Inherits CommandBase

#Region " Client-side Code "

    Private mProfileVersionId As Guid
    Private mNextLatestProfileVersionId As Guid
    Private mIsProfileDeleted As Boolean

    Friend Property ProfileVersionId() As Guid
        Get
            Return mProfileVersionId
        End Get
        Set(ByVal value As Guid)
            mProfileVersionId = value
        End Set
    End Property

    Friend ReadOnly Property NextLatestProfileVersionId() As Guid
        Get
            Return mNextLatestProfileVersionId
        End Get
    End Property

    Friend ReadOnly Property IsProfileDeleted() As Boolean
        Get
            Return mIsProfileDeleted
        End Get
    End Property

#End Region

#Region " Factory Methods "

    Protected Friend Shared Function DeleteProfileVersion(ByVal profileVersionId As Guid) As Guid

        Dim cmd As New DeleteProfileVersionCommand
        cmd.ProfileVersionId = profileVersionId

        cmd = DataPortal.Execute(Of DeleteProfileVersionCommand)(cmd)
        Return cmd.NextLatestProfileVersionId

    End Function

#End Region

#Region " Server-side Code "

    Protected Overrides Sub DataPortal_Execute()

        Dim db As ServiceContracts.IProfileManagementService = DataFactory.GetProfileManagementService()
        Dim result As DataContracts.DeleteProfileVersionResponse = _
            db.DeleteProfileVersion(New DataContracts.DeleteProfileVersionRequest(mProfileVersionId))

        mNextLatestProfileVersionId = result.NextLatestProfileVersionId
        mIsProfileDeleted = result.IsProfileDeleted

    End Sub

    

#End Region

End Class


