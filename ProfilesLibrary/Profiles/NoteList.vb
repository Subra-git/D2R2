Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class NoteList
    Inherits BusinessListBase(Of NoteList, Note)

    Private mProfileVersionId As Guid
    Private mNoteTypeId As Guid

    Friend ReadOnly Property ProfileVersionId() As Guid
        Get
            Return mProfileVersionId
        End Get
    End Property

    Friend ReadOnly Property NoteTypeId() As Guid
        Get
            Return mNoteTypeId
        End Get
    End Property

    Public Function GetById(ByVal noteId As Guid) As Note
        For Each currentNote As Note In Me
            If currentNote.Id.Equals(noteId) Then
                Return currentNote
            End If
        Next
        Return Nothing
    End Function

    Public Sub RemoveQuestionReferenceByProfileSectionId(ByVal profileSectionId As Guid)

        For Each item As Note In Me

            item.ReferenceList.RemoveQuestionReferenceByProfileSectionId(profileSectionId)

        Next

    End Sub

    Protected Overrides Function AddNewCore() As Object

        Dim newNote As Note = Note.NewNote(mProfileVersionId)
        Add(newNote)
        Return newNote

    End Function

#Region " Authorization Rules "

    Public Shared Function CanGetNoteList(ByVal profileVersionId As Guid) As Boolean

        Dim currentProfileVersionInfo As ProfileVersionInfo = ProfileVersionInfo.GetProfileVersionInfo(profileVersionId)

        'If the profile version is published
        If Not currentProfileVersionInfo.Status = ProfileVersionStatus.Draft Then
            'the note information is available to everyone if public; all authenticated users if not public
            Return currentProfileVersionInfo.IsPublic OrElse Csla.ApplicationContext.User.Identity.IsAuthenticated
        End If

        'If the profile version is draft, you must be a profile editor, policy profile user or a contributor or a reviewer to get
        'the note information
        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)

        If identity.IsUserManagementSystem Then
            Return False
        End If

        Return (identity.IsProfileContributorOrReviewer(currentProfileVersionInfo.ProfileId) OrElse _
                identity.IsProfileEditor OrElse identity.IsPolicyProfileUser)

    End Function

    Public Shared Function CanAddNote(ByVal profileVersionId As Guid) As Boolean

        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Dim currentProfileVersionInfo As ProfileVersionInfo = ProfileVersionInfo.GetProfileVersionInfo(profileVersionId)

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

        'Must be a Profile Editor or a contributor to add a new note
        Return (identity.IsProfileEditor OrElse identity.IsProfileContributor(currentProfileVersionInfo.ProfileId))
    End Function

    Public Shared Function CanEditNoteList(ByVal profileVersionId As Guid, ByVal profileSectionId As Guid) As Boolean

        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Dim currentProfileVersionInfo As ProfileVersionInfo = ProfileVersionInfo.GetProfileVersionInfo(profileVersionId)

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

        'Must be a Profile Editor or a contributor to edit a note
        Return (identity.IsProfileEditor OrElse identity.IsProfileSectionContributor(currentProfileVersionInfo.ProfileId, profileSectionId))
    End Function

    Public Overrides Function Save() As NoteList

        For Each item As Note In Me
            If item.IsDirty Then
                If item.IsNew Then
                    If Not CanAddNote(mProfileVersionId) Then
                        Throw New System.Security.SecurityException("You do not have permission to edit the profile note list.")
                    End If
                End If
            End If
        Next

        For Each item As Note In DeletedList
            If Not item.CanDeleteNote() Then
                Throw New System.Security.SecurityException("You do not have permission to edit the profile note list.")
            End If
        Next

        Return MyBase.Save()

    End Function

#End Region

