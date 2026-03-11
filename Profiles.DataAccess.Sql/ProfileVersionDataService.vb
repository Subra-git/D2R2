Imports Profiles.Contracts.ServiceContracts
Imports Profiles.Contracts.DataContracts
Imports System.Data.SqlClient
Imports Profiles.DataAccess.Sql.Data
Imports System.Transactions

Public Class ProfileVersionDataService
    Implements IProfileVersionDataService

    Public Function GetProfileMetadata() As System.Collections.Generic.List(Of Contracts.DataContracts.ProfileSectionMetadata) Implements Contracts.ServiceContracts.IProfileVersionDataService.GetProfileMetadata

        Dim sectionDictionary As New Dictionary(Of Guid, ProfileSectionMetadata)
        Dim questionDictionary As New Dictionary(Of Guid, ProfileQuestionMetadata)
        Dim fieldDictionary As New Dictionary(Of Guid, ProfileFieldMetadata)
        Dim fieldGroupfieldDictionary As New Dictionary(Of Guid, ProfileFieldMetadata)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgaProfileSectionMetadata"

                Using reader As New SafeDataReader(getCommand.ExecuteReader)

                    While reader.Read()
                        Dim currentProfileSection As New ProfileSectionMetadata With { _
                        .Id = reader.GetGuid(0), _
                        .Name = reader.GetString(1), _
                        .ShortName = reader.GetString(2), _
                        .SectionNumber = reader.GetInt32(3), _
                        .Note = reader.GetString(4), _
                        .QuestionMetadataList = New List(Of QuestionMetadata) _
                        }

                        sectionDictionary.Add(currentProfileSection.Id, currentProfileSection)

                    End While

                    If reader.NextResult Then
                        While reader.Read()

                            Dim currentProfileQuestion As New ProfileQuestionMetadata With { _
                            .SectionId = reader.GetGuid(0), _
                            .Id = reader.GetGuid(1), _
                            .ShortName = reader.GetString(2), _
                            .QuestionNumber = reader.GetInt32(3), _
                            .IsPerSpecies = reader.GetBoolean(4), _
                            .IsRepeating = reader.GetBoolean(5), _
                            .IrrelevanceFieldId = reader.GetGuid(6), _
                            .IrrelevanceValueId = reader.GetGuid(7), _
                            .IrrelevanceFlag = reader.GetBoolean(8), _
                            .FieldMetadataList = New List(Of FieldMetadata) _
                            }

                            questionDictionary.Add(currentProfileQuestion.Id, currentProfileQuestion)

                        End While
                    End If

                    If reader.NextResult Then
                        While reader.Read()

                            Dim currentProfileField As ProfileFieldMetadata
                            Dim dataTypeName As String = reader.GetString(6)

                            If dataTypeName = "Field Group" Then

                                currentProfileField = New ProfileFieldGroupMetadata() With { _
                                .FieldMetadataList = New List(Of FieldMetadata) _
                                }

                            Else
                                currentProfileField = New ProfileFieldMetadata()
                            End If

                            With currentProfileField
                                .SectionId = reader.GetGuid(0)
                                .QuestionId = reader.GetGuid(1)
                                .Id = reader.GetGuid(2)
                                .ShortName = reader.GetString(3)
                                .FieldNumber = reader.GetInt32(4)
                                .DataFieldTypeId = reader.GetGuid(5)
                                .DataTypeName = dataTypeName
                                .IsMandatory = reader.GetBoolean(7)
                                .ReferenceTableId = reader.GetGuid(8)
                                .ReferenceTableIsMaintainable = reader.GetBoolean(9)
                                .AffectsRelevance = reader.GetBoolean(10)
                                .Name = reader.GetString(11)
                                .IsReadOnlyCurrentSituation = reader.GetBoolean(12)
                                .IsReadOnlyScenario = reader.GetBoolean(13)
                                .IsPerSpecies = reader.GetBoolean(14)
                                .IsRepeating = reader.GetBoolean(15)
                                .IncludeInSummary = reader.GetBoolean(16)
                                .EditorFieldType = reader.GetInt32(17)
                                .RelevanceFieldId = reader.GetGuid(18)
                                .RelevanceValueId = reader.GetGuid(19)
                                .AffectsVisibility = reader.GetBoolean(20)
                                .SourceOfDataReplication = reader.GetBoolean(21)
                            End With
                            fieldDictionary.Add(currentProfileField.Id, currentProfileField)

                        End While
                    End If

                    If reader.NextResult() Then
                        While reader.Read()
                            Dim currentProfileField As New ProfileFieldMetadata With {
                            .SectionId = reader.GetGuid(0),
                            .QuestionId = reader.GetGuid(1),
                            .Id = reader.GetGuid(2),
                            .ShortName = reader.GetString(3),
                            .FieldNumber = reader.GetInt32(4),
                            .DataFieldTypeId = reader.GetGuid(5),
                            .DataTypeName = reader.GetString(6),
                            .IsMandatory = reader.GetBoolean(7),
                            .ReferenceTableId = reader.GetGuid(8),
                            .ReferenceTableIsMaintainable = reader.GetBoolean(9),
                            .AffectsRelevance = reader.GetBoolean(10),
                            .Name = reader.GetString(11),
                            .IsReadOnlyCurrentSituation = reader.GetBoolean(12),
                            .IsReadOnlyScenario = reader.GetBoolean(13),
                            .IsPerSpecies = reader.GetBoolean(14),
                            .IsRepeating = reader.GetBoolean(15),
                            .IncludeInSummary = reader.GetBoolean(16),
                            .ProfileFieldGroupId = reader.GetGuid(17),
                            .RelevanceFieldId = reader.GetGuid(18),
                            .RelevanceValueId = reader.GetGuid(19),
                            .AffectsVisibility = reader.GetBoolean(20),
                            .SourceOfDataReplication = reader.GetBoolean(21)
                            }

                            fieldGroupfieldDictionary.Add(currentProfileField.Id, currentProfileField)

                        End While
                    End If

                    If reader.NextResult Then
                        While reader.Read()
                            fieldDictionary(reader.GetGuid(0)).AffectsRelevanceOf += reader.GetString(1) + ", "
                        End While
                    End If

                    If reader.NextResult Then
                        While reader.Read()
                            fieldDictionary(reader.GetGuid(0)).TargetFieldList.Add(reader.GetGuid(1))
                        End While
                    End If
                End Using
            End Using
        End Using

        For Each profileFieldGroupField As ProfileFieldMetadata In fieldGroupfieldDictionary.Values
            Dim group As ProfileFieldGroupMetadata
            Dim field As ProfileFieldMetadata = fieldDictionary(profileFieldGroupField.ProfileFieldGroupId)
            group = DirectCast(field, ProfileFieldGroupMetadata)
            group.FieldMetadataList.Add(profileFieldGroupField)
        Next

        For Each profileField As ProfileFieldMetadata In fieldDictionary.Values
            questionDictionary(profileField.QuestionId).FieldMetadataList.Add(profileField)
        Next

        For Each profileQuestion As ProfileQuestionMetadata In questionDictionary.Values
            sectionDictionary(profileQuestion.SectionId).QuestionMetadataList.Add(profileQuestion)
        Next

        Return sectionDictionary.Values.ToList()

    End Function

    Public Function GetContributions(ByVal request As GetContributionsRequest) As List(Of ProfileContributionData) Implements IProfileVersionDataService.GetContributions

        Dim profileContributionList As New List(Of ProfileContributionData)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgProfileVersionSectionUser"
                getCommand.Parameters.AddWithValue("@ProfileVersionId", request.ProfileVersionId)
                getCommand.Parameters.AddWithValue("@ProfileSectionId", request.ProfileSectionId)
                Using reader As New SafeDataReader(getCommand.ExecuteReader)
                    While reader.Read
                        profileContributionList.Add(New ProfileContributionData() With { _
                                                    .ProfileVersionId = reader.GetGuid(0), _
                                                    .UserId = reader.GetGuid(1), _
                                                    .ProfileSectionId = reader.GetGuid(2), _
                                                    .UserName = reader.GetString(3), _
                                                    .OrganisationName = reader.GetString(4), _
                                                    .FullName = reader.GetString(5), _
                                                    .LastContributionDate = reader.GetDateTime(6)})
                    End While
                End Using
            End Using
        End Using

        Return profileContributionList

    End Function

    Public Function GetProfileVersionAnswerData(ByVal request As Contracts.DataContracts.GetProfilesAnswerDataRequest) As Contracts.DataContracts.ProfileAnswerData Implements Contracts.ServiceContracts.IProfileVersionDataService.GetProfileVersionAnswerData

        Dim dtoAnswerData As ProfileAnswerData = New ProfileAnswerData()
        Dim dtoProfiledSpeciesList As New List(Of ProfiledSpecies)

        Dim questionNameListDictionary As New Dictionary(Of Guid, List(Of QuestionName))
        Dim questionRowListDictionary As New Dictionary(Of Guid, List(Of QuestionRow))
        Dim fieldValueListDictionary As New Dictionary(Of Guid, List(Of ProfileFieldValue))
        Dim sectionListDictionary As New Dictionary(Of Guid, ProfileVersionSection)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgaProfileVersionSection"
                getCommand.Parameters.AddWithValue("@ProfileVersionId", request.ProfileVersionId)
                Using reader As New SafeDataReader(getCommand.ExecuteReader)

                    While reader.Read()

                        Dim dtoProfiledSpecies As New ProfiledSpecies() With { _
                        .Id = reader.GetGuid(0), _
                        .Name = reader.GetString(1), _
                        .IsActive = reader.GetBoolean(2) _
                        }

                        dtoProfiledSpeciesList.Add(dtoProfiledSpecies)

                    End While

                    If reader.NextResult() Then
                        While reader.Read()

                            Dim dtoProfileVersionSection As New ProfileVersionSection()
                            dtoProfileVersionSection.SectionId = reader.GetGuid(0)
                            dtoProfileVersionSection.ProfileVersionId = request.ProfileVersionId

                            reader.GetBytes("LastUpdated", 0, dtoProfileVersionSection.LastUpdated, 0, 8)

                            Dim dtoRevisionDates As New RevisionDates() With { _
                            .VAReviewFrequency = reader.GetGuid(1), _
                            .PolicyReviewFrequency = reader.GetGuid(2), _
                            .AuthorReviewFrequency = reader.GetGuid(3), _
                            .NextVAReview = reader.GetDateTime(4), _
                            .NextPolicyReview = reader.GetDateTime(5), _
                            .NextAuthorReview = reader.GetDateTime(6), _
                            .PolicyReviewStatusId = reader.GetGuid(8), _
                            .VAReviewStatusId = reader.GetGuid(9), _
                            .AuthorReviewStatusId = reader.GetGuid(10) _
                            }

                            If dtoRevisionDates.VAReviewFrequency = Guid.Empty Then
                                dtoRevisionDates.HasVAReviewFrequency = False
                            Else
                                dtoRevisionDates.HasVAReviewFrequency = True
                            End If

                            If dtoRevisionDates.PolicyReviewFrequency = Guid.Empty Then
                                dtoRevisionDates.HasPolicyReviewFrequency = False
                            Else
                                dtoRevisionDates.HasPolicyReviewFrequency = True
                            End If

                            If dtoRevisionDates.AuthorReviewFrequency = Guid.Empty Then
                                dtoRevisionDates.HasAuthorReviewFrequency = False
                            Else
                                dtoRevisionDates.HasAuthorReviewFrequency = True
                            End If

                            If dtoRevisionDates.VAReviewStatusId = Guid.Empty Then
                                dtoRevisionDates.HasVAReviewStatusId = False
                            Else
                                dtoRevisionDates.HasVAReviewStatusId = True
                            End If

                            If dtoRevisionDates.PolicyReviewStatusId = Guid.Empty Then
                                dtoRevisionDates.HasPolicyReviewStatusId = False
                            Else
                                dtoRevisionDates.HasPolicyReviewStatusId = True
                            End If

                            If dtoRevisionDates.AuthorReviewStatusId = Guid.Empty Then
                                dtoRevisionDates.HasAuthorReviewStatusId = False
                            Else
                                dtoRevisionDates.HasAuthorReviewStatusId = True
                            End If

                            dtoProfileVersionSection.RevisionDates = dtoRevisionDates

                            Dim dtoQuestionRowList As New List(Of QuestionRow)
                            questionRowListDictionary.Add(dtoProfileVersionSection.SectionId, dtoQuestionRowList)

                            Dim dtoFieldValueList As New List(Of ProfileFieldValue)
                            fieldValueListDictionary.Add(dtoProfileVersionSection.SectionId, dtoFieldValueList)

                            Dim dtoQuestionNameList As New List(Of QuestionName)
                            questionNameListDictionary.Add(dtoProfileVersionSection.SectionId, dtoQuestionNameList)

                            sectionListDictionary.Add(dtoProfileVersionSection.SectionId, dtoProfileVersionSection)

                        End While
                    End If

                    If reader.NextResult() Then
                        While reader.Read()

                            Dim sectionId As Guid = reader.GetGuid(0)

                            Dim dtoQuestionName As New QuestionName() With { _
                            .Id = reader.GetGuid(1), _
                            .Name = reader.GetString(2), _
                            .NonTechnicalName = reader.GetString(3) _
                            }

                            If Not questionNameListDictionary.ContainsKey(sectionId) Then
                                questionNameListDictionary.Add(sectionId, New List(Of QuestionName))
                            End If
                            questionNameListDictionary(sectionId).Add(dtoQuestionName)
                        End While
                    End If

                    If reader.NextResult() Then
                        While reader.Read()

                            Dim sectionId As Guid = reader.GetGuid(0)

                            Dim dtoQuestionRow As New QuestionRow() With { _
                            .Id = reader.GetGuid(1), _
                            .ProfileQuestionId = reader.GetGuid(2), _
                            .SequenceNumber = reader.GetInt32(3) _
                            }

                            If Not questionRowListDictionary.ContainsKey(sectionId) Then
                                questionRowListDictionary.Add(sectionId, New List(Of QuestionRow))
                            End If
                            questionRowListDictionary(sectionId).Add(dtoQuestionRow)
                        End While
                    End If

                    If reader.NextResult() Then
                        While reader.Read()

                            Dim sectionId As Guid = reader.GetGuid(0)

                            Dim dtoFieldValue As New ProfileFieldValue() With { _
                            .Id = reader.GetGuid(1), _
                            .SpeciesId = reader.GetGuid(2), _
                            .ProfileVersionQuestionRowId = reader.GetGuid(3), _
                            .BooleanValue = reader.GetBoolean(4), _
                            .ListValue = reader.GetGuid(5), _
                            .DecimalValue = reader.GetDecimal(6), _
                            .DateValue = reader.GetDateTime(7), _
                            .TextValue = reader.GetString(8), _
                            .FieldGroupId = reader.GetGuid(10), _
                            .QuestionId = reader.GetGuid(11), _
                            .QuestionNumber = reader.GetInt32(12), _
                            .FieldNumber = reader.GetInt32(13) _
                            }

                            If Not fieldValueListDictionary.ContainsKey(sectionId) Then
                                fieldValueListDictionary.Add(sectionId, New List(Of ProfileFieldValue))
                            End If
                            fieldValueListDictionary(sectionId).Add(dtoFieldValue)
                        End While
                    End If

                End Using
            End Using
        End Using

        For Each section As ProfileVersionSection In sectionListDictionary.Values
            section.QuestionRowList = questionRowListDictionary(section.SectionId)
            section.FieldValueList = fieldValueListDictionary(section.SectionId)
            section.QuestionNameList = questionNameListDictionary(section.SectionId)
        Next

        dtoAnswerData.ProfiledSpeciesList = dtoProfiledSpeciesList
        dtoAnswerData.ProfileVersionSectionList = sectionListDictionary.Values.ToList()

        Return dtoAnswerData

    End Function

    Public Function GetProfileVersionAnswerDataSingleSection(ByVal request As Contracts.DataContracts.GetProfilesAnswerDataSingleSectionRequest) As Contracts.DataContracts.ProfileAnswerDataSingleSection Implements Contracts.ServiceContracts.IProfileVersionDataService.GetProfileVersionAnswerDataSingleSection

        Dim dtoAnswerData As ProfileAnswerDataSingleSection = New ProfileAnswerDataSingleSection()
        Dim dtoProfiledSpeciesList As New List(Of ProfiledSpecies)
        Dim dtoProfileVersionSection As New ProfileVersionSection()
        Dim dtoQuestionRowList As New List(Of QuestionRow)
        Dim dtoFieldValueList As New List(Of ProfileFieldValue)
        Dim dtoQuestionNameList As New List(Of QuestionName)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgProfileVersionSection"
                getCommand.Parameters.AddWithValue("@ProfileVersionId", request.ProfileVersionId)
                getCommand.Parameters.AddWithValue("@ProfileSectionId", request.ProfileSectionId)
                Using reader As New SafeDataReader(getCommand.ExecuteReader)

                    While reader.Read()

                        Dim dtoProfiledSpecies As New ProfiledSpecies() With { _
                        .Id = reader.GetGuid(0), _
                        .Name = reader.GetString(1), _
                        .IsActive = reader.GetBoolean(2) _
                        }

                        dtoProfiledSpeciesList.Add(dtoProfiledSpecies)

                    End While

                    If reader.NextResult() Then
                        While reader.Read()

                            dtoProfileVersionSection.SectionId = request.ProfileSectionId
                            dtoProfileVersionSection.ProfileVersionId = request.ProfileVersionId
                            dtoProfileVersionSection.ParentId = reader.GetGuid(8)
                            reader.GetBytes("LastUpdated", 0, dtoProfileVersionSection.LastUpdated, 0, 8)

                            Dim dtoRevisionDates As New RevisionDates() With { _
                            .VAReviewFrequency = reader.GetGuid(1), _
                            .PolicyReviewFrequency = reader.GetGuid(2), _
                            .AuthorReviewFrequency = reader.GetGuid(3), _
                            .NextVAReview = reader.GetDateTime(4), _
                            .NextPolicyReview = reader.GetDateTime(5), _
                            .NextAuthorReview = reader.GetDateTime(6), _
                            .PolicyReviewStatusId = reader.GetGuid(9), _
                            .VAReviewStatusId = reader.GetGuid(10), _
                            .AuthorReviewStatusId = reader.GetGuid(11) _
                            }

                            If dtoRevisionDates.VAReviewFrequency = Guid.Empty Then
                                dtoRevisionDates.HasVAReviewFrequency = False
                            Else
                                dtoRevisionDates.HasVAReviewFrequency = True
                            End If

                            If dtoRevisionDates.PolicyReviewFrequency = Guid.Empty Then
                                dtoRevisionDates.HasPolicyReviewFrequency = False
                            Else
                                dtoRevisionDates.HasPolicyReviewFrequency = True
                            End If

                            If dtoRevisionDates.AuthorReviewStatusId = Guid.Empty Then
                                dtoRevisionDates.HasAuthorReviewFrequency = False
                            Else
                                dtoRevisionDates.HasAuthorReviewFrequency = True
                            End If

                            If dtoRevisionDates.VAReviewStatusId = Guid.Empty Then
                                dtoRevisionDates.HasVAReviewStatusId = False
                            Else
                                dtoRevisionDates.HasVAReviewStatusId = True
                            End If

                            If dtoRevisionDates.PolicyReviewStatusId = Guid.Empty Then
                                dtoRevisionDates.HasPolicyReviewStatusId = False
                            Else
                                dtoRevisionDates.HasPolicyReviewStatusId = True
                            End If

                            If dtoRevisionDates.AuthorReviewStatusId = Guid.Empty Then
                                dtoRevisionDates.HasAuthorReviewStatusId = False
                            Else
                                dtoRevisionDates.HasAuthorReviewStatusId = True
                            End If

                            dtoProfileVersionSection.RevisionDates = dtoRevisionDates

                        End While
                    End If

                    If reader.NextResult() Then
                        While reader.Read()

                            Dim dtoQuestionName As New QuestionName() With { _
                           .Id = reader.GetGuid(0), _
                           .Name = reader.GetString(1), _
                           .NonTechnicalName = reader.GetString(2) _
                           }

                            dtoQuestionNameList.Add(dtoQuestionName)

                        End While
                    End If

                    If reader.NextResult() Then
                        While reader.Read()

                            Dim dtoQuestionRow As New QuestionRow() With { _
                            .Id = reader.GetGuid(0), _
                            .ProfileQuestionId = reader.GetGuid(1), _
                            .SequenceNumber = reader.GetInt32(2) _
                            }

                            dtoQuestionRowList.Add(dtoQuestionRow)

                        End While
                    End If

                    If reader.NextResult() Then
                        While reader.Read()

                            Dim dtoFieldValue As New ProfileFieldValue() With { _
                            .Id = reader.GetGuid(0), _
                            .SpeciesId = reader.GetGuid(1), _
                            .ProfileVersionQuestionRowId = reader.GetGuid(2), _
                            .BooleanValue = reader.GetBoolean(3), _
                            .ListValue = reader.GetGuid(4), _
                            .DecimalValue = reader.GetDecimal(5), _
                            .DateValue = reader.GetDateTime(6), _
                            .TextValue = reader.GetString(7), _
                            .FieldGroupId = reader.GetGuid(9), _
                            .QuestionNumber = reader.GetInt32(10), _
                            .QuestionId = reader.GetGuid(11), _
                            .FieldNumber = reader.GetInt32(12) _
                            }

                            dtoFieldValueList.Add(dtoFieldValue)

                        End While
                    End If

                End Using
            End Using
        End Using

        dtoProfileVersionSection.FieldValueList = dtoFieldValueList
        dtoProfileVersionSection.QuestionRowList = dtoQuestionRowList
        dtoProfileVersionSection.QuestionNameList = dtoQuestionNameList

        dtoAnswerData.ProfileVersionSection = dtoProfileVersionSection
        dtoAnswerData.ProfiledSpeciesList = dtoProfiledSpeciesList

        Return dtoAnswerData

    End Function
    Public Function GetSectionReviewFrequencies() As System.Collections.Generic.List(Of Contracts.DataContracts.SectionReviewFrequency) Implements Contracts.ServiceContracts.IProfileVersionDataService.GetSectionReviewFrequencies

        Dim returnList As New List(Of SectionReviewFrequency)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgaluSectionReviewFrequency"
                Using reader As New SafeDataReader(getCommand.ExecuteReader)
                    While reader.Read
                        returnList.Add(New SectionReviewFrequency() With {.Id = reader.GetGuid(0), .LookupValue = reader.GetString(1)})
                    End While
                End Using
            End Using
        End Using

        Return returnList

    End Function

    Public Function GetSectionReviewStatusTypes() As System.Collections.Generic.List(Of Contracts.DataContracts.SectionReviewStatusType) Implements Contracts.ServiceContracts.IProfileVersionDataService.GetSectionReviewStatusTypes

        Dim returnList As New List(Of SectionReviewStatusType)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgaluSectionReviewStatusType"
                Using reader As New SafeDataReader(getCommand.ExecuteReader)
                    While reader.Read
                        returnList.Add(New SectionReviewStatusType() With {.Id = reader.GetGuid(0), .Name = reader.GetString(1)})
                    End While
                End Using
            End Using
        End Using

        Return returnList

    End Function

    Public Function UpdateProfileVersionAnswerData(ByVal request As Contracts.DataContracts.ProfileAnswerDataChangeSet) As Contracts.DataContracts.ProfileAnswerDataChangeResult Implements Contracts.ServiceContracts.IProfileVersionDataService.UpdateProfileVersionAnswerData

        Dim result As New ProfileAnswerDataChangeResult

        Using transaction As New TransactionScope

            Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
                connection.Open()

                result.LastUpdated = UpdateProfileVersionSection(request, connection)

                For Each item As QuestionRowDelete In request.QuestionRowDeleteList
                    DeleteQuestionRow(item, connection)
                Next

                For Each item As QuestionRow In request.QuestionRowInsertList
                    InsertQuestionRow(item, connection, request.ProfileVersionId)
                    result.QuestionRowIdInsertList.Add(item.Id)
                Next

                For Each item As QuestionRow In request.QuestionRowUpdateList
                    UpdateQuestionRow(item, connection, request.ProfileVersionId)
                Next

                If request.FieldValueUpdateList.Count > 0 Then
                    For Each item As ProfileFieldValueUpdate In request.FieldValueUpdateList
                        If item.ParameterName = "@MultiValue" Then
                            UpdateMultiFieldValue(item, connection, request.ProfileVersionId)
                        Else
                            UpdateFieldValue(item, connection, request.ProfileVersionId)
                        End If
                    Next

                    LogUserContribution(connection, request.UserId, request.ProfileVersionId, request.ProfileSectionId)
                End If

            End Using
            transaction.Complete()
        End Using

        Return result

    End Function

    Private Function UpdateProfileVersionSection(ByVal request As Contracts.DataContracts.ProfileAnswerDataChangeSet, ByVal connection As SqlConnection) As Byte()

        Dim lastUpdated(7) As Byte

        Using updateProfileVersionSectionCommand As SqlCommand = connection.CreateCommand
            With updateProfileVersionSectionCommand
                .CommandType = CommandType.StoredProcedure
                .CommandText = "spuProfileVersionSection"
                .Parameters.AddWithValue("@ProfileVersionId", request.ProfileVersionId)
                .Parameters.AddWithValue("@ProfileSectionId", request.ProfileSectionId)
                If request.VAReviewFrequency.Equals(Guid.Empty) Then
                    .Parameters.AddWithValue("@TechnicalReviewFrequency", DBNull.Value)
                Else
                    .Parameters.AddWithValue("@TechnicalReviewFrequency", request.VAReviewFrequency)
                End If
                If request.PolicyReviewFrequency.Equals(Guid.Empty) Then
                    .Parameters.AddWithValue("@PolicyReviewFrequency", DBNull.Value)
                Else
                    .Parameters.AddWithValue("@PolicyReviewFrequency", request.PolicyReviewFrequency)
                End If
                If request.AuthorReviewFrequency.Equals(Guid.Empty) Then
                    .Parameters.AddWithValue("@AuthorReviewFrequency", DBNull.Value)
                Else
                    .Parameters.AddWithValue("@AuthorReviewFrequency", request.AuthorReviewFrequency)
                End If
                If request.NextVAReview.Equals(Date.MinValue) Then
                    .Parameters.AddWithValue("@NextTechnicalReview", DBNull.Value)
                Else
                    .Parameters.AddWithValue("@NextTechnicalReview", request.NextVAReview)
                End If
                If request.NextPolicyReview.Equals(Date.MinValue) Then
                    .Parameters.AddWithValue("@NextPolicyReview", DBNull.Value)
                Else
                    .Parameters.AddWithValue("@NextPolicyReview", request.NextPolicyReview)
                End If
                If request.NextAuthorReview.Equals(Date.MinValue) Then
                    .Parameters.AddWithValue("@NextAuthorReview", DBNull.Value)
                Else
                    .Parameters.AddWithValue("@NextAuthorReview", request.NextAuthorReview)
                End If

                If request.VAReviewStatusId.Equals(Guid.Empty) Then
                    .Parameters.AddWithValue("@TechnicalReviewStatusId", DBNull.Value)
                Else
                    .Parameters.AddWithValue("@TechnicalReviewStatusId", request.VAReviewStatusId)
                End If
                If request.PolicyReviewStatusId.Equals(Guid.Empty) Then
                    .Parameters.AddWithValue("@PolicyReviewStatusId", DBNull.Value)
                Else
                    .Parameters.AddWithValue("@PolicyReviewStatusId", request.PolicyReviewStatusId)
                End If
                If request.AuthorReviewStatusId.Equals(Guid.Empty) Then
                    .Parameters.AddWithValue("@AuthorReviewStatusId", DBNull.Value)
                Else
                    .Parameters.AddWithValue("@AuthorReviewStatusId", request.AuthorReviewStatusId)
                End If

                If request.VAReviewCompleted.Equals(Date.MinValue) Then
                    .Parameters.AddWithValue("@TechnicalReviewCompleted", DBNull.Value)
                Else
                    .Parameters.AddWithValue("@TechnicalReviewCompleted", request.VAReviewCompleted)
                End If
                If request.PolicyReviewCompleted.Equals(Date.MinValue) Then
                    .Parameters.AddWithValue("@PolicyReviewCompleted", DBNull.Value)
                Else
                    .Parameters.AddWithValue("@PolicyReviewCompleted", request.PolicyReviewCompleted)
                End If
                If request.AuthorReviewCompleted.Equals(Date.MinValue) Then
                    .Parameters.AddWithValue("@AuthorReviewCompleted", DBNull.Value)
                Else
                    .Parameters.AddWithValue("@AuthorReviewCompleted", request.AuthorReviewCompleted)
                End If

                .Parameters.AddWithValue("@LastUpdated", request.LastUpdated)
                Dim output As New SqlParameter("@NewLastUpdated", SqlDbType.Timestamp)
                output.Direction = ParameterDirection.Output
                .Parameters.Add(output)
                .ExecuteNonQuery()
                lastUpdated = CType(.Parameters("@NewLastUpdated").Value, Byte())
            End With
        End Using

        Return lastUpdated

    End Function

    Private Sub UpdateMultiFieldValue(ByVal item As ProfileFieldValueUpdate, ByVal connection As SqlConnection, ByVal profileVersionId As Guid)

        'first, remove all multi-values from the database
        Using deleteMultiValueCommand As SqlCommand = connection.CreateCommand
            deleteMultiValueCommand.CommandType = CommandType.StoredProcedure
            deleteMultiValueCommand.CommandText = "spdProfileVersionFieldMultiValue"
            deleteMultiValueCommand.Parameters.AddWithValue("@ProfileVersionId", profileVersionId)
            deleteMultiValueCommand.Parameters.AddWithValue("@ProfileFieldId", item.FieldId)
            If Not item.SpeciesId.Equals(Guid.Empty) Then
                deleteMultiValueCommand.Parameters.AddWithValue("@SpeciesId", item.SpeciesId)
            End If
            If Not item.ProfileVersionQuestionRowId.Equals(Guid.Empty) Then
                deleteMultiValueCommand.Parameters.AddWithValue("@ProfileVersionQuestionRowId", item.ProfileVersionQuestionRowId)
            End If
            deleteMultiValueCommand.ExecuteNonQuery()
        End Using

        'then add back in any multi-values that are in this object
        Using insertMultiValueCommand As SqlCommand = connection.CreateCommand
            insertMultiValueCommand.CommandType = CommandType.StoredProcedure
            insertMultiValueCommand.CommandText = "spiProfileVersionFieldMultiValue"
            insertMultiValueCommand.Parameters.AddWithValue("@ProfileVersionId", profileVersionId)
            insertMultiValueCommand.Parameters.AddWithValue("@ProfileFieldId", item.FieldId)
            If Not item.SpeciesId.Equals(Guid.Empty) Then
                insertMultiValueCommand.Parameters.AddWithValue("@SpeciesId", item.SpeciesId)
            End If
            If Not item.ProfileVersionQuestionRowId.Equals(Guid.Empty) Then
                insertMultiValueCommand.Parameters.AddWithValue("@ProfileVersionQuestionRowId", item.ProfileVersionQuestionRowId)
            End If

            Dim valueParameter As New SqlParameter("@ListValue", SqlDbType.UniqueIdentifier)
            insertMultiValueCommand.Parameters.Add(valueParameter)
            'execute the stored procedure once for each value in the multi-value, inserting that value into the database
            For Each id As Guid In item.MultiValueList
                valueParameter.Value = id
                insertMultiValueCommand.ExecuteNonQuery()
            Next

        End Using

    End Sub

    Private Sub UpdateFieldValue(ByVal item As ProfileFieldValueUpdate, ByVal connection As SqlConnection, ByVal profileVersionId As Guid)

        Using updateFieldValueCommand As SqlCommand = connection.CreateCommand()
            updateFieldValueCommand.CommandType = CommandType.StoredProcedure

            updateFieldValueCommand.CommandText = "spuProfileVersionFieldValue"
            updateFieldValueCommand.Parameters.AddWithValue("@ProfileVersionId", profileVersionId)
            updateFieldValueCommand.Parameters.AddWithValue("@ProfileFieldId", item.FieldId)

            If item.SpeciesId <> Guid.Empty Then
                updateFieldValueCommand.Parameters.AddWithValue("@SpeciesId", item.SpeciesId)
            End If
            If item.ProfileVersionQuestionRowId <> Guid.Empty Then
                updateFieldValueCommand.Parameters.AddWithValue("@ProfileVersionQuestionRowId", item.ProfileVersionQuestionRowId)
            End If

            Select Case item.ParameterName
                Case String.Empty
                    ' don't add any parameters here. The stored procedure gives defaults of DBNULL
                Case "@BooleanValue"
                    updateFieldValueCommand.Parameters.AddWithValue(item.ParameterName, item.BooleanValue)
                Case "@ListValue"
                    If Not item.ListValue.Equals(Guid.Empty) Then
                        updateFieldValueCommand.Parameters.AddWithValue(item.ParameterName, item.ListValue)
                    End If
                Case "@DecimalValue"
                    updateFieldValueCommand.Parameters.AddWithValue(item.ParameterName, item.DecimalValue)
                Case "@DateValue"
                    updateFieldValueCommand.Parameters.AddWithValue(item.ParameterName, item.DateValue)
                Case "@TextValue"
                    updateFieldValueCommand.Parameters.AddWithValue(item.ParameterName, item.TextValue)
            End Select

            updateFieldValueCommand.ExecuteNonQuery()

        End Using
    End Sub

    Private Sub DeleteQuestionRow(ByVal item As QuestionRowDelete, ByVal connection As SqlConnection)

        Using deleteRowCommand As SqlCommand = connection.CreateCommand

            deleteRowCommand.CommandType = CommandType.StoredProcedure
            deleteRowCommand.CommandText = "spdProfileVersionQuestionRow"
            deleteRowCommand.Parameters.AddWithValue("@Id", item.Id)

            deleteRowCommand.ExecuteNonQuery()
        End Using

    End Sub

    Private Sub InsertQuestionRow(ByVal item As QuestionRow, ByVal connection As SqlConnection, ByVal profileVersionId As Guid)

        Using insertRowCommand As SqlCommand = connection.CreateCommand

            insertRowCommand.CommandType = CommandType.StoredProcedure
            insertRowCommand.CommandText = "spiProfileVersionQuestionRow"
            insertRowCommand.Parameters.AddWithValue("@Id", item.Id)
            insertRowCommand.Parameters.AddWithValue("@ProfileVersionId", profileVersionId)
            insertRowCommand.Parameters.AddWithValue("@ProfileQuestionId", item.ProfileQuestionId)
            insertRowCommand.Parameters.AddWithValue("@SequenceNumber", item.SequenceNumber)
            insertRowCommand.ExecuteNonQuery()

        End Using

    End Sub

    Private Sub UpdateQuestionRow(ByVal item As QuestionRow, ByVal connection As SqlConnection, ByVal profileVersionId As Guid)

        Using updateRowCommand As SqlCommand = connection.CreateCommand

            updateRowCommand.CommandType = CommandType.StoredProcedure
            updateRowCommand.CommandText = "spuProfileVersionQuestionRow"
            updateRowCommand.Parameters.AddWithValue("@Id", item.Id)
            updateRowCommand.Parameters.AddWithValue("@SequenceNumber", item.SequenceNumber)
            updateRowCommand.ExecuteNonQuery()

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
