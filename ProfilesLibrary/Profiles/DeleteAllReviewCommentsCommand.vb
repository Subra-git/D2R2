Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class DeleteAllReviewCommentsCommand
    Inherits CommandBase

#Region " Authorisation Rules "

    Public Shared Function CanDeleteAllReviewComments() As Boolean

        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return identity.IsProfileEditor AndAlso Not identity.IsUserManagementSystem

    End Function

#End Region

#Region " Client-side Code "

    Private mProfileVersionId As Guid
    Private mProfileSectionId As Guid

    Friend Property ProfileVersionId() As Guid
        Get
            Return mProfileVersionId
        End Get
        Set(ByVal value As Guid)
            mProfileVersionId = value
        End Set
    End Property
    Friend Property ProfileSectionId() As Guid
        Get
            Return mProfileSectionId
        End Get
        Set(ByVal value As Guid)
            mProfileSectionId = value
        End Set
    End Property

#End Region

#Region " Factory Methods "

    Public Shared Sub DeleteAllReviewComments(ByVal profileVersionId As Guid, ByVal profileSectionId As Guid)

        If Not CanDeleteAllReviewComments() Then
            Throw New System.Security.SecurityException("You do not have permission to delete all review comments")
        End If

        Dim cmd As New DeleteAllReviewCommentsCommand
        cmd.ProfileVersionId = profileVersionId
        cmd.ProfileSectionId = profileSectionId

        cmd = DataPortal.Execute(Of DeleteAllReviewCommentsCommand)(cmd)

    End Sub

#End Region

#Region " Server-side Code "

    Protected Overrides Sub DataPortal_Execute()

        Dim db As ServiceContracts.IReviewCommentService = DataFactory.GetReviewCommentService()
        db.DeleteAllReviewComments(New DataContracts.DeleteAllReviewCommentsRequest(ProfileVersionId, ProfileSectionId))

    End Sub

#End Region

End Class
