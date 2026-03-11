Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Friend Class NewProfileVersionCommand
    Inherits CommandBase

#Region " Client-side Code "

    Private mProfileVersionId As Guid
    Private mNewProfileVersionId As Guid
    Private mNewStatus As ProfileVersionStatus
    Private mNewIsPublic As Boolean

    Friend Property ProfileVersionId() As Guid
        Get
            Return mProfileVersionId
        End Get
        Set(ByVal value As Guid)
            mProfileVersionId = value
        End Set
    End Property

    Friend Property NewStatus() As ProfileVersionStatus
        Get
            Return mNewStatus
        End Get
        Set(ByVal value As ProfileVersionStatus)
            mNewStatus = value
        End Set
    End Property

    Friend Property IsPublic() As Boolean
        Get
            Return mNewIsPublic
        End Get
        Set(ByVal value As Boolean)
            mNewIsPublic = value
        End Set
    End Property

    Friend ReadOnly Property NewProfileVersionId() As Guid
        Get
            Return mNewProfileVersionId
        End Get
    End Property

#End Region

#Region " Factory Methods "

    Protected Friend Shared Function NewProfileVersion(ByVal profileVersionId As Guid) As Guid
        Return NewProfileVersion(profileVersionId, ProfileVersionStatus.Draft, False)
    End Function

    Protected Friend Shared Function NewProfileVersion(ByVal profileVersionId As Guid, ByVal newStatus As ProfileVersionStatus, ByVal isPublic As Boolean) As Guid

        Dim cmd As New NewProfileVersionCommand
        cmd.ProfileVersionId = profileVersionId
        cmd.NewStatus = newStatus
        cmd.IsPublic = isPublic
        cmd = DataPortal.Execute(Of NewProfileVersionCommand)(cmd)
        Return cmd.NewProfileVersionId

    End Function

#End Region

#Region " Server-side Code "

    Protected Overrides Sub DataPortal_Execute()

        Dim db As ServiceContracts.IProfileManagementService = DataFactory.GetProfileManagementService()
        mNewProfileVersionId = db.CreateNewProfileVersion(New DataContracts.NewProfileVersionRequest( _
                                   mProfileVersionId, _
                                   (mNewStatus = ProfileVersionStatus.Published), _
                                    mNewIsPublic)).NewProfileVersionId

    End Sub

#End Region

End Class

