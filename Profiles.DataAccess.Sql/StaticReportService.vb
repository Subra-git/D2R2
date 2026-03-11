Imports Profiles.Contracts.ServiceContracts
Imports Profiles.Contracts.DataContracts
Imports System.Data.SqlClient
Imports System.Transactions

Public Class StaticReportService
    Implements IStaticReportService

    Public Function GetCurrentPublicStaticReports(ByVal request As GetCurrentPublicStaticReportsRequest) As List(Of StaticReportVersion) Implements IStaticReportService.GetCurrentPublicStaticReports

        Return GetStaticReports(Guid.Empty, False, True)

    End Function

    Public Function GetCurrentStaticReports(ByVal request As GetCurrentStaticReportsRequest) As List(Of StaticReportVersion) Implements IStaticReportService.GetCurrentStaticReports

        Return GetStaticReports(Guid.Empty, request.IsUserManual, False)

    End Function

    Public Function GetStaticReportPublicHistory(ByVal request As GetStaticReportPublicHistoryRequest) As List(Of StaticReportVersion) Implements IStaticReportService.GetStaticReportPublicHistory

        Return GetStaticReports(request.StaticReportId, False, True)

    End Function

    Public Function GetStaticReportHistory(ByVal request As GetStaticReportHistoryRequest) As List(Of StaticReportVersion) Implements IStaticReportService.GetStaticReportHistory

        Return GetStaticReports(request.StaticReportId, False, False)

    End Function

    Public Function GetStaticReportData(ByVal request As GetStaticReportDataRequest) As StaticReportData Implements IStaticReportService.GetStaticReportData

        Dim pdfData As Byte() = Nothing
        Dim isPublic As Boolean
        Dim title As String = String.Empty

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgStaticReportVersionData"
                getCommand.Parameters.AddWithValue("@StaticReportVersionId", request.StaticReportVersionId)
                Using reader As New Data.SafeDataReader(getCommand.ExecuteReader)
                    While reader.Read()
                        pdfData = CType(reader.GetValue(0), Byte())
                        isPublic = reader.GetBoolean(1)
                        title = reader.GetString(2)
                    End While
                End Using
            End Using
        End Using

        Return New StaticReportData(pdfData, isPublic, title)

    End Function

    Public Sub DeleteStaticReportVersion(ByVal request As DeleteStaticReportVersionRequest) Implements IStaticReportService.DeleteStaticReportVersion

        Using transaction As New TransactionScope

            Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
                connection.Open()

                Using deleteCommand As SqlCommand = connection.CreateCommand
                    deleteCommand.CommandType = CommandType.StoredProcedure
                    deleteCommand.CommandText = "spdStaticReportVersion"
                    deleteCommand.Parameters.AddWithValue("@StaticReportVersionId", request.StaticReportVersionId)
                    deleteCommand.ExecuteNonQuery()
                End Using

            End Using
            transaction.Complete()
        End Using

    End Sub

    Private Function GetStaticReports(ByVal staticReportId As Guid, ByVal isUserManual As Boolean, ByVal publicOnly As Boolean) As List(Of StaticReportVersion)

        Dim staticReports As New List(Of StaticReportVersion)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                'if we don't have a Static Report ID, we are getting a list of current static reports
                If staticReportId.Equals(Guid.Empty) Then
                    getCommand.CommandText = "spgaCurrentStaticReport"
                    getCommand.Parameters.AddWithValue("IsUserManual", isUserManual)
                Else
                    getCommand.CommandText = "spgStaticReportHistory"
                    getCommand.Parameters.AddWithValue("StaticReportId", staticReportId)
                End If
                getCommand.Parameters.AddWithValue("PublicOnly", publicOnly)

                Using reader As New Data.SafeDataReader(getCommand.ExecuteReader)
                    While reader.Read()

                        staticReports.Add(New StaticReportVersion( _
                                          reader.GetGuid(0), _
                                          reader.GetGuid(1), _
                                          reader.GetString(2), _
                                          reader.GetByte(3), _
                                          reader.GetDateTime(4), _
                                          reader.GetDateTime(5), _
                                          reader.IsDBNull(5), _
                                          reader.GetBoolean(6), _
                                          reader.GetBoolean(7), _
                                          reader.GetInt32(8)))
                    End While
                End Using
            End Using
        End Using

        Return staticReports

    End Function

    Public Sub SetStaticReportPublicAccess(ByVal request As SetStaticReportPublicAccessRequest) Implements IStaticReportService.SetStaticReportPublicAccess

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using setCommand As SqlCommand = connection.CreateCommand
                setCommand.CommandType = CommandType.StoredProcedure
                setCommand.CommandText = "spuStaticReportVersion"
                setCommand.Parameters.AddWithValue("@StaticReportVersionId", request.StaticReportVersionId)
                setCommand.ExecuteNonQuery()
            End Using

        End Using

    End Sub

    Public Sub UploadStaticReport(ByVal request As Contracts.DataContracts.UploadStaticReportRequest) Implements Contracts.ServiceContracts.IStaticReportService.UploadStaticReport

        Using transaction As New TransactionScope()

            Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
                connection.Open()

                Using insertCommand As SqlCommand = connection.CreateCommand
                    insertCommand.CommandType = CommandType.StoredProcedure
                    insertCommand.CommandText = "spiStaticReport"
                    insertCommand.Parameters.AddWithValue("@Title", request.Title)
                    insertCommand.Parameters.AddWithValue("@PdfData", request.PdfData)
                    insertCommand.Parameters.AddWithValue("@IsUserManual", request.IsUserManual)
                    insertCommand.Parameters.AddWithValue("@IsPublic", request.IsPublic)
                    insertCommand.ExecuteNonQuery()
                End Using

            End Using
            transaction.Complete()
        End Using
    End Sub

End Class
