Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class QuestionReferenceList
    Inherits BusinessListBase(Of QuestionReferenceList, QuestionReference)

#Region " Authorization Rules "

    Public Function CanAddQuestionReference(ByVal profileSectionId As Guid) As Boolean

        'the authorisation logic is the same for Removing a question reference

        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Dim currentProfileVersionInfo As ProfileVersionInfo = ProfileVersionInfo.GetProfileVersionInfo(mProfileVersionId)

        'The profile version must be current
        If Not currentProfileVersionInfo.IsCurrent Then
            Return False
        End If

        'The profile version must be draft
        If Not currentProfileVersionInfo.Status = ProfileVersionStatus.Draft Then
            Return False
        End If

        If identity.IsUserManagementSystem Then
            Return False
        End If

        'Must be a Profile Editor or a contributor with access to the section 
        Return identity.IsProfileEditor OrElse identity.IsProfileSectionContributor(currentProfileVersionInfo.ProfileId, profileSectionId)

    End Function

#End Region

#Region " Business Methods "

    Private mQuestionReferenceListText As String
    Private mProfileVersionId As Guid

    Public ReadOnly Property QuestionReferenceListText() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            Return mQuestionReferenceListText
        End Get
    End Property

    Public ReadOnly Property ProfileVersionId() As Guid
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            Return mProfileVersionId
        End Get
    End Property

    Public Function GetById(ByVal profileSectionId As Guid, ByVal profileQuestionId As Guid) As QuestionReference

        For Each item As QuestionReference In Me
            If item.ProfileSectionId = profileSectionId AndAlso item.ProfileQuestionId = profileQuestionId Then
                Return item
            End If
        Next
        Return Nothing

    End Function

    Public Sub AddQuestionReference(ByVal profileSectionId As Guid, ByVal profileQuestionId As Guid)

        If Not CanAddQuestionReference(profileSectionId) Then
            Throw New System.Security.SecurityException("You do not have permission to add this question reference.")
        End If

        If Me.GetById(profileSectionId, profileQuestionId) Is Nothing Then

            Dim currentQuestionReference As QuestionReference = QuestionReference.NewQuestionReference(profileSectionId, profileQuestionId)

            Me.Add(currentQuestionReference)

        End If

    End Sub

    Public Sub RemoveQuestionReference(ByVal profileSectionId As Guid, ByVal profileQuestionId As Guid)

        If Not CanAddQuestionReference(profileSectionId) Then
            Throw New System.Security.SecurityException("You do not have permission to remove this question reference.")
        End If

        Dim currentQuestionReference As QuestionReference = Me.GetById(profileSectionId, profileQuestionId)

        If currentQuestionReference IsNot Nothing Then
            Me.Remove(currentQuestionReference)
        End If

    End Sub

    Public Sub RemoveQuestionReferenceByProfileSectionId(ByVal profileSectionId As Guid)

        If Not CanAddQuestionReference(profileSectionId) Then
            Throw New System.Security.SecurityException("You do not have permission to remove the question reference.")
        End If

        Dim removeList As New List(Of QuestionReference)

        For Each item As QuestionReference In Me
            If item.ProfileSectionId = profileSectionId Then
                removeList.Add(item)
            End If
        Next

        For Each item As QuestionReference In removeList
            Me.Remove(item)
        Next

    End Sub

#End Region

#Region " Factory Methods "

    Friend Shared Function NewQuestionReferenceList(ByVal profileVersionId As Guid) As QuestionReferenceList

        Return New QuestionReferenceList(profileVersionId)

    End Function

    Friend Shared Function GetQuestionReferenceList(ByVal profileVersionId As Guid, ByVal questionReferences As List(Of DataContracts.QuestionReference)) As QuestionReferenceList

        Return New QuestionReferenceList(profileVersionId, questionReferences)

    End Function

    Private Sub New(ByVal profileVersionId As Guid)
        mProfileVersionId = profileVersionId
    End Sub

    Private Sub New()
        'requires use of factory methods
    End Sub

    Private Sub New(ByVal profileVersionId As Guid, ByVal questionReferences As List(Of DataContracts.QuestionReference))

        Fetch(profileVersionId, questionReferences)
        MarkAsChild()

    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal profileVersionId As Guid, ByVal questionReferences As List(Of DataContracts.QuestionReference))

        mProfileVersionId = profileVersionId

        For Each ref As DataContracts.QuestionReference In questionReferences

            Dim currentQuestionReference As QuestionReference = QuestionReference.GetQuestionReference(ref)
            Me.Add(currentQuestionReference)

        Next

    End Sub

    Friend Sub UpdateQuestionReferenceStrings(ByVal profileSectionList As SectionMetadataListBase)

        mQuestionReferenceListText = String.Empty

        Dim fullQuestionNumberList As New List(Of FullQuestionNumber)

        For Each section As SectionMetadataBase In profileSectionList

            For Each question As QuestionMetadataBase In section.QuestionMetadataList

                Dim currentQuestionReference As QuestionReference = Me.GetById(section.Id, question.Id)

                If currentQuestionReference IsNot Nothing Then
                    fullQuestionNumberList.Add(New FullQuestionNumber(section.SectionNumber, question.QuestionNumber))
                End If
            Next

        Next

        For Each fullNumber As FullQuestionNumber In fullQuestionNumberList
            mQuestionReferenceListText = mQuestionReferenceListText & fullNumber.SectionNumber.ToString() + "." & fullNumber.QuestionNumber.ToString() & ", "
        Next
        If mQuestionReferenceListText.Length > 2 Then
            mQuestionReferenceListText = mQuestionReferenceListText.Substring(0, mQuestionReferenceListText.Length - 2)
        End If

    End Sub

    Friend Function GetAddList() As List(Of DataContracts.QuestionReference)

        Dim questionReferenceList As New List(Of DataContracts.QuestionReference)

        For Each item As QuestionReference In Me

            If item.IsNew Then

                questionReferenceList.Add(item.GetInsert())

            End If

        Next

        Return questionReferenceList

    End Function

    Friend Function GetRemoveList() As List(Of DataContracts.QuestionReference)

        Dim questionReferenceList As New List(Of DataContracts.QuestionReference)

        For Each item As QuestionReference In DeletedList

            questionReferenceList.Add(item.GetInsert())

        Next

        Return questionReferenceList

        DeletedList.Clear()

    End Function


#End Region

#Region " Helper Class "

    Private Class FullQuestionNumber

        Private mSectionNumber As Integer
        Private mQuestionNumber As Integer

        Public ReadOnly Property SectionNumber() As Integer
            Get
                Return mSectionNumber
            End Get
        End Property

        Public ReadOnly Property QuestionNumber() As Integer
            Get
                Return mQuestionNumber
            End Get
        End Property

        Public ReadOnly Property FullNumberString() As String
            Get
                Return mSectionNumber.ToString() & "." & QuestionNumber.ToString()
            End Get
        End Property

        Public Sub New(ByVal sectionNumber As Integer, ByVal questionNumber As Integer)
            mSectionNumber = sectionNumber
            mQuestionNumber = questionNumber
        End Sub

    End Class

#End Region


End Class
