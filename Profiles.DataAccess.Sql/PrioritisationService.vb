Imports Profiles.Contracts.ServiceContracts
Imports Profiles.Contracts.DataContracts
Imports System.Data.SqlClient
Imports System.Transactions
Imports Profiles.DataAccess.Sql.Data
Imports Profiles.DataAccess.NPoco
Imports Profiles.Infrastructure.Mapping
Imports Profiles.DataModels.StoredProcedures

Public Class PrioritisationService
    Implements IPrioritisationService

    Public Function GetProfilePrioritisationMetadata() As Contracts.DataContracts.ProfilePrioritisationMetadata Implements Contracts.ServiceContracts.IPrioritisationService.GetProfilePrioritisationMetadata

        Dim dtoPrioritisationMetadata As New ProfilePrioritisationMetadata()
        Dim categoryDictionary As New Dictionary(Of Guid, ProfilePrioritisationCategory)
        Dim criterionDictionary As New Dictionary(Of Guid, ProfilePrioritisationCriterion)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand

                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgaPrioritisationVariables"

                Using reader As New SafeDataReader(getCommand.ExecuteReader)
                    While reader.Read()
                        dtoPrioritisationMetadata.Id = reader.GetGuid(0)
                        dtoPrioritisationMetadata.RankingRangeLowerBound = reader.GetInt32(1)
                        dtoPrioritisationMetadata.RankingRangeUpperBound = reader.GetInt32(2)
                        reader.GetBytes("LastUpdated", 0, dtoPrioritisationMetadata.LastUpdated, 0, 8)
                    End While

                    'move to category recordset if exists
                    If reader.NextResult() Then

                        While reader.Read
                            Dim dtoCategory As New ProfilePrioritisationCategory() With { _
                             .Id = reader.GetGuid(0), _
                             .Name = reader.GetString(1) _
                             }

                            dtoPrioritisationMetadata.PrioritisationCategoryList.Add(dtoCategory)

                            'add categories to dictionary
                            categoryDictionary.Add(dtoCategory.Id, dtoCategory)
                        End While

                    End If

                    'do any categories exist
                    If categoryDictionary.Count > 0 Then

                        'move to criterion recordset if exists
                        If reader.NextResult() Then

                            While reader.Read()

                                Dim dtoCriterion As New ProfilePrioritisationCriterion() With { _
                                .Id = reader.GetGuid(0), _
                                .CategoryId = reader.GetGuid(1), _
                                .Code = reader.GetString(2), _
                                .Name = reader.GetString(3), _
                                .Weight = reader.GetInt32(4) _
                                }

                                'add criterion objects from each category object to criterion dictionary
                                criterionDictionary.Add(dtoCriterion.Id, dtoCriterion)
                                categoryDictionary(dtoCriterion.CategoryId).PrioritisationCriterionList.Add(dtoCriterion)

                            End While

                            'do any criterion exist in any category
                            If criterionDictionary.Count > 0 Then

                                'move to criterion value recordset if exists
                                If reader.NextResult() Then

                                    While reader.Read()

                                        Dim dtoCriterionValue As New ProfilePrioritisationCriterionValue() With { _
                                        .Id = reader.GetGuid(0), _
                                        .CriterionId = reader.GetGuid(1), _
                                        .Value = reader.GetString(2), _
                                        .Score = reader.GetInt32(3) _
                                        }

                                        criterionDictionary(dtoCriterionValue.CriterionId).PrioritisationCriterionValueList.Add(dtoCriterionValue)

                                    End While
                                End If
                            End If
                        End If
                    End If
                End Using
            End Using
        End Using

        Return dtoPrioritisationMetadata

    End Function

    Public Function GetSpeciesPrioritisationMetadata() As Contracts.DataContracts.SpeciesPrioritisationMetadata Implements Contracts.ServiceContracts.IPrioritisationService.GetSpeciesPrioritisationMetadata

        Dim dtoPrioritisationMetadata As New SpeciesPrioritisationMetadata()
        Dim categoryDictionary As New Dictionary(Of Guid, SpeciesPrioritisationCategory)
        Dim criterionDictionary As New Dictionary(Of Guid, SpeciesPrioritisationCriterion)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand

                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgaSpeciesPrioritisationVariables"

                Using reader As New SafeDataReader(getCommand.ExecuteReader)

                    If reader.Read() Then

                        reader.GetBytes("LastUpdated", 0, dtoPrioritisationMetadata.LastUpdated, 0, 8)

                    End If

                    If reader.NextResult() Then

                        While reader.Read()

                            Dim dtoCategory As New SpeciesPrioritisationCategory() With { _
                            .Id = reader.GetGuid(0), _
                            .Name = reader.GetString(1) _
                            }

                            dtoPrioritisationMetadata.PrioritisationCategoryList.Add(dtoCategory)
                            categoryDictionary.Add(dtoCategory.Id, dtoCategory)
                        End While
                    End If

                    'do any categories exist
                    If categoryDictionary.Count > 0 Then

                        'move to criterion recordset if exists
                        If reader.NextResult() Then

                            While reader.Read()

                                Dim dtoCriterion As New SpeciesPrioritisationCriterion() With { _
                                .Id = reader.GetGuid(0), _
                                .CategoryId = reader.GetGuid(1), _
                                .Name = reader.GetString(3) _
                                }

                                criterionDictionary.Add(dtoCriterion.Id, dtoCriterion)
                                categoryDictionary(dtoCriterion.CategoryId).PrioritisationCriterionList.Add(dtoCriterion)

                            End While

                        End If

                        'do any criterion exist in any category
                        If criterionDictionary.Count > 0 Then

                            'move to criterion value recordset if exists
                            If reader.NextResult() Then

                                While reader.Read()

                                    Dim dtoCriterionValue As New SpeciesPrioritisationCriterionValue() With { _
                                       .Id = reader.GetGuid(0), _
                                       .CriterionId = reader.GetGuid(1), _
                                       .Value = reader.GetString(2), _
                                       .Score = reader.GetInt32(3) _
                                       }

                                    criterionDictionary(dtoCriterionValue.CriterionId).PrioritisationCriterionValueList.Add(dtoCriterionValue)

                                End While
                            End If
                        End If
                    End If

                End Using
            End Using
        End Using

        Return dtoPrioritisationMetadata

    End Function

    Public Function UpdateProfilePrioritisationMetadata(ByVal request As Contracts.DataContracts.PrioritisationChangeSet) As Contracts.DataContracts.PrioritisationChangeResult Implements Contracts.ServiceContracts.IPrioritisationService.UpdateProfilePrioritisationMetadata

        Dim result As New Contracts.DataContracts.PrioritisationChangeResult

        Using transaction As New TransactionScope

            Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
                connection.Open()

                Using updateCommand As SqlCommand = connection.CreateCommand
                    updateCommand.CommandType = CommandType.StoredProcedure
                    updateCommand.CommandText = "spuPrioritisationRankingRange"
                    updateCommand.Parameters.AddWithValue("@UpperBound", request.RankingRangeUpperBound)
                    updateCommand.Parameters.AddWithValue("@LowerBound", request.RankingRangeLowerBound)
                    updateCommand.Parameters.AddWithValue("@LastUpdated", request.LastUpdated)
                    Dim output As New SqlParameter("@NewLastUpdated", SqlDbType.Timestamp)
                    output.Direction = ParameterDirection.Output
                    updateCommand.Parameters.Add(output)
                    updateCommand.Parameters.AddWithValue("@PrioritisationType", "Profile")
                    updateCommand.ExecuteNonQuery()
                    result.LastUpdated = CType(updateCommand.Parameters("@NewLastUpdated").Value, Byte())
                End Using

                For Each item As Contracts.DataContracts.CriterionUpdate In request.CriterionUpdateList

                    Using updateCommand As SqlCommand = connection.CreateCommand
                        updateCommand.CommandType = CommandType.StoredProcedure
                        updateCommand.CommandText = "spuPrioritisationCriterion"
                        updateCommand.Parameters.AddWithValue("@CriterionId", item.CriterionId)
                        updateCommand.Parameters.AddWithValue("@Weighting", item.Weight)
                        updateCommand.Parameters.AddWithValue("@Name", item.Name)
                        updateCommand.ExecuteNonQuery()
                    End Using

                Next

                For Each item As Contracts.DataContracts.CriterionValueUpdate In request.CriterionValueUpdateList

                    Using updateCommand As SqlCommand = connection.CreateCommand
                        updateCommand.CommandType = CommandType.StoredProcedure
                        updateCommand.CommandText = "spuPrioritisationCriterionValue"
                        updateCommand.Parameters.AddWithValue("@CriterionValueId", item.Id)
                        updateCommand.Parameters.AddWithValue("@Score", item.Score)
                        updateCommand.ExecuteNonQuery()
                    End Using

                Next

                Using calculateCommand As SqlCommand = connection.CreateCommand
                    calculateCommand.CommandType = CommandType.StoredProcedure
                    calculateCommand.CommandText = "sppPrioritisationScore"
                    calculateCommand.ExecuteNonQuery()
                End Using

            End Using
            transaction.Complete()
        End Using

        Return result

    End Function

    Public Function UpdateSpeciesPrioritisationMetadata(ByVal request As Contracts.DataContracts.PrioritisationChangeSet) As PrioritisationChangeResult Implements Contracts.ServiceContracts.IPrioritisationService.UpdateSpeciesPrioritisationMetadata

        Dim result As New Contracts.DataContracts.PrioritisationChangeResult

        Using transaction As New TransactionScope

            Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
                connection.Open()

                Using updateCommand As SqlCommand = connection.CreateCommand
                    updateCommand.CommandType = CommandType.StoredProcedure
                    updateCommand.CommandText = "spuPrioritisationRankingRange"
                    updateCommand.Parameters.AddWithValue("@UpperBound", 100)
                    updateCommand.Parameters.AddWithValue("@LowerBound", 0)
                    updateCommand.Parameters.AddWithValue("@LastUpdated", request.LastUpdated)
                    Dim output As New SqlParameter("@NewLastUpdated", SqlDbType.Timestamp)
                    output.Direction = ParameterDirection.Output
                    updateCommand.Parameters.Add(output)
                    updateCommand.Parameters.AddWithValue("@PrioritisationType", "Species")
                    updateCommand.ExecuteNonQuery()
                    result.LastUpdated = CType(updateCommand.Parameters("@NewLastUpdated").Value, Byte())
                End Using

                For Each item As Contracts.DataContracts.CriterionValueUpdate In request.CriterionValueUpdateList

                    Using updateCommand As SqlCommand = connection.CreateCommand
                        updateCommand.CommandType = CommandType.StoredProcedure
                        updateCommand.CommandText = "spuSpeciesPrioritisationCriterionValue"
                        updateCommand.Parameters.AddWithValue("@Id", item.Id)
                        updateCommand.Parameters.AddWithValue("@Score", item.Score)
                        updateCommand.ExecuteNonQuery()
                    End Using

                Next

                Using calculateCommand As SqlCommand = connection.CreateCommand
                    calculateCommand.CommandType = CommandType.StoredProcedure
                    calculateCommand.CommandText = "sppSpeciesPrioritisationScore"
                    calculateCommand.ExecuteNonQuery()
                End Using

            End Using

            transaction.Complete()
        End Using

        Return result

    End Function

    Public Function GetPrioritisationCategoryScores(ByVal request As Contracts.DataContracts.ProfileVersionIdRequest) As System.Collections.Generic.List(Of Contracts.DataContracts.PrioritisationCategoryScore) Implements Contracts.ServiceContracts.IPrioritisationService.GetPrioritisationCategoryScores

        Dim dtoPrioritisationCategoryScoreList As New List(Of Contracts.DataContracts.PrioritisationCategoryScore)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgPrioritisationCategoryScoreByProfileVersionId"
                getCommand.Parameters.AddWithValue("ProfileVersionId", request.ProfileVersionId)
                Using reader As New SafeDataReader(getCommand.ExecuteReader)
                    While reader.Read()

                        Dim dtoPrioritisationCategoryScore As New Contracts.DataContracts.PrioritisationCategoryScore With { _
                            .PrioritisationCategoryId = reader.GetGuid(0), _
                            .PrioritisationCategoryName = reader.GetString(1), _
                            .SpeciesId = reader.GetGuid(2), _
                            .SpeciesName = reader.GetString(3), _
                            .DataIncomplete = reader.GetBoolean(4), _
                            .Score = reader.GetInt32(5), _
                            .Rank = reader.GetInt32(6), _
                            .IsProfiledSpecies = reader.GetBoolean(7) _
                            }

                        dtoPrioritisationCategoryScoreList.Add(dtoPrioritisationCategoryScore)

                    End While
                End Using
            End Using

        End Using

        Return dtoPrioritisationCategoryScoreList

    End Function

    Public Function GetPrioritisationCriterionScores(ByVal request As Contracts.DataContracts.ProfileVersionIdRequest) As System.Collections.Generic.List(Of Contracts.DataContracts.PrioritisationCriterionScore) Implements Contracts.ServiceContracts.IPrioritisationService.GetPrioritisationCriterionScores

        Dim dtoPrioritisationCriterionScoreList As New List(Of Contracts.DataContracts.PrioritisationCriterionScore)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgPrioritisationCriterionScoreByProfileVersionId"
                getCommand.Parameters.AddWithValue("ProfileVersionId", request.ProfileVersionId)
                Using reader As New SafeDataReader(getCommand.ExecuteReader)
                    While reader.Read()

                        Dim dtoPrioritisationCriterionScore As New Contracts.DataContracts.PrioritisationCriterionScore With { _
                            .PrioritisationCategoryId = reader.GetGuid(0), _
                            .PrioritisationCategoryName = reader.GetString(1), _
                            .PrioritisationCriterionId = reader.GetGuid(2), _
                            .PrioritisationCriterionCode = reader.GetString(3), _
                            .PrioritisationCriterionName = reader.GetString(4), _
                            .SpeciesId = reader.GetGuid(5), _
                            .SpeciesName = reader.GetString(6), _
                            .DataIncomplete = reader.GetBoolean(7), _
                            .IrrelevantCategory = reader.GetBoolean(8), _
                            .CriterionValue = reader.GetString(9), _
                            .Score = reader.GetInt32(10), _
                            .PrioritisationCategoryDisplayName = reader.GetString(11) _
                            }

                        dtoPrioritisationCriterionScoreList.Add(dtoPrioritisationCriterionScore)

                    End While
                End Using
            End Using

        End Using

        Return dtoPrioritisationCriterionScoreList

    End Function

    Public Function GetPrioritisedSpecies(ByVal request As Contracts.DataContracts.ProfileVersionIdRequest) As System.Collections.Generic.List(Of Contracts.DataContracts.PrioritisedSpecies) Implements Contracts.ServiceContracts.IPrioritisationService.GetPrioritisedSpecies

        Dim dtoPrioritisedSpeciesList As New List(Of PrioritisedSpecies)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgPrioritisedSpeciesByProfileVersionId"
                getCommand.Parameters.AddWithValue("@ProfileVersionId", request.ProfileVersionId)
                Using reader As New SafeDataReader(getCommand.ExecuteReader)
                    While reader.Read
                        Dim dtoPrioritisedSpecies As New PrioritisedSpecies With { _
                            .SpeciesId = reader.GetGuid(0), _
                            .Name = reader.GetString(1) _
                            }

                        dtoPrioritisedSpeciesList.Add(dtoPrioritisedSpecies)

                    End While
                End Using
            End Using
        End Using

        Return dtoPrioritisedSpeciesList

    End Function

    Public Sub PrioritiseProfile(ByVal request As Contracts.DataContracts.ProfileVersionIdRequest) Implements Contracts.ServiceContracts.IPrioritisationService.PrioritiseProfile

        Using transaction As New TransactionScope

            Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
                connection.Open()

                RunPrioritisationCalculation(connection, request.ProfileVersionId)

                RunPrioritisationScore(connection)

            End Using
            transaction.Complete()
        End Using

    End Sub

    Public Sub PrioritiseProfiles(ByVal request As Contracts.DataContracts.PrioritiseProfilesRequest) Implements Contracts.ServiceContracts.IPrioritisationService.PrioritiseProfiles

        Dim profileVersionList As New List(Of Guid)

        Using transaction As New TransactionScope(TransactionScopeOption.Required, New TimeSpan(0, 3, 0))

            Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
                connection.Open()

                'get a list of profiles that match the state passed in, and run the calculation on each in turn
                Using getCommand As SqlCommand = connection.CreateCommand
                    getCommand.CommandType = CommandType.StoredProcedure
                    getCommand.CommandText = "spgaCurrentProfile"

                    If request.PublishedProfiles Then
                        getCommand.Parameters.AddWithValue("ProfileVersionState", "Published")
                    Else
                        getCommand.Parameters.AddWithValue("ProfileVersionState", "Draft")
                    End If

                    Using reader As New SafeDataReader(getCommand.ExecuteReader)
                        While reader.Read()
                            profileVersionList.Add(reader.GetGuid(0))
                        End While
                    End Using
                End Using

                For Each currentProfileVersionId As Guid In profileVersionList
                    RunPrioritisationCalculation(connection, currentProfileVersionId)
                Next

                RunPrioritisationScore(connection)

            End Using

            transaction.Complete()
        End Using

    End Sub

    Private Sub RunPrioritisationCalculation(ByVal connection As SqlConnection, ByVal profileVersionId As Guid)

        Using prioritisationCommand As SqlCommand = connection.CreateCommand
            prioritisationCommand.CommandType = CommandType.StoredProcedure
            prioritisationCommand.CommandText = "sppPrioritisationCalculation"
            prioritisationCommand.Parameters.AddWithValue("@ProfileVersionId", profileVersionId)
            prioritisationCommand.ExecuteNonQuery()
        End Using

    End Sub

    Private Sub RunPrioritisationScore(ByVal connection As SqlConnection)

        Using calculateCommand As SqlCommand = connection.CreateCommand
            calculateCommand.CommandType = CommandType.StoredProcedure
            calculateCommand.CommandText = "sppPrioritisationScore"
            calculateCommand.ExecuteNonQuery()
        End Using

    End Sub

    Public Function GetPrioritisationGuidanceData() As Contracts.DataContracts.PrioritisationGuidanceData Implements Contracts.ServiceContracts.IPrioritisationService.GetPrioritisationGuidanceData

        Dim dtoPrioritisationGuidanceData As New PrioritisationGuidanceData
        Dim categoryDictionary As New Dictionary(Of Guid, PrioritisationCategoryData)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgaPrioritisationGuidanceData"

                Using reader As New SafeDataReader(getCommand.ExecuteReader)

                    While reader.Read()
                        Dim dtoPrioritisationCategoryData As New PrioritisationCategoryData() With { _
                             .Id = reader.GetGuid(0), _
                             .DisplayName = reader.GetString(1), _
                             .CategoryName = reader.GetString(2) _
                            }

                        categoryDictionary.Add(dtoPrioritisationCategoryData.Id, dtoPrioritisationCategoryData)
                        dtoPrioritisationGuidanceData.PrioritisationCategoryDataList.Add(dtoPrioritisationCategoryData)
                    End While

                    If reader.NextResult() Then

                        ' To unique the Criterion Codes because they questions can be combined as in PMR01 - it occurs twice in ProfileQuestions table
                        ' and so is duplicated on the report without AddedCriterionCodes below
                        Dim AddedCrtierionCodes As New List(Of String)

                        While reader.Read()
                            Dim dtoPrioritisationQuestionData As New PrioritisationQuestionData() With { _
                                .Id = reader.GetGuid(0), _
                                .PrioritisationCategoryId = reader.GetGuid(1), _
                                .SectionNumber = reader.GetInt32(2), _
                                .QuestionNumber = reader.GetInt32(3), _
                                .Name = reader.GetString(4), _
                                .IsPerSpecies = reader.GetBoolean(5), _
                                .CriterionCode = reader.GetString(6), _
                                .CriterionName = reader.GetString(7) _
                                }

                            If Not (AddedCrtierionCodes.Contains(dtoPrioritisationQuestionData.CriterionCode)) Then
                                If categoryDictionary.ContainsKey(dtoPrioritisationQuestionData.PrioritisationCategoryId) Then
                                    categoryDictionary(dtoPrioritisationQuestionData.PrioritisationCategoryId).PrioritisationQuestionDataList.Add(dtoPrioritisationQuestionData)
                                End If
                            End If

                            AddedCrtierionCodes.Add(dtoPrioritisationQuestionData.CriterionCode)

                        End While
                    End If

                End Using
            End Using
        End Using

        Return dtoPrioritisationGuidanceData


    End Function

    Public Function GetScoreData() As Contracts.DataContracts.ScoreData Implements Contracts.ServiceContracts.IPrioritisationService.GetScoreData

        Dim dtoScoreData As New ScoreData
        Dim categoryDictionary As New Dictionary(Of Guid, PrioritisationCategoryData)
        Dim profileDictionary As New Dictionary(Of Guid, ProfileData)
        Dim profileVersionDictionary As New Dictionary(Of Guid, ProfileVersionData)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgaPrioritisationScoreData"

                Using reader As New SafeDataReader(getCommand.ExecuteReader)

                    ' Common Questions
                    While reader.Read()
                        Dim dtoCommonQuestionData As New CommonQuestionData() With { _
                            .Id = reader.GetGuid(0), _
                            .SectionNumber = reader.GetInt32(1), _
                            .QuestionNumber = reader.GetInt32(2), _
                            .Name = reader.GetString(3) _
                            }
                        dtoScoreData.CommonQuestionDataList.Add(dtoCommonQuestionData)
                    End While

                    If reader.NextResult() Then

                        ' Prioritisation Categories
                        While reader.Read

                            Dim dtoPrioritisationCategoryData As New PrioritisationCategoryData() With { _
                             .Id = reader.GetGuid(0), _
                             .DisplayName = reader.GetString(1), _
                             .CategoryName = reader.GetString(2) _
                            }

                            categoryDictionary.Add(dtoPrioritisationCategoryData.Id, dtoPrioritisationCategoryData)
                            dtoScoreData.PrioritisationCategoryDataList.Add(dtoPrioritisationCategoryData)

                        End While

                    End If

                    If reader.NextResult() Then

                        ' Prioritisation Questions
                        While reader.Read()
                            Dim dtoPrioritisationQuestionData As New PrioritisationQuestionData() With { _
                                .Id = reader.GetGuid(0), _
                                .PrioritisationCategoryId = reader.GetGuid(1), _
                                .SectionNumber = reader.GetInt32(2), _
                                .QuestionNumber = reader.GetInt32(3), _
                                .Name = reader.GetString(4), _
                                .IsPerSpecies = reader.GetBoolean(5), _
                                .CriterionCode = reader.GetString(6), _
                                .CriterionName = reader.GetString(7) _
                                }

                            categoryDictionary(dtoPrioritisationQuestionData.PrioritisationCategoryId).PrioritisationQuestionDataList.Add(dtoPrioritisationQuestionData)

                        End While

                    End If

                    If reader.NextResult() Then

                        ' Profiles
                        While reader.Read()
                            Dim dtoProfileData As New ProfileData With { _
                            .Id = reader.GetGuid(0), _
                            .Title = reader.GetString(1), _
                            .StatusId = reader.GetGuid(2), _
                            .StatusName = reader.GetString(3) _
                            }

                            profileDictionary.Add(dtoProfileData.Id, dtoProfileData)
                            dtoScoreData.ProfileDataList.Add(dtoProfileData)

                        End While

                    End If


                    If reader.NextResult() Then

                        ' Profile Versions
                        While reader.Read()
                            Dim dtoProfileVersionData As New ProfileVersionData() With { _
                                .Id = reader.GetGuid(0), _
                                .ProfileId = reader.GetGuid(1), _
                                .ScenarioTitle = reader.GetString(2), _
                                .VersionMajor = reader.GetByte(3), _
                                .VersionMinor = reader.GetByte(4), _
                                .ProfileVersionState = reader.GetString(5), _
                                .IsProfileScenario = reader.GetBoolean(6) _
                                }

                            profileVersionDictionary.Add(dtoProfileVersionData.Id, dtoProfileVersionData)
                            profileDictionary(dtoProfileVersionData.ProfileId).ProfileVersionDataList.Add(dtoProfileVersionData)

                        End While

                    End If

                    If reader.NextResult() Then

                        ' Profiled Species
                        While reader.Read
                            Dim dtoProfiledSpecies As New ProfiledSpeciesData() With { _
                                .Id = reader.GetGuid(0), _
                                .ProfileVersionId = reader.GetGuid(1), _
                                .Name = reader.GetString(2) _
                                }

                            profileVersionDictionary(dtoProfiledSpecies.ProfileVersionId).ProfiledSpeciesDataList.Add(dtoProfiledSpecies)

                        End While

                    End If

                    If reader.NextResult() Then

                        ' Common Answers
                        While reader.Read
                            Dim dtoCommonAnswers As New CommonAnswerData() With { _
                                .Id = reader.GetGuid(0), _
                                .ProfileVersionId = reader.GetGuid(1), _
                                .Answer = reader.GetString(2) _
                                }

                            profileVersionDictionary(dtoCommonAnswers.ProfileVersionId).CommonAnswerDataList.Add(dtoCommonAnswers)

                        End While

                    End If

                    If reader.NextResult Then

                        ' Prioritisation Answers
                        While reader.Read
                            Dim dtoPrioritisationAnswer As New PrioritisationAnswerData With { _
                                .Id = reader.GetGuid(0), _
                                .ProfileVersionId = reader.GetGuid(1), _
                                .SpeciesId = reader.GetGuid(2), _
                                .Answer = reader.GetString(3), _
                                .Score = reader.GetInt32(4), _
                                .Weighting = reader.GetInt32(5) _
                                }

                            profileVersionDictionary(dtoPrioritisationAnswer.ProfileVersionId).PrioritisationAnswerDataList.Add(dtoPrioritisationAnswer)

                        End While

                    End If

                    If reader.NextResult() Then

                        ' Prioritisation Scores
                        While reader.Read
                            Dim dtoPrioritisationScoreData As New PrioritisationScoreData With { _
                                .ProfileVersionId = reader.GetGuid(0), _
                                .SpeciesId = reader.GetGuid(1), _
                                .PrioritisationCategoryId = reader.GetGuid(2), _
                                .Score = reader.GetInt32(3), _
                                .Rank = reader.GetInt32(4) _
                                }

                            profileVersionDictionary(dtoPrioritisationScoreData.ProfileVersionId).PrioritisationScoreDataList.Add(dtoPrioritisationScoreData)

                        End While

                    End If

                End Using
            End Using
        End Using

        Return dtoScoreData

    End Function

    Public Function GetRankProfileData() As System.Collections.Generic.List(Of Contracts.DataContracts.RankProfileData) Implements Contracts.ServiceContracts.IPrioritisationService.GetRankProfileData
        Return GetRankProfileData(New GetProfileRankingReportRequest())
    End Function

    Public Function GetRankProfileData(ByVal request As Contracts.DataContracts.GetProfileRankingReportRequest) As System.Collections.Generic.List(Of Contracts.DataContracts.RankProfileData) Implements Contracts.ServiceContracts.IPrioritisationService.GetRankProfileData

        Dim dictionaryRankProfile As New Dictionary(Of String, RankProfileData)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgaFilterRankProfileData"
                'getCommand.CommandText = "spgaRankProfileData"

                Using reader As New SafeDataReader(getCommand.ExecuteReader)

                    While reader.Read()

                        Dim profileId As Guid = reader.GetGuid(0)
                        Dim speciesId As Guid = reader.GetGuid(1)
                        Dim keyString As String = profileId.ToString() & "_" & speciesId.ToString()

                        Dim dtoRankProfile As New RankProfileData

                        If dictionaryRankProfile.ContainsKey(keyString) Then
                            dtoRankProfile = dictionaryRankProfile(keyString)
                        End If

                        dtoRankProfile.ProfileId = profileId
                        dtoRankProfile.ProfileVersionId = reader.GetGuid(9)
                        dtoRankProfile.SpeciesId = speciesId
                        dtoRankProfile.ProfileTitle = reader.GetString(5)
                        dtoRankProfile.IsExotic = Not (reader.GetBoolean(4))
                        dtoRankProfile.SpeciesName = reader.GetString(6)

                        Dim isPublished As Boolean = (reader.GetString(7) = "Published")
                        Dim isValidationComplete As Boolean = reader.GetBoolean(8)

                        Dim isAwaitingValidation As Boolean = True
                        If isPublished Then
                            isAwaitingValidation = False
                        Else
                            If isValidationComplete Then
                                isAwaitingValidation = False
                            End If
                        End If

                        dtoRankProfile.IsAwaitingValidation = isAwaitingValidation

                        Dim categoryName As String = reader.GetString(2)
                        Dim rankValue As Integer

                        Select Case categoryName.ToLower()
                            Case "international trade"
                                rankValue = reader.GetInt32(3)
                                dtoRankProfile.InternationalTradeRank = rankValue
                                dtoRankProfile.InternationalTradeProfileVersionId = reader.GetGuid(9)
                            Case "public health"
                                rankValue = reader.GetInt32(3)
                                dtoRankProfile.PublicHealthRank = rankValue
                                dtoRankProfile.PublicHealthProfileVersionId = reader.GetGuid(9)

                            Case "post mitigation risk"
                                rankValue = reader.GetInt32(3)
                                dtoRankProfile.RiskRank = rankValue
                                dtoRankProfile.RiskProfileVersionId = reader.GetGuid(9)
                            Case "welfare"
                                rankValue = reader.GetInt32(3)
                                dtoRankProfile.WelfareRank = rankValue
                                dtoRankProfile.WelfareProfileVersionId = reader.GetGuid(9)
                            Case "wider society"
                                rankValue = reader.GetInt32(3)
                                dtoRankProfile.WiderSocietyRank = rankValue
                                dtoRankProfile.WiderSocietyProfileVersionId = reader.GetGuid(9)
                            Case "potential to add value"
                                rankValue = reader.GetInt32(3)
                                dtoRankProfile.PotentialToAddValueRank = rankValue
                                dtoRankProfile.PotentialToAddValueProfileVersionId = reader.GetGuid(9)
                            Case Else

                        End Select

                        'update the dictionary.
                        If Not dictionaryRankProfile.ContainsKey(keyString) Then
                            dictionaryRankProfile.Add(keyString, dtoRankProfile)
                        Else
                            dictionaryRankProfile(keyString) = dtoRankProfile
                        End If

                    End While

                End Using

            End Using
        End Using

        Return dictionaryRankProfile.Values.ToList()

    End Function

    'Public Function GetRankProfileData(ByVal request As Contracts.DataContracts.GetProfileRankingReportRequest) As System.Collections.Generic.List(Of Contracts.DataContracts.RankProfileData) Implements Contracts.ServiceContracts.IPrioritisationService.GetRankProfileData
    Public Function GetRankProfileDataForFilter(ByVal value As String) As System.Collections.Generic.List(Of Contracts.DataContracts.RankProfileData) Implements IPrioritisationService.GetRankProfileDataForFilter

        Dim dictionaryRankProfile As New Dictionary(Of String, RankProfileData)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure

                If value = Nothing Then
                    getCommand.CommandText = "spgaRankProfileData"
                Else
                    getCommand.Parameters.AddWithValue("@DiseaseName", value)
                    getCommand.CommandText = "spgaFilterRankProfileData"
                End If

                Using reader As New SafeDataReader(getCommand.ExecuteReader)

                    While reader.Read()

                        Dim profileId As Guid = reader.GetGuid(0)
                        Dim speciesId As Guid = reader.GetGuid(1)
                        Dim keyString As String = profileId.ToString() & "_" & speciesId.ToString()

                        Dim dtoRankProfile As New RankProfileData

                        If dictionaryRankProfile.ContainsKey(keyString) Then
                            dtoRankProfile = dictionaryRankProfile(keyString)
                        End If

                        dtoRankProfile.ProfileId = profileId
                        dtoRankProfile.ProfileVersionId = reader.GetGuid(9)
                        dtoRankProfile.SpeciesId = speciesId
                        dtoRankProfile.ProfileTitle = reader.GetString(5)
                        dtoRankProfile.IsExotic = Not (reader.GetBoolean(4))
                        dtoRankProfile.SpeciesName = reader.GetString(6)

                        Dim isPublished As Boolean = (reader.GetString(7) = "Published")
                        Dim isValidationComplete As Boolean = reader.GetBoolean(8)

                        Dim isAwaitingValidation As Boolean = True
                        If isPublished Then
                            isAwaitingValidation = False
                        Else
                            If isValidationComplete Then
                                isAwaitingValidation = False
                            End If
                        End If

                        dtoRankProfile.IsAwaitingValidation = isAwaitingValidation

                        Dim categoryName As String = reader.GetString(2)
                        Dim rankValue As Integer

                        Select Case categoryName.ToLower()
                            Case "international trade"
                                rankValue = reader.GetInt32(3)
                                dtoRankProfile.InternationalTradeRank = rankValue
                                dtoRankProfile.InternationalTradeProfileVersionId = reader.GetGuid(9)
                            Case "public health"
                                rankValue = reader.GetInt32(3)
                                dtoRankProfile.PublicHealthRank = rankValue
                                dtoRankProfile.PublicHealthProfileVersionId = reader.GetGuid(9)

                            Case "post mitigation risk"
                                rankValue = reader.GetInt32(3)
                                dtoRankProfile.RiskRank = rankValue
                                dtoRankProfile.RiskProfileVersionId = reader.GetGuid(9)
                            Case "welfare"
                                rankValue = reader.GetInt32(3)
                                dtoRankProfile.WelfareRank = rankValue
                                dtoRankProfile.WelfareProfileVersionId = reader.GetGuid(9)
                            Case "wider society"
                                rankValue = reader.GetInt32(3)
                                dtoRankProfile.WiderSocietyRank = rankValue
                                dtoRankProfile.WiderSocietyProfileVersionId = reader.GetGuid(9)
                            Case "potential to add value"
                                rankValue = reader.GetInt32(3)
                                dtoRankProfile.PotentialToAddValueRank = rankValue
                                dtoRankProfile.PotentialToAddValueProfileVersionId = reader.GetGuid(9)
                            Case Else

                        End Select

                        'update the dictionary.
                        If Not dictionaryRankProfile.ContainsKey(keyString) Then
                            dictionaryRankProfile.Add(keyString, dtoRankProfile)
                        Else
                            dictionaryRankProfile(keyString) = dtoRankProfile
                        End If

                    End While

                End Using

            End Using
        End Using

        Return dictionaryRankProfile.Values.ToList()

    End Function

    Public Function GetDiseaseReviewsDataForFilter(ByVal GetDescription As String, ByVal GetToDate As Date, ByVal GetFromdate As Date, ByVal AuthorId As Guid) As System.Collections.Generic.List(Of Contracts.DataContracts.DiseaseReviewsData) Implements IPrioritisationService.GetDiseaseReviewsDataForFilter

        Dim diseaseReviewsData As IEnumerable(Of DiseaseReviewsData)

        Dim databaseInitializer As IDatabaseInitializer = New DatabaseInitializer()
        Dim db = databaseInitializer.Instance

        Dim results = db.Fetch(Of ReviewTimingsReport)("EXEC [dbo].[spgaDiseaseReviews] @0, @1, @2", GetFromdate, GetToDate, authorId)
        diseaseReviewsData = results.Select(Function(x) ExplicitlyMap.TheseTypes(Of ReviewTimingsReport, DiseaseReviewsData).Using(Of DiseaseReviewsDataMap)().Map(x))

        db.Dispose()

        Return diseaseReviewsData.ToList()

    End Function

End Class

