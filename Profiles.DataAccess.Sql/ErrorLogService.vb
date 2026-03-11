Imports Profiles.Contracts.ServiceContracts
Imports Profiles.Contracts.DataContracts
Imports System.Data.SqlClient

Public Class ErrorLogService
    Implements IErrorLogService

    Public Sub CreateErrorLogEntry(ByVal entry As ErrorLogEntry) Implements IErrorLogService.CreateErrorLogEntry

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using insertCommand As SqlCommand = connection.CreateCommand

                insertCommand.CommandType = CommandType.StoredProcedure
                insertCommand.CommandText = "spiErrorLog"
                insertCommand.Parameters.AddWithValue("@Id", entry.Id)
                insertCommand.Parameters.AddWithValue("@ErrorType", entry.ErrorType)
                insertCommand.Parameters.AddWithValue("@Exception", entry.Exception)
                insertCommand.Parameters.AddWithValue("@StackTrace", entry.StackTrace)
                insertCommand.Parameters.AddWithValue("@ApplicationName", entry.ApplicationName)
                insertCommand.Parameters.AddWithValue("@VersionName", entry.VersionName)
                insertCommand.Parameters.AddWithValue("@Request", entry.Request)
                insertCommand.Parameters.AddWithValue("@Username", entry.Username)

                insertCommand.ExecuteNonQuery()

            End Using
        End Using

    End Sub

End Class