#Region " Factory Methods "

    Public Shared Function GetNoteListBySection(ByVal profileVersionId As Guid, ByVal profileSectionId As Guid, ByVal type As NoteType) As NoteList

        'Here is where we need to check if the user is allowed to get the note list
        If Not CanGetNoteList(profileVersionId) Then
            Throw New System.Security.SecurityException("You do not have permission to get notes for this profile version.")
        End If

        Dim noteTypeId As Guid = NoteTypeInfoList.GetNoteTypeInfoByNoteType(type).Id

        Return DataPortal.Fetch(Of NoteList)(New Criteria(profileVersionId, profileSectionId, noteTypeId))

    End Function

    Public Shared Function GetNoteListBySection(ByVal profileVersionId As Guid, ByVal profileSectionId As Guid, ByVal noteTypeId As Guid) As NoteList

        If Not CanGetNoteList(profileVersionId) Then
            Throw New System.Security.SecurityException("You do not have permission to get notes for this profile version.")
        End If

        Return DataPortal.Fetch(Of NoteList)(New Criteria(profileVersionId, profileSectionId, noteTypeId))

    End Function

    Public Shared Function GetNoteListByVersion(ByVal profileVersionId As Guid, ByVal noteTypeId As Guid) As NoteList

        If Not CanGetNoteList(profileVersionId) Then
            Throw New System.Security.SecurityException("You do not have permission to get notes for this profile version.")
        End If

        Return DataPortal.Fetch(Of NoteList)(New Criteria(profileVersionId, noteTypeId))

    End Function

    Public Shared Function GetNoteListByVersion(ByVal profileVersionId As Guid, ByVal type As NoteType) As NoteList

        If Not CanGetNoteList(profileVersionId) Then
            Throw New System.Security.SecurityException("You do not have permission to get notes for this profile version.")
        End If

        Dim noteTypeId As Guid = NoteTypeInfoList.GetNoteTypeInfoByNoteType(type).Id

        Return DataPortal.Fetch(Of NoteList)(New Criteria(profileVersionId, noteTypeId))
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
        Private mNoteTypeId As Guid

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

        Public ReadOnly Property NoteTypeId() As Guid
            Get
                Return mNoteTypeId
            End Get
        End Property

        Public Sub New(ByVal profileVersionId As Guid, ByVal profileSectionId As Guid, ByVal noteTypeId As Guid)
            mProfileVersionId = profileVersionId
            mProfileSectionId = profileSectionId
            mNoteTypeId = noteTypeId
        End Sub

        Public Sub New(ByVal profileVersionId As Guid, ByVal noteTypeId As Guid)
            mProfileVersionId = profileVersionId
            mNoteTypeId = noteTypeId
        End Sub

    End Class

    Private Overloads Sub DataPortal_Fetch(ByVal criteria As Criteria)

        mProfileVersionId = criteria.ProfileVersionId
        mNoteTypeId = criteria.NoteTypeId

        RaiseListChangedEvents = False

        Dim db As ServiceContracts.IProfileNoteService = DataFactory.GetProfileNoteService()
        Dim profileNotes As List(Of DataContracts.ProfileNote)

        If Guid.Equals(criteria.ProfileSectionId, Guid.Empty) Then

            ' get by version
            profileNotes = db.GetNotesByVersion( _
                New DataContracts.GetProfileNotesByVersionRequest(criteria.ProfileVersionId, criteria.NoteTypeId) _
            )

        Else
            'get by section
            profileNotes = db.GetNotesBySection( _
                New DataContracts.GetProfileNotesBySectionRequest(criteria.ProfileVersionId, criteria.ProfileSectionId, criteria.NoteTypeId) _
            )

        End If

        For Each profileNote As DataContracts.ProfileNote In profileNotes
            Add(Note.GetNote(mProfileVersionId, profileNote))
        Next

        Dim profileSectionList As ProfileSectionMetadataList = ProfileSectionMetadataList.GetProfileSectionMetadataList()

        For Each currentNote As Note In Me
            currentNote.ReferenceList.UpdateQuestionReferenceStrings(profileSectionList)
        Next

        RaiseListChangedEvents = True

    End Sub

    Protected Overrides Sub DataPortal_Update()

        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Dim db As ServiceContracts.IProfileNoteService = DataFactory.GetProfileNoteService()
        Dim changeset As New DataContracts.ProfileNoteChangeset(identity.UserId, mProfileVersionId, mNoteTypeId)

        Dim updateRequired As Boolean

        For Each item As Note In DeletedList
            changeset.DeleteList.Add(item.GetDelete())
            updateRequired = True
        Next

        For Each item As Note In Me
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
            Dim result As DataContracts.ChangeResult = db.UpdateNotes(changeset)
            Dim currentInsert As Integer
            Dim currentUpdate As Integer
            RaiseListChangedEvents = False

            For Each item As Note In DeletedList
                item.DeleteSelf()
            Next

            For Each item As Note In Me
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

