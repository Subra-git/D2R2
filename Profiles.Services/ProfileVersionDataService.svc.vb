Imports Profiles.Contracts
Imports Profiles.Contracts.ServiceContracts
Imports ProfilesLibrary

<ServiceBehavior(InstanceContextMode:=InstanceContextMode.PerCall)> _
<ErrorHandlerBehavior()> _
Public Class ProfileVersionDataService
    Implements IProfileVersionDataService

    Public Function GetProfileMetadata() As System.Collections.Generic.List(Of Contracts.DataContracts.ProfileSectionMetadata) Implements Contracts.ServiceContracts.IProfileVersionDataService.GetProfileMetadata

        Dim libSectionMetadataList As ProfilesLibrary.ProfileSectionMetadataList = ProfileSectionMetadataList.GetProfileSectionMetadataList()

        Dim returnList As New List(Of DataContracts.ProfileSectionMetadata)

        For Each libSectionMetadata As ProfilesLibrary.ProfileSectionMetadata In libSectionMetadataList
            returnList.Add(BuildProfileSectionMetadata(libSectionMetadata))
        Next

        Return returnList

    End Function

    Private Function BuildProfileSectionMetadata(ByVal libSectionMetadata As ProfilesLibrary.ProfileSectionMetadata) As DataContracts.ProfileSectionMetadata

        Dim dtoSectionMetadata As DataContracts.ProfileSectionMetadata = New DataContracts.ProfileSectionMetadata()

        Dim dtoQuestionMetadataList As New List(Of DataContracts.QuestionMetadata)

        With dtoSectionMetadata
            .Id = libSectionMetadata.Id
            .Name = libSectionMetadata.Name
            .SectionNumber = libSectionMetadata.SectionNumber
            .ShortName = libSectionMetadata.ShortName
            .Note = libSectionMetadata.Note
        End With

        For Each libQuestionMetadata As ProfilesLibrary.ProfileQuestionMetadata In libSectionMetadata.QuestionMetadataList
            dtoQuestionMetadataList.Add(BuildProfileQuestionMetadata(libQuestionMetadata))
        Next

        dtoSectionMetadata.QuestionMetadataList = dtoQuestionMetadataList

        Return dtoSectionMetadata

    End Function

    Private Function BuildProfileQuestionMetadata(ByVal libQuestionMetadata As ProfilesLibrary.ProfileQuestionMetadata) As DataContracts.ProfileQuestionMetadata

        Dim dtoQuestionMetadata As DataContracts.ProfileQuestionMetadata = New DataContracts.ProfileQuestionMetadata()

        Dim dtoFieldMetadataList As New List(Of DataContracts.FieldMetadata)

        With dtoQuestionMetadata
            .Id = libQuestionMetadata.Id
            .ShortName = libQuestionMetadata.ShortName
            .QuestionNumber = libQuestionMetadata.QuestionNumber
            .IrrelevanceFieldId = libQuestionMetadata.IrrelevanceFieldId
            .IrrelevanceValueId = libQuestionMetadata.IrrelevanceValueId
            .IrrelevanceFlag = libQuestionMetadata.IrrelevanceFlag
            .IsPerSpecies = libQuestionMetadata.IsPerSpecies
            .IsRepeating = libQuestionMetadata.IsRepeating
        End With

        For Each libFieldMetadata As ProfilesLibrary.ProfileFieldMetadata In libQuestionMetadata.FieldMetadataList
            dtoFieldMetadataList.Add(BuildProfileFieldMetadata(libFieldMetadata))
        Next

        dtoQuestionMetadata.FieldMetadataList = dtoFieldMetadataList

        Return dtoQuestionMetadata

    End Function

    Private Function BuildProfileFieldMetadata(ByVal libFieldMetadata As ProfilesLibrary.ProfileFieldMetadata) As DataContracts.ProfileFieldMetadata

        Dim dtoFieldMetadata As DataContracts.ProfileFieldMetadata

        Dim libFieldMetadataGroup As ProfilesLibrary.ProfileFieldGroupMetadata

        libFieldMetadataGroup = TryCast(libFieldMetadata, ProfilesLibrary.ProfileFieldGroupMetadata)

        If libFieldMetadataGroup Is Nothing Then
            dtoFieldMetadata = New DataContracts.ProfileFieldMetadata
        Else
            Dim dtoGroup As DataContracts.ProfileFieldGroupMetadata = New DataContracts.ProfileFieldGroupMetadata

            Dim dtoFieldMetadataList As New List(Of DataContracts.FieldMetadata)

            For Each libField As ProfilesLibrary.ProfileFieldMetadata In libFieldMetadataGroup.FieldList
                dtoFieldMetadataList.Add(BuildProfileFieldMetadata(libField))
            Next

            dtoGroup.FieldMetadataList = dtoFieldMetadataList

            dtoFieldMetadata = dtoGroup
        End If

        With dtoFieldMetadata
            .Id = libFieldMetadata.Id
            .Name = libFieldMetadata.Name
            .ShortName = libFieldMetadata.ShortName
            .FieldNumber = libFieldMetadata.FieldNumber
            .ReferenceTableId = libFieldMetadata.ReferenceTableId
            .ReferenceTableIsMaintainable = libFieldMetadata.ReferenceTableIsMaintainable
            .IncludeInSummary = libFieldMetadata.IncludeInSummary
            .DataFieldTypeId = libFieldMetadata.DataFieldTypeId
            .DataTypeName = libFieldMetadata.DataTypeName
            .IsMandatory = libFieldMetadata.IsMandatory
            .IsPerSpecies = libFieldMetadata.IsPerSpecies
            .IsReadOnlyCurrentSituation = libFieldMetadata.IsReadOnlyCurrentSituation
            .IsReadOnlyScenario = libFieldMetadata.IsReadOnlyScenario
            .IsRepeating = libFieldMetadata.IsRepeating
            .AffectsRelevance = libFieldMetadata.AffectsRelevance
            .AffectsRelevanceOf = libFieldMetadata.AffectsRelevanceOf
            .EditorFieldType = libFieldMetadata.EditorFieldType
            .RelevanceFieldId = libFieldMetadata.RelevanceFieldId
            .RelevanceValueId = libFieldMetadata.RelevanceValueId
            .AffectsVisibility = libFieldMetadata.AffectsVisibility
            .SourceOfDataReplication = libFieldMetadata.SourceOfDataReplication

            .TargetFieldList = libFieldMetadata.TargetFieldList
        End With

        Return dtoFieldMetadata

    End Function

    Public Function GetContributions(ByVal request As DataContracts.GetContributionsRequest) As List(Of DataContracts.ProfileContributionData) Implements IProfileVersionDataService.GetContributions
        Dim profileContributionList As ProfileContributionInfoList = ProfileContributionInfoList.GetProfileContributionInfoList(request.ProfileVersionId, request.ProfileSectionId)
        Dim returnList As New List(Of DataContracts.ProfileContributionData)

        For Each profileContribution As ProfileContributionInfo In profileContributionList
            returnList.Add(New DataContracts.ProfileContributionData() With { _
                            .ProfileSectionId = profileContribution.ProfileSectionId, _
                            .ProfileVersionId = profileContribution.ProfileVersionId, _
                            .OrganisationName = profileContribution.OrganisationName, _
                            .UserId = profileContribution.UserId, _
                            .UserName = profileContribution.UserName, _
                            .FullName = profileContribution.FullName, _
                            .LastContributionDate = profileContribution.LastContributionDate})

        Next

        Return returnList

    End Function

    Public Function GetProfileVersionAnswerData(ByVal request As Contracts.DataContracts.GetProfilesAnswerDataRequest) As Contracts.DataContracts.ProfileAnswerData Implements Contracts.ServiceContracts.IProfileVersionDataService.GetProfileVersionAnswerData

        Dim libProfileVersionSectionList As ProfilesLibrary.ProfileVersionSectionList = ProfilesLibrary.ProfileVersionSectionList.GetProfileVersionSectionList(request.ProfileVersionId)

        Dim dtoAnswerData As New DataContracts.ProfileAnswerData

        Dim dtoProfileVersionSectionList As New List(Of DataContracts.ProfileVersionSection)

        For Each libProfileVersionSection As ProfilesLibrary.ProfileVersionSection In libProfileVersionSectionList
            dtoProfileVersionSectionList.Add(BuildProfileVersionSectionAnswerData(libProfileVersionSection))
        Next

        dtoAnswerData.ProfiledSpeciesList = BuildProfiledSpeciesList(libProfileVersionSectionList.ProfiledSpeciesList)

        dtoAnswerData.ProfileVersionSectionList = dtoProfileVersionSectionList

        Return dtoAnswerData

    End Function

    Public Function GetProfileVersionAnswerDataSingleSection(ByVal request As Contracts.DataContracts.GetProfilesAnswerDataSingleSectionRequest) As Contracts.DataContracts.ProfileAnswerDataSingleSection Implements Contracts.ServiceContracts.IProfileVersionDataService.GetProfileVersionAnswerDataSingleSection

        Dim libProfileVersionSection As ProfilesLibrary.ProfileVersionSection = ProfilesLibrary.ProfileVersionSection.GetProfileVersionSection(request.ProfileVersionId, request.ProfileSectionId)

        Dim dtoAnswerData As New DataContracts.ProfileAnswerDataSingleSection

        Dim dtoProfileVersionSection As New DataContracts.ProfileVersionSection

        dtoProfileVersionSection = BuildProfileVersionSectionAnswerData(libProfileVersionSection)

        dtoProfileVersionSection.ProfileVersionId = request.ProfileVersionId

        dtoAnswerData.ProfiledSpeciesList = BuildProfiledSpeciesList(libProfileVersionSection.ProfiledSpeciesList)
        dtoAnswerData.ProfileVersionSection = dtoProfileVersionSection

        Return dtoAnswerData

    End Function

    Private Function BuildProfiledSpeciesList(ByVal libProfiledSpeciesList As List(Of ProfilesLibrary.ProfiledSpecies)) As List(Of DataContracts.ProfiledSpecies)

        Dim dtoProfiledSpeciesList As New List(Of DataContracts.ProfiledSpecies)

        For Each libProfiledSpecies As ProfilesLibrary.ProfiledSpecies In libProfiledSpeciesList
            Dim dtoProfiledSpecies As New DataContracts.ProfiledSpecies()
            dtoProfiledSpecies.Id = libProfiledSpecies.Id
            dtoProfiledSpecies.Name = libProfiledSpecies.Name
            dtoProfiledSpecies.IsActive = libProfiledSpecies.IsActive
            dtoProfiledSpeciesList.Add(dtoProfiledSpecies)
        Next

        Return dtoProfiledSpeciesList

    End Function

    Private Function BuildProfileVersionSectionAnswerData(ByVal libProfileVersionSection As ProfilesLibrary.ProfileVersionSection) As DataContracts.ProfileVersionSection

        Dim dtoProfileVersionSection As New DataContracts.ProfileVersionSection

        With dtoProfileVersionSection
            .SectionId = libProfileVersionSection.SectionId
            .ProfileVersionId = libProfileVersionSection.ProfileVersionId
            .LastUpdated = libProfileVersionSection.LastUpdated
            .ParentId = libProfileVersionSection.ParentId
        End With

        'Question Rows
        Dim dtoQuestionRowList As New List(Of DataContracts.QuestionRow)
        For Each libQuestion As ProfilesLibrary.QuestionBase In libProfileVersionSection.Questions
            Dim libRepeatingQuestion As ProfilesLibrary.RepeatingQuestion = TryCast(libQuestion, ProfilesLibrary.RepeatingQuestion)
            If libRepeatingQuestion IsNot Nothing Then
                For Each libQuestionRow As ProfilesLibrary.QuestionRow In libRepeatingQuestion.RowList
                    Dim dtoQuestionRow As New DataContracts.QuestionRow
                    dtoQuestionRow.Id = libQuestionRow.Id
                    dtoQuestionRow.ProfileQuestionId = libQuestionRow.ProfileQuestionId
                    dtoQuestionRow.SequenceNumber = libQuestionRow.SequenceNumber
                    dtoQuestionRowList.Add(dtoQuestionRow)
                Next
            End If
        Next
        dtoProfileVersionSection.QuestionRowList = dtoQuestionRowList

        'Field Values
        Dim dtoFieldValueList As New List(Of DataContracts.ProfileFieldValue)
        Dim dtoQuestionNameList As New List(Of DataContracts.QuestionName)
        For Each libQuestion As ProfilesLibrary.QuestionBase In libProfileVersionSection.Questions

            Dim dtoQuestionName As New DataContracts.QuestionName
            dtoQuestionName.Id = libQuestion.Id
            dtoQuestionName.Name = libQuestion.Name
            dtoQuestionName.NonTechnicalName = libQuestion.NonTechnicalName
            dtoQuestionNameList.Add(dtoQuestionName)

            Dim dtoFieldValue As New DataContracts.ProfileFieldValue
            Dim libStandardQuestion As ProfilesLibrary.StandardQuestion = TryCast(libQuestion, StandardQuestion)

            If libStandardQuestion IsNot Nothing Then
                dtoFieldValueList.AddRange(BuildFieldValueList(libStandardQuestion.FieldValues, libStandardQuestion.Id, libStandardQuestion.QuestionNumber))
            Else
                Dim libPerSpeciesQuestion As ProfilesLibrary.PerSpeciesQuestion = TryCast(libQuestion, PerSpeciesQuestion)
                If libPerSpeciesQuestion IsNot Nothing Then
                    For Each species As QuestionSpecies In libPerSpeciesQuestion.SpeciesList
                        dtoFieldValueList.AddRange(BuildFieldValueList(species.FieldValues, libPerSpeciesQuestion.Id, libPerSpeciesQuestion.QuestionNumber, Guid.Empty, species.Id, Guid.Empty))
                    Next
                Else
                    Dim libRepeatingQuestion As ProfilesLibrary.RepeatingQuestion = DirectCast(libQuestion, RepeatingQuestion)
                    For Each row As ProfilesLibrary.QuestionRow In libRepeatingQuestion.RowList
                        dtoFieldValueList.AddRange(BuildFieldValueList(row.FieldValues, libRepeatingQuestion.Id, libRepeatingQuestion.QuestionNumber, row.Id, Guid.Empty, Guid.Empty))
                    Next
                End If
            End If
        Next

        Dim dtoRevisionDates As New DataContracts.RevisionDates()

        If libProfileVersionSection.CanReadProperty("PolicyReviewFrequency") Then
            dtoRevisionDates.PolicyReviewFrequency = libProfileVersionSection.PolicyReviewFrequency
        End If

        If libProfileVersionSection.CanReadProperty("VAReviewFrequency") Then
            dtoRevisionDates.VAReviewFrequency = libProfileVersionSection.VAReviewFrequency
        End If

        dtoRevisionDates.HasPolicyReviewFrequency = libProfileVersionSection.HasPolicyReviewFrequency
        dtoRevisionDates.HasVAReviewFrequency = libProfileVersionSection.HasVAReviewFrequency

        If libProfileVersionSection.CanReadProperty("PolicyReviewStatusId") Then
            dtoRevisionDates.PolicyReviewStatusId = libProfileVersionSection.PolicyReviewStatusId
        End If

        If libProfileVersionSection.CanReadProperty("VAReviewStatusId") Then
            dtoRevisionDates.VAReviewStatusId = libProfileVersionSection.VAReviewStatusId
        End If

        If libProfileVersionSection.CanReadProperty("NextVAReview") Then
            dtoRevisionDates.NextVAReview = libProfileVersionSection.NextVAReview.Date
        End If

		If libProfileVersionSection.CanReadProperty("NextPolicyReview") Then
			dtoRevisionDates.NextPolicyReview = libProfileVersionSection.NextPolicyReview.Date
		End If

		If libProfileVersionSection.CanReadProperty("AuthorReviewStatusId") Then
			dtoRevisionDates.AuthorReviewStatusId = libProfileVersionSection.AuthorReviewStatusId
		End If

		dtoRevisionDates.HasAuthorReviewFrequency = libProfileVersionSection.HasAuthorReviewFrequency
		dtoRevisionDates.HasAuthorReviewStatusId = libProfileVersionSection.HasAuthorReviewStatusId
		dtoRevisionDates.HasPolicyReviewStatusId = libProfileVersionSection.HasPolicyReviewStatusId
		dtoRevisionDates.HasVAReviewStatusId = libProfileVersionSection.HasVAReviewStatusId

        dtoProfileVersionSection.RevisionDates = dtoRevisionDates
        dtoProfileVersionSection.QuestionNameList = dtoQuestionNameList
        dtoProfileVersionSection.FieldValueList = dtoFieldValueList

        Return dtoProfileVersionSection

    End Function

    Private Function BuildFieldValueList(ByVal libFieldValueList As ProfilesLibrary.FieldValueList, ByVal questionId As Guid, ByVal questionNumber As Integer, ByVal questionRowId As Guid, ByVal speciesId As Guid, ByVal fieldGroupId As Guid) As List(Of DataContracts.ProfileFieldValue)

        Dim dtoFieldValueList As List(Of DataContracts.ProfileFieldValue) = BuildFieldValueList(libFieldValueList, questionId, questionNumber)

        For Each dtoFieldValue As DataContracts.ProfileFieldValue In dtoFieldValueList

            If questionRowId <> Guid.Empty Then
                dtoFieldValue.ProfileVersionQuestionRowId = questionRowId
            End If

            If speciesId <> Guid.Empty Then
                dtoFieldValue.SpeciesId = speciesId
            End If

            If fieldGroupId <> Guid.Empty Then
                dtoFieldValue.FieldGroupId = fieldGroupId
            End If

        Next

        Return dtoFieldValueList

    End Function

    Private Function BuildFieldValueList(ByVal libFieldValueList As ProfilesLibrary.FieldValueList, ByVal questionId As Guid, ByVal questionNumber As Integer) As List(Of DataContracts.ProfileFieldValue)

        Dim dtoFieldValueList As New List(Of DataContracts.ProfileFieldValue)

        For Each libFieldValue As ProfilesLibrary.FieldValueBase In libFieldValueList

            If TypeOf (libFieldValue) Is ProfilesLibrary.BooleanFieldValue Then
                Dim libBooleanFieldValue As ProfilesLibrary.BooleanFieldValue = DirectCast(libFieldValue, ProfilesLibrary.BooleanFieldValue)

                If libBooleanFieldValue.FieldValue.HasValue Then
                    Dim dtoFieldValue As New DataContracts.ProfileFieldValue
                    BuildFieldValueCommon(dtoFieldValue, libFieldValue, questionId, questionNumber)
                    dtoFieldValue.BooleanValue = CBool(libBooleanFieldValue.FieldValue)
                    dtoFieldValueList.Add(dtoFieldValue)
                End If

            ElseIf TypeOf (libFieldValue) Is ProfilesLibrary.DateFieldValue Then
                Dim libDataFieldValue As ProfilesLibrary.DateFieldValue = DirectCast(libFieldValue, ProfilesLibrary.DateFieldValue)

                If libDataFieldValue.FieldValue.HasValue Then
                    Dim dtoFieldValue As New DataContracts.ProfileFieldValue
                    BuildFieldValueCommon(dtoFieldValue, libFieldValue, questionId, questionNumber)
                    dtoFieldValue.DateValue = CDate(libDataFieldValue.FieldValue)
                    dtoFieldValueList.Add(dtoFieldValue)
                End If

            ElseIf TypeOf (libFieldValue) Is ProfilesLibrary.DecimalFieldValue Then
                Dim libDecimalFieldValue As ProfilesLibrary.DecimalFieldValue = DirectCast(libFieldValue, ProfilesLibrary.DecimalFieldValue)

                If libDecimalFieldValue.FieldValue.HasValue Then
                    Dim dtoFieldValue As New DataContracts.ProfileFieldValue
                    BuildFieldValueCommon(dtoFieldValue, libFieldValue, questionId, questionNumber)
                    dtoFieldValue.DecimalValue = CDec(libDecimalFieldValue.FieldValue)
                    dtoFieldValueList.Add(dtoFieldValue)
                End If

            ElseIf TypeOf (libFieldValue) Is ProfilesLibrary.LongTextFieldValue Then
                Dim libLongTextFieldValue As ProfilesLibrary.LongTextFieldValue = DirectCast(libFieldValue, ProfilesLibrary.LongTextFieldValue)

                If libLongTextFieldValue.FieldValue <> String.Empty Then
                    Dim dtoFieldValue As New DataContracts.ProfileFieldValue
                    BuildFieldValueCommon(dtoFieldValue, libFieldValue, questionId, questionNumber)
                    dtoFieldValue.TextValue = libLongTextFieldValue.FieldValue
                    dtoFieldValueList.Add(dtoFieldValue)
                End If

            ElseIf TypeOf (libFieldValue) Is ProfilesLibrary.TextFieldValue Then
                Dim libTextFieldValue As ProfilesLibrary.TextFieldValue = DirectCast(libFieldValue, ProfilesLibrary.TextFieldValue)

                If libTextFieldValue.FieldValue <> String.Empty Then
                    Dim dtoFieldValue As New DataContracts.ProfileFieldValue
                    BuildFieldValueCommon(dtoFieldValue, libFieldValue, questionId, questionNumber)
                    dtoFieldValue.TextValue = libTextFieldValue.FieldValue
                    dtoFieldValueList.Add(dtoFieldValue)
                End If

            ElseIf TypeOf (libFieldValue) Is ProfilesLibrary.ListFieldValue Then
                Dim libListFieldValue As ProfilesLibrary.ListFieldValue = DirectCast(libFieldValue, ProfilesLibrary.ListFieldValue)

                If libListFieldValue.FieldValue <> Guid.Empty Then
                    Dim dtoFieldValue As New DataContracts.ProfileFieldValue
                    BuildFieldValueCommon(dtoFieldValue, libFieldValue, questionId, questionNumber)
                    dtoFieldValue.ListValue = libListFieldValue.FieldValue
                    dtoFieldValueList.Add(dtoFieldValue)
                End If

            ElseIf TypeOf (libFieldValue) Is ProfilesLibrary.FieldGroupFieldValue Then
                Dim libFieldGroupFieldValue As ProfilesLibrary.FieldGroupFieldValue = DirectCast(libFieldValue, ProfilesLibrary.FieldGroupFieldValue)

                For Each species As ProfilesLibrary.QuestionSpecies In libFieldGroupFieldValue.QuesSpecies
                    dtoFieldValueList.AddRange(BuildFieldValueList(species.FieldValues, questionId, questionNumber, Guid.Empty, species.Id, libFieldGroupFieldValue.Id))
                Next

            ElseIf TypeOf (libFieldValue) Is ProfilesLibrary.MultiValueListFieldValue Then
                Dim libMultiValueListFieldValue As ProfilesLibrary.MultiValueListFieldValue = DirectCast(libFieldValue, ProfilesLibrary.MultiValueListFieldValue)

                For Each listValue As Guid In libMultiValueListFieldValue.FieldValues
                    Dim dtoFieldValue As New DataContracts.ProfileFieldValue
                    dtoFieldValue.FieldNumber = libMultiValueListFieldValue.FieldNumber
                    dtoFieldValue.ListValue = listValue
                    dtoFieldValue.QuestionId = questionId
                    dtoFieldValue.QuestionNumber = questionNumber
                    dtoFieldValueList.Add(dtoFieldValue)
                Next

            ElseIf TypeOf (libFieldValue) Is ProfilesLibrary.ProfileVersionDataFieldValue Then
                Dim libProfileVersionDataFieldValue As ProfilesLibrary.ProfileVersionDataFieldValue = DirectCast(libFieldValue, ProfilesLibrary.ProfileVersionDataFieldValue)

                If libProfileVersionDataFieldValue.FieldValue = String.Empty Then
                    Dim dtoFieldValue As New DataContracts.ProfileFieldValue
                    BuildFieldValueCommon(dtoFieldValue, libFieldValue, questionId, questionNumber)
                    dtoFieldValue.TextValue = libProfileVersionDataFieldValue.FieldValue
                    dtoFieldValueList.Add(dtoFieldValue)
                End If
            Else
                '
            End If
        Next

        Return dtoFieldValueList

    End Function

    Private Sub BuildFieldValueCommon(ByVal dtoFieldValue As DataContracts.ProfileFieldValue, ByVal libFieldValue As ProfilesLibrary.FieldValueBase, ByVal questionId As Guid, ByVal questionNumber As Integer)

        dtoFieldValue.Id = libFieldValue.Id
        dtoFieldValue.FieldNumber = libFieldValue.FieldNumber
        dtoFieldValue.QuestionId = questionId
        dtoFieldValue.QuestionNumber = questionNumber

    End Sub


    Public Function GetSectionReviewFrequencies() As List(Of DataContracts.SectionReviewFrequency) Implements IProfileVersionDataService.GetSectionReviewFrequencies

        Dim returnList As New List(Of DataContracts.SectionReviewFrequency)
        Dim reviewFrequencyList As SectionReviewFrequencyList = SectionReviewFrequencyList.GetList()

        For Each reviewFrequency As Csla.NameValueListBase(Of Guid, String).NameValuePair In reviewFrequencyList
            returnList.Add(New DataContracts.SectionReviewFrequency() With {.Id = reviewFrequency.Key, .LookupValue = reviewFrequency.Value})
        Next

        Return returnList

    End Function

    Public Function GetSectionReviewStatusTypes() As List(Of DataContracts.SectionReviewStatusType) Implements IProfileVersionDataService.GetSectionReviewStatusTypes

        Dim returnList As New List(Of DataContracts.SectionReviewStatusType)
        Dim reviewStatusList As ReviewStatusTypeList = ReviewStatusTypeList.GetReviewStatusTypeList()

        For Each reviewStatus As ReviewStatusType In reviewStatusList

            Dim dtoSectionReviewStatusType As New DataContracts.SectionReviewStatusType
            dtoSectionReviewStatusType.Id = reviewStatus.Id
            dtoSectionReviewStatusType.Name = reviewStatus.Name
            returnList.Add(dtoSectionReviewStatusType)

        Next

        Return returnList

    End Function

    Public Function UpdateProfileVersionAnswerData(ByVal request As Contracts.DataContracts.ProfileAnswerDataChangeSet) As Contracts.DataContracts.ProfileAnswerDataChangeResult Implements Contracts.ServiceContracts.IProfileVersionDataService.UpdateProfileVersionAnswerData

        Dim changeResult As New DataContracts.ProfileAnswerDataChangeResult
        Dim libProfileVersionSection As ProfilesLibrary.ProfileVersionSection = ProfilesLibrary.ProfileVersionSection.GetProfileVersionSection(request.ProfileVersionId, request.ProfileSectionId)

        libProfileVersionSection.BeginEdit()

        If Not GlobalCommon.TimestampsEqual(libProfileVersionSection.LastUpdated, request.LastUpdated) Then
            Throw New ApplicationException("The profile version section has been modified by another user")
        End If

        Dim lastUpdated(7) As Byte
        Dim questionRowInsertDictionary As New Dictionary(Of Guid, Guid)
        Dim questionRowDeleteDictionary As New Dictionary(Of Guid, Guid)
        Dim questionRowInsertList As New List(Of Guid)

        With libProfileVersionSection
            .PolicyReviewFrequency = request.PolicyReviewFrequency
            .VAReviewFrequency = request.VAReviewFrequency
            .PolicyReviewStatusId = request.PolicyReviewStatusId
            .VAReviewStatusId = request.VAReviewStatusId
        End With

        For Each item As DataContracts.QuestionRowDelete In request.QuestionRowDeleteList
            Dim libRepeatingQuestion As ProfilesLibrary.RepeatingQuestion = DirectCast(libProfileVersionSection.Questions.GetById(item.QuestionId), RepeatingQuestion)
            Dim rowToDelete As ProfilesLibrary.QuestionRow = libRepeatingQuestion.RowList.GetById(item.Id)

            If rowToDelete IsNot Nothing Then
                libRepeatingQuestion.RowList.Remove(rowToDelete)
                questionRowDeleteDictionary.Add(item.Id, item.Id)
            End If
        Next

        For Each item As DataContracts.QuestionRow In request.QuestionRowInsertList
            Dim libRepeatingQuestion As ProfilesLibrary.RepeatingQuestion = DirectCast(libProfileVersionSection.Questions.GetById(item.ProfileQuestionId), RepeatingQuestion)
            Dim rowToInsert As ProfilesLibrary.QuestionRow = libRepeatingQuestion.RowList.AddNew()
            questionRowInsertDictionary.Add(item.Id, rowToInsert.Id)
            questionRowInsertList.Add(rowToInsert.Id)
        Next

        For Each item As DataContracts.QuestionRow In request.QuestionRowUpdateList
            Dim libRepeatingQuestion As ProfilesLibrary.RepeatingQuestion = DirectCast(libProfileVersionSection.Questions.GetById(item.ProfileQuestionId), RepeatingQuestion)
            Dim rowToUpdate As ProfilesLibrary.QuestionRow = libRepeatingQuestion.RowList.GetById(item.Id)
            If rowToUpdate Is Nothing Then
                Throw New ApplicationException("The profile version section has been modified by another user")
            End If

            rowToUpdate.SequenceNumber = item.SequenceNumber
        Next

        For Each item As DataContracts.ProfileFieldValueUpdate In request.FieldValueUpdateList
            Dim libQuestion As ProfilesLibrary.QuestionBase = libProfileVersionSection.Questions.GetById(item.QuestionId)

            If TypeOf (libQuestion) Is ProfilesLibrary.StandardQuestion Then
                Dim libStandardQuestion As ProfilesLibrary.StandardQuestion = DirectCast(libQuestion, ProfilesLibrary.StandardQuestion)
                Dim libFieldValue As ProfilesLibrary.FieldValueBase = libStandardQuestion.FieldValues.GetByFieldId(item.FieldId)
                UpdateFieldValue(libFieldValue, item)

            ElseIf TypeOf (libQuestion) Is ProfilesLibrary.PerSpeciesQuestion Then
                Dim libPerSpeciesQuestion As ProfilesLibrary.PerSpeciesQuestion = DirectCast(libQuestion, ProfilesLibrary.PerSpeciesQuestion)

                Dim libField As ProfilesLibrary.FieldValueBase = libPerSpeciesQuestion.SpeciesList.GetById(item.SpeciesId).FieldValues.GetByFieldId(item.FieldId)
                UpdateFieldValue(libField, item)

            ElseIf TypeOf (libQuestion) Is ProfilesLibrary.RepeatingQuestion Then
                Dim libRepeatingQuestion As ProfilesLibrary.RepeatingQuestion = DirectCast(libQuestion, ProfilesLibrary.RepeatingQuestion)

                If Not questionRowDeleteDictionary.ContainsKey(item.ProfileVersionQuestionRowId) Then
                    Dim rowId As Guid
                    If questionRowInsertDictionary.ContainsKey(item.ProfileVersionQuestionRowId) Then
                        rowId = questionRowInsertDictionary(item.ProfileVersionQuestionRowId)
                    Else
                        rowId = item.ProfileVersionQuestionRowId
                    End If

                    If item.SpeciesId.Equals(Guid.Empty) Then
                        Dim libField As ProfilesLibrary.FieldValueBase = libRepeatingQuestion.RowList.GetById(rowId).FieldValues.GetByFieldId(item.FieldId)
                        UpdateFieldValue(libField, item)
                    Else
                        Dim libRow As ProfilesLibrary.QuestionRow = libRepeatingQuestion.RowList.GetById(rowId)
                        Dim libFieldGroup As ProfilesLibrary.FieldGroupFieldValue = DirectCast(libRow.FieldValues.GetByFieldId(item.FieldGroupId), ProfilesLibrary.FieldGroupFieldValue)

                        Dim libField As ProfilesLibrary.FieldValueBase = libFieldGroup.QuesSpecies.GetById(item.SpeciesId).FieldValues.GetByFieldId(item.FieldId)
                        UpdateFieldValue(libField, item)
                    End If

                End If
            End If

        Next

        libProfileVersionSection.ApplyEdit()
        libProfileVersionSection.Save()

        changeResult.LastUpdated = libProfileVersionSection.LastUpdated
        changeResult.QuestionRowIdInsertList = questionRowInsertList

        Return changeResult

    End Function

    Private Sub UpdateFieldValue(ByVal libFieldValue As ProfilesLibrary.FieldValueBase, ByVal dtoFieldValue As DataContracts.ProfileFieldValueUpdate)

        If TypeOf (libFieldValue) Is ProfilesLibrary.BooleanFieldValue Then
            Dim libBooleanFieldValue As ProfilesLibrary.BooleanFieldValue = DirectCast(libFieldValue, ProfilesLibrary.BooleanFieldValue)
            If dtoFieldValue.ParameterName = "@BooleanValue" Then
                libBooleanFieldValue.FieldValue = dtoFieldValue.BooleanValue
            Else
                libBooleanFieldValue.FieldValue = Nothing
            End If
        ElseIf TypeOf (libFieldValue) Is ProfilesLibrary.DateFieldValue Then
            Dim libDateFieldValue As ProfilesLibrary.DateFieldValue = DirectCast(libFieldValue, ProfilesLibrary.DateFieldValue)
            If dtoFieldValue.ParameterName = "@DateValue" Then
                libDateFieldValue.FieldValue = dtoFieldValue.DateValue
            Else
                libDateFieldValue.FieldValue = Nothing
            End If
        ElseIf TypeOf (libFieldValue) Is ProfilesLibrary.DecimalFieldValue Then
            Dim libDecimalFieldValue As ProfilesLibrary.DecimalFieldValue = DirectCast(libFieldValue, ProfilesLibrary.DecimalFieldValue)
            If dtoFieldValue.ParameterName = "@DecimalValue" Then
                libDecimalFieldValue.FieldValue = dtoFieldValue.DecimalValue
            Else
                libDecimalFieldValue.FieldValue = Nothing
            End If
        ElseIf TypeOf (libFieldValue) Is ProfilesLibrary.ListFieldValue Then
            Dim libListFieldValue As ProfilesLibrary.ListFieldValue = DirectCast(libFieldValue, ProfilesLibrary.ListFieldValue)

            If dtoFieldValue.ParameterName = "@ListValue" Then
                libListFieldValue.FieldValue = dtoFieldValue.ListValue
            End If
        ElseIf TypeOf (libFieldValue) Is ProfilesLibrary.LongTextFieldValue Then
            Dim libLongTextFieldValue As ProfilesLibrary.LongTextFieldValue = DirectCast(libFieldValue, ProfilesLibrary.LongTextFieldValue)

            If dtoFieldValue.ParameterName = "@TextValue" Then
                libLongTextFieldValue.FieldValue = dtoFieldValue.TextValue
            End If
        ElseIf TypeOf (libFieldValue) Is ProfilesLibrary.TextFieldValue Then
            Dim libTextFieldValue As ProfilesLibrary.TextFieldValue = DirectCast(libFieldValue, ProfilesLibrary.TextFieldValue)

            If dtoFieldValue.ParameterName = "@TextValue" Then
                libTextFieldValue.FieldValue = dtoFieldValue.TextValue
            End If
        ElseIf TypeOf (libFieldValue) Is ProfilesLibrary.MultiValueListFieldValue Then
            Dim libMultiFieldValue As ProfilesLibrary.MultiValueListFieldValue = DirectCast(libFieldValue, ProfilesLibrary.MultiValueListFieldValue)

            If dtoFieldValue.ParameterName = "@MultiValue" Then
                libMultiFieldValue.ClearFieldValues()

                For Each id As Guid In dtoFieldValue.MultiValueList
                    libMultiFieldValue.AddFieldValue(id)
                Next

            End If

        End If


    End Sub


End Class
