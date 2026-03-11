Imports System.Configuration.ConfigurationManager
Imports ProfilesLibrary

Partial Class NavigationLinks
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        lnkExit.NavigateUrl = AppSettings("ExitLink")
        'display left hand links according to permissions
        litProfileHome.Visible = ProfileInfoList.CanGetProfileInfoList()
        litProfileSearch.Visible = ProfileInfoList.CanGetProfileInfoList()
        litMaintainGlobalUsers.Visible = GlobalUserList.CanGetGlobalUserList()
        litCreateProfile.Visible = ProfilesLibrary.Profile.CanCreateProfile()
        litCompareProfileVersions.Visible = GetProfileVersionComparisonReportCommand.CanGetReport()
        litDiseaseRanking.Visible = GetProfileRankingReportCommand.CanGetReport()
        litMaintainReferenceData.Visible = ReferenceTableInfoList.CanGetList()
        litPrioritisationVariables.Visible = ProfilePrioritisationMetadata.CanGetObject()
        litCrossCuttingIssueScores.Visible = SpeciesPrioritisationMetadata.CanGetObject()
        litStaticReports.Visible = StaticReportList.CanGetList()
        litMaintainSpeciesData.Visible = SpeciesDataChange.CanAddSpeciesDataChange()
        litUserGuidance.Visible = ProfileQuestion.CanEditObject()
        litUserManuals.Visible = StaticReportList.CanGetList()
        litViewSpeciesData.Visible = SpeciesSectionList.CanGetSpeciesSectionList()
        litMaintainExternalUsers.Visible = SsoUserMaintenance.CanGetSsoUserMaintenance()
        litReviewTiming.Visible = DiseaseReviewsFilterInfo.CanGetObject()
    End Sub

End Class
