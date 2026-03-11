Imports Profiles.Contracts
Imports Profiles.Contracts.ServiceContracts
Imports ProfilesLibrary

<ServiceBehavior(InstanceContextMode:=InstanceContextMode.PerCall)> _
<ErrorHandlerBehavior()> _
Public Class ReviewCommentService
    Implements IReviewCommentService

    Public Function GetReviewComments(ByVal request As Contracts.DataContracts.GetReviewCommentsRequest) As System.Collections.Generic.List(Of Contracts.DataContracts.ReviewCommentData) Implements Contracts.ServiceContracts.IReviewCommentService.GetReviewComments

        Dim commentDataList As New List(Of DataContracts.ReviewCommentData)
        Dim commentList As ReviewCommentList = ReviewCommentList.GetReviewCommentList(request.ProfileVersionId, request.ProfileSectionId)

        For Each comment As ReviewComment In commentList
            commentDataList.Add(New DataContracts.ReviewCommentData() With { _
            .Id = comment.Id, _
            .CommentDate = comment.CommentDate, _
            .CommentSubject = comment.CommentSubject, _
            .CommentReference = comment.CommentReference, _
            .CommentText = comment.CommentText, _
            .UserName = comment.UserName, _
            .UserFullName = comment.UserFullName, _
            .ProfileVersionId = comment.ProfileVersionId, _
            .LastUpdated = comment.LastUpdated, _
            .ParentId = comment.ParentId, _
            .Level = comment.Level, _
            .RowCode = comment.RowCode, _
            .ChildCount = comment.ChildCount})
        Next

        Return commentDataList

    End Function

    Public Function UpdateReviewComments(ByVal request As Contracts.DataContracts.ReviewCommentChangeset) As DataContracts.ChangeResult Implements ServiceContracts.IReviewCommentService.UpdateReviewComments

        Dim result As New DataContracts.ChangeResult
        Dim insertList As New List(Of ProfilesLibrary.ReviewComment)
        Dim updateList As New List(Of ProfilesLibrary.ReviewComment)

        Dim reviewComments As ProfilesLibrary.ReviewCommentList = ProfilesLibrary.ReviewCommentList.GetReviewCommentList(request.ProfileVersionId, request.ProfileSectionId)

        reviewComments.BeginEdit()

        For Each item As DataContracts.ReviewCommentDelete In request.DeleteList
            Dim commentToDelete As ProfilesLibrary.ReviewComment = reviewComments.GetById(item.Id)
            If commentToDelete IsNot Nothing Then
                reviewComments.Remove(commentToDelete)
            End If
        Next

        For Each item As DataContracts.ReviewCommentInsert In request.InsertList
            Dim commentToInsert As ProfilesLibrary.ReviewComment
            If item.ParentId.Equals(Guid.Empty) Then
                commentToInsert = reviewComments.AddNew()
            Else
                commentToInsert = reviewComments.AddReply(item.ParentId)
            End If
            insertList.Add(commentToInsert)
            commentToInsert.CommentReference = item.CommentReference
            commentToInsert.CommentSubject = item.CommentSubject
            commentToInsert.CommentText = item.CommentText
        Next

        For Each item As DataContracts.ReviewCommentUpdate In request.UpdateList
            Dim commentToUpdate As ProfilesLibrary.ReviewComment = reviewComments.GetById(item.Id)
            updateList.Add(commentToUpdate)
            If commentToUpdate IsNot Nothing AndAlso GlobalCommon.TimestampsEqual(commentToUpdate.LastUpdated, item.LastUpdated) Then
                commentToUpdate.CommentReference = item.CommentReference
                commentToUpdate.CommentSubject = item.CommentSubject
                commentToUpdate.CommentText = item.CommentText
            Else
                Throw New ApplicationException("The review comment has been edited by another user")
            End If
        Next

        reviewComments.ApplyEdit()
        reviewComments.Save()

        For Each item As ProfilesLibrary.ReviewComment In insertList
            result.IdInsertList.Add(item.Id)
            result.LastUpdatedInsertList.Add(item.LastUpdated)
        Next

        For Each item As ProfilesLibrary.ReviewComment In updateList
            result.LastUpdatedUpdateList.Add(item.LastUpdated)
        Next

        Return result

    End Function

    Public Sub DeleteAllReviewComments(ByVal request As Contracts.DataContracts.DeleteAllReviewCommentsRequest) Implements Contracts.ServiceContracts.IReviewCommentService.DeleteAllReviewComments
        Throw New System.Security.SecurityException("This method is not available via WCF")
    End Sub

End Class
