Imports Profiles.Contracts
Imports Profiles.Contracts.ServiceContracts
Imports ProfilesLibrary

<ServiceBehavior(InstanceContextMode:=InstanceContextMode.PerCall)> _
<ErrorHandlerBehavior()> _
Public Class SpellCheckService
    Implements ISpellCheckService

    Public Function GetCustomWords() As List(Of DataContracts.CustomWord) Implements ISpellCheckService.GetCustomWords

        Dim customWords As New List(Of DataContracts.CustomWord)

        Dim wordList As ProfilesLibrary.CustomWordList = ProfilesLibrary.CustomWordList.GetCustomWordList()
        For Each currentWord As ProfilesLibrary.CustomWord In wordList
            Dim wordData As New DataContracts.CustomWord
            wordData.Id = currentWord.Id
            wordData.Word = currentWord.Word
            wordData.LastUpdated = currentWord.LastUpdated
            customWords.Add(wordData)
        Next

        Return customWords

    End Function

    Public Function UpdateCustomWords(ByVal request As DataContracts.CustomWordChangeset) As DataContracts.ChangeResult Implements ISpellCheckService.UpdateCustomWords

        Dim result As New DataContracts.ChangeResult
        Dim insertList As New List(Of ProfilesLibrary.CustomWord)
        Dim updateList As New List(Of ProfilesLibrary.CustomWord)

        Dim customWords As ProfilesLibrary.CustomWordList = ProfilesLibrary.CustomWordList.GetCustomWordList()

        customWords.BeginEdit()

        For Each item As DataContracts.CustomWordDelete In request.DeleteList
            Dim wordToDelete As ProfilesLibrary.CustomWord = customWords.GetById(item.Id)
            If wordToDelete IsNot Nothing Then
                customWords.Remove(wordToDelete)
            End If
        Next

        For Each item As DataContracts.CustomWordInsert In request.InsertList
            Dim wordToInsert As ProfilesLibrary.CustomWord = CustomWord.NewCustomWord(item.Word)
            customWords.Add(wordToInsert)
            insertList.Add(wordToInsert)
        Next

        For Each item As DataContracts.CustomWordUpdate In request.UpdateList
            Dim wordToUpdate As ProfilesLibrary.CustomWord = customWords.GetById(item.Id)
            updateList.Add(wordToUpdate)
            If wordToUpdate IsNot Nothing AndAlso GlobalCommon.TimestampsEqual(wordToUpdate.LastUpdated, item.LastUpdated) Then
                wordToUpdate.Word = item.Word
            Else
                Throw New ApplicationException("The custom dictionary word has been edited by another user")
            End If
        Next

        customWords.ApplyEdit()
        customWords.Save()

        For Each item As ProfilesLibrary.CustomWord In insertList
            result.IdInsertList.Add(item.Id)
            result.LastUpdatedInsertList.Add(item.LastUpdated)
        Next

        For Each item As ProfilesLibrary.CustomWord In updateList
            result.LastUpdatedUpdateList.Add(item.LastUpdated)
        Next

        Return result

    End Function
End Class
