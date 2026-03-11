Imports Profiles.Contracts.ServiceContracts
Imports Profiles.Contracts.DataContracts
Imports System.Data.SqlClient
Imports System.Transactions
Imports Profiles.DataAccess.Sql.Data

Public Class ReviewCommentService
    Implements IReviewCommentService

    Public Function GetReviewComments(ByVal request As GetReviewCommentsRequest) As List(Of ReviewCommentData) Implements IReviewCommentService.GetReviewComments

        Dim commentList As New List(Of ReviewCommentData)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgReviewCommentByProfileVersionSection"
                getCommand.Parameters.AddWithValue("@ProfileVersionId", request.ProfileVersionId)
                getCommand.Parameters.AddWithValue("@ProfileSectionId", request.ProfileSectionId)
                Using reader As New SafeDataReader(getCommand.ExecuteReader)
                    While reader.Read()
                        Dim updated(7) As Byte
                        reader.GetBytes("LastUpdated", 0, updated, 0, 8)
                        commentList.Add(New ReviewCommentData() With { _
                                        .Id = reader.GetGuid(0), _
                                        .CommentDate = reader.GetDateTime(1), _
                                        .CommentSubject = reader.GetString(2), _
                                        .CommentReference = reader.GetString(3), _
                                        .CommentText = reader.GetString(4), _
                                        .UserName = reader.GetString(5), _
                                        .UserFullName = reader.GetString(6), _
                                        .ProfileVersionId = reader.GetGuid(7), _
                                        .LastUpdated = updated, _
                                        .ParentId = reader.GetGuid(9), _
                                        .Level = reader.GetInt32(10), _
                                        .RowCode = reader.GetString(11), _
                                        .ChildCount = reader.GetInt32(12)})
                    End While
                End Using
            End Using
        End Using

        Return commentList

    End Function

    Public Function UpdateReviewComments(ByVal request As ReviewCommentChangeset) As ChangeResult Implements IReviewCommentService.UpdateReviewComments

        Dim result As New ChangeResult

        Using transaction As New TransactionScope

            Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
                connection.Open()

                For Each item As ReviewCommentDelete In request.DeleteList
                    DeleteReviewComment(item, connection)
                Next

                For Each item As ReviewCommentInsert In request.InsertList
                    InsertReviewComment(item, request, connection, result)
                Next

                For Each item As ReviewCommentUpdate In request.UpdateList
                    UpdateReviewComment(item, connection, result)
                Next

            End Using
            transaction.Complete()
        End Using

        Return result

    End Function

    Private Sub DeleteReviewComment(ByVal item As ReviewCommentDelete, ByVal connection As SqlConnection)

        Using deleteCommand As SqlCommand = connection.CreateCommand
            deleteCommand.CommandType = CommandType.StoredProcedure
            deleteCommand.CommandText = "spdReviewComment"
            deleteCommand.Parameters.AddWithValue("@Id", item.Id)
            deleteCommand.ExecuteNonQuery()
        End Using

    End Sub

    Private Sub InsertReviewComment(ByVal item As ReviewCommentInsert, ByVal request As ReviewCommentChangeset, ByVal connection As SqlConnection, ByVal result As ChangeResult)

        Using insertCommand As SqlCommand = connection.CreateCommand
            insertCommand.CommandType = CommandType.StoredProcedure
            insertCommand.CommandText = "spiReviewComment"
            insertCommand.Parameters.AddWithValue("@Id", item.Id)
            insertCommand.Parameters.AddWithValue("@ProfileVersionId", request.ProfileVersionId)
            insertCommand.Parameters.AddWithValue("@ProfileSectionId", request.ProfileSectionId)
            insertCommand.Parameters.AddWithValue("@CommentDate", item.CommentDate)
            insertCommand.Parameters.AddWithValue("@Subject", item.CommentSubject)
            insertCommand.Parameters.AddWithValue("@CommentReference", item.CommentReference)
            insertCommand.Parameters.AddWithValue("@Comment", item.CommentText)
            insertCommand.Parameters.AddWithValue("@UserName", item.UserName)
            If item.ParentId.Equals(Guid.Empty) Then
                insertCommand.Parameters.AddWithValue("@ParentId", DBNull.Value)
            Else
                insertCommand.Parameters.AddWithValue("@ParentId", item.ParentId)
            End If
            Dim output As New SqlParameter("@NewLastUpdated", SqlDbType.Timestamp)
            output.Direction = ParameterDirection.Output
            insertCommand.Parameters.Add(output)
            insertCommand.ExecuteNonQuery()

            result.IdInsertList.Add(item.Id)
            result.LastUpdatedInsertList.Add(CType(insertCommand.Parameters("@NewLastUpdated").Value, Byte()))
        End Using

    End Sub

    Private Sub UpdateReviewComment(ByVal item As ReviewCommentUpdate, ByVal connection As SqlConnection, ByVal result As ChangeResult)

        Using updateCommand As SqlCommand = connection.CreateCommand
            updateCommand.CommandType = CommandType.StoredProcedure
            updateCommand.CommandText = "spuReviewComment"
            updateCommand.Parameters.AddWithValue("@Id", item.Id)
            updateCommand.Parameters.AddWithValue("@Subject", item.CommentSubject)
            updateCommand.Parameters.AddWithValue("@CommentReference", item.CommentReference)
            updateCommand.Parameters.AddWithValue("@Comment", item.CommentText)
            updateCommand.Parameters.AddWithValue("@LastUpdated", item.LastUpdated)
            Dim output As New SqlParameter("@NewLastUpdated", SqlDbType.Timestamp)
            output.Direction = ParameterDirection.Output
            updateCommand.Parameters.Add(output)
            updateCommand.ExecuteNonQuery()

            result.LastUpdatedUpdateList.Add(CType(updateCommand.Parameters("@NewLastUpdated").Value, Byte()))
        End Using

    End Sub

    Public Sub DeleteAllReviewComments(ByVal request As DeleteAllReviewCommentsRequest) Implements IReviewCommentService.DeleteAllReviewComments

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using deleteAllCommand As SqlCommand = connection.CreateCommand
                deleteAllCommand.CommandType = CommandType.StoredProcedure
                deleteAllCommand.CommandText = "spdReviewCommentsByProfileSection"
                deleteAllCommand.Parameters.AddWithValue("@ProfileVersionId", request.ProfileVersionId)
                deleteAllCommand.Parameters.AddWithValue("@ProfileSectionId", request.ProfileSectionId)
                deleteAllCommand.ExecuteNonQuery()
            End Using

        End Using

    End Sub

End Class
