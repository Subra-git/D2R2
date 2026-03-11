Imports Profiles.Contracts.ServiceContracts
Imports Profiles.Contracts.DataContracts
Imports System.Data.SqlClient
Imports Profiles.DataAccess.Sql.Data

Public Class ProfileSearchService
    Implements IProfileSearchService

    Public Function GetAllProfiles(ByVal request As GetAllProfilesRequest) As List(Of ProfileSearchProfileInfo) Implements IProfileSearchService.GetAllProfiles

        Dim profileDictionary As New Dictionary(Of Guid, ProfileSearchProfileInfo)
        Dim scenarioDictionary As New Dictionary(Of Guid, ProfileSearchProfileScenarioInfo)
        Dim versionSummaryDictionary As New Dictionary(Of Guid, ProfileSearchProfileVersionSummaryInfo)

        Dim sqlRequest = DirectCast(request, GetAllProfilesRequest)

        Dim commaSeparatedList As String = ""

        If request.SectionSelection IsNot Nothing Then
            commaSeparatedList = String.Join(",", request.SectionSelection.[Select](Function(i) i.ToString()).ToArray())
        End If

        ' load values
        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgaProfile"

                getCommand.Parameters.AddWithValue("@UserId", sqlRequest.UserId)
                getCommand.Parameters.AddWithValue("@ReturnQuestionAnswers", sqlRequest.ReturnQuestionAnswers)
                getCommand.Parameters.AddWithValue("@ReturnNotes", sqlRequest.ReturnNotes)
                getCommand.Parameters.AddWithValue("@Words", sqlRequest.SearchWords)
                getCommand.Parameters.AddWithValue("@PerformSqlSearch", sqlRequest.PerformSqlWordSearch)
                getCommand.Parameters.AddWithValue("@SectionSelection", commaSeparatedList)

                Using reader As New SafeDataReader(getCommand.ExecuteReader())
                    While reader.Read
                        Dim profile As New ProfileSearchProfileInfo With {
                        .Id = reader.GetGuid(0),
                        .Title = reader.GetString(1),
                        .ProfileScenarios = New List(Of ProfileSearchProfileScenarioInfo)}
                        profileDictionary.Add(profile.Id, profile)
                    End While

                    If reader.NextResult Then
                        While reader.Read()
                            Dim scenario As New ProfileSearchProfileScenarioInfo With {
                            .Id = reader.GetGuid(0),
                            .ProfileId = reader.GetGuid(1),
                            .ScenarioTitle = reader.GetString(2),
                            .UserRole = reader.GetString(3),
                            .ProfileVersions = New List(Of ProfileSearchProfileVersionSummaryInfo),
                            .ProfileStatus = reader.GetString(4)}
                            scenarioDictionary.Add(scenario.Id, scenario)
                        End While
                    End If

                    If reader.NextResult Then
                        While reader.Read()
							Dim profileVersion As New ProfileSearchProfileVersionSummaryInfo With {
							.Id = reader.GetGuid(0),
							.ScenarioId = reader.GetGuid(1),
							.ProfileId = reader.GetGuid(2),
							.VersionMajor = reader.GetByte(3),
							.VersionMinor = reader.GetByte(4),
							.IsPublished = (reader.GetString(5) = "Published"),
							.EffectiveDateFrom = reader.GetDateTime(6),
							.EffectiveDateTo = reader.GetDateTime(7),
							.IsPublic = reader.GetBoolean(8),
							.LastContributionDate = reader.GetDateTime(9),
							.AffectedSpecies = New List(Of ProfileSearchProfileAffectedSpecies),
							.Answers = New List(Of ProfileSearchProfileAnswer),
							.Notes = New List(Of ProfileSearchProfileNote)}
							versionSummaryDictionary.Add(profileVersion.Id, profileVersion)
						End While
                    End If

                    If reader.NextResult Then
                        While reader.Read()
                            Dim affectedSpecie As New ProfileSearchProfileAffectedSpecies With {
                            .ProfileVersionId = reader.GetGuid(0),
                            .ScenarioId = reader.GetGuid(1),
                            .ProfileId = reader.GetGuid(2),
                            .Name = reader.GetString(3),
                            .SpeciesId = reader.GetGuid(4),
                            .Type = reader.GetString(5),
                            .IsActive = reader.GetBoolean(6)}
                            versionSummaryDictionary(affectedSpecie.ProfileVersionId).AffectedSpecies.Add(affectedSpecie)
                        End While
                    End If

                    If reader.NextResult Then
                        While reader.Read()

                            Dim scenarioId As Guid = reader.GetGuid(1)
                            Dim nextVAReviewDate As DateTime?

                            If Not reader.GetValue(4) Is DBNull.Value Then
                                nextVAReviewDate = reader.GetDateTime(4)
                            End If

                            Dim dtoScenario As ProfileSearchProfileScenarioInfo = scenarioDictionary(scenarioId)
                            dtoScenario.NextReviewDate = nextVAReviewDate

                        End While
                    End If

                    If reader.NextResult() Then
                        While reader.Read()

                            Dim scenarioId As Guid = reader.GetGuid(1)
                            Dim nextPolicyReviewDate As DateTime?

                            If Not reader.GetValue(4) Is DBNull.Value Then
                                nextPolicyReviewDate = reader.GetDateTime(4)
                            End If

                            Dim dtoScenario As ProfileSearchProfileScenarioInfo = scenarioDictionary(scenarioId)
                            dtoScenario.NextReviewDate = GetEarliestDate(dtoScenario.NextReviewDate, nextPolicyReviewDate)

                        End While
                    End If

                    If reader.NextResult() Then
                        While reader.Read()
                            Dim scenarioId As Guid = reader.GetGuid(1)
                            Dim dtoScenario As ProfileSearchProfileScenarioInfo = scenarioDictionary(scenarioId)
                            dtoScenario.ReviewIncomplete = True
                        End While
                    End If

                    If reader.NextResult() Then
                        While reader.Read()
                            Dim scenarioId As Guid = reader.GetGuid(1)
                            Dim dtoScenario As ProfileSearchProfileScenarioInfo = scenarioDictionary(scenarioId)
                            dtoScenario.ReviewIncomplete = True
                        End While
                    End If

                    If reader.NextResult() Then
                        While reader.Read()
                            Dim answer As New ProfileSearchProfileAnswer With {
                            .AnswerId = reader.GetGuid(0),
                            .ProfileVersionId = reader.GetGuid(1),
                            .ScenarioId = reader.GetGuid(2),
                            .ProfileId = reader.GetGuid(3),
                            .SectionNumber = reader.GetInt32(4),
                            .QuestionNumber = reader.GetInt32(5),
                            .Answer = reader.GetString(6),
                            .QuestionShortName = reader.GetString(7),
                            .Guidance = reader.GetString(8)}
                            versionSummaryDictionary(answer.ProfileVersionId).Answers.Add(answer)
                        End While
                    End If

                    If reader.NextResult() Then
                        While reader.Read()
                            Dim note As New ProfileSearchProfileNote With {
                            .NoteId = reader.GetGuid(0),
                            .ProfileVersionId = reader.GetGuid(1),
                            .ScenarioId = reader.GetGuid(2),
                            .ProfileId = reader.GetGuid(3),
                            .Note = reader.GetString(4),
                            .IsReference = reader.GetBoolean(5),
                            .NoteType = reader.GetString(6)}
                            versionSummaryDictionary(note.ProfileVersionId).Notes.Add(note)
                        End While
                    End If

                End Using
            End Using
        End Using

        For Each profileVersion As ProfileSearchProfileVersionSummaryInfo In versionSummaryDictionary.Values
            scenarioDictionary(profileVersion.ScenarioId).ProfileVersions.Add(profileVersion)
        Next

        For Each scenarioInfo As ProfileSearchProfileScenarioInfo In scenarioDictionary.Values
            profileDictionary(scenarioInfo.ProfileId).ProfileScenarios.Add(scenarioInfo)
        Next

        Return profileDictionary.Values.ToList()

    End Function

    Private Function GetEarliestDate(ByVal firstDate As DateTime?, ByVal secondDate As DateTime?) As DateTime?

        If firstDate.HasValue AndAlso Not secondDate.HasValue Then
            Return firstDate
        End If

        If secondDate.HasValue AndAlso Not firstDate.HasValue Then
            Return secondDate
        End If

        If Not firstDate.HasValue AndAlso Not secondDate.HasValue Then
            Return Nothing
        End If

        If firstDate = secondDate Then
            Return firstDate
        End If

        If firstDate < secondDate Then
            Return firstDate
        Else
            Return secondDate
        End If

        Return Nothing

    End Function

    Public Function GetProfileVersion(ByVal request As GetProfileVersionRequest) As ProfileSearchProfileVersionInfo Implements IProfileSearchService.GetProfileVersion

        Dim profileVersion As New ProfileSearchProfileVersionInfo()

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgProfileVersionInfoById"
                getCommand.Parameters.AddWithValue("@Id", request.ProfileVersionId)

                Using reader As New SafeDataReader(getCommand.ExecuteReader)
                    While reader.Read()
                        profileVersion.Id = reader.GetGuid(0)
                        profileVersion.ProfileId = reader.GetGuid(1)
                        profileVersion.Title = reader.GetString(2)
                        profileVersion.VersionMajor = reader.GetByte(3)
                        profileVersion.VersionMinor = reader.GetByte(4)
                        profileVersion.IsPublished = (reader.GetString(5) = "Published")
                        profileVersion.EffectiveDateFrom = reader.GetDateTime(6)
                        profileVersion.EffectiveDateTo = reader.GetDateTime(7)
                        profileVersion.IsLatestVersion = reader.GetBoolean(8)
                        profileVersion.ScenarioTitle = reader.GetString(9)
                        profileVersion.ParentProfileId = reader.GetGuid(10)
                        profileVersion.IsPublic = reader.GetBoolean(11)
                        profileVersion.HasRelevantPublicScenarios = False
                        profileVersion.ProfileStatusId = reader.GetGuid(12)
                        profileVersion.ProfileStatusName = reader.GetString(13)
                    End While
                    If reader.NextResult() Then
                        While reader.Read()
                            Dim species As String = reader.GetString(1)
                            Dim isActive As Boolean = reader.GetBoolean(3)

                            If reader.GetString(2) = "Profiled" Then
                                If profileVersion.ProfiledSpecies.Length > 0 Then
                                    profileVersion.ProfiledSpecies &= ", "
                                End If

                                profileVersion.ProfiledSpecies &= species
                                If Not isActive Then
                                    profileVersion.ProfiledSpecies &= " (inactive)"
                                End If
                                profileVersion.ProfiledSpeciesCount += 1
                            Else
                                If profileVersion.OtherAffectedSpecies.Length > 0 Then
                                    profileVersion.OtherAffectedSpecies &= ", "
                                End If

                                profileVersion.OtherAffectedSpecies &= species
                                If Not isActive Then
                                    profileVersion.OtherAffectedSpecies &= " (inactive)"
                                End If
                                profileVersion.OtherAffectedSpeciesCount += 1
                            End If
                        End While
                    End If
                End Using
            End Using
        End Using

        Return profileVersion
    End Function

    Public Function GetDraftProfileHistory(ByVal request As GetDraftProfileHistoryRequest) As List(Of ProfileSearchProfileVersionInfo) Implements IProfileSearchService.GetDraftProfileHistory
        Return GetProfileHistory(request.ProfileId, False, False)
    End Function

    Public Function GetPublicProfileHistory(ByVal request As GetPublicProfileHistoryRequest) As List(Of ProfileSearchProfileVersionInfo) Implements IProfileSearchService.GetPublicProfileHistory
        Return GetProfileHistory(request.ProfileId, True, True)
    End Function

    Public Function GetPublishedProfileHistory(ByVal request As GetPublishedProfileHistoryRequest) As List(Of ProfileSearchProfileVersionInfo) Implements IProfileSearchService.GetPublishedProfileHistory
        Return GetProfileHistory(request.ProfileId, True, False)
    End Function

    Private Function GetProfileHistory(ByVal profileId As Guid, ByVal isPublished As Boolean, ByVal publicOnly As Boolean) As List(Of ProfileSearchProfileVersionInfo)

        Dim profileHistoryDictionary As New Dictionary(Of Guid, ProfileSearchProfileVersionInfo)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgProfileHistory"
                getCommand.Parameters.AddWithValue("ProfileId", profileId)
                If isPublished Then
                    getCommand.Parameters.AddWithValue("StateName", "Published")
                Else
                    getCommand.Parameters.AddWithValue("StateName", "Draft")
                End If
                getCommand.Parameters.AddWithValue("PublicOnly", publicOnly)

                Using reader As New SafeDataReader(getCommand.ExecuteReader)
                    While reader.Read()
                        Dim profileVersion As New ProfileSearchProfileVersionInfo() With
                        {
                        .Id = reader.GetGuid(0),
                        .ProfileId = reader.GetGuid(1),
                        .Title = reader.GetString(2),
                        .VersionMajor = reader.GetByte(3),
                        .VersionMinor = reader.GetByte(4),
                        .IsPublished = (reader.GetString(5) = "Published"),
                        .EffectiveDateFrom = reader.GetDateTime(6),
                        .EffectiveDateTo = reader.GetDateTime(7),
                        .IsLatestVersion = reader.GetBoolean(8),
                        .ScenarioTitle = reader.GetString(9),
                        .ParentProfileId = reader.GetGuid(10),
                        .IsPublic = reader.GetBoolean(11),
                        .HasRelevantPublicScenarios = False,
                        .ProfileStatusId = reader.GetGuid(12),
                        .ProfileStatusName = reader.GetString(13)
                        }
                        profileHistoryDictionary(profileVersion.Id) = profileVersion
                    End While
                    If reader.NextResult() Then
                        While reader.Read()
                            Dim id As Guid = reader.GetGuid(0)
                            Dim species As String = reader.GetString(1)
                            Dim isActive As Boolean = reader.GetBoolean(3)
                            If reader.GetString(2) = "Profiled" Then
                                If profileHistoryDictionary(id).ProfiledSpecies.Length > 0 Then
                                    profileHistoryDictionary(id).ProfiledSpecies &= ", "
                                End If

                                profileHistoryDictionary(id).ProfiledSpecies &= species
                                If Not isActive Then
                                    profileHistoryDictionary(id).ProfiledSpecies &= " (inactive)"
                                End If
                                profileHistoryDictionary(id).ProfiledSpeciesCount += 1
                            Else
                                If profileHistoryDictionary(id).OtherAffectedSpecies.Length > 0 Then
                                    profileHistoryDictionary(id).OtherAffectedSpecies &= ", "
                                End If

                                profileHistoryDictionary(id).OtherAffectedSpecies &= species
                                If Not isActive Then
                                    profileHistoryDictionary(id).OtherAffectedSpecies &= " (inactive)"
                                End If
                                profileHistoryDictionary(id).OtherAffectedSpeciesCount += 1
                            End If
                        End While
                    End If
                End Using
            End Using
        End Using

        Return profileHistoryDictionary.Values.ToList()

    End Function

    Public Function GetCurrentPublicCurrentSituation() As List(Of Contracts.DataContracts.ProfileSearchProfileVersionInfo) Implements Contracts.ServiceContracts.IProfileSearchService.GetCurrentPublicCurrentSituation

        Dim profileSituationDictionary As New Dictionary(Of Guid, ProfileSearchProfileVersionInfo)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgCurrentPublicProfileByParent"
                getCommand.Parameters.AddWithValue("ParentProfileId", DBNull.Value)

                Using reader As New SafeDataReader(getCommand.ExecuteReader)
                    While reader.Read()
                        Dim profileVersion As New ProfileSearchProfileVersionInfo() With
                                                {
                                                .Id = reader.GetGuid(0),
                                                .ProfileId = reader.GetGuid(1),
                                                .Title = reader.GetString(2),
                                                .VersionMajor = reader.GetByte(3),
                                                .VersionMinor = reader.GetByte(4),
                                                .IsPublished = (reader.GetString(5) = "Published"),
                                                .EffectiveDateFrom = reader.GetDateTime(6),
                                                .EffectiveDateTo = reader.GetDateTime(7),
                                                .IsLatestVersion = reader.GetBoolean(8),
                                                .ScenarioTitle = reader.GetString(9),
                                                .ParentProfileId = reader.GetGuid(10),
                                                .IsPublic = reader.GetBoolean(11),
                                                .HasRelevantPublicScenarios = reader.GetBoolean(12),
                                                .ProfileStatusId = reader.GetGuid(13),
                                                .ProfileStatusName = reader.GetString(14)
                                                }
                        profileSituationDictionary(profileVersion.Id) = profileVersion
                    End While
                    If reader.NextResult() Then
                        While reader.Read()
                            Dim id As Guid = reader.GetGuid(0)
                            Dim species As String = reader.GetString(1)
                            Dim isActive As Boolean = reader.GetBoolean(3)
                            If reader.GetString(2) = "Profiled" Then
                                If profileSituationDictionary(id).ProfiledSpecies.Length > 0 Then
                                    profileSituationDictionary(id).ProfiledSpecies &= ", "
                                End If

                                profileSituationDictionary(id).ProfiledSpecies &= species
                                If Not isActive Then
                                    profileSituationDictionary(id).ProfiledSpecies &= " (inactive)"
                                End If
                                profileSituationDictionary(id).ProfiledSpeciesCount += 1
                            Else
                                If profileSituationDictionary(id).OtherAffectedSpecies.Length > 0 Then
                                    profileSituationDictionary(id).OtherAffectedSpecies &= ", "
                                End If

                                profileSituationDictionary(id).OtherAffectedSpecies &= species
                                If Not isActive Then
                                    profileSituationDictionary(id).OtherAffectedSpecies &= " (inactive)"
                                End If
                                profileSituationDictionary(id).OtherAffectedSpeciesCount += 1
                            End If
                        End While
                    End If
                End Using
            End Using
        End Using
        Return profileSituationDictionary.Values.ToList()
    End Function

    Public Function GetCurrentPublicWhatIfScenario(ByVal request As Contracts.DataContracts.GetCurrentPublicWhatIfScenarioRequest) As List(Of Contracts.DataContracts.ProfileSearchProfileVersionInfo) Implements Contracts.ServiceContracts.IProfileSearchService.GetCurrentPublicWhatIfScenario
        Dim profileSituationDictionary As New Dictionary(Of Guid, ProfileSearchProfileVersionInfo)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgCurrentPublicProfileByParent"
                getCommand.Parameters.AddWithValue("ParentProfileId", request.ParentProfileId)

                Using reader As New SafeDataReader(getCommand.ExecuteReader)
                    While reader.Read()
                        Dim profileVersion As New ProfileSearchProfileVersionInfo() With
                                                {
                                                .Id = reader.GetGuid(0),
                                                .ProfileId = reader.GetGuid(1),
                                                .Title = reader.GetString(2),
                                                .VersionMajor = reader.GetByte(3),
                                                .VersionMinor = reader.GetByte(4),
                                                .IsPublished = (reader.GetString(5) = "Published"),
                                                .EffectiveDateFrom = reader.GetDateTime(6),
                                                .EffectiveDateTo = reader.GetDateTime(7),
                                                .IsLatestVersion = reader.GetBoolean(8),
                                                .ScenarioTitle = reader.GetString(9),
                                                .ParentProfileId = reader.GetGuid(10),
                                                .IsPublic = reader.GetBoolean(11),
                                                .HasRelevantPublicScenarios = reader.GetBoolean(12),
                                                .ProfileStatusId = reader.GetGuid(13),
                                                .ProfileStatusName = reader.GetString(14)
                                                }
                        profileSituationDictionary(profileVersion.Id) = profileVersion
                    End While
                    If reader.NextResult() Then
                        While reader.Read()
                            Dim id As Guid = reader.GetGuid(0)
                            Dim species As String = reader.GetString(1)
                            Dim isActive As Boolean = reader.GetBoolean(3)
                            If reader.GetString(2) = "Profiled" Then
                                If profileSituationDictionary(id).ProfiledSpecies.Length > 0 Then
                                    profileSituationDictionary(id).ProfiledSpecies &= ", "
                                End If

                                profileSituationDictionary(id).ProfiledSpecies &= species
                                If Not isActive Then
                                    profileSituationDictionary(id).ProfiledSpecies &= " (inactive)"
                                End If
                                profileSituationDictionary(id).ProfiledSpeciesCount += 1
                            Else
                                If profileSituationDictionary(id).OtherAffectedSpecies.Length > 0 Then
                                    profileSituationDictionary(id).OtherAffectedSpecies &= ", "
                                End If

                                profileSituationDictionary(id).OtherAffectedSpecies &= species
                                If Not isActive Then
                                    profileSituationDictionary(id).OtherAffectedSpecies &= " (inactive)"
                                End If
                                profileSituationDictionary(id).OtherAffectedSpeciesCount += 1
                            End If
                        End While
                    End If
                End Using
            End Using
        End Using

        Return profileSituationDictionary.Values.ToList()
    End Function
End Class
