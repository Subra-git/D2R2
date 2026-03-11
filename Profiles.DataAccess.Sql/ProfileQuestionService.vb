Imports Profiles.Contracts.ServiceContracts
Imports Profiles.Contracts.DataContracts
Imports System.Data.SqlClient
Imports System.Transactions
Imports Profiles.DataAccess.Sql.Data
Imports Profiles.Reports

Public Class ProfileQuestionService
    Implements IProfileQuestionService

    Public Function GetProfileQuestion(ByVal request As GetProfileQuestionRequest) As ProfileQuestionData Implements IProfileQuestionService.GetProfileQuestion

        Dim question As New ProfileQuestionData

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgProfileQuestion"
                getCommand.Parameters.AddWithValue("@Id", request.Id)
                Using reader As New SafeDataReader(getCommand.ExecuteReader)
                    While reader.Read()
                        Dim lastUpdated(7) As Byte
                        reader.GetBytes("LastUpdated", 0, lastUpdated, 0, 8)
                        With question
                            .Id = reader.GetGuid(0)
                            .Name = reader.GetString(1)
                            .ShortName = reader.GetString(2)
                            .QuestionNumber = reader.GetInt32(3)
                            .UserGuidance = reader.GetString(4)
                            .NonTechnicalName = reader.GetString(6)
                            .LastUpdated = lastUpdated
                        End With
                    End While
                End Using
            End Using
        End Using

        Return question

    End Function

    Public Function UpdateProfileQuestion(ByVal request As UpdateProfileQuestionRequest) As Byte() Implements IProfileQuestionService.UpdateProfileQuestion

        Dim lastUpdated As Byte()

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using updateCommand As SqlCommand = connection.CreateCommand
                With updateCommand
                    .CommandType = CommandType.StoredProcedure
                    .CommandText = "spuProfileQuestion"
                    .Parameters.AddWithValue("@Id", request.Id)
                    .Parameters.AddWithValue("@UserGuidance", request.UserGuidance)
                    .Parameters.AddWithValue("@LastUpdated", request.LastUpdated)
                    .Parameters.AddWithValue("@Name", request.Name)
                    .Parameters.AddWithValue("@NonTechnicalName", request.NonTechnicalName)
                    Dim output As New SqlParameter("@NewLastUpdated", SqlDbType.Timestamp)
                    output.Direction = ParameterDirection.Output
                    .Parameters.Add(output)
                    .ExecuteNonQuery()
                    lastUpdated = CType(.Parameters("@NewLastUpdated").Value, Byte())
                End With
            End Using
        End Using

        Return lastUpdated

    End Function

    Public Function GetProfileQuestionInfoList(ByVal request As Contracts.DataContracts.GetProfileQuestionInfoListRequest) As System.Collections.Generic.List(Of Contracts.DataContracts.ProfileQuestionInfo) Implements Contracts.ServiceContracts.IProfileQuestionService.GetProfileQuestionInfoList

        Dim questionInfoList As New List(Of ProfileQuestionInfo)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgProfileQuestionBySectionId"
                getCommand.Parameters.AddWithValue("@ProfileSectionId", request.ProfileSectionId)
                Using reader As New SafeDataReader(getCommand.ExecuteReader)
                    While reader.Read()
                        Dim questionInfo As New ProfileQuestionInfo With { _
                        .Id = reader.GetGuid(0), _
                        .Name = reader.GetString(1), _
                        .QuestionNumber = reader.GetInt32(2) _
                        }

                        questionInfoList.Add(questionInfo)

                    End While
                End Using
            End Using
        End Using

        Return questionInfoList

    End Function

    Public Function GetProfileGuidanceReport(request As GetProfileQuestionReportRequest) As ProfileGuidanceReportData Implements IProfileQuestionService.GetProfileGuidanceReport

        Dim pdfData As Byte()

        Select Case request.ReportType

            Case Contracts.ProfileGuidanceReportType.All
                pdfData = New ProfileGuidanceReportPdf().PdfData

            Case Contracts.ProfileGuidanceReportType.SummaryProfile
                pdfData = New SummaryProfileGuidanceReportPdf().PdfData

            Case Contracts.ProfileGuidanceReportType.SummaryPrioritisationReport
                pdfData = New SummaryPrioritisationGuidanceReportPdf().PdfData

            Case Contracts.ProfileGuidanceReportType.QAGuidanceReport
                pdfData = New QAGuidanceReportPdf().PdfData

            Case Else
                Throw New NotSupportedException( _
                    String.Format( _
                        "Report type '{0}' is not supported.", _
                        request.ReportType))

        End Select

        Return New ProfileGuidanceReportData(pdfData)

    End Function

End Class
