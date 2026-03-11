Imports Profiles.Contracts
Imports Profiles.Contracts.ServiceContracts
Imports ProfilesLibrary

<ServiceBehavior(InstanceContextMode:=InstanceContextMode.PerCall)> _
<ErrorHandlerBehavior()> _
Public Class SpeciesDataService
    Implements ISpeciesDataService

    Public Function GetAllSpecies() As List(Of Contracts.DataContracts.SpeciesData) Implements Contracts.ServiceContracts.ISpeciesDataService.GetAllSpecies
        Dim speciesList As New List(Of DataContracts.SpeciesData)
        Dim speciesInfoList As SpeciesInfoList = speciesInfoList.GetList()

        speciesList.AddRange(FlattenSpeciesHierarchy(speciesInfoList))

        Return speciesList

    End Function

    Public Function FlattenSpeciesHierarchy(ByVal speciesInfoList As SpeciesInfoList) As List(Of DataContracts.SpeciesData)
        Dim speciesList As New List(Of DataContracts.SpeciesData)
        For Each currentSpeciesInfo As SpeciesInfo In speciesInfoList
            speciesList.Add(New DataContracts.SpeciesData() With { _
            .Id = currentSpeciesInfo.Id, _
            .ParentId = currentSpeciesInfo.ParentId, _
            .IsActive = currentSpeciesInfo.IsActive, _
            .IsInUse = currentSpeciesInfo.IsInUse, _
            .Description = currentSpeciesInfo.Description})
            If currentSpeciesInfo.ChildList.Count > 0 Then
                speciesList.AddRange(FlattenSpeciesHierarchy(currentSpeciesInfo.ChildList))
            End If
        Next
        Return speciesList
    End Function

    Public Function GetSpeciesMetadata() As System.Collections.Generic.List(Of Contracts.DataContracts.SpeciesSectionMetadata) Implements Contracts.ServiceContracts.ISpeciesDataService.GetSpeciesMetadata

        Dim libSectionMetadataList As ProfilesLibrary.SpeciesSectionMetadataList = SpeciesSectionMetadataList.GetSpeciesSectionMetadataList()

        Dim returnList As New List(Of DataContracts.SpeciesSectionMetadata)

        For Each libSectionMetadata As SpeciesSectionMetadata In libSectionMetadataList
            returnList.Add(BuildSpeciesSectionMetadata(libSectionMetadata))
        Next

        Return returnList

    End Function

    Private Function BuildSpeciesSectionMetadata(ByVal libSectionMetadata As ProfilesLibrary.SpeciesSectionMetadata) As DataContracts.SpeciesSectionMetadata

        Dim dtoSectionMetadata As DataContracts.SpeciesSectionMetadata = New DataContracts.SpeciesSectionMetadata()

        Dim dtoQuestionMetadataList As New List(Of DataContracts.QuestionMetadata)

        With dtoSectionMetadata
            .Id = libSectionMetadata.Id
            .Name = libSectionMetadata.Name
            .SectionNumber = libSectionMetadata.SectionNumber
            .ShortName = libSectionMetadata.ShortName
        End With

        For Each libQuestionMetadata As ProfilesLibrary.SpeciesQuestionMetadata In libSectionMetadata.QuestionMetadataList
            dtoQuestionMetadataList.Add(BuildSpeciesQuestionMetadata(libQuestionMetadata))
        Next

        dtoSectionMetadata.QuestionMetadataList = dtoQuestionMetadataList

        Return dtoSectionMetadata

    End Function

    Private Function BuildSpeciesQuestionMetadata(ByVal libQuestionMetadata As ProfilesLibrary.SpeciesQuestionMetadata) As DataContracts.SpeciesQuestionMetadata

        Dim dtoQuestionMetadata As DataContracts.SpeciesQuestionMetadata = New DataContracts.SpeciesQuestionMetadata()

        Dim dtoFieldMetadataList As New List(Of DataContracts.FieldMetadata)

        With dtoQuestionMetadata
            .Id = libQuestionMetadata.Id
            .Name = libQuestionMetadata.Name
            .ShortName = libQuestionMetadata.ShortName
            .NonTechnicalName = libQuestionMetadata.NonTechnicalName
            .QuestionNumber = libQuestionMetadata.QuestionNumber
        End With

        For Each libFieldMetadata As ProfilesLibrary.SpeciesFieldMetadata In libQuestionMetadata.FieldMetadataList
            dtoFieldMetadataList.Add(BuildSpeciesFieldMetadata(libFieldMetadata))
        Next

        dtoQuestionMetadata.FieldMetadataList = dtoFieldMetadataList

        Return dtoQuestionMetadata

    End Function

    Private Function BuildSpeciesFieldMetadata(ByVal libFieldMetadata As ProfilesLibrary.SpeciesFieldMetadata) As DataContracts.SpeciesFieldMetadata

        Dim dtoFieldMetadata As DataContracts.SpeciesFieldMetadata = New DataContracts.SpeciesFieldMetadata()

        With dtoFieldMetadata
            .Id = libFieldMetadata.Id
            .ShortName = libFieldMetadata.ShortName
            .FieldNumber = libFieldMetadata.FieldNumber
            .ReferenceTableId = libFieldMetadata.ReferenceTableId
            .ReferenceTableIsMaintainable = libFieldMetadata.ReferenceTableIsMaintainable
            .IncludeInSummary = libFieldMetadata.IncludeInSummary
            .DataFieldTypeId = libFieldMetadata.DataFieldTypeId
            .DataTypeName = libFieldMetadata.DataTypeName
            .IsMandatory = libFieldMetadata.IsMandatory
            .Name = libFieldMetadata.Name
            .EditorFieldType = libFieldMetadata.EditorFieldType
            .RelevanceFieldId = libFieldMetadata.RelevanceFieldId
            .RelevanceValueId = libFieldMetadata.RelevanceValueId
            .AffectsVisibility = libFieldMetadata.AffectsVisibility
            .SourceOfDataReplication = libFieldMetadata.SourceOfDataReplication

            .TargetFieldList = libFieldMetadata.TargetFieldList
        End With

        Return dtoFieldMetadata

    End Function

    Public Function GetSpeciesAnswerData(ByVal request As Contracts.DataContracts.GetSpeciesAnswerDataRequest) As Contracts.DataContracts.SpeciesAnswerData Implements Contracts.ServiceContracts.ISpeciesDataService.GetSpeciesAnswerData

        Dim libSpeciesSectionList As ProfilesLibrary.SpeciesSectionList = ProfilesLibrary.SpeciesSectionList.GetSpeciesSectionList(request.SpeciesId)

        Dim dtoAnswerData As New DataContracts.SpeciesAnswerData

        dtoAnswerData.SpeciesId = request.SpeciesId
        dtoAnswerData.SpeciesName = libSpeciesSectionList.SpeciesName
        dtoAnswerData.LastUpdated = libSpeciesSectionList.LastUpdated

        Dim dtoSpeciesSectionList As New List(Of DataContracts.SpeciesSection)

        For Each libSpeciesSection As ProfilesLibrary.SpeciesSection In libSpeciesSectionList
            dtoSpeciesSectionList.Add(BuildSpeciesSectionAnswerData(libSpeciesSection))
        Next

        dtoAnswerData.SpeciesSectionList = dtoSpeciesSectionList

        Return dtoAnswerData

    End Function

    Private Function BuildSpeciesSectionAnswerData(ByVal libSpeciesSection As ProfilesLibrary.SpeciesSection) As DataContracts.SpeciesSection

        Dim dtoSpeciesSection As New DataContracts.SpeciesSection

        dtoSpeciesSection.SectionId = libSpeciesSection.SectionId

        Dim dtoFieldValueList As New List(Of DataContracts.SpeciesFieldValue)
        For Each libQuestion As ProfilesLibrary.QuestionBase In libSpeciesSection.Questions

            Dim libStandardQuestion As ProfilesLibrary.StandardQuestion = TryCast(libQuestion, StandardQuestion)
            If libStandardQuestion IsNot Nothing Then
                dtoFieldValueList.AddRange(BuildFieldValueList(libStandardQuestion.FieldValues, libStandardQuestion.Id, libStandardQuestion.QuestionNumber))
            End If
        Next

        dtoSpeciesSection.FieldValueList = dtoFieldValueList

        Return dtoSpeciesSection

    End Function

    Private Function BuildFieldValueList(ByVal libFieldValueList As ProfilesLibrary.FieldValueList, ByVal questionId As Guid, ByVal questionNumber As Integer) As List(Of DataContracts.SpeciesFieldValue)

        Dim dtoFieldValueList As New List(Of DataContracts.SpeciesFieldValue)

        For Each libFieldValue As ProfilesLibrary.FieldValueBase In libFieldValueList

            If TypeOf (libFieldValue) Is ProfilesLibrary.BooleanFieldValue Then
                Dim libBooleanFieldValue As ProfilesLibrary.BooleanFieldValue = DirectCast(libFieldValue, ProfilesLibrary.BooleanFieldValue)

                If libBooleanFieldValue.FieldValue.HasValue Then
                    Dim dtoFieldValue As New DataContracts.SpeciesFieldValue
                    BuildFieldValueCommon(dtoFieldValue, libFieldValue, questionId, questionNumber)
                    dtoFieldValue.BooleanValue = CBool(libBooleanFieldValue.FieldValue)
                    dtoFieldValueList.Add(dtoFieldValue)
                End If

            ElseIf TypeOf (libFieldValue) Is ProfilesLibrary.ListFieldValue Then
                Dim libListFieldValue As ProfilesLibrary.ListFieldValue = DirectCast(libFieldValue, ProfilesLibrary.ListFieldValue)

                If libListFieldValue.FieldValue <> Guid.Empty Then
                    Dim dtoFieldValue As New DataContracts.SpeciesFieldValue
                    BuildFieldValueCommon(dtoFieldValue, libFieldValue, questionId, questionNumber)
                    dtoFieldValue.ListValue = libListFieldValue.FieldValue
                    dtoFieldValueList.Add(dtoFieldValue)
                End If

            ElseIf TypeOf (libFieldValue) Is ProfilesLibrary.TextFieldValue Then
                Dim libTextFieldValue As ProfilesLibrary.TextFieldValue = DirectCast(libFieldValue, ProfilesLibrary.TextFieldValue)

                If libTextFieldValue.FieldValue <> String.Empty Then
                    Dim dtoFieldValue As New DataContracts.SpeciesFieldValue
                    BuildFieldValueCommon(dtoFieldValue, libFieldValue, questionId, questionNumber)
                    dtoFieldValue.TextValue = libTextFieldValue.FieldValue
                    dtoFieldValueList.Add(dtoFieldValue)
                End If

            ElseIf TypeOf (libFieldValue) Is ProfilesLibrary.LongTextFieldValue Then
                Dim libLongTextFieldValue As ProfilesLibrary.LongTextFieldValue = DirectCast(libFieldValue, ProfilesLibrary.LongTextFieldValue)

                If libLongTextFieldValue.FieldValue <> String.Empty Then
                    Dim dtoFieldValue As New DataContracts.SpeciesFieldValue
                    BuildFieldValueCommon(dtoFieldValue, libFieldValue, questionId, questionNumber)
                    dtoFieldValue.TextValue = libLongTextFieldValue.FieldValue
                    dtoFieldValueList.Add(dtoFieldValue)
                End If

            ElseIf TypeOf (libFieldValue) Is ProfilesLibrary.MultiValueListFieldValue Then
                Dim libMultiValueListFieldValue As ProfilesLibrary.MultiValueListFieldValue = DirectCast(libFieldValue, ProfilesLibrary.MultiValueListFieldValue)

                For Each listValue As Guid In libMultiValueListFieldValue.FieldValues
                    Dim dtoFieldValue As New DataContracts.SpeciesFieldValue
                    dtoFieldValue.FieldNumber = libMultiValueListFieldValue.FieldNumber
                    dtoFieldValue.ListValue = listValue
                    dtoFieldValue.QuestionId = questionId
                    dtoFieldValue.QuestionNumber = questionNumber
                    dtoFieldValueList.Add(dtoFieldValue)
                Next

            Else
                '
            End If

        Next

        Return dtoFieldValueList

    End Function

    Private Sub BuildFieldValueCommon(ByVal dtoFieldValue As DataContracts.SpeciesFieldValue, ByVal libFieldValue As ProfilesLibrary.FieldValueBase, ByVal questionId As Guid, ByVal questionNumber As Integer)

        dtoFieldValue.Id = libFieldValue.Id
        dtoFieldValue.FieldNumber = libFieldValue.FieldNumber
        dtoFieldValue.QuestionId = questionId
        dtoFieldValue.QuestionNumber = questionNumber

    End Sub

    Public Function UpdateSpeciesAnswerData(ByVal request As Contracts.DataContracts.SpeciesAnswerDataChangeSet) As Contracts.DataContracts.SpeciesAnswerDataChangeResult Implements Contracts.ServiceContracts.ISpeciesDataService.UpdateSpeciesAnswerData
        Throw New InvalidOperationException("You cannot update the species answer data via the web service.")
    End Function

    Public Function GetAllSelectedSpecies(ByVal request As String) As List(Of Contracts.DataContracts.SpeciesData) Implements Contracts.ServiceContracts.ISpeciesDataService.GetAllSelectedSpecies
        Dim speciesList As New List(Of DataContracts.SpeciesData)
        Dim speciesInfoList As SpeciesInfoList = speciesInfoList.GetList()

        speciesList.AddRange(FlattenSpeciesHierarchy(speciesInfoList))

        Return speciesList

    End Function

End Class
