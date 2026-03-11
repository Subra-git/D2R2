Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class ReviewCommentList
    Inherits BusinessListBase(Of ReviewCommentList, ReviewComment)

    Private mProfileVersionId As Guid
    Private mProfileSectionId As Guid

    Friend ReadOnly Property ProfileVersionId() As Guid
        Get
            Return mProfileVersionId
        End Get
    End Property

    Friend ReadOnly Property ProfileSectionId() As Guid
        Get
            Return mProfileSectionId
        End Get
    End Property

    Public Function GetById(ByVal commentId As Guid) As ReviewComment
        For Each currentComment As ReviewComment In Me
            If currentComment.Id.Equals(commentId) Then
                Return currentComment
            End If
        Next
        Return Nothing
    End Function

    Public Function AddReply(ByVal commentId As Guid) As ReviewComment

        Dim newComment As ReviewComment = GetById(commentId).AddReply()
        Add(newComment)
        Return newComment

    End Function

    Protected Overrides Function AddNewCore() As Object

        Dim newComment As ReviewComment = ReviewComment.NewReviewComment(Me.ProfileVersionId)
        Add(newComment)
        Return newComment

    End Function

#Region " Authorization Rules "

    Public Shared Function CanAddReviewComment(ByVal profileVersionId As Guid) As Boolean

        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Dim currentProfileVersionInfo As ProfileVersionInfo = ProfileVersionInfo.GetProfileVersionInfo(profileVersionId)

        If identity.IsUserManagementSystem Then
            Return False
        End If

        'The profile version must be draft
        If Not currentProfileVersionInfo.Status = ProfileVersionStatus.Draft Then
            Return False
        End If

        'The profile version must be current
        If Not currentProfileVersionInfo.IsCurrent Then
            Return False
        End If

        'Must be a Profile Editor or a contributor or a reviewer to add a review comment to the list
        Return (identity.IsProfileEditor OrElse identity.IsProfileContributorOrReviewer(currentProfileVersionInfo.ProfileId))

    End Function

    Public Shared Function CanGetReviewCommentList(ByVal profileVersionId As Guid) As Boolean

        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Dim currentProfileVersionInfo As ProfileVersionInfo = ProfileVersionInfo.GetProfileVersionInfo(profileVersionId)

        If identity.IsUserManagementSystem Then
            Return False
        End If

        'The profile version must be draft
        If Not currentProfileVersionInfo.Status = ProfileVersionStatus.Draft Then
            Return False
        End If

        'Must be a Profile editor, Policy profile user or a contributor or a reviewer to get a review comment list
        Return (identity.IsProfileContributorOrReviewer(currentProfileVersionInfo.ProfileId) OrElse _
                identity.IsProfileEditor OrElse identity.IsPolicyProfileUser)

    End Function

    Public Overrides Function Save() As ReviewCommentList

        If Not CanAddReviewComment(ProfileVersionId) Then
            Throw New System.Security.SecurityException("You do not have permission to add a review comment.")
        End If

        Return MyBase.Save()

    End Function
#End Region

#Region " Factory Methods "

    Public Shared Function GetReviewCommentList(ByVal profileVersionId As Guid, ByVal profileSectionId As Guid) As ReviewCommentList

        'Here is where we need to check if the user is allowed to get the review comment list
        If Not CanGetReviewCommentList(profileVersionId) Then
            Throw New System.Security.SecurityException("You do not have permission to view the review comments for this profile version.")
        End If

        Return DataPortal.Fetch(Of ReviewCommentList)(New Criteria(profileVersionId, profileSectionId))

    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

#End Region

#Region " Data Access "

    <Serializable()> _
    Private Class Criteria

        Private mProfileVersionId As Guid
        Private mProfileSectionId As Guid

        Public ReadOnly Property ProfileVersionId() As Guid
            Get
                Return mProfileVersionId
            End Get
        End Property

        Public ReadOnly Property ProfileSectionId() As Guid
            Get
                Return mProfileSectionId
            End Get
        End Property

        Public Sub New(ByVal profileVersionId As Guid, ByVal profileSectionId As Guid)
            mProfileVersionId = profileVersionId
            mProfileSectionId = profileSectionId
        End Sub
    End Class

    Private Overloads Sub DataPortal_Fetch(ByVal criteria As Criteria)

        mProfileVersionId = criteria.ProfileVersionId
        mProfileSectionId = criteria.ProfileSectionId

        RaiseListChangedEvents = False

        Dim db As ServiceContracts.IReviewCommentService = DataFactory.GetReviewCommentService()
        Dim reviewCommentDataList As List(Of DataContracts.ReviewCommentData) = _
            db.GetReviewComments(New DataContracts.GetReviewCommentsRequest(criteria.ProfileVersionId, criteria.ProfileSectionId))

        For Each commentData As DataContracts.ReviewCommentData In reviewCommentDataList
            Add(ReviewComment.GetReviewComment(commentData))
        Next

        RaiseListChangedEvents = True

    End Sub

    Protected Overrides Sub DataPortal_Update()

        RaiseListChangedEvents = False

        Dim db As ServiceContracts.IReviewCommentService = DataFactory.GetReviewCommentService
        Dim changeset As New DataContracts.ReviewCommentChangeset(mProfileVersionId, mProfileSectionId)

        Dim updateRequired As Boolean

        For Each item As ReviewComment In DeletedList
            changeset.DeleteList.Add(item.GetDelete())
            updateRequired = True
        Next

        For Each item As ReviewComment In Me
            If item.IsDirty Then
                If item.IsNew Then
                    changeset.InsertList.Add(item.GetInsert())
                Else
                    changeset.UpdateList.Add(item.GetUpdate())
                End If
                updateRequired = True
            End If
        Next

        If updateRequired Then
            Dim result As DataContracts.ChangeResult = db.UpdateReviewComments(changeset)
            Dim currentInsert As Integer
            Dim currentUpdate As Integer
            RaiseListChangedEvents = False

            For Each item As ReviewComment In DeletedList
                item.DeleteSelf()
            Next

            For Each item As ReviewComment In Me
                If item.IsDirty Then
                    If item.IsNew Then
                        item.Insert(result.IdInsertList(currentInsert), result.LastUpdatedInsertList(currentInsert))
                        currentInsert += 1
                    Else
                        item.Update(result.LastUpdatedUpdateList(currentUpdate))
                        currentUpdate += 1
                    End If
                End If
            Next

            RaiseListChangedEvents = True

        End If


    End Sub

#End Region

End Class


