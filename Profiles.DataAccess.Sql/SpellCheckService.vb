Imports Profiles.Contracts.ServiceContracts
Imports Profiles.Contracts.DataContracts
Imports System.Data.SqlClient
Imports System.Transactions

Public Class SpellCheckService
    Implements ISpellCheckService

    Public Function GetCustomWords() As List(Of CustomWord) Implements ISpellCheckService.GetCustomWords

        Dim customWords As New List(Of CustomWord)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgaSpellCustomWord"

                Using reader As New Data.SafeDataReader(getCommand.ExecuteReader)
                    While reader.Read()
                        Dim currentWord As New CustomWord
                        currentWord.Id = reader.GetGuid(0)
                        currentWord.Word = reader.GetString(1)
                        reader.GetBytes("LastUpdated", 0, currentWord.LastUpdated, 0, 8)
                        customWords.Add(currentWord)
                    End While
                End Using
            End Using
        End Using

        Return customWords

    End Function

    Public Function UpdateCustomWords(ByVal request As CustomWordChangeset) As ChangeResult Implements ISpellCheckService.UpdateCustomWords

        Dim result As New ChangeResult

        Using transaction As New TransactionScope

            Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
                connection.Open()

                For Each item As CustomWordDelete In request.DeleteList
                    DeleteCustomWord(item, connection)
                Next

                For Each item As CustomWordInsert In request.InsertList
                    InsertCustomWord(item, connection, result)
                Next

                For Each item As CustomWordUpdate In request.UpdateList
                    UpdateCustomWord(item, connection, result)
                Next

            End Using
            transaction.Complete()
        End Using

        Return result

    End Function

    Private Sub InsertCustomWord(ByVal item As CustomWordInsert, ByVal connection As SqlConnection, ByVal result As ChangeResult)

        Using insertCommand As SqlCommand = connection.CreateCommand
            insertCommand.CommandType = CommandType.StoredProcedure
            insertCommand.CommandText = "spiSpellCustomWord"
            insertCommand.Parameters.AddWithValue("@Id", item.Id)
            insertCommand.Parameters.AddWithValue("@Word", item.Word)
            Dim output As New SqlParameter("@LastUpdated", SqlDbType.Timestamp)
            output.Direction = ParameterDirection.Output
            insertCommand.Parameters.Add(output)
            insertCommand.ExecuteNonQuery()

            result.IdInsertList.Add(item.Id)
            result.LastUpdatedInsertList.Add(CType(insertCommand.Parameters("@LastUpdated").Value, Byte()))

        End Using

    End Sub

    Private Sub UpdateCustomWord(ByVal item As CustomWordUpdate, ByVal connection As SqlConnection, ByVal result As ChangeResult)

        Using updateCommand As SqlCommand = connection.CreateCommand
            updateCommand.CommandType = CommandType.StoredProcedure
            updateCommand.CommandText = "spuSpellCustomWord"
            updateCommand.Parameters.AddWithValue("@Id", item.Id)
            updateCommand.Parameters.AddWithValue("@Word", item.Word)
            updateCommand.Parameters.AddWithValue("@LastUpdated", item.LastUpdated)
            Dim output As New SqlParameter("@NewLastUpdated", SqlDbType.Timestamp)
            output.Direction = ParameterDirection.Output
            updateCommand.Parameters.Add(output)
            updateCommand.ExecuteNonQuery()

            result.LastUpdatedUpdateList.Add(CType(updateCommand.Parameters("@NewLastUpdated").Value, Byte()))

        End Using

    End Sub

    Private Sub DeleteCustomWord(ByVal item As CustomWordDelete, ByVal connection As SqlConnection)

        Using deleteCommand As SqlCommand = connection.CreateCommand
            deleteCommand.CommandType = CommandType.StoredProcedure
            deleteCommand.CommandText = "spdSpellCustomWord"
            deleteCommand.Parameters.AddWithValue("@Id", item.Id)
            deleteCommand.ExecuteNonQuery()
        End Using

    End Sub

End Class
