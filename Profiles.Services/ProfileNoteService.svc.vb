Imports Profiles.Contracts
Imports Profiles.Contracts.ServiceContracts
Imports ProfilesLibrary

<ServiceBehavior(InstanceContextMode:=InstanceContextMode.PerCall)> _
<ErrorHandlerBehavior()> _
Public Class ProfileNoteService
    Implements IProfileNoteService

    Public Function GetNoteTypes() As List(Of DataContracts.ProfileNoteType) Implements IProfileNoteService.GetNoteTypes

        Dim profileNoteTypes As New List(Of DataContracts.ProfileNoteType)

        Dim noteTypes As ProfilesLibrary.NoteTypeInfoList = ProfilesLibrary.NoteTypeInfoList.GetNoteTypeInfoList()
        For Each noteType As ProfilesLibrary.NoteTypeInfo In noteTypes
            profileNoteTypes.Add(New DataContracts.ProfileNoteType(noteType.Id, noteType.Name, noteType.PluralName))
        Next

        Return profileNoteTypes

    End Function

    Public Function GetNotesBySection(ByVal request As DataContracts.GetProfileNotesBySectionRequest) As List(Of DataContracts.ProfileNote) Implements IProfileNoteService.GetNotesBySection

        Dim profileNotes As New List(Of DataContracts.ProfileNote)

        Dim notes As ProfilesLibrary.NoteList = ProfilesLibrary.NoteList.GetNoteListBySection(request.ProfileVersionId, request.ProfileSectionId, request.NoteTypeId)
        For Each item As ProfilesLibrary.Note In notes
            profileNotes.Add(New DataContracts.ProfileNote() With { _
                             .Id = item.Id, _
                             .NoteText = item.NoteText, _
                             .QuestionReferences = GetQuestionReferenceList(item.ReferenceList), _
                             .LastUpdated = item.LastUpdated _
            })

        Next

        Return profileNotes

    End Function

    Public Function GetNotesByVersion(ByVal request As Contracts.DataContracts.GetProfileNotesByVersionRequest) As System.Collections.Generic.List(Of Contracts.DataContracts.ProfileNote) Implements Contracts.ServiceContracts.IProfileNoteService.GetNotesByVersion

        Dim profileNotes As New List(Of DataContracts.ProfileNote)

        Dim notes As ProfilesLibrary.NoteList = ProfilesLibrary.NoteList.GetNoteListByVersion(request.ProfileVersionId, request.NoteTypeId)
        For Each item As ProfilesLibrary.Note In notes

            profileNotes.Add(New DataContracts.ProfileNote() With { _
                             .Id = item.Id, _
                             .NoteText = item.NoteText, _
                             .QuestionReferences = GetQuestionReferenceList(item.ReferenceList), _
                             .LastUpdated = item.LastUpdated _
            })

        Next

        Return profileNotes

    End Function

    Private Function GetQuestionReferenceList(ByVal referenceList As QuestionReferenceList) As List(Of DataContracts.QuestionReference)

        Dim dtoQuestionReferenceList As New List(Of Contracts.DataContracts.QuestionReference)

        For Each ref As QuestionReference In referenceList

            Dim dtoQuestionReference As New Contracts.DataContracts.QuestionReference(ref.ProfileSectionId, ref.ProfileQuestionId)
            dtoQuestionReferenceList.Add(dtoQuestionReference)

        Next

        Return dtoQuestionReferenceList

    End Function

    Public Function UpdateNotes(ByVal request As DataContracts.ProfileNoteChangeset) As DataContracts.ChangeResult Implements IProfileNoteService.UpdateNotes

        Dim result As New DataContracts.ChangeResult
        Dim insertList As New List(Of ProfilesLibrary.Note)
        Dim updateList As New List(Of ProfilesLibrary.Note)

        Dim notes As ProfilesLibrary.NoteList = ProfilesLibrary.NoteList.GetNoteListByVersion(request.ProfileVersionId, request.NoteTypeId)

        notes.BeginEdit()

        For Each item As DataContracts.ProfileNoteDelete In request.DeleteList
            Dim noteToDelete As ProfilesLibrary.Note = notes.GetById(item.Id)
            If noteToDelete IsNot Nothing Then
                notes.Remove(noteToDelete)
            End If
        Next

        For Each item As DataContracts.ProfileNoteInsert In request.InsertList
            Dim noteToInsert As ProfilesLibrary.Note = notes.AddNew()
            insertList.Add(noteToInsert)
            noteToInsert.NoteText = item.NoteText
            For Each questionReference As DataContracts.QuestionReference In item.QuestionReferenceAddList
                noteToInsert.ReferenceList.AddQuestionReference(questionReference.ProfileSectionId, questionReference.ProfileQuestionId)
            Next
        Next

        For Each item As DataContracts.ProfileNoteUpdate In request.UpdateList
            Dim noteToUpdate As ProfilesLibrary.Note = notes.GetById(item.Id)
            updateList.Add(noteToUpdate)
            If noteToUpdate IsNot Nothing AndAlso GlobalCommon.TimestampsEqual(noteToUpdate.LastUpdated, item.LastUpdated) Then

                noteToUpdate.NoteText = item.NoteText
                For Each questionReference As DataContracts.QuestionReference In item.QuestionReferenceRemoveList
                    noteToUpdate.ReferenceList.RemoveQuestionReference(questionReference.ProfileSectionId, questionReference.ProfileQuestionId)
                Next
                For Each questionReference As DataContracts.QuestionReference In item.QuestionReferenceAddList
                    noteToUpdate.ReferenceList.AddQuestionReference(questionReference.ProfileSectionId, questionReference.ProfileQuestionId)
                Next
            Else
                Throw New ApplicationException("The reference has been edited by another user")
            End If
        Next

        notes.ApplyEdit()
        notes.Save()

        For Each item As ProfilesLibrary.Note In insertList
            result.IdInsertList.Add(item.Id)
            result.LastUpdatedInsertList.Add(item.LastUpdated)
        Next

        For Each item As ProfilesLibrary.Note In updateList
            result.LastUpdatedUpdateList.Add(item.LastUpdated)
        Next

        Return result

    End Function


End Class
