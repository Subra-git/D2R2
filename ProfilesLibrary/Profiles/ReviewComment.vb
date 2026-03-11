Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class ReviewComment
    Inherits BusinessBase(Of ReviewComment)

#Region " Business Methods "

    Private mId As Guid
    Private mCommentDate As DateTime
    Private mCommentSubject As String
    Private mCommentReference As String
    Private mCommentText As String
    Private mUserName As String
    Private mUserFullName As String
    Private mProfileVersionId As Guid
    Private mParentId As Guid
    Private mLevel As Integer
    Private mRowCode As String
    Private mChildCount As Integer
    Private mLastUpdated(7) As Byte

    Public ReadOnly Property Id() As Guid
        Get
            CanReadProperty(True)
            Return mId
        End Get
    End Property

    Public ReadOnly Property CommentDate() As DateTime
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mCommentDate
        End Get
    End Property

    Public Property CommentSubject() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mCommentSubject
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As String)
            CanWriteProperty(True)
            If mCommentSubject <> value Then
                mCommentSubject = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public Property CommentReference() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mCommentReference
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As String)
            CanWriteProperty(True)
            If mCommentReference <> value Then
                mCommentReference = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public Property CommentText() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mCommentText
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As String)
            CanWriteProperty(True)
            If mCommentText <> value Then
                mCommentText = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public ReadOnly Property UserName() As String
        Get
            CanReadProperty(True)
            Return mUserName
        End Get
    End Property

    Public ReadOnly Property UserFullName() As String
        Get
            CanReadProperty(True)
            Return mUserFullName
        End Get
    End Property

    Public ReadOnly Property ParentId() As Guid
        Get
            CanReadProperty(True)
            Return mParentId
        End Get
    End Property

    Public ReadOnly Property Level() As Integer
        Get
            CanReadProperty(True)
            Return mLevel
        End Get
    End Property

    Public ReadOnly Property RowCode() As String
        Get
            CanReadProperty(True)
            Return mRowCode
        End Get
    End Property

    Public ReadOnly Property ChildCount() As Integer
        Get
            CanReadProperty(True)
            Return mChildCount
        End Get
    End Property

    Public ReadOnly Property ProfileVersionId() As Guid
        Get
            CanReadProperty(True)
            Return mProfileVersionId
        End Get
    End Property

    'Required for WCF version
    Public ReadOnly Property LastUpdated() As Byte()
        Get
            Return mLastUpdated
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mId
    End Function

#End Region

#Region " Validation Rules "

    Protected Overrides Sub AddBusinessRules()

        ValidationRules.AddRule(AddressOf Validation.CommonRules.StringRequired, "CommentReference")
        ValidationRules.AddRule(AddressOf Validation.CommonRules.StringMaxLength, New Validation.CommonRules.MaxLengthRuleArgs("CommentReference", 255))

        ValidationRules.AddRule(AddressOf Validation.CommonRules.StringRequired, "CommentSubject")
        ValidationRules.AddRule(AddressOf Validation.CommonRules.StringMaxLength, New Validation.CommonRules.MaxLengthRuleArgs("CommentSubject", 255))

        ValidationRules.AddRule(AddressOf Validation.CommonRules.StringRequired, "CommentText")

    End Sub

#End Region

#Region " Authorization Rules "

    Public Function CanEditReviewComment() As Boolean

        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Dim currentProfileVersionInfo As ProfileVersionInfo = ProfileVersionInfo.GetProfileVersionInfo(mProfileVersionId)

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

        'Can only edit your own comment
        If Not (identity.UserName.ToLower = mUserName.ToLower) Then
            Return False
        End If

        'Can only edit a comment that does not have replies
        If mChildCount > 0 Then
            Return False
        End If

        'Must be a Profile Editor or a contributor to edit a review comment
        Return (identity.IsProfileEditor OrElse identity.IsProfileContributorOrReviewer(currentProfileVersionInfo.ProfileId))

    End Function

    Public Function CanDeleteReviewComment() As Boolean

        If DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity).IsUserManagementSystem Then
            Return False
        End If

        Return CanEditReviewComment()

    End Function

