Imports Profiles.Reports
Imports System.Data.SqlClient
Imports Profiles.DataAccess.Sql.Data
Imports Profiles.Contracts.ServiceContracts
Imports Profiles.Contracts.DataContracts

Public Class DiseaseRankingService
    Implements IDiseaseRankingService

    Public Sub InsertDiseaseFilterValue(ByVal request As Contracts.DataContracts.DiseaseRankingValues) Implements IDiseaseRankingService.InsertDiseaseFilterValue

        Select Case request.Action
            Case ChangeActionTypeForDisease.Add
                InsertDiseaseFiltersValue(request)
        End Select

    End Sub

    Public Function GetStaticReportPublicHistory(ByVal request As DiseaseRankingValues, ByVal reDiseaseName As String) As DiseaseRankingValues Implements IDiseaseRankingService.GetFilterNumberFetchedFromDatabase

        Return GetGetFilterNumberFetched(request.FilterNumber, reDiseaseName)

    End Function

    Private Sub InsertDiseaseFiltersValue(ByVal request As DiseaseRankingValues)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using insertReferenceValueCommand As SqlCommand = connection.CreateCommand
                insertReferenceValueCommand.CommandType = CommandType.StoredProcedure
                insertReferenceValueCommand.CommandText = "spiDiseaseFilterValue"
                insertReferenceValueCommand.Parameters.AddWithValue("@FilterNumber", request.FilterNumber)
                'insertReferenceValueCommand.Parameters.AddWithValue("@DiseaseType", request.DiseaseType)
                insertReferenceValueCommand.Parameters.AddWithValue("@DiseaseName", request.DiseaseName)
                insertReferenceValueCommand.Parameters.AddWithValue("@Disease1", request.Disease1)
                insertReferenceValueCommand.Parameters.AddWithValue("@Disease2", request.Disease2)
                insertReferenceValueCommand.Parameters.AddWithValue("@Disease3", request.Disease3)
                insertReferenceValueCommand.Parameters.AddWithValue("@Disease4", request.Disease4)
                insertReferenceValueCommand.Parameters.AddWithValue("@Disease5", request.Disease5)
                insertReferenceValueCommand.Parameters.AddWithValue("@SelectedSpecies", request.SelectedSpecies)
                insertReferenceValueCommand.ExecuteNonQuery()

            End Using
        End Using

    End Sub

    Private Function GetGetFilterNumberFetched(ByVal FilterNumberFetched As Long, ByVal reDiseaseName As String) As DiseaseRankingValues

        Dim filterFetchedData As New DiseaseRankingValues()

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spiGetMaxFilterNumber"
                getCommand.Parameters.AddWithValue("@DiseaseName", reDiseaseName)
                Using reader As New Data.SafeDataReader(getCommand.ExecuteReader)
                    While reader.Read()

                        filterFetchedData.FilterNumber = Convert.ToInt64(reader(0))

                    End While
                End Using
            End Using
        End Using

        Return filterFetchedData

    End Function

    Public Function GetDiseaseDropReferenceTables() As List(Of DiseaseFilterNameValues) Implements IDiseaseRankingService.GetDiseaseDropReferenceTables

        Dim result As New List(Of DiseaseFilterNameValues)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spiGetDiseaseRankingFilterName"

                Using reader As New SafeDataReader(getCommand.ExecuteReader)
                    While reader.Read
                        result.Add(New DiseaseFilterNameValues(reader.GetGuid(0), reader.GetString(1)))
                    End While
                End Using
            End Using
        End Using

        Return result

    End Function

    Public Sub DeleteFilterNumberFromFilterService(ByVal request As Contracts.DataContracts.DiseaseRankingValues) Implements IDiseaseRankingService.DeleteFilterNumberFromFilterService

        DeleteFilterNumberFromFilterServiceInner(request.DiseaseName)

    End Sub

    Private Sub DeleteFilterNumberFromFilterServiceInner(ByVal DiseaseNameFetched As String)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spiDeleteFilterFromFilterList"
                getCommand.Parameters.AddWithValue("@DiseaseName", DiseaseNameFetched)
                getCommand.ExecuteNonQuery()

            End Using
        End Using

    End Sub

    Public Sub UpdateDiseaseFilterValueFromervice(ByVal request As Contracts.DataContracts.DiseaseRankingValues) Implements IDiseaseRankingService.UpdateDiseaseFilterValue

        UpdateDiseaseFilterValue(request)

    End Sub

    Private Sub UpdateDiseaseFilterValue(ByVal request As DiseaseRankingValues)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using insertReferenceValueCommand As SqlCommand = connection.CreateCommand
                insertReferenceValueCommand.CommandType = CommandType.StoredProcedure
                insertReferenceValueCommand.CommandText = "spiUpdateDiseaseFilterValue"
                insertReferenceValueCommand.Parameters.AddWithValue("@DiseaseName", request.DiseaseName)
                insertReferenceValueCommand.Parameters.AddWithValue("@FilterNumber", request.FilterNumber)
                insertReferenceValueCommand.Parameters.AddWithValue("@Disease1", request.Disease1)
                insertReferenceValueCommand.Parameters.AddWithValue("@Disease2", request.Disease2)
                insertReferenceValueCommand.Parameters.AddWithValue("@Disease3", request.Disease3)
                insertReferenceValueCommand.Parameters.AddWithValue("@Disease4", request.Disease4)
                insertReferenceValueCommand.Parameters.AddWithValue("@Disease5", request.Disease5)
                insertReferenceValueCommand.Parameters.AddWithValue("@SelectedSpecies", request.SelectedSpecies)
                insertReferenceValueCommand.ExecuteNonQuery()

            End Using
        End Using

    End Sub

    Public Sub UpdateDisableDiseaseFilterValue(ByVal request As DiseaseRankingValues) Implements IDiseaseRankingService.UpdateDisableDiseaseFilterValue

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using insertReferenceValueCommand As SqlCommand = connection.CreateCommand
                insertReferenceValueCommand.CommandType = CommandType.StoredProcedure
                insertReferenceValueCommand.CommandText = "spiUpdateDisableDiseaseFilterValue"
                insertReferenceValueCommand.Parameters.AddWithValue("@FilterNumber", request.FilterNumber)
                insertReferenceValueCommand.ExecuteNonQuery()

            End Using
        End Using

    End Sub

    Public Function GetAllDiseaseReviewsForSelectedDatesFetched(ByVal description As String, ByVal todate As String, ByVal fromdate As String, ByVal valueProfile As Integer) As System.Collections.Generic.List(Of DiseaseReviewsData) Implements IDiseaseRankingService.GetAllDiseaseReviewsForSelectedDates

        Dim DiseaseReviewsList As New List(Of DiseaseReviewsData)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgaDiseASeReviews"
                getCommand.Parameters.AddWithValue("@FromDate", fromdate)
                getCommand.Parameters.AddWithValue("@ToDate", todate)
                getCommand.Parameters.AddWithValue("@ProfileSelected", valueProfile)
                Using reader As New SafeDataReader(getCommand.ExecuteReader)
                    While reader.Read()
                        Dim currentReview As New DiseaseReviewsData() With { _
                                .ProfileVersionId = reader.GetGuid(0), _
                                .Title = reader.GetString(1), _
                                .VersionMajor = reader.GetInt32(2), _
                                .VersionMinor = reader.GetInt32(3), _
                                .SectionNumber = reader.GetInt32(4), _
                                .NextPolicyReview = reader.GetDateTime(5), _
                                .NextAuthorReview = reader.GetDateTime(6), _
                                .NextTechnicalReview = reader.GetDateTime(7) }
                        DiseaseReviewsList.Add(currentReview)
                    End While
                End Using
            End Using
        End Using

        Return DiseaseReviewsList
    End Function
End Class
