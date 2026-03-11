Imports System.Configuration.ConfigurationManager
Imports ProfilesLibrary

Partial Class Footer
    Inherits System.Web.UI.UserControl

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

		litMaintainGlobalUsers.Visible = GlobalUserList.CanGetGlobalUserList()
		litUserManuals.Visible = StaticReportList.CanGetList()

		litMaintainReferenceData.Visible = ReferenceTableInfoList.CanGetList()
		litPrioritisationVariables.Visible = ProfilePrioritisationMetadata.CanGetObject()
		litCrossCuttingIssueScores.Visible = SpeciesPrioritisationMetadata.CanGetObject()

		litMaintainExternalUsers.Visible = SsoUserMaintenance.CanGetSsoUserMaintenance()

		pnlUserAdmin.Visible = litMaintainGlobalUsers.Visible OrElse litMaintainExternalUsers.Visible
		pnlCrossProfileAdmin.Visible = litMaintainReferenceData.Visible OrElse litPrioritisationVariables.Visible OrElse litCrossCuttingIssueScores.Visible

		pnlHelpAndSupport.Visible = litUserManuals.Visible

		qualityStatementLink.NavigateUrl = StaticReportWebHelper.GetDownloadUrl("D2R2 Quality Statement")
		qualityStatementLink.Visible = litUserManuals.Visible
	End Sub

End Class