#End Region

#Region " Factory Methods "

    Friend Shared Function NewReviewComment(ByVal profileVersionId As Guid) As ReviewComment
        Return New ReviewComment(profileVersionId)
    End Function

    Friend Function AddReply() As ReviewComment
        mChildCount += 1
        Return New ReviewComment(Me)
    End Function

    Friend Shared Function GetReviewComment(ByVal commentData As DataContracts.ReviewCommentData) As ReviewComment
        Return New ReviewComment(commentData)
    End Function

    Private Sub New(ByVal profileVersionId As Guid)

        mId = Guid.NewGuid()
        mCommentDate = DateTime.Now
        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        mUserName = identity.UserName
        mUserFullName = identity.FullName
        mProfileVersionId = profileVersionId
        mParentId = Guid.Empty
        MarkAsChild()
        ValidationRules.CheckRules()

    End Sub

    Private Sub New(ByVal originalComment As ReviewComment)

        Me.New(originalComment.ProfileVersionId)
        If originalComment.CommentSubject.ToLower().StartsWith("re:") Then
            mCommentSubject = originalComment.CommentSubject
        Else
            mCommentSubject = "Re: " & originalComment.CommentSubject
        End If
        mCommentReference = originalComment.CommentReference
        mCommentText = String.Empty
        mParentId = originalComment.Id
        mLevel = originalComment.Level + 1
        mRowCode = originalComment.RowCode & originalComment.ChildCount.ToString().PadLeft(10)
        ValidationRules.CheckRules()

    End Sub

    Private Sub New(ByVal commentData As DataContracts.ReviewCommentData)
        MarkAsChild()
        Fetch(commentData)
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal commentData As DataContracts.ReviewCommentData)

        mId = commentData.Id
        mCommentDate = commentData.CommentDate
        mCommentSubject = commentData.CommentSubject
        mCommentReference = commentData.CommentReference
        mCommentText = commentData.CommentText
        mUserName = commentData.UserName
        mUserFullName = commentData.UserFullName
        mProfileVersionId = commentData.ProfileVersionId
        mLastUpdated = commentData.LastUpdated
        mParentId = commentData.ParentId
        mLevel = commentData.Level
        mRowCode = commentData.RowCode
        mChildCount = commentData.ChildCount
        MarkOld()

    End Sub

    Friend Function GetDelete() As DataContracts.ReviewCommentDelete

        Return New DataContracts.ReviewCommentDelete With {.Id = mId}

    End Function

    Friend Function GetInsert() As DataContracts.ReviewCommentInsert

        Return New DataContracts.ReviewCommentInsert With { _
            .Id = mId, _
            .CommentDate = mCommentDate, _
            .CommentReference = mCommentReference, _
            .CommentSubject = mCommentSubject, _
            .CommentText = mCommentText, _
            .ParentId = mParentId, _
            .UserName = mUserName}

    End Function

    Friend Function GetUpdate() As DataContracts.ReviewCommentUpdate

        Return New DataContracts.ReviewCommentUpdate With { _
            .Id = mId, _
            .CommentReference = mCommentReference, _
            .CommentSubject = mCommentSubject, _
            .CommentText = mCommentText, _
            .LastUpdated = mLastUpdated}

    End Function


    Friend Sub Insert(ByVal newId As Guid, ByVal newLastUpdated As Byte())

        mId = newId
        mLastUpdated = newLastUpdated
        MarkOld()

    End Sub

    Friend Sub Update(ByVal newLastUpdated As Byte())

        If Not CanEditReviewComment() Then
            Throw New System.Security.SecurityException("You do not have permission to edit this review comment.")
        End If

        mLastUpdated = newLastUpdated
        MarkOld()

    End Sub

    Friend Sub DeleteSelf()

        If Not CanDeleteReviewComment() Then
            Throw New System.Security.SecurityException("You do not have permission to delete this review comment.")
        End If

        MarkNew()

    End Sub

#End Region

End Class


