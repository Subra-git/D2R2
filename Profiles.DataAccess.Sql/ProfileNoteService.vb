Imports Profiles.Contracts.ServiceContracts
Imports Profiles.Contracts.DataContracts
Imports System.Data.SqlClient
Imports System.Transactions

Public Class ProfileNoteService
    Implements IProfileNoteService

    Public Function GetNoteTypes() As List(Of ProfileNoteType) Implements IProfileNoteService.GetNoteTypes

        Dim noteTypes As New List(Of ProfileNoteType)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgaProfileNoteType"
                Using reader As New Data.SafeDataReader(getCommand.ExecuteReader)
                    While reader.Read
                        noteTypes.Add(New ProfileNoteType(reader.GetGuid(0), reader.GetString(1), reader.GetString(2)))
                    End While
                End Using
            End Using
        End Using

        Return noteTypes

    End Function

    Public Function GetNotesBySection(ByVal request As GetProfileNotesBySectionRequest) As List(Of ProfileNote) Implements IProfileNoteService.GetNotesBySection

        Dim noteDictionary As New Dictionary(Of Guid, ProfileNote)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgProfileVersionNoteBySectionAndType"
                getCommand.Parameters.AddWithValue("@ProfileNoteTypeId", request.NoteTypeId)
                getCommand.Parameters.AddWithValue("@ProfileVersionId", request.ProfileVersionId)
                getCommand.Parameters.AddWithValue("@ProfileSectionId", request.ProfileSectionId)
                Using reader As New Data.SafeDataReader(getCommand.ExecuteReader)
                    While reader.Read()
                        Dim note As New ProfileNote
                        With note
                            .Id = reader.GetGuid(0)
                            .NoteText = reader.GetString(1)                        
                            .QuestionReferences = New List(Of QuestionReference)
                            reader.GetBytes("LastUpdated", 0, .LastUpdated, 0, 8)
                        End With
                        noteDictionary.Add(note.Id, note)
                    End While

                    If reader.NextResult Then
                        While reader.Read()
                            noteDictionary(reader.GetGuid(0)).QuestionReferences.Add(New QuestionReference(request.ProfileSectionId, reader.GetGuid(1)))
                        End While
                    End If
                End Using

            End Using
        End Using

        Return noteDictionary.Values.ToList()

    End Function

    Public Function GetNotesByVersion(ByVal request As Contracts.DataContracts.GetProfileNotesByVersionRequest) As System.Collections.Generic.List(Of Contracts.DataContracts.ProfileNote) Implements IProfileNoteService.GetNotesByVersion

        Dim noteDictionary As New Dictionary(Of Guid, ProfileNote)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgProfileVersionNoteByType"
                getCommand.Parameters.AddWithValue("@ProfileNoteTypeId", request.NoteTypeId)
                getCommand.Parameters.AddWithValue("@ProfileVersionId", request.ProfileVersionId)
                Using reader As New Data.SafeDataReader(getCommand.ExecuteReader)
                    While reader.Read()
                        Dim note As New ProfileNote
                        With note
                            .Id = reader.GetGuid(0)
                            .NoteText = reader.GetString(1)
                            .QuestionReferences = New List(Of QuestionReference)
                            reader.GetBytes("LastUpdated", 0, .LastUpdated, 0, 8)
                        End With
                        noteDictionary.Add(note.Id, note)
                    End While

                    If reader.NextResult Then
                        While reader.Read()
                            noteDictionary(reader.GetGuid(0)).QuestionReferences.Add(New QuestionReference(reader.GetGuid(1), reader.GetGuid(2)))
                        End While
                    End If
                End Using

            End Using
        End Using

        Return noteDictionary.Values.ToList()

    End Function

    Public Function UpdateNotes(ByVal request As ProfileNoteChangeset) As ChangeResult Implements IProfileNoteService.UpdateNotes

        Dim result As New ChangeResult

        Dim sectionList As New List(Of Guid)

        Using transaction As New TransactionScope

            Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
                connection.Open()

                sectionList = GetSectionList(request, connection)

                For Each item As ProfileNoteDelete In request.DeleteList                  
                    DeleteNote(item, connection)
                Next

                For Each item As ProfileNoteInsert In request.InsertList
                    InsertNote(item, request, connection, result)
                Next

                For Each item As ProfileNoteUpdate In request.UpdateList                    
                    UpdateNote(item, request, connection, result)
                Next

                For Each sectionId As Guid In sectionList
                    LogUserContribution(connection, request.UserId, request.ProfileVersionId, sectionId)
                Next

            End Using
            transaction.Complete()
        End Using

        Return result

    End Function

    Private Sub InsertNote(ByVal item As ProfileNoteInsert, ByVal request As ProfileNoteChangeset, ByVal connection As SqlConnection, ByVal result As ChangeResult)

        Using insertCommand As SqlCommand = connection.CreateCommand
            insertCommand.CommandType = CommandType.StoredProcedure
            insertCommand.CommandText = "spiProfileVersionNote"
            insertCommand.Parameters.AddWithValue("@Id", item.Id)
            insertCommand.Parameters.AddWithValue("@ProfileVersionId", request.ProfileVersionId)
            insertCommand.Parameters.AddWithValue("@ProfileNoteTypeId", request.NoteTypeId)

            insertCommand.Parameters.AddWithValue("@NoteText", item.NoteText)
            Dim output As New SqlParameter("@NewLastUpdated", SqlDbType.Timestamp)
            output.Direction = ParameterDirection.Output
            insertCommand.Parameters.Add(output)
            insertCommand.ExecuteNonQuery()

            result.IdInsertList.Add(item.Id)
            result.LastUpdatedInsertList.Add(CType(insertCommand.Parameters("@NewLastUpdated").Value, Byte()))
        End Using

        For Each ref As QuestionReference In item.QuestionReferenceAddList
            Using insertCommand As SqlCommand = connection.CreateCommand
                insertCommand.CommandType = CommandType.StoredProcedure
                insertCommand.CommandText = "spiProfileVersionNoteQuestion"
                insertCommand.Parameters.AddWithValue("@ProfileVersionNoteId", item.Id)
                insertCommand.Parameters.AddWithValue("@ProfileQuestionId", ref.ProfileQuestionId)
                insertCommand.Parameters.AddWithValue("@ProfileSectionId", ref.ProfileSectionId)
                insertCommand.ExecuteNonQuery()
            End Using
        Next

    End Sub

    Private Sub UpdateNote(ByVal item As ProfileNoteUpdate, ByVal request As ProfileNoteChangeset, ByVal connection As SqlConnection, ByVal result As ChangeResult)

        Using updateCommand As SqlCommand = connection.CreateCommand
            updateCommand.CommandType = CommandType.StoredProcedure
            updateCommand.CommandText = "spuProfileVersionNote"
            updateCommand.Parameters.AddWithValue("@Id", item.Id)
            updateCommand.Parameters.AddWithValue("@NoteText", item.NoteText)
            updateCommand.Parameters.AddWithValue("@LastUpdated", item.LastUpdated)
            Dim output As New SqlParameter("@NewLastUpdated", SqlDbType.Timestamp)
            output.Direction = ParameterDirection.Output
            updateCommand.Parameters.Add(output)
            updateCommand.ExecuteNonQuery()
            result.LastUpdatedUpdateList.Add(CType(updateCommand.Parameters("@NewLastUpdated").Value, Byte()))
        End Using

        For Each ref As QuestionReference In item.QuestionReferenceAddList
            Using insertCommand As SqlCommand = connection.CreateCommand
                insertCommand.CommandType = CommandType.StoredProcedure
                insertCommand.CommandText = "spiProfileVersionNoteQuestion"
                insertCommand.Parameters.AddWithValue("@ProfileVersionNoteId", item.Id)
                insertCommand.Parameters.AddWithValue("@ProfileQuestionId", ref.ProfileQuestionId)
                insertCommand.Parameters.AddWithValue("@ProfileSectionId", ref.ProfileSectionId)
                insertCommand.ExecuteNonQuery()
            End Using
        Next

        For Each ref As QuestionReference In item.QuestionReferenceRemoveList
            Using insertCommand As SqlCommand = connection.CreateCommand
                insertCommand.CommandType = CommandType.StoredProcedure
                insertCommand.CommandText = "spdProfileVersionNoteQuestion"
                insertCommand.Parameters.AddWithValue("@ProfileVersionNoteId", item.Id)
                insertCommand.Parameters.AddWithValue("@ProfileQuestionId", ref.ProfileQuestionId)
                insertCommand.Parameters.AddWithValue("@ProfileSectionId", ref.ProfileSectionId)
                insertCommand.ExecuteNonQuery()
            End Using
        Next

    End Sub

    Private Function GetSectionListByProfileVersionNoteId(ByVal profileVersionNoteId As Guid, ByVal connection As SqlConnection, ByVal isDelete As Boolean, ByVal newNoteText As String) As List(Of Guid)

        Dim sectionList As New List(Of Guid)

        Using getCommand As SqlCommand = connection.CreateCommand
            getCommand.CommandType = CommandType.StoredProcedure
            getCommand.CommandText = "spgProfileSectionIdByProfileVersionNoteId"
            getCommand.Parameters.AddWithValue("@ProfileVersionNoteId", profileVersionNoteId)

            Using reader As New Data.SafeDataReader(getCommand.ExecuteReader)
                While reader.Read()

                    Dim currentSectionId As Guid = reader.GetGuid(0)
                    Dim oldNoteText As String = reader.GetString(1)

                    If isDelete Then
                        If Not sectionList.Contains(currentSectionId) Then
                            sectionList.Add(currentSectionId)
                        End If
                    Else
                        If Not sectionList.Contains(currentSectionId) And Not oldNoteText.Equals(newNoteText) Then
                            sectionList.Add(currentSectionId)
                        End If
                    End If

                    
                End While
            End Using

        End Using

        Return sectionList

    End Function

    Private Function GetSectionList(ByVal request As ProfileNoteChangeset, ByVal connection As SqlConnection) As List(Of Guid)
        'a means of determining which sections are 
        'effected by the changeset.  

        Dim sectionList As New List(Of Guid)

        'deleting a note could effect several sections
        For Each item As ProfileNoteDelete In request.DeleteList

            For Each id As Guid In GetSectionListByProfileVersionNoteId(item.Id, connection, True, String.Empty)
                If Not sectionList.Contains(id) Then
                    sectionList.Add(id)
                End If
            Next

        Next

        'editing a note could effect several sections, if the note text changes.
        For Each item As ProfileNoteUpdate In request.UpdateList

            For Each id As Guid In GetSectionListByProfileVersionNoteId(item.Id, connection, False, item.NoteText)
                If Not sectionList.Contains(id) Then
                    sectionList.Add(id)
                End If
            Next

        Next

        For Each updateNote As ProfileNoteUpdate In request.UpdateList
            For Each ref As QuestionReference In updateNote.QuestionReferenceAddList
                If Not sectionList.Contains(ref.ProfileSectionId) Then
                    sectionList.Add(ref.ProfileSectionId)
                End If
            Next

            For Each ref As QuestionReference In updateNote.QuestionReferenceRemoveList
                If Not sectionList.Contains(ref.ProfileSectionId) Then
                    sectionList.Add(ref.ProfileSectionId)
                End If
            Next
        Next

        For Each insertNote As ProfileNoteInsert In request.InsertList
            For Each ref As QuestionReference In insertNote.QuestionReferenceAddList
                If Not sectionList.Contains(ref.ProfileSectionId) Then
                    sectionList.Add(ref.ProfileSectionId)
                End If
            Next
        Next

        Return sectionList

    End Function

    Private Sub DeleteNote(ByVal item As ProfileNoteDelete, ByVal connection As SqlConnection)

        Using deleteCommand As SqlCommand = connection.CreateCommand
            deleteCommand.CommandType = CommandType.StoredProcedure
            deleteCommand.CommandText = "spdProfileVersionNote"
            deleteCommand.Parameters.AddWithValue("@Id", item.Id)
            deleteCommand.Parameters.AddWithValue("@LastUpdated", item.LastUpdated)
            deleteCommand.ExecuteNonQuery()
        End Using

    End Sub

    Private Sub LogUserContribution(ByVal connection As SqlConnection, ByVal userId As Guid, ByVal profileVersionId As Guid, ByVal profileSectionId As Guid)

        Using updateCommand As SqlCommand = connection.CreateCommand
            updateCommand.CommandType = CommandType.StoredProcedure
            updateCommand.CommandText = "spiProfileVersionSectionUser"
            updateCommand.Parameters.AddWithValue("@UserId", userId)
            updateCommand.Parameters.AddWithValue("@ProfileVersionId", profileVersionId)
            updateCommand.Parameters.AddWithValue("@ProfileSectionId", profileSectionId)
            updateCommand.Parameters.AddWithValue("@LastContributionDate", DateTime.Now())
            updateCommand.ExecuteNonQuery()
        End Using

    End Sub

  
End Class
