Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class Note
    Inherits BusinessBase(Of Note)

#Region " Business Methods "

    Private mId As Guid
    Private mNoteText As String
    Private mReferenceList As QuestionReferenceList
    Private mLastUpdated(7) As Byte
    Private mProfileVersionId As Guid

    Public ReadOnly Property Id() As Guid
        Get
            CanReadProperty(True)
            Return mId
        End Get
    End Property

    Public Property NoteText() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)>
        Get
            CanReadProperty(True)
            Return mNoteText.SanitizeHtml()
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)>
        Set(ByVal value As String)
            If CanEditNoteText() Then
                CanReadProperty(True)
                If mNoteText <> value Then
                    mNoteText = value
                    PropertyHasChanged()
                End If
            End If
        End Set
    End Property

    Public ReadOnly Property NoteTextPlainText As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)>
        Get
            CanReadProperty(True)
            Return mNoteText.StripHtmlTags()
        End Get
    End Property

    Public ReadOnly Property NoteTextSlim() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)>
        Get
            CanReadProperty(True)
            If mNoteText.Length > 50 Then
                Return mNoteText.Substring(0, 47) & "..."
            Else
                Return mNoteText
            End If
        End Get
    End Property


    Public ReadOnly Property NoteTextPlainTextSlim() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)>
        Get
            CanReadProperty(True)
            If NoteTextPlainText.Length > 50 Then
                Return NoteTextPlainText.Substring(0, 47) & "..."
            Else
                Return NoteTextPlainText
            End If
        End Get
    End Property

    Public ReadOnly Property ProfileVersionId() As Guid
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            Return mProfileVersionId
        End Get
    End Property

    Public ReadOnly Property ReferenceList() As QuestionReferenceList
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mReferenceList
        End Get
    End Property

    Public ReadOnly Property QuestionReference() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mReferenceList.QuestionReferenceListText
        End Get
    End Property

    'required for WCF version
    Public ReadOnly Property LastUpdated() As Byte()
        Get
            Return mLastUpdated
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mId
    End Function

    Public Overrides ReadOnly Property IsDirty() As Boolean
        Get
            Return MyBase.IsDirty OrElse mReferenceList.IsDirty
        End Get
    End Property

    Public Overrides ReadOnly Property IsValid() As Boolean
        Get
            Return MyBase.IsValid AndAlso mReferenceList.IsValid
        End Get
    End Property

#End Region

#Region " Validation Rules "

    Protected Overrides Sub AddBusinessRules()
        ValidationRules.AddRule(AddressOf Validation.CommonRules.StringRequired, "NoteText")        
    End Sub

#End Region

#Region " Authorization Rules "

    Protected Overrides Sub AddAuthorizationRules()
        '
    End Sub

    Public Function CanDeleteNote() As Boolean

        Return CanEditNoteText()

    End Function

    Public Function CanEditNoteText() As Boolean

        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Dim currentProfileVersionInfo As ProfileVersionInfo = ProfileVersionInfo.GetProfileVersionInfo(DirectCast(Me.Parent, NoteList).ProfileVersionId)

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

        'Must be a Profile Editor 
        If identity.IsProfileEditor Then
            Return True
        End If

        If identity.IsProfileContributor(currentProfileVersionInfo.ProfileId) Then
            'or a contributor with access to all of the sections the note is associated with
            For Each ref As QuestionReference In Me.ReferenceList
                If Not identity.IsProfileSectionContributor(currentProfileVersionInfo.ProfileId, ref.ProfileSectionId) Then
                    Return False
                End If
            Next
            Return True
        Else
            Return False
        End If

    End Function

#End Region

#Region " Factory Methods "

    Friend Shared Function NewNote(ByVal profileVersionId As Guid) As Note
        Return New Note(profileVersionId)
    End Function

    Friend Shared Function GetNote(ByVal profileVersionId As Guid, ByVal profileNote As DataContracts.ProfileNote) As Note
        Return New Note(profileVersionId, profileNote)
    End Function

    Private Sub New(ByVal profileVersionId As Guid)
        mId = Guid.NewGuid()
        mNoteText = String.Empty
        mProfileVersionId = profileVersionId
        mReferenceList = QuestionReferenceList.NewQuestionReferenceList(profileVersionId)
        MarkAsChild()
        ValidationRules.CheckRules()
    End Sub

    Private Sub New()
        'requires use of factory methods
    End Sub

    Private Sub New(ByVal profileVersionId As Guid, ByVal profileNote As DataContracts.ProfileNote)
        MarkAsChild()
        Fetch(profileVersionId, profileNote)
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal profileVersionId As Guid, ByVal profileNote As DataContracts.ProfileNote)
        mId = profileNote.Id
        mNoteText = profileNote.NoteText
        mProfileVersionId = profileVersionId
        mReferenceList = QuestionReferenceList.GetQuestionReferenceList(profileVersionId, profileNote.QuestionReferences)
        mLastUpdated = profileNote.LastUpdated
        MarkOld()
    End Sub

    Friend Function GetDelete() As DataContracts.ProfileNoteDelete

        Return New DataContracts.ProfileNoteDelete With {.Id = mId, _
                                                         .LastUpdated = mLastUpdated}

    End Function

    Friend Function GetInsert() As DataContracts.ProfileNoteInsert

        Return New DataContracts.ProfileNoteInsert With { _
            .Id = mId, _
            .NoteText = mNoteText, _
            .QuestionReferenceAddList = mReferenceList.GetAddList() _
                }

    End Function

    Friend Function GetUpdate() As DataContracts.ProfileNoteUpdate

        Return New DataContracts.ProfileNoteUpdate With { _
            .Id = mId, _
            .NoteText = mNoteText, _
            .QuestionReferenceAddList = mReferenceList.GetAddList(), _
            .QuestionReferenceRemoveList = mReferenceList.GetRemoveList(), _
            .LastUpdated = mLastUpdated _
        }

    End Function

    Friend Sub Insert(ByVal newId As Guid, ByVal newLastUpdated As Byte())
        mId = newId
        mLastUpdated = newLastUpdated
        MarkOld()
    End Sub

    Friend Sub Update(ByVal newLastUpdated As Byte())
        mLastUpdated = newLastUpdated
        MarkOld()
    End Sub

    Friend Sub DeleteSelf()
        MarkNew()
    End Sub

#End Region

End Class

