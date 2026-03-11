Imports Profiles.Contracts
Imports Profiles.Contracts.ServiceContracts
Imports ProfilesLibrary

<ServiceBehavior(InstanceContextMode:=InstanceContextMode.PerCall)>
<ErrorHandlerBehavior()>
Public Class ProfileSearchService
    Implements IProfileSearchService

    Public Function GetAllProfiles(ByVal request As DataContracts.GetAllProfilesRequest) As List(Of DataContracts.ProfileSearchProfileInfo) Implements IProfileSearchService.GetAllProfiles

        Dim profileInfoList As ProfileInfoList = ProfileInfoList.GetProfileInfoList(request.ReturnQuestionAnswers, request.ReturnNotes, request.SearchWords, request.PerformSqlWordSearch, request.SectionSelection)
        Dim returnList As New List(Of DataContracts.ProfileSearchProfileInfo)

        For Each profileInfo As ProfileInfo In profileInfoList
            returnList.Add(BuildProfileSearchProfileInfo(profileInfo))
        Next

        Return returnList

    End Function

    Private Function BuildProfileSearchProfileInfo(ByVal profileInfo As ProfileInfo) As DataContracts.ProfileSearchProfileInfo
        Dim scenarioList As New List(Of DataContracts.ProfileSearchProfileScenarioInfo)

        Dim profileSearchProfileInfo As New DataContracts.ProfileSearchProfileInfo() With
        {
        .Id = profileInfo.Id,
        .Title = profileInfo.Title
        }

        Dim profileScenarioInfoList As ProfileScenarioInfoList = profileInfo.GetScenarios()
        For Each scenarioInfo As ProfileScenarioInfo In profileScenarioInfoList
            scenarioList.Add(BuildProfileSearchProfileScenarioInfo(scenarioInfo))
        Next
        profileSearchProfileInfo.ProfileScenarios = scenarioList

        Return profileSearchProfileInfo

    End Function

    Private Function BuildProfileSearchProfileScenarioInfo(ByVal scenarioInfo As ProfileScenarioInfo) As DataContracts.ProfileSearchProfileScenarioInfo
        Dim profileVersionsList As New List(Of DataContracts.ProfileSearchProfileVersionSummaryInfo)

		Dim profileSearchProfileScenarioInfo As New DataContracts.ProfileSearchProfileScenarioInfo() With
		{
		.Id = scenarioInfo.Id,
		.ProfileId = scenarioInfo.ProfileId,
		.ScenarioTitle = scenarioInfo.ScenarioTitle,
		.ProfileStatus = scenarioInfo.ProfileStatus,
		.NextReviewDate = scenarioInfo.NextReviewDate.Date,
		.ReviewIncomplete = scenarioInfo.ReviewIncomplete,
		.UserRole = scenarioInfo.UserRole
		}

		Dim profileVersionSummaryInfoList As ProfileVersionSummaryInfoList = scenarioInfo.GetAllVersions()
		For Each versionSummaryInfo As ProfileVersionSummaryInfo In profileVersionSummaryInfoList
			profileVersionsList.Add(BuildProfileSearchProfileVersionSummaryInfo(versionSummaryInfo))
		Next
		profileSearchProfileScenarioInfo.ProfileVersions = profileVersionsList

		Return profileSearchProfileScenarioInfo

	End Function

	Private Function BuildProfileSearchProfileVersionSummaryInfo(ByVal versionSummaryInfo As ProfileVersionSummaryInfo) As DataContracts.ProfileSearchProfileVersionSummaryInfo
		Dim profileSearchProfileVersionSummaryInfo As New DataContracts.ProfileSearchProfileVersionSummaryInfo() With
		{
		.Id = versionSummaryInfo.Id,
		.ScenarioId = versionSummaryInfo.ScenarioId,
		.ProfileId = versionSummaryInfo.ProfileId,
		.IsPublic = versionSummaryInfo.IsPublic,
		.IsPublished = (versionSummaryInfo.Status = ProfileVersionStatus.Published),
		.EffectiveDateFrom = versionSummaryInfo.EffectiveDateFrom,
		.EffectiveDateTo = versionSummaryInfo.EffectiveDateTo,
		.VersionMajor = versionSummaryInfo.VersionMajor,
		.VersionMinor = versionSummaryInfo.VersionMinor,
		.AffectedSpecies = BuildProfileSearchAffectedSpeciesList(versionSummaryInfo.AffectedSpeciesList),
		.Answers = BuildProfileSearchAnswers(versionSummaryInfo.Answers),
		.Notes = BuildProfileSearchNotes(versionSummaryInfo.Notes),
		.LastContributionDate = versionSummaryInfo.LastContributionDate
		}

		Return profileSearchProfileVersionSummaryInfo

	End Function

    Private Function BuildProfileSearchAffectedSpeciesList(ByVal speciesInfoList As List(Of ProfileVersionAffectedSpecies)) As List(Of DataContracts.ProfileSearchProfileAffectedSpecies)
        Dim speciesList As New List(Of DataContracts.ProfileSearchProfileAffectedSpecies)
        For Each species As ProfileVersionAffectedSpecies In speciesInfoList
            speciesList.Add(New DataContracts.ProfileSearchProfileAffectedSpecies() With
                            {
                            .ProfileId = species.ProfileId,
                            .ScenarioId = species.ScenarioId,
                            .ProfileVersionId = species.ProfileVersionId,
                            .SpeciesId = species.SpeciesId,
                            .Type = species.Type,
                            .Name = species.Name,
                            .IsActive = species.IsActive
                            })
        Next
        Return speciesList
    End Function

    Private Function BuildProfileSearchAnswers(ByVal answerInfoList As List(Of ProfileVersionAnswer)) As List(Of DataContracts.ProfileSearchProfileAnswer)
        Dim answerList As New List(Of DataContracts.ProfileSearchProfileAnswer)
        For Each answer As ProfileVersionAnswer In answerInfoList
            answerList.Add(New DataContracts.ProfileSearchProfileAnswer() With
                            {
                            .AnswerId = answer.Id,
                            .ProfileVersionId = answer.ProfileVersionId,
                            .ScenarioId = answer.ScenarioId,
                            .ProfileId = answer.ProfileId,
                            .SectionNumber = answer.SectionNumber,
                            .QuestionNumber = answer.QuestionNumber,
                            .Answer = answer.Answer,
                            .QuestionShortName = answer.QuestionShortName,
                            .Guidance = answer.Guidance
                            })
        Next
        Return answerList
    End Function

    Private Function BuildProfileSearchNotes(ByVal noteInfoList As List(Of ProfileVersionNote)) As List(Of DataContracts.ProfileSearchProfileNote)
        Dim noteList As New List(Of DataContracts.ProfileSearchProfileNote)
        For Each note As ProfileVersionNote In noteInfoList
            noteList.Add(New DataContracts.ProfileSearchProfileNote() With
                            {
                             .NoteId = note.Id,
                             .ProfileVersionId = note.ProfileVersionId,
                             .ScenarioId = note.ScenarioId,
                             .ProfileId = note.ProfileId,
                             .Note = note.Note,
                             .IsReference = note.IsReference,
                             .NoteType = note.NoteType
                            })
        Next
        Return noteList
    End Function

    Public Function GetProfileVersion(ByVal request As DataContracts.GetProfileVersionRequest) As DataContracts.ProfileSearchProfileVersionInfo Implements IProfileSearchService.GetProfileVersion
        Dim profileVersion As ProfileVersionInfo = ProfileVersionInfo.GetProfileVersionInfo(request.ProfileVersionId)

        Return BuildProfileVersion(profileVersion)

    End Function

    Public Function GetPublicProfileHistory(ByVal request As DataContracts.GetPublicProfileHistoryRequest) As List(Of DataContracts.ProfileSearchProfileVersionInfo) Implements ServiceContracts.IProfileSearchService.GetPublicProfileHistory
        Dim profileVersions As ProfileVersionInfoList = ProfileVersionInfoList.GetPublicHistory(request.ProfileId)

        Dim profileSearchProfileVersionInfoList As New List(Of DataContracts.ProfileSearchProfileVersionInfo)

        For Each profileVersion As ProfileVersionInfo In profileVersions
            profileSearchProfileVersionInfoList.Add(BuildProfileVersion(profileVersion))
        Next

        Return profileSearchProfileVersionInfoList

    End Function

    Public Function GetDraftProfileHistory(ByVal request As Contracts.DataContracts.GetDraftProfileHistoryRequest) As List(Of Contracts.DataContracts.ProfileSearchProfileVersionInfo) Implements Contracts.ServiceContracts.IProfileSearchService.GetDraftProfileHistory
        Throw New InvalidOperationException("You cannot get a draft profile history via the web service.")
    End Function

    Public Function GetPublishedProfileHistory(ByVal request As Contracts.DataContracts.GetPublishedProfileHistoryRequest) As List(Of Contracts.DataContracts.ProfileSearchProfileVersionInfo) Implements Contracts.ServiceContracts.IProfileSearchService.GetPublishedProfileHistory
        Throw New InvalidOperationException("You cannot get a published profile history via the web service.")
    End Function

    Public Function GetCurrentPublicCurrentSituation() As List(Of Contracts.DataContracts.ProfileSearchProfileVersionInfo) Implements Contracts.ServiceContracts.IProfileSearchService.GetCurrentPublicCurrentSituation
        Dim profileVersions As ProfileVersionInfoList = ProfileVersionInfoList.GetCurrentPublicCurrentSituation()

        Dim profileSearchProfileVersionInfoList As New List(Of DataContracts.ProfileSearchProfileVersionInfo)

        For Each profileVersion As ProfileVersionInfo In profileVersions
            profileSearchProfileVersionInfoList.Add(BuildProfileVersion(profileVersion))
        Next

        Return profileSearchProfileVersionInfoList
    End Function

    Public Function GetCurrentPublicWhatIfScenario(ByVal request As Contracts.DataContracts.GetCurrentPublicWhatIfScenarioRequest) As List(Of Contracts.DataContracts.ProfileSearchProfileVersionInfo) Implements Contracts.ServiceContracts.IProfileSearchService.GetCurrentPublicWhatIfScenario
        Dim profileVersions As ProfileVersionInfoList = ProfileVersionInfoList.GetCurrentPublicWhatIfScenario(request.ParentProfileId)

        Dim profileSearchProfileVersionInfoList As New List(Of DataContracts.ProfileSearchProfileVersionInfo)

        For Each profileVersion As ProfileVersionInfo In profileVersions
            profileSearchProfileVersionInfoList.Add(BuildProfileVersion(profileVersion))
        Next

        Return profileSearchProfileVersionInfoList
    End Function

    Private Function BuildProfileVersion(ByVal profileVersion As ProfileVersionInfo) As DataContracts.ProfileSearchProfileVersionInfo

        Return New DataContracts.ProfileSearchProfileVersionInfo() With
            {
            .Id = profileVersion.Id,
            .ProfileId = profileVersion.ProfileId,
            .ParentProfileId = profileVersion.ParentProfileId,
            .Title = profileVersion.Title,
            .ScenarioTitle = profileVersion.ScenarioTitle,
            .ProfiledSpecies = profileVersion.ProfiledSpecies,
            .ProfiledSpeciesCount = profileVersion.ProfiledSpeciesCount,
            .OtherAffectedSpecies = profileVersion.OtherAffectedSpecies,
            .OtherAffectedSpeciesCount = profileVersion.OtherAffectedSpeciesCount,
            .VersionMajor = profileVersion.VersionMajor,
            .VersionMinor = profileVersion.VersionMinor,
            .IsPublished = (profileVersion.Status = ProfileVersionStatus.Published),
            .EffectiveDateFrom = profileVersion.EffectiveDateFrom,
            .EffectiveDateTo = profileVersion.EffectiveDateTo,
            .IsLatestVersion = profileVersion.IsLatestVersion,
            .IsPublic = profileVersion.IsPublic,
            .ProfileStatusId = profileVersion.ProfileStatusId,
            .ProfileStatusName = profileVersion.ProfileStatusName,
            .HasRelevantPublicScenarios = profileVersion.HasRelevantPublicScenarios
            }

    End Function

End Class
