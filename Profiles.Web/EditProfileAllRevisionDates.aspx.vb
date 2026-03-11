Imports Profiles.WebControls
Imports Profiles.WebControls.Profiles.WebControls
Imports ProfilesLibrary

Partial Class EditProfileAllRevisionDates
	Inherits System.Web.UI.Page

	Private mProfileVersionInfo As ProfileVersionInfo
	Private mCanEditProfileVersionSection As Boolean

	Protected WithEvents ctlSectionLinksMaster As Global.Profiles.Web.ProfileSectionLinks


	Private Property CurrentProfile() As Profile
		Get
			If Not Session("CurrentProfile") Is Nothing Then
				Return DirectCast(Session("CurrentProfile"), Profile)
			Else
				Return Nothing
			End If
		End Get
		Set(ByVal value As Profile)
			Session("CurrentProfile") = value
		End Set
	End Property

	Private Property CurrentProfileSectionId() As Guid
		Get
			If Not Session("CurrentProfileSectionId") Is Nothing Then
				Return DirectCast(Session("CurrentProfileSectionId"), Guid)
			Else
				Return Guid.Empty
			End If
		End Get
		Set(ByVal value As Guid)
			Session("CurrentProfileSectionId") = value
		End Set
	End Property

	Private Property CurrentProfileVersionSection() As ProfileVersionSection
		Get
			If Session("CurrentProfileVersionSection") IsNot Nothing Then
				Return DirectCast(Session("CurrentProfileVersionSection"), ProfileVersionSection)
			Else
				Throw New InvalidOperationException("The current profile version section information is unavailable. The session may have timed out.")
			End If
		End Get
		Set(ByVal value As ProfileVersionSection)
			Session("CurrentProfileVersionSection") = value
		End Set
	End Property

	Private Property SummaryProfileVersionSection() As ProfileVersionSection
		Get
			If Session("SummaryProfileVersionSection") IsNot Nothing Then
				Return DirectCast(Session("SummaryProfileVersionSection"), ProfileVersionSection)
			Else
				Throw New InvalidOperationException("The current profile version section information is unavailable. The session may have timed out.")
			End If
		End Get
		Set(ByVal value As ProfileVersionSection)
			Session("SummaryProfileVersionSection") = value
		End Set
	End Property

	Private Property GeographicDistributionLevelsDiseaseProfileVersionSection() As ProfileVersionSection
		Get
			If Session("GeographicDistributionLevelsDiseaseProfileVersionSection") IsNot Nothing Then
				Return DirectCast(Session("GeographicDistributionLevelsDiseaseProfileVersionSection"), ProfileVersionSection)
			Else
				Throw New InvalidOperationException("The current profile version section information is unavailable. The session may have timed out.")
			End If
		End Get
		Set(ByVal value As ProfileVersionSection)
			Session("GeographicDistributionLevelsDiseaseProfileVersionSection") = value
		End Set
	End Property

	Private Property EpidemiologyProfileVersionSection() As ProfileVersionSection
		Get
			If Session("EpidemiologyProfileVersionSection") IsNot Nothing Then
				Return DirectCast(Session("EpidemiologyProfileVersionSection"), ProfileVersionSection)
			Else
				Throw New InvalidOperationException("The current profile version section information is unavailable. The session may have timed out.")
			End If
		End Get
		Set(ByVal value As ProfileVersionSection)
			Session("EpidemiologyProfileVersionSection") = value
		End Set
	End Property

	Private Property CharacteristicsAgentProfileVersionSection() As ProfileVersionSection
		Get
			If Session("CharacteristicsAgentProfileVersionSection") IsNot Nothing Then
				Return DirectCast(Session("CharacteristicsAgentProfileVersionSection"), ProfileVersionSection)
			Else
				Throw New InvalidOperationException("The current profile version section information is unavailable. The session may have timed out.")
			End If
		End Get
		Set(ByVal value As ProfileVersionSection)
			Session("CharacteristicsAgentProfileVersionSection") = value
		End Set
	End Property

	Private Property AnimalWelfareProfileVersionSection() As ProfileVersionSection
		Get
			If Session("AnimalWelfareProfileVersionSection") IsNot Nothing Then
				Return DirectCast(Session("AnimalWelfareProfileVersionSection"), ProfileVersionSection)
			Else
				Throw New InvalidOperationException("The current profile version section information is unavailable. The session may have timed out.")
			End If
		End Get
		Set(ByVal value As ProfileVersionSection)
			Session("AnimalWelfareProfileVersionSection") = value
		End Set
	End Property

	Private Property HumanHealthProfileVersionSection() As ProfileVersionSection
		Get
			If Session("HumanHealthProfileVersionSection") IsNot Nothing Then
				Return DirectCast(Session("HumanHealthProfileVersionSection"), ProfileVersionSection)
			Else
				Throw New InvalidOperationException("The current profile version section information is unavailable. The session may have timed out.")
			End If
		End Get
		Set(ByVal value As ProfileVersionSection)
			Session("HumanHealthProfileVersionSection") = value
		End Set
	End Property

	Private Property WiderSocietyProfileVersionSection() As ProfileVersionSection
		Get
			If Session("WiderSocietyProfileVersionSection") IsNot Nothing Then
				Return DirectCast(Session("WiderSocietyProfileVersionSection"), ProfileVersionSection)
			Else
				Throw New InvalidOperationException("The current profile version section information is unavailable. The session may have timed out.")
			End If
		End Get
		Set(ByVal value As ProfileVersionSection)
			Session("WiderSocietyProfileVersionSection") = value
		End Set
	End Property

	Private Property LegislationMandatesProfileVersionSection() As ProfileVersionSection
		Get
			If Session("LegislationMandatesProfileVersionSection") IsNot Nothing Then
				Return DirectCast(Session("LegislationMandatesProfileVersionSection"), ProfileVersionSection)
			Else
				Throw New InvalidOperationException("The current profile version section information is unavailable. The session may have timed out.")
			End If
		End Get
		Set(ByVal value As ProfileVersionSection)
			Session("LegislationMandatesProfileVersionSection") = value
		End Set
	End Property

	Private Property ApproachControlProfileVersionSection() As ProfileVersionSection
		Get
			If Session("ApproachControlProfileVersionSection") IsNot Nothing Then
				Return DirectCast(Session("ApproachControlProfileVersionSection"), ProfileVersionSection)
			Else
				Throw New InvalidOperationException("The current profile version section information is unavailable. The session may have timed out.")
			End If
		End Get
		Set(ByVal value As ProfileVersionSection)
			Session("ApproachControlProfileVersionSection") = value
		End Set
	End Property

	Private Property RiskAssessmentProfileVersionSection() As ProfileVersionSection
		Get
			If Session("RiskAssessmentProfileVersionSection") IsNot Nothing Then
				Return DirectCast(Session("RiskAssessmentProfileVersionSection"), ProfileVersionSection)
			Else
				Throw New InvalidOperationException("The current profile version section information is unavailable. The session may have timed out.")
			End If
		End Get
		Set(ByVal value As ProfileVersionSection)
			Session("RiskAssessmentProfileVersionSection") = value
		End Set
	End Property

	Private Property LaboratoriesProfileVersionSection() As ProfileVersionSection
		Get
			If Session("LaboratoriesProfileVersionSection") IsNot Nothing Then
				Return DirectCast(Session("LaboratoriesProfileVersionSection"), ProfileVersionSection)
			Else
				Throw New InvalidOperationException("The current profile version section information is unavailable. The session may have timed out.")
			End If
		End Get
		Set(ByVal value As ProfileVersionSection)
			Session("LaboratoriesProfileVersionSection") = value
		End Set
	End Property

	Private Property SurveillanceProfileVersionSection() As ProfileVersionSection
		Get
			If Session("SurveillanceProfileVersionSection") IsNot Nothing Then
				Return DirectCast(Session("SurveillanceProfileVersionSection"), ProfileVersionSection)
			Else
				Throw New InvalidOperationException("The current profile version section information is unavailable. The session may have timed out.")
			End If
		End Get
		Set(ByVal value As ProfileVersionSection)
			Session("SurveillanceProfileVersionSection") = value
		End Set
	End Property

	Private Property InternationalTradeProfileVersionSection() As ProfileVersionSection
		Get
			If Session("InternationalTradeProfileVersionSection") IsNot Nothing Then
				Return DirectCast(Session("InternationalTradeProfileVersionSection"), ProfileVersionSection)
			Else
				Throw New InvalidOperationException("The current profile version section information is unavailable. The session may have timed out.")
			End If
		End Get
		Set(ByVal value As ProfileVersionSection)
			Session("InternationalTradeProfileVersionSection") = value
		End Set
	End Property

	Private Property OpportunityProfileVersionSection() As ProfileVersionSection
		Get
			If Session("OpportunityProfileVersionSection") IsNot Nothing Then
				Return DirectCast(Session("OpportunityProfileVersionSection"), ProfileVersionSection)
			Else
				Throw New InvalidOperationException("The current profile version section information is unavailable. The session may have timed out.")
			End If
		End Get
		Set(ByVal value As ProfileVersionSection)
			Session("OpportunityProfileVersionSection") = value
		End Set
	End Property

	Private Property PublicAndStakeholderPerceptionProfileVersionSection() As ProfileVersionSection
		Get
			If Session("PublicAndStakeholderPerceptionProfileVersionSection") IsNot Nothing Then
				Return DirectCast(Session("PublicAndStakeholderPerceptionProfileVersionSection"), ProfileVersionSection)
			Else
				Throw New InvalidOperationException("The current profile version section information is unavailable. The session may have timed out.")
			End If
		End Get
		Set(ByVal value As ProfileVersionSection)
			Session("PublicAndStakeholderPerceptionProfileVersionSection") = value
		End Set
	End Property

	Private Property AreasOfUncertaintyProfileVersionSection() As ProfileVersionSection
		Get
			If Session("AreasOfUncertaintyProfileVersionSection") IsNot Nothing Then
				Return DirectCast(Session("AreasOfUncertaintyProfileVersionSection"), ProfileVersionSection)
			Else
				Throw New InvalidOperationException("The current profile version section information is unavailable. The session may have timed out.")
			End If
		End Get
		Set(ByVal value As ProfileVersionSection)
			Session("AreasOfUncertaintyProfileVersionSection") = value
		End Set
	End Property

	'Protected Sub ctlSectionLinks_Save(ByVal sender As Object, ByVal e As System.ComponentModel.CancelEventArgs) Handles ctlSectionLinks.Save

	'    If Not Page.IsValid Then
	'        e.Cancel = True
	'        Exit Sub
	'    End If

	'    If mCanEditProfileVersionSection Then
	'        If Not PersistSectionInfoToDatabase() Then
	'            e.Cancel = True
	'        End If
	'    End If

	'End Sub

	Private Sub PersistSectionInfoToProfileVersion()

		If ProfileVersionSection.CanEditNextReviewDates(mProfileVersionInfo.Id) Then
			'Persist the revision dates information
			SummaryProfileVersionSection.NextPolicyReview = Csla.SmartDate.Parse(txtNextPolicyReviewSummary.Text)
			SummaryProfileVersionSection.NextVAReview = Csla.SmartDate.Parse(txtNextVAReviewSummary.Text)
			SummaryProfileVersionSection.NextAuthorReview = Csla.SmartDate.Parse(txtNextAuthorReviewSummary.Text)

			GeographicDistributionLevelsDiseaseProfileVersionSection.NextPolicyReview = Csla.SmartDate.Parse(txtNextPolicyReviewGeographicDistributionLevelsDisease.Text)
			GeographicDistributionLevelsDiseaseProfileVersionSection.NextVAReview = Csla.SmartDate.Parse(txtNextVAReviewGeographicDistributionLevelsDisease.Text)
			GeographicDistributionLevelsDiseaseProfileVersionSection.NextAuthorReview = Csla.SmartDate.Parse(txtNextAuthorReviewGeographicDistributionLevelsDisease.Text)

			EpidemiologyProfileVersionSection.NextPolicyReview = Csla.SmartDate.Parse(txtNextPolicyReviewEpidemiology.Text)
			EpidemiologyProfileVersionSection.NextVAReview = Csla.SmartDate.Parse(txtNextVAReviewEpidemiology.Text)
			EpidemiologyProfileVersionSection.NextAuthorReview = Csla.SmartDate.Parse(txtNextAuthorReviewEpidemiology.Text)

			CharacteristicsAgentProfileVersionSection.NextPolicyReview = Csla.SmartDate.Parse(txtNextPolicyReviewCharacteristicsAgent.Text)
			CharacteristicsAgentProfileVersionSection.NextVAReview = Csla.SmartDate.Parse(txtNextVAReviewCharacteristicsAgent.Text)
			CharacteristicsAgentProfileVersionSection.NextAuthorReview = Csla.SmartDate.Parse(txtNextAuthorReviewCharacteristicsAgent.Text)

			AnimalWelfareProfileVersionSection.NextPolicyReview = Csla.SmartDate.Parse(txtNextPolicyReviewAnimalWelfare.Text)
			AnimalWelfareProfileVersionSection.NextVAReview = Csla.SmartDate.Parse(txtNextVAReviewAnimalWelfare.Text)
			AnimalWelfareProfileVersionSection.NextAuthorReview = Csla.SmartDate.Parse(txtNextAuthorReviewAnimalWelfare.Text)

			HumanHealthProfileVersionSection.NextPolicyReview = Csla.SmartDate.Parse(txtNextPolicyReviewHumanHealth.Text)
			HumanHealthProfileVersionSection.NextVAReview = Csla.SmartDate.Parse(txtNextVAReviewHumanHealth.Text)
			HumanHealthProfileVersionSection.NextAuthorReview = Csla.SmartDate.Parse(txtNextAuthorReviewHumanHealth.Text)

			WiderSocietyProfileVersionSection.NextPolicyReview = Csla.SmartDate.Parse(txtNextPolicyReviewWiderSociety.Text)
			WiderSocietyProfileVersionSection.NextVAReview = Csla.SmartDate.Parse(txtNextVAReviewWiderSociety.Text)
			WiderSocietyProfileVersionSection.NextAuthorReview = Csla.SmartDate.Parse(txtNextAuthorReviewWiderSociety.Text)

			LegislationMandatesProfileVersionSection.NextPolicyReview = Csla.SmartDate.Parse(txtNextPolicyReviewLegislationMandates.Text)
			LegislationMandatesProfileVersionSection.NextVAReview = Csla.SmartDate.Parse(txtNextVAReviewLegislationMandates.Text)
			LegislationMandatesProfileVersionSection.NextAuthorReview = Csla.SmartDate.Parse(txtNextAuthorReviewLegislationMandates.Text)

			ApproachControlProfileVersionSection.NextPolicyReview = Csla.SmartDate.Parse(txtNextPolicyReviewApproachControl.Text)
			ApproachControlProfileVersionSection.NextVAReview = Csla.SmartDate.Parse(txtNextVAReviewApproachControl.Text)
			ApproachControlProfileVersionSection.NextAuthorReview = Csla.SmartDate.Parse(txtNextAuthorReviewApproachControl.Text)

			RiskAssessmentProfileVersionSection.NextPolicyReview = Csla.SmartDate.Parse(txtNextPolicyReviewRiskAssessment.Text)
			RiskAssessmentProfileVersionSection.NextVAReview = Csla.SmartDate.Parse(txtNextVAReviewRiskAssessment.Text)
			RiskAssessmentProfileVersionSection.NextAuthorReview = Csla.SmartDate.Parse(txtNextAuthorReviewRiskAssessment.Text)

			LaboratoriesProfileVersionSection.NextPolicyReview = Csla.SmartDate.Parse(txtNextPolicyReviewLaboratories.Text)
			LaboratoriesProfileVersionSection.NextVAReview = Csla.SmartDate.Parse(txtNextVAReviewLaboratories.Text)
			LaboratoriesProfileVersionSection.NextAuthorReview = Csla.SmartDate.Parse(txtNextAuthorReviewLaboratories.Text)

			SurveillanceProfileVersionSection.NextPolicyReview = Csla.SmartDate.Parse(txtNextPolicyReviewSurveillance.Text)
			SurveillanceProfileVersionSection.NextVAReview = Csla.SmartDate.Parse(txtNextVAReviewSurveillance.Text)
			SurveillanceProfileVersionSection.NextAuthorReview = Csla.SmartDate.Parse(txtNextAuthorReviewSurveillance.Text)

			InternationalTradeProfileVersionSection.NextPolicyReview = Csla.SmartDate.Parse(txtNextPolicyReviewInternationalTrade.Text)
			InternationalTradeProfileVersionSection.NextVAReview = Csla.SmartDate.Parse(txtNextVAReviewInternationalTrade.Text)
			InternationalTradeProfileVersionSection.NextAuthorReview = Csla.SmartDate.Parse(txtNextAuthorReviewInternationalTrade.Text)

			OpportunityProfileVersionSection.NextPolicyReview = Csla.SmartDate.Parse(txtNextPolicyReviewOpportunity.Text)
			OpportunityProfileVersionSection.NextVAReview = Csla.SmartDate.Parse(txtNextVAReviewOpportunity.Text)
			OpportunityProfileVersionSection.NextAuthorReview = Csla.SmartDate.Parse(txtNextAuthorReviewOpportunity.Text)

			PublicAndStakeholderPerceptionProfileVersionSection.NextPolicyReview = Csla.SmartDate.Parse(txtNextPolicyReviewPublicAndStakeholderPerception.Text)
			PublicAndStakeholderPerceptionProfileVersionSection.NextVAReview = Csla.SmartDate.Parse(txtNextVAReviewPublicAndStakeholderPerception.Text)
			PublicAndStakeholderPerceptionProfileVersionSection.NextAuthorReview = Csla.SmartDate.Parse(txtNextAuthorReviewPublicAndStakeholderPerception.Text)

			AreasOfUncertaintyProfileVersionSection.NextPolicyReview = Csla.SmartDate.Parse(txtNextPolicyReviewAreasOfUncertainty.Text)
			AreasOfUncertaintyProfileVersionSection.NextVAReview = Csla.SmartDate.Parse(txtNextVAReviewAreasOfUncertainty.Text)
			AreasOfUncertaintyProfileVersionSection.NextAuthorReview = Csla.SmartDate.Parse(txtNextAuthorReviewAreasOfUncertainty.Text)
		End If

		If Not ddlPolicyReviewFreqSummary.SelectedValue.ToString() = String.Empty Then
			SummaryProfileVersionSection.PolicyReviewFrequency = New Guid(ddlPolicyReviewFreqSummary.SelectedValue)
		Else
			SummaryProfileVersionSection.PolicyReviewFrequency = Guid.Empty
		End If

		If Not ddlVAReviewFreqSummary.SelectedValue.ToString() = String.Empty Then
			SummaryProfileVersionSection.VAReviewFrequency = New Guid(ddlVAReviewFreqSummary.SelectedValue)
		Else
			SummaryProfileVersionSection.VAReviewFrequency = Guid.Empty
		End If

		If Not ddlAuthorReviewFreqSummary.SelectedValue.ToString() = String.Empty Then
			SummaryProfileVersionSection.AuthorReviewFrequency = New Guid(ddlAuthorReviewFreqSummary.SelectedValue)
		Else
			SummaryProfileVersionSection.AuthorReviewFrequency = Guid.Empty
		End If

		If Not ddlPolicyReviewStatusSummary.SelectedValue.ToString() = String.Empty Then
			SummaryProfileVersionSection.PolicyReviewStatusId = New Guid(ddlPolicyReviewStatusSummary.SelectedValue)
		Else
			SummaryProfileVersionSection.PolicyReviewStatusId = Guid.Empty
		End If

		If Not ddlVAReviewStatusSummary.SelectedValue.ToString() = String.Empty Then
			SummaryProfileVersionSection.VAReviewStatusId = New Guid(ddlVAReviewStatusSummary.SelectedValue)
		Else
			SummaryProfileVersionSection.VAReviewStatusId = Guid.Empty
		End If

		If Not ddlAuthorReviewStatusSummary.SelectedValue.ToString() = String.Empty Then
			SummaryProfileVersionSection.AuthorReviewStatusId = New Guid(ddlAuthorReviewStatusSummary.SelectedValue)
		Else
			SummaryProfileVersionSection.AuthorReviewStatusId = (Guid.Empty)
		End If
		'-------------------------------------------------------------------------------------------------------------------------------------------------------------------
		If Not ddlPolicyReviewFreqGeographicDistributionLevelsDisease.SelectedValue.ToString() = String.Empty Then
			GeographicDistributionLevelsDiseaseProfileVersionSection.PolicyReviewFrequency = New Guid(ddlPolicyReviewFreqGeographicDistributionLevelsDisease.SelectedValue)
		Else
			GeographicDistributionLevelsDiseaseProfileVersionSection.PolicyReviewFrequency = Guid.Empty
		End If

		If Not ddlVAReviewFreqGeographicDistributionLevelsDisease.SelectedValue.ToString() = String.Empty Then
			GeographicDistributionLevelsDiseaseProfileVersionSection.VAReviewFrequency = New Guid(ddlVAReviewFreqGeographicDistributionLevelsDisease.SelectedValue)
		Else
			GeographicDistributionLevelsDiseaseProfileVersionSection.VAReviewFrequency = Guid.Empty
		End If

		If Not ddlAuthorReviewFreqGeographicDistributionLevelsDisease.SelectedValue.ToString() = String.Empty Then
			GeographicDistributionLevelsDiseaseProfileVersionSection.AuthorReviewFrequency = New Guid(ddlAuthorReviewFreqGeographicDistributionLevelsDisease.SelectedValue)
		Else
			GeographicDistributionLevelsDiseaseProfileVersionSection.AuthorReviewFrequency = Guid.Empty
		End If

		If Not ddlPolicyReviewStatusGeographicDistributionLevelsDisease.SelectedValue.ToString() = String.Empty Then
			GeographicDistributionLevelsDiseaseProfileVersionSection.PolicyReviewStatusId = New Guid(ddlPolicyReviewStatusGeographicDistributionLevelsDisease.SelectedValue)
		Else
			GeographicDistributionLevelsDiseaseProfileVersionSection.PolicyReviewStatusId = Guid.Empty
		End If

		If Not ddlVAReviewStatusGeographicDistributionLevelsDisease.SelectedValue.ToString() = String.Empty Then
			GeographicDistributionLevelsDiseaseProfileVersionSection.VAReviewStatusId = New Guid(ddlVAReviewStatusGeographicDistributionLevelsDisease.SelectedValue)
		Else
			GeographicDistributionLevelsDiseaseProfileVersionSection.VAReviewStatusId = Guid.Empty
		End If

		If Not ddlAuthorReviewStatusGeographicDistributionLevelsDisease.SelectedValue.ToString() = String.Empty Then
			GeographicDistributionLevelsDiseaseProfileVersionSection.AuthorReviewStatusId = New Guid(ddlAuthorReviewStatusGeographicDistributionLevelsDisease.SelectedValue)
		Else
			GeographicDistributionLevelsDiseaseProfileVersionSection.AuthorReviewStatusId = (Guid.Empty)
		End If
		'-------------------------------------------------------------------------------------------------------------------------------------------------------------------
		If Not ddlPolicyReviewFreqEpidemiology.SelectedValue.ToString() = String.Empty Then
			EpidemiologyProfileVersionSection.PolicyReviewFrequency = New Guid(ddlPolicyReviewFreqEpidemiology.SelectedValue)
		Else
			EpidemiologyProfileVersionSection.PolicyReviewFrequency = Guid.Empty
		End If

		If Not ddlVAReviewFreqEpidemiology.SelectedValue.ToString() = String.Empty Then
			EpidemiologyProfileVersionSection.VAReviewFrequency = New Guid(ddlVAReviewFreqEpidemiology.SelectedValue)
		Else
			EpidemiologyProfileVersionSection.VAReviewFrequency = Guid.Empty
		End If

		If Not ddlAuthorReviewFreqEpidemiology.SelectedValue.ToString() = String.Empty Then
			EpidemiologyProfileVersionSection.AuthorReviewFrequency = New Guid(ddlAuthorReviewFreqEpidemiology.SelectedValue)
		Else
			EpidemiologyProfileVersionSection.AuthorReviewFrequency = Guid.Empty
		End If

		If Not ddlPolicyReviewStatusEpidemiology.SelectedValue.ToString() = String.Empty Then
			EpidemiologyProfileVersionSection.PolicyReviewStatusId = New Guid(ddlPolicyReviewStatusEpidemiology.SelectedValue)
		Else
			EpidemiologyProfileVersionSection.PolicyReviewStatusId = Guid.Empty
		End If

		If Not ddlVAReviewStatusEpidemiology.SelectedValue.ToString() = String.Empty Then
			EpidemiologyProfileVersionSection.VAReviewStatusId = New Guid(ddlVAReviewStatusEpidemiology.SelectedValue)
		Else
			EpidemiologyProfileVersionSection.VAReviewStatusId = Guid.Empty
		End If

		If Not ddlAuthorReviewStatusEpidemiology.SelectedValue.ToString() = String.Empty Then
			EpidemiologyProfileVersionSection.AuthorReviewStatusId = New Guid(ddlAuthorReviewStatusEpidemiology.SelectedValue)
		Else
			EpidemiologyProfileVersionSection.AuthorReviewStatusId = (Guid.Empty)
		End If
		'-------------------------------------------------------------------------------------------------------------------------------------------------------------------
		If Not ddlPolicyReviewFreqCharacteristicsAgent.SelectedValue.ToString() = String.Empty Then
			CharacteristicsAgentProfileVersionSection.PolicyReviewFrequency = New Guid(ddlPolicyReviewFreqCharacteristicsAgent.SelectedValue)
		Else
			CharacteristicsAgentProfileVersionSection.PolicyReviewFrequency = Guid.Empty
		End If

		If Not ddlVAReviewFreqCharacteristicsAgent.SelectedValue.ToString() = String.Empty Then
			CharacteristicsAgentProfileVersionSection.VAReviewFrequency = New Guid(ddlVAReviewFreqCharacteristicsAgent.SelectedValue)
		Else
			CharacteristicsAgentProfileVersionSection.VAReviewFrequency = Guid.Empty
		End If

		If Not ddlAuthorReviewFreqCharacteristicsAgent.SelectedValue.ToString() = String.Empty Then
			CharacteristicsAgentProfileVersionSection.AuthorReviewFrequency = New Guid(ddlAuthorReviewFreqCharacteristicsAgent.SelectedValue)
		Else
			CharacteristicsAgentProfileVersionSection.AuthorReviewFrequency = Guid.Empty
		End If

		If Not ddlPolicyReviewStatusCharacteristicsAgent.SelectedValue.ToString() = String.Empty Then
			CharacteristicsAgentProfileVersionSection.PolicyReviewStatusId = New Guid(ddlPolicyReviewStatusCharacteristicsAgent.SelectedValue)
		Else
			CharacteristicsAgentProfileVersionSection.PolicyReviewStatusId = Guid.Empty
		End If

		If Not ddlVAReviewStatusCharacteristicsAgent.SelectedValue.ToString() = String.Empty Then
			CharacteristicsAgentProfileVersionSection.VAReviewStatusId = New Guid(ddlVAReviewStatusCharacteristicsAgent.SelectedValue)
		Else
			CharacteristicsAgentProfileVersionSection.VAReviewStatusId = Guid.Empty
		End If

		If Not ddlAuthorReviewStatusCharacteristicsAgent.SelectedValue.ToString() = String.Empty Then
			CharacteristicsAgentProfileVersionSection.AuthorReviewStatusId = New Guid(ddlAuthorReviewStatusCharacteristicsAgent.SelectedValue)
		Else
			CharacteristicsAgentProfileVersionSection.AuthorReviewStatusId = (Guid.Empty)
		End If
		'-------------------------------------------------------------------------------------------------------------------------------------------------------------------
		If Not ddlPolicyReviewFreqAnimalWelfare.SelectedValue.ToString() = String.Empty Then
			AnimalWelfareProfileVersionSection.PolicyReviewFrequency = New Guid(ddlPolicyReviewFreqAnimalWelfare.SelectedValue)
		Else
			AnimalWelfareProfileVersionSection.PolicyReviewFrequency = Guid.Empty
		End If

		If Not ddlVAReviewFreqAnimalWelfare.SelectedValue.ToString() = String.Empty Then
			AnimalWelfareProfileVersionSection.VAReviewFrequency = New Guid(ddlVAReviewFreqAnimalWelfare.SelectedValue)
		Else
			AnimalWelfareProfileVersionSection.VAReviewFrequency = Guid.Empty
		End If

		If Not ddlAuthorReviewFreqAnimalWelfare.SelectedValue.ToString() = String.Empty Then
			AnimalWelfareProfileVersionSection.AuthorReviewFrequency = New Guid(ddlAuthorReviewFreqAnimalWelfare.SelectedValue)
		Else
			AnimalWelfareProfileVersionSection.AuthorReviewFrequency = Guid.Empty
		End If

		If Not ddlPolicyReviewStatusAnimalWelfare.SelectedValue.ToString() = String.Empty Then
			AnimalWelfareProfileVersionSection.PolicyReviewStatusId = New Guid(ddlPolicyReviewStatusAnimalWelfare.SelectedValue)
		Else
			AnimalWelfareProfileVersionSection.PolicyReviewStatusId = Guid.Empty
		End If

		If Not ddlVAReviewStatusAnimalWelfare.SelectedValue.ToString() = String.Empty Then
			AnimalWelfareProfileVersionSection.VAReviewStatusId = New Guid(ddlVAReviewStatusAnimalWelfare.SelectedValue)
		Else
			AnimalWelfareProfileVersionSection.VAReviewStatusId = Guid.Empty
		End If

		If Not ddlAuthorReviewStatusAnimalWelfare.SelectedValue.ToString() = String.Empty Then
			AnimalWelfareProfileVersionSection.AuthorReviewStatusId = New Guid(ddlAuthorReviewStatusAnimalWelfare.SelectedValue)
		Else
			AnimalWelfareProfileVersionSection.AuthorReviewStatusId = (Guid.Empty)
		End If
		'-------------------------------------------------------------------------------------------------------------------------------------------------------------------
		If Not ddlPolicyReviewFreqHumanHealth.SelectedValue.ToString() = String.Empty Then
			HumanHealthProfileVersionSection.PolicyReviewFrequency = New Guid(ddlPolicyReviewFreqHumanHealth.SelectedValue)
		Else
			HumanHealthProfileVersionSection.PolicyReviewFrequency = Guid.Empty
		End If

		If Not ddlVAReviewFreqHumanHealth.SelectedValue.ToString() = String.Empty Then
			HumanHealthProfileVersionSection.VAReviewFrequency = New Guid(ddlVAReviewFreqHumanHealth.SelectedValue)
		Else
			HumanHealthProfileVersionSection.VAReviewFrequency = Guid.Empty
		End If

		If Not ddlAuthorReviewFreqHumanHealth.SelectedValue.ToString() = String.Empty Then
			HumanHealthProfileVersionSection.AuthorReviewFrequency = New Guid(ddlAuthorReviewFreqHumanHealth.SelectedValue)
		Else
			HumanHealthProfileVersionSection.AuthorReviewFrequency = Guid.Empty
		End If

		If Not ddlPolicyReviewStatusHumanHealth.SelectedValue.ToString() = String.Empty Then
			HumanHealthProfileVersionSection.PolicyReviewStatusId = New Guid(ddlPolicyReviewStatusHumanHealth.SelectedValue)
		Else
			HumanHealthProfileVersionSection.PolicyReviewStatusId = Guid.Empty
		End If

		If Not ddlVAReviewStatusHumanHealth.SelectedValue.ToString() = String.Empty Then
			HumanHealthProfileVersionSection.VAReviewStatusId = New Guid(ddlVAReviewStatusHumanHealth.SelectedValue)
		Else
			HumanHealthProfileVersionSection.VAReviewStatusId = Guid.Empty
		End If

		If Not ddlAuthorReviewStatusHumanHealth.SelectedValue.ToString() = String.Empty Then
			HumanHealthProfileVersionSection.AuthorReviewStatusId = New Guid(ddlAuthorReviewStatusHumanHealth.SelectedValue)
		Else
			HumanHealthProfileVersionSection.AuthorReviewStatusId = (Guid.Empty)
		End If
		'-------------------------------------------------------------------------------------------------------------------------------------------------------------------
		If Not ddlPolicyReviewFreqWiderSociety.SelectedValue.ToString() = String.Empty Then
			WiderSocietyProfileVersionSection.PolicyReviewFrequency = New Guid(ddlPolicyReviewFreqWiderSociety.SelectedValue)
		Else
			WiderSocietyProfileVersionSection.PolicyReviewFrequency = Guid.Empty
		End If

		If Not ddlVAReviewFreqWiderSociety.SelectedValue.ToString() = String.Empty Then
			WiderSocietyProfileVersionSection.VAReviewFrequency = New Guid(ddlVAReviewFreqWiderSociety.SelectedValue)
		Else
			WiderSocietyProfileVersionSection.VAReviewFrequency = Guid.Empty
		End If

		If Not ddlAuthorReviewFreqWiderSociety.SelectedValue.ToString() = String.Empty Then
			WiderSocietyProfileVersionSection.AuthorReviewFrequency = New Guid(ddlAuthorReviewFreqWiderSociety.SelectedValue)
		Else
			WiderSocietyProfileVersionSection.AuthorReviewFrequency = Guid.Empty
		End If

		If Not ddlPolicyReviewStatusWiderSociety.SelectedValue.ToString() = String.Empty Then
			WiderSocietyProfileVersionSection.PolicyReviewStatusId = New Guid(ddlPolicyReviewStatusWiderSociety.SelectedValue)
		Else
			WiderSocietyProfileVersionSection.PolicyReviewStatusId = Guid.Empty
		End If

		If Not ddlVAReviewStatusWiderSociety.SelectedValue.ToString() = String.Empty Then
			WiderSocietyProfileVersionSection.VAReviewStatusId = New Guid(ddlVAReviewStatusWiderSociety.SelectedValue)
		Else
			WiderSocietyProfileVersionSection.VAReviewStatusId = Guid.Empty
		End If

		If Not ddlAuthorReviewStatusWiderSociety.SelectedValue.ToString() = String.Empty Then
			WiderSocietyProfileVersionSection.AuthorReviewStatusId = New Guid(ddlAuthorReviewStatusWiderSociety.SelectedValue)
		Else
			WiderSocietyProfileVersionSection.AuthorReviewStatusId = (Guid.Empty)
		End If
		'-------------------------------------------------------------------------------------------------------------------------------------------------------------------
		If Not ddlPolicyReviewFreqLegislationMandates.SelectedValue.ToString() = String.Empty Then
			LegislationMandatesProfileVersionSection.PolicyReviewFrequency = New Guid(ddlPolicyReviewFreqLegislationMandates.SelectedValue)
		Else
			LegislationMandatesProfileVersionSection.PolicyReviewFrequency = Guid.Empty
		End If

		If Not ddlVAReviewFreqLegislationMandates.SelectedValue.ToString() = String.Empty Then
			LegislationMandatesProfileVersionSection.VAReviewFrequency = New Guid(ddlVAReviewFreqLegislationMandates.SelectedValue)
		Else
			LegislationMandatesProfileVersionSection.VAReviewFrequency = Guid.Empty
		End If

		If Not ddlAuthorReviewFreqLegislationMandates.SelectedValue.ToString() = String.Empty Then
			LegislationMandatesProfileVersionSection.AuthorReviewFrequency = New Guid(ddlAuthorReviewFreqLegislationMandates.SelectedValue)
		Else
			LegislationMandatesProfileVersionSection.AuthorReviewFrequency = Guid.Empty
		End If

		If Not ddlPolicyReviewStatusLegislationMandates.SelectedValue.ToString() = String.Empty Then
			LegislationMandatesProfileVersionSection.PolicyReviewStatusId = New Guid(ddlPolicyReviewStatusLegislationMandates.SelectedValue)
		Else
			LegislationMandatesProfileVersionSection.PolicyReviewStatusId = Guid.Empty
		End If

		If Not ddlVAReviewStatusLegislationMandates.SelectedValue.ToString() = String.Empty Then
			LegislationMandatesProfileVersionSection.VAReviewStatusId = New Guid(ddlVAReviewStatusLegislationMandates.SelectedValue)
		Else
			LegislationMandatesProfileVersionSection.VAReviewStatusId = Guid.Empty
		End If

		If Not ddlAuthorReviewStatusLegislationMandates.SelectedValue.ToString() = String.Empty Then
			LegislationMandatesProfileVersionSection.AuthorReviewStatusId = New Guid(ddlAuthorReviewStatusLegislationMandates.SelectedValue)
		Else
			LegislationMandatesProfileVersionSection.AuthorReviewStatusId = (Guid.Empty)
		End If
		'-------------------------------------------------------------------------------------------------------------------------------------------------------------------
		If Not ddlPolicyReviewFreqApproachControl.SelectedValue.ToString() = String.Empty Then
			ApproachControlProfileVersionSection.PolicyReviewFrequency = New Guid(ddlPolicyReviewFreqApproachControl.SelectedValue)
		Else
			ApproachControlProfileVersionSection.PolicyReviewFrequency = Guid.Empty
		End If

		If Not ddlVAReviewFreqApproachControl.SelectedValue.ToString() = String.Empty Then
			ApproachControlProfileVersionSection.VAReviewFrequency = New Guid(ddlVAReviewFreqApproachControl.SelectedValue)
		Else
			ApproachControlProfileVersionSection.VAReviewFrequency = Guid.Empty
		End If

		If Not ddlAuthorReviewFreqApproachControl.SelectedValue.ToString() = String.Empty Then
			ApproachControlProfileVersionSection.AuthorReviewFrequency = New Guid(ddlAuthorReviewFreqApproachControl.SelectedValue)
		Else
			ApproachControlProfileVersionSection.AuthorReviewFrequency = Guid.Empty
		End If

		If Not ddlPolicyReviewStatusApproachControl.SelectedValue.ToString() = String.Empty Then
			ApproachControlProfileVersionSection.PolicyReviewStatusId = New Guid(ddlPolicyReviewStatusApproachControl.SelectedValue)
		Else
			ApproachControlProfileVersionSection.PolicyReviewStatusId = Guid.Empty
		End If

		If Not ddlVAReviewStatusApproachControl.SelectedValue.ToString() = String.Empty Then
			ApproachControlProfileVersionSection.VAReviewStatusId = New Guid(ddlVAReviewStatusApproachControl.SelectedValue)
		Else
			ApproachControlProfileVersionSection.VAReviewStatusId = Guid.Empty
		End If

		If Not ddlAuthorReviewStatusApproachControl.SelectedValue.ToString() = String.Empty Then
			ApproachControlProfileVersionSection.AuthorReviewStatusId = New Guid(ddlAuthorReviewStatusApproachControl.SelectedValue)
		Else
			ApproachControlProfileVersionSection.AuthorReviewStatusId = (Guid.Empty)
		End If
		'-------------------------------------------------------------------------------------------------------------------------------------------------------------------
		If Not ddlPolicyReviewFreqRiskAssessment.SelectedValue.ToString() = String.Empty Then
			RiskAssessmentProfileVersionSection.PolicyReviewFrequency = New Guid(ddlPolicyReviewFreqRiskAssessment.SelectedValue)
		Else
			RiskAssessmentProfileVersionSection.PolicyReviewFrequency = Guid.Empty
		End If

		If Not ddlVAReviewFreqRiskAssessment.SelectedValue.ToString() = String.Empty Then
			RiskAssessmentProfileVersionSection.VAReviewFrequency = New Guid(ddlVAReviewFreqRiskAssessment.SelectedValue)
		Else
			RiskAssessmentProfileVersionSection.VAReviewFrequency = Guid.Empty
		End If

		If Not ddlAuthorReviewFreqRiskAssessment.SelectedValue.ToString() = String.Empty Then
			RiskAssessmentProfileVersionSection.AuthorReviewFrequency = New Guid(ddlAuthorReviewFreqRiskAssessment.SelectedValue)
		Else
			RiskAssessmentProfileVersionSection.AuthorReviewFrequency = Guid.Empty
		End If

		If Not ddlPolicyReviewStatusRiskAssessment.SelectedValue.ToString() = String.Empty Then
			RiskAssessmentProfileVersionSection.PolicyReviewStatusId = New Guid(ddlPolicyReviewStatusRiskAssessment.SelectedValue)
		Else
			RiskAssessmentProfileVersionSection.PolicyReviewStatusId = Guid.Empty
		End If

		If Not ddlVAReviewStatusRiskAssessment.SelectedValue.ToString() = String.Empty Then
			RiskAssessmentProfileVersionSection.VAReviewStatusId = New Guid(ddlVAReviewStatusRiskAssessment.SelectedValue)
		Else
			RiskAssessmentProfileVersionSection.VAReviewStatusId = Guid.Empty
		End If

		If Not ddlAuthorReviewStatusRiskAssessment.SelectedValue.ToString() = String.Empty Then
			RiskAssessmentProfileVersionSection.AuthorReviewStatusId = New Guid(ddlAuthorReviewStatusRiskAssessment.SelectedValue)
		Else
			RiskAssessmentProfileVersionSection.AuthorReviewStatusId = (Guid.Empty)
		End If
		'-------------------------------------------------------------------------------------------------------------------------------------------------------------------
		If Not ddlPolicyReviewFreqLaboratories.SelectedValue.ToString() = String.Empty Then
			LaboratoriesProfileVersionSection.PolicyReviewFrequency = New Guid(ddlPolicyReviewFreqLaboratories.SelectedValue)
		Else
			LaboratoriesProfileVersionSection.PolicyReviewFrequency = Guid.Empty
		End If

		If Not ddlVAReviewFreqLaboratories.SelectedValue.ToString() = String.Empty Then
			LaboratoriesProfileVersionSection.VAReviewFrequency = New Guid(ddlVAReviewFreqLaboratories.SelectedValue)
		Else
			LaboratoriesProfileVersionSection.VAReviewFrequency = Guid.Empty
		End If

		If Not ddlAuthorReviewFreqLaboratories.SelectedValue.ToString() = String.Empty Then
			LaboratoriesProfileVersionSection.AuthorReviewFrequency = New Guid(ddlAuthorReviewFreqLaboratories.SelectedValue)
		Else
			LaboratoriesProfileVersionSection.AuthorReviewFrequency = Guid.Empty
		End If

		If Not ddlPolicyReviewStatusLaboratories.SelectedValue.ToString() = String.Empty Then
			LaboratoriesProfileVersionSection.PolicyReviewStatusId = New Guid(ddlPolicyReviewStatusLaboratories.SelectedValue)
		Else
			LaboratoriesProfileVersionSection.PolicyReviewStatusId = Guid.Empty
		End If

		If Not ddlVAReviewStatusLaboratories.SelectedValue.ToString() = String.Empty Then
			LaboratoriesProfileVersionSection.VAReviewStatusId = New Guid(ddlVAReviewStatusLaboratories.SelectedValue)
		Else
			LaboratoriesProfileVersionSection.VAReviewStatusId = Guid.Empty
		End If

		If Not ddlAuthorReviewStatusLaboratories.SelectedValue.ToString() = String.Empty Then
			LaboratoriesProfileVersionSection.AuthorReviewStatusId = New Guid(ddlAuthorReviewStatusLaboratories.SelectedValue)
		Else
			LaboratoriesProfileVersionSection.AuthorReviewStatusId = (Guid.Empty)
		End If
		'-------------------------------------------------------------------------------------------------------------------------------------------------------------------
		If Not ddlPolicyReviewFreqSurveillance.SelectedValue.ToString() = String.Empty Then
			SurveillanceProfileVersionSection.PolicyReviewFrequency = New Guid(ddlPolicyReviewFreqSurveillance.SelectedValue)
		Else
			SurveillanceProfileVersionSection.PolicyReviewFrequency = Guid.Empty
		End If

		If Not ddlVAReviewFreqSurveillance.SelectedValue.ToString() = String.Empty Then
			SurveillanceProfileVersionSection.VAReviewFrequency = New Guid(ddlVAReviewFreqSurveillance.SelectedValue)
		Else
			SurveillanceProfileVersionSection.VAReviewFrequency = Guid.Empty
		End If

		If Not ddlAuthorReviewFreqSurveillance.SelectedValue.ToString() = String.Empty Then
			SurveillanceProfileVersionSection.AuthorReviewFrequency = New Guid(ddlAuthorReviewFreqSurveillance.SelectedValue)
		Else
			SurveillanceProfileVersionSection.AuthorReviewFrequency = Guid.Empty
		End If

		If Not ddlPolicyReviewStatusSurveillance.SelectedValue.ToString() = String.Empty Then
			SurveillanceProfileVersionSection.PolicyReviewStatusId = New Guid(ddlPolicyReviewStatusSurveillance.SelectedValue)
		Else
			SurveillanceProfileVersionSection.PolicyReviewStatusId = Guid.Empty
		End If

		If Not ddlVAReviewStatusSurveillance.SelectedValue.ToString() = String.Empty Then
			SurveillanceProfileVersionSection.VAReviewStatusId = New Guid(ddlVAReviewStatusSurveillance.SelectedValue)
		Else
			SurveillanceProfileVersionSection.VAReviewStatusId = Guid.Empty
		End If

		If Not ddlAuthorReviewStatusSurveillance.SelectedValue.ToString() = String.Empty Then
			SurveillanceProfileVersionSection.AuthorReviewStatusId = New Guid(ddlAuthorReviewStatusSurveillance.SelectedValue)
		Else
			SurveillanceProfileVersionSection.AuthorReviewStatusId = (Guid.Empty)
		End If
		'-------------------------------------------------------------------------------------------------------------------------------------------------------------------
		If Not ddlPolicyReviewFreqInternationalTrade.SelectedValue.ToString() = String.Empty Then
			InternationalTradeProfileVersionSection.PolicyReviewFrequency = New Guid(ddlPolicyReviewFreqInternationalTrade.SelectedValue)
		Else
			InternationalTradeProfileVersionSection.PolicyReviewFrequency = Guid.Empty
		End If

		If Not ddlVAReviewFreqInternationalTrade.SelectedValue.ToString() = String.Empty Then
			InternationalTradeProfileVersionSection.VAReviewFrequency = New Guid(ddlVAReviewFreqInternationalTrade.SelectedValue)
		Else
			InternationalTradeProfileVersionSection.VAReviewFrequency = Guid.Empty
		End If

		If Not ddlAuthorReviewFreqInternationalTrade.SelectedValue.ToString() = String.Empty Then
			InternationalTradeProfileVersionSection.AuthorReviewFrequency = New Guid(ddlAuthorReviewFreqInternationalTrade.SelectedValue)
		Else
			InternationalTradeProfileVersionSection.AuthorReviewFrequency = Guid.Empty
		End If

		If Not ddlPolicyReviewStatusInternationalTrade.SelectedValue.ToString() = String.Empty Then
			InternationalTradeProfileVersionSection.PolicyReviewStatusId = New Guid(ddlPolicyReviewStatusInternationalTrade.SelectedValue)
		Else
			InternationalTradeProfileVersionSection.PolicyReviewStatusId = Guid.Empty
		End If

		If Not ddlVAReviewStatusInternationalTrade.SelectedValue.ToString() = String.Empty Then
			InternationalTradeProfileVersionSection.VAReviewStatusId = New Guid(ddlVAReviewStatusInternationalTrade.SelectedValue)
		Else
			InternationalTradeProfileVersionSection.VAReviewStatusId = Guid.Empty
		End If

		If Not ddlAuthorReviewStatusInternationalTrade.SelectedValue.ToString() = String.Empty Then
			InternationalTradeProfileVersionSection.AuthorReviewStatusId = New Guid(ddlAuthorReviewStatusInternationalTrade.SelectedValue)
		Else
			InternationalTradeProfileVersionSection.AuthorReviewStatusId = (Guid.Empty)
		End If
		'-------------------------------------------------------------------------------------------------------------------------------------------------------------------
		If Not ddlPolicyReviewFreqOpportunity.SelectedValue.ToString() = String.Empty Then
			OpportunityProfileVersionSection.PolicyReviewFrequency = New Guid(ddlPolicyReviewFreqOpportunity.SelectedValue)
		Else
			OpportunityProfileVersionSection.PolicyReviewFrequency = Guid.Empty
		End If

		If Not ddlVAReviewFreqOpportunity.SelectedValue.ToString() = String.Empty Then
			OpportunityProfileVersionSection.VAReviewFrequency = New Guid(ddlVAReviewFreqOpportunity.SelectedValue)
		Else
			OpportunityProfileVersionSection.VAReviewFrequency = Guid.Empty
		End If

		If Not ddlAuthorReviewFreqOpportunity.SelectedValue.ToString() = String.Empty Then
			OpportunityProfileVersionSection.AuthorReviewFrequency = New Guid(ddlAuthorReviewFreqOpportunity.SelectedValue)
		Else
			OpportunityProfileVersionSection.AuthorReviewFrequency = Guid.Empty
		End If

		If Not ddlPolicyReviewStatusOpportunity.SelectedValue.ToString() = String.Empty Then
			OpportunityProfileVersionSection.PolicyReviewStatusId = New Guid(ddlPolicyReviewStatusOpportunity.SelectedValue)
		Else
			OpportunityProfileVersionSection.PolicyReviewStatusId = Guid.Empty
		End If

		If Not ddlVAReviewStatusOpportunity.SelectedValue.ToString() = String.Empty Then
			OpportunityProfileVersionSection.VAReviewStatusId = New Guid(ddlVAReviewStatusOpportunity.SelectedValue)
		Else
			OpportunityProfileVersionSection.VAReviewStatusId = Guid.Empty
		End If

		If Not ddlAuthorReviewStatusOpportunity.SelectedValue.ToString() = String.Empty Then
			OpportunityProfileVersionSection.AuthorReviewStatusId = New Guid(ddlAuthorReviewStatusOpportunity.SelectedValue)
		Else
			OpportunityProfileVersionSection.AuthorReviewStatusId = (Guid.Empty)
		End If
		'-------------------------------------------------------------------------------------------------------------------------------------------------------------------
		If Not ddlPolicyReviewFreqPublicAndStakeholderPerception.SelectedValue.ToString() = String.Empty Then
			PublicAndStakeholderPerceptionProfileVersionSection.PolicyReviewFrequency = New Guid(ddlPolicyReviewFreqPublicAndStakeholderPerception.SelectedValue)
		Else
			PublicAndStakeholderPerceptionProfileVersionSection.PolicyReviewFrequency = Guid.Empty
		End If

		If Not ddlVAReviewFreqPublicAndStakeholderPerception.SelectedValue.ToString() = String.Empty Then
			PublicAndStakeholderPerceptionProfileVersionSection.VAReviewFrequency = New Guid(ddlVAReviewFreqPublicAndStakeholderPerception.SelectedValue)
		Else
			PublicAndStakeholderPerceptionProfileVersionSection.VAReviewFrequency = Guid.Empty
		End If

		If Not ddlAuthorReviewFreqPublicAndStakeholderPerception.SelectedValue.ToString() = String.Empty Then
			PublicAndStakeholderPerceptionProfileVersionSection.AuthorReviewFrequency = New Guid(ddlAuthorReviewFreqPublicAndStakeholderPerception.SelectedValue)
		Else
			PublicAndStakeholderPerceptionProfileVersionSection.AuthorReviewFrequency = Guid.Empty
		End If

		If Not ddlPolicyReviewStatusPublicAndStakeholderPerception.SelectedValue.ToString() = String.Empty Then
			PublicAndStakeholderPerceptionProfileVersionSection.PolicyReviewStatusId = New Guid(ddlPolicyReviewStatusPublicAndStakeholderPerception.SelectedValue)
		Else
			PublicAndStakeholderPerceptionProfileVersionSection.PolicyReviewStatusId = Guid.Empty
		End If

		If Not ddlVAReviewStatusPublicAndStakeholderPerception.SelectedValue.ToString() = String.Empty Then
			PublicAndStakeholderPerceptionProfileVersionSection.VAReviewStatusId = New Guid(ddlVAReviewStatusPublicAndStakeholderPerception.SelectedValue)
		Else
			PublicAndStakeholderPerceptionProfileVersionSection.VAReviewStatusId = Guid.Empty
		End If

		If Not ddlAuthorReviewStatusPublicAndStakeholderPerception.SelectedValue.ToString() = String.Empty Then
			PublicAndStakeholderPerceptionProfileVersionSection.AuthorReviewStatusId = New Guid(ddlAuthorReviewStatusPublicAndStakeholderPerception.SelectedValue)
		Else
			PublicAndStakeholderPerceptionProfileVersionSection.AuthorReviewStatusId = (Guid.Empty)
		End If
		'-------------------------------------------------------------------------------------------------------------------------------------------------------------------
		If Not ddlPolicyReviewFreqAreasOfUncertainty.SelectedValue.ToString() = String.Empty Then
			AreasOfUncertaintyProfileVersionSection.PolicyReviewFrequency = New Guid(ddlPolicyReviewFreqAreasOfUncertainty.SelectedValue)
		Else
			AreasOfUncertaintyProfileVersionSection.PolicyReviewFrequency = Guid.Empty
		End If

		If Not ddlVAReviewFreqAreasOfUncertainty.SelectedValue.ToString() = String.Empty Then
			AreasOfUncertaintyProfileVersionSection.VAReviewFrequency = New Guid(ddlVAReviewFreqAreasOfUncertainty.SelectedValue)
		Else
			AreasOfUncertaintyProfileVersionSection.VAReviewFrequency = Guid.Empty
		End If

		If Not ddlAuthorReviewFreqAreasOfUncertainty.SelectedValue.ToString() = String.Empty Then
			AreasOfUncertaintyProfileVersionSection.AuthorReviewFrequency = New Guid(ddlAuthorReviewFreqAreasOfUncertainty.SelectedValue)
		Else
			AreasOfUncertaintyProfileVersionSection.AuthorReviewFrequency = Guid.Empty
		End If

		If Not ddlPolicyReviewStatusAreasOfUncertainty.SelectedValue.ToString() = String.Empty Then
			AreasOfUncertaintyProfileVersionSection.PolicyReviewStatusId = New Guid(ddlPolicyReviewStatusAreasOfUncertainty.SelectedValue)
		Else
			AreasOfUncertaintyProfileVersionSection.PolicyReviewStatusId = Guid.Empty
		End If

		If Not ddlVAReviewStatusAreasOfUncertainty.SelectedValue.ToString() = String.Empty Then
			AreasOfUncertaintyProfileVersionSection.VAReviewStatusId = New Guid(ddlVAReviewStatusAreasOfUncertainty.SelectedValue)
		Else
			AreasOfUncertaintyProfileVersionSection.VAReviewStatusId = Guid.Empty
		End If

		If Not ddlAuthorReviewStatusAreasOfUncertainty.SelectedValue.ToString() = String.Empty Then
			AreasOfUncertaintyProfileVersionSection.AuthorReviewStatusId = New Guid(ddlAuthorReviewStatusAreasOfUncertainty.SelectedValue)
		Else
			AreasOfUncertaintyProfileVersionSection.AuthorReviewStatusId = (Guid.Empty)
		End If

	End Sub

	Private Function PersistSectionInfoToDatabase() As Boolean

		PersistSectionInfoToProfileVersion()

		Try
			SummaryProfileVersionSection.Save()
			GeographicDistributionLevelsDiseaseProfileVersionSection.Save()
			EpidemiologyProfileVersionSection.Save()
			CharacteristicsAgentProfileVersionSection.Save()
			AnimalWelfareProfileVersionSection.Save()
			HumanHealthProfileVersionSection.Save()
			WiderSocietyProfileVersionSection.Save()
			LegislationMandatesProfileVersionSection.Save()
			ApproachControlProfileVersionSection.Save()
			RiskAssessmentProfileVersionSection.Save()
			LaboratoriesProfileVersionSection.Save()
			SurveillanceProfileVersionSection.Save()
			InternationalTradeProfileVersionSection.Save()
			OpportunityProfileVersionSection.Save()
			PublicAndStakeholderPerceptionProfileVersionSection.Save()
			OpportunityProfileVersionSection.Save()
			AreasOfUncertaintyProfileVersionSection.Save()
			lblErrorDesc.Text = "Profile section save succeeded"
		Catch ex As Csla.DataPortalException
			lblErrorDesc.Text = "Profile section save failed: " + ex.BusinessException.Message
			Dim profileSectionList As ProfileSectionMetadataList = ProfileSectionMetadataList.GetProfileSectionMetadataList()
			Dim SummaryProfileSectionId As Guid = profileSectionList.Item(0).Id
			Dim GeographicDistributionLevelsDiseaseProfileSectionId As Guid = profileSectionList.Item(1).Id
			Dim EpidemiologyProfileSectionId As Guid = profileSectionList.Item(2).Id
			Dim CharacteristicsAgentProfileVersionSectionId As Guid = profileSectionList.Item(3).Id
			Dim AnimalWelfareProfileVersionSectionId As Guid = profileSectionList.Item(4).Id
			Dim HumanHealthProfileVersionSectionId As Guid = profileSectionList.Item(5).Id
			Dim WiderSocietyProfileVersionSectionId As Guid = profileSectionList.Item(6).Id
			Dim LegislationMandatesProfileVersionSectionId As Guid = profileSectionList.Item(7).Id
			Dim ApproachControlProfileVersionSectionId As Guid = profileSectionList.Item(8).Id
			Dim RiskAssessmentProfileVersionSectionId As Guid = profileSectionList.Item(9).Id
			Dim LaboratoriesProfileVersionSectionId As Guid = profileSectionList.Item(10).Id
			Dim SurveillanceProfileVersionSectionId As Guid = profileSectionList.Item(11).Id
			Dim InternationalTradeProfileVersionSectionId As Guid = profileSectionList.Item(12).Id
			Dim OpportunityProfileVersionSectionId As Guid = profileSectionList.Item(13).Id
			Dim PublicAndStakeholderPerceptionProfileVersionSectionId As Guid = profileSectionList.Item(14).Id
			Dim AreasOfUncertaintyProfileVersionSectionId As Guid = profileSectionList.Item(15).Id
			CurrentProfileVersionSection = ProfileVersionSection.GetProfileVersionSection(mProfileVersionInfo.Id, CurrentProfileSectionId)
			SummaryProfileVersionSection = ProfileVersionSection.GetProfileVersionSection(mProfileVersionInfo.Id, SummaryProfileSectionId)
			GeographicDistributionLevelsDiseaseProfileVersionSection = ProfileVersionSection.GetProfileVersionSection(mProfileVersionInfo.Id, GeographicDistributionLevelsDiseaseProfileSectionId)
			EpidemiologyProfileVersionSection = ProfileVersionSection.GetProfileVersionSection(mProfileVersionInfo.Id, EpidemiologyProfileSectionId)
			CharacteristicsAgentProfileVersionSection = ProfileVersionSection.GetProfileVersionSection(mProfileVersionInfo.Id, CharacteristicsAgentProfileVersionSectionId)
			AnimalWelfareProfileVersionSection = ProfileVersionSection.GetProfileVersionSection(mProfileVersionInfo.Id, AnimalWelfareProfileVersionSectionId)
			HumanHealthProfileVersionSection = ProfileVersionSection.GetProfileVersionSection(mProfileVersionInfo.Id, HumanHealthProfileVersionSectionId)
			WiderSocietyProfileVersionSection = ProfileVersionSection.GetProfileVersionSection(mProfileVersionInfo.Id, WiderSocietyProfileVersionSectionId)
			LegislationMandatesProfileVersionSection = ProfileVersionSection.GetProfileVersionSection(mProfileVersionInfo.Id, LegislationMandatesProfileVersionSectionId)
			ApproachControlProfileVersionSection = ProfileVersionSection.GetProfileVersionSection(mProfileVersionInfo.Id, ApproachControlProfileVersionSectionId)
			RiskAssessmentProfileVersionSection = ProfileVersionSection.GetProfileVersionSection(mProfileVersionInfo.Id, RiskAssessmentProfileVersionSectionId)
			LaboratoriesProfileVersionSection = ProfileVersionSection.GetProfileVersionSection(mProfileVersionInfo.Id, LaboratoriesProfileVersionSectionId)
			SurveillanceProfileVersionSection = ProfileVersionSection.GetProfileVersionSection(mProfileVersionInfo.Id, SurveillanceProfileVersionSectionId)
			InternationalTradeProfileVersionSection = ProfileVersionSection.GetProfileVersionSection(mProfileVersionInfo.Id, InternationalTradeProfileVersionSectionId)
			OpportunityProfileVersionSection = ProfileVersionSection.GetProfileVersionSection(mProfileVersionInfo.Id, OpportunityProfileVersionSectionId)
			PublicAndStakeholderPerceptionProfileVersionSection = ProfileVersionSection.GetProfileVersionSection(mProfileVersionInfo.Id, PublicAndStakeholderPerceptionProfileVersionSectionId)
			AreasOfUncertaintyProfileVersionSection = ProfileVersionSection.GetProfileVersionSection(mProfileVersionInfo.Id, AreasOfUncertaintyProfileVersionSectionId)
			SetUIValues()
			Return False
		End Try

		Return True

	End Function

#Region "Revision Dates"

	Protected Sub dsRevisionDates_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsRevisionDates.SelectObject

		e.BusinessObject = SectionReviewFrequencyList.GetList()

	End Sub

#End Region

#Region "Review Status"

	Protected Sub dsRevisionStatus_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsRevisionStatus.SelectObject

		e.BusinessObject = ReviewStatusTypeList.GetReviewStatusTypeList

	End Sub

#End Region

	Private nestedMaster As NestedProfileQuestions

	Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

		SetPageExpireImmediately(Response)

		'Dim master As ProfilesTemplate = Brute.Cast(Of ProfilesTemplate)(Me.Master)
		Dim master = CType(Page.Master.Master, ProfilesTemplate)

		nestedMaster = CType(Page.Master, NestedProfileQuestions)

		SetAccessibility()

		If Not Page.IsPostBack Then

			If Not CommonUI.IsValidGuid(Request.QueryString("ProfileVersionId")) Then
				Throw New InvalidOperationException("There was an invalid or missing profile version id passed to the page.")
			End If

			Dim profileVersionId As Guid = New Guid(Request.QueryString("ProfileVersionId"))
			mProfileVersionInfo = ProfileVersionInfo.GetProfileVersionInfo(profileVersionId)
			Session("EditProfileVersionInfo") = mProfileVersionInfo
			mCanEditProfileVersionSection = ProfileVersionSection.CanEditProfileVersionSection(mProfileVersionInfo.Id, CurrentProfileSectionId)

			master.UpdateTitle(mProfileVersionInfo.Title.ToString().StripPTags)


			nestedMaster.SubTitle = mProfileVersionInfo.VersionToString()

			If Not CommonUI.IsValidGuid(Request.QueryString("ProfileSectionId")) Then
				Throw New InvalidOperationException("There was an invalid or missing profile section id passed to the page.")
			End If

			If Request.QueryString("ProfileSectionId") Is Nothing Then

				CurrentProfileSectionId = Guid.Empty
				CurrentProfileVersionSection = Nothing

			Else
				Dim profileSectionList As ProfileSectionMetadataList = ProfileSectionMetadataList.GetProfileSectionMetadataList()

				CurrentProfileSectionId = New Guid(Request.QueryString("ProfileSectionId"))
				Dim SummaryProfileSectionId As Guid = profileSectionList.Item(0).Id
				Dim GeographicDistributionLevelsDiseaseProfileSectionId As Guid = profileSectionList.Item(1).Id
				Dim EpidemiologyProfileSectionId As Guid = profileSectionList.Item(2).Id
				Dim CharacteristicsAgentProfileVersionSectionId As Guid = profileSectionList.Item(3).Id
				Dim AnimalWelfareProfileVersionSectionId As Guid = profileSectionList.Item(4).Id
				Dim HumanHealthProfileVersionSectionProfileVersionSectionId As Guid = profileSectionList.Item(5).Id
				Dim WiderSocietyProfileVersionSectionId As Guid = profileSectionList.Item(6).Id
				Dim LegislationMandatesProfileVersionSectionId As Guid = profileSectionList.Item(7).Id
				Dim ApproachControlProfileVersionSectionId As Guid = profileSectionList.Item(8).Id
				Dim RiskAssessmentProfileVersionSectionId As Guid = profileSectionList.Item(9).Id
				Dim LaboratoriesProfileVersionSectionId As Guid = profileSectionList.Item(10).Id
				Dim SurveillanceProfileVersionSectionId As Guid = profileSectionList.Item(11).Id
				Dim InternationalTradeProfileVersionSectionId As Guid = profileSectionList.Item(12).Id
				Dim OpportunityProfileVersionSectionId As Guid = profileSectionList.Item(13).Id
				Dim PublicAndStakeholderPerceptionProfileVersionSectionId As Guid = profileSectionList.Item(14).Id
				Dim AreasOfUncertaintyProfileVersionSectionId As Guid = profileSectionList.Item(15).Id

				CurrentProfileVersionSection = ProfileVersionSection.GetProfileVersionSection(mProfileVersionInfo.Id, CurrentProfileSectionId)
				SummaryProfileVersionSection = ProfileVersionSection.GetProfileVersionSection(mProfileVersionInfo.Id, SummaryProfileSectionId)
				GeographicDistributionLevelsDiseaseProfileVersionSection = ProfileVersionSection.GetProfileVersionSection(mProfileVersionInfo.Id, GeographicDistributionLevelsDiseaseProfileSectionId)
				EpidemiologyProfileVersionSection = ProfileVersionSection.GetProfileVersionSection(mProfileVersionInfo.Id, EpidemiologyProfileSectionId)
				CharacteristicsAgentProfileVersionSection = ProfileVersionSection.GetProfileVersionSection(mProfileVersionInfo.Id, CharacteristicsAgentProfileVersionSectionId)
				AnimalWelfareProfileVersionSection = ProfileVersionSection.GetProfileVersionSection(mProfileVersionInfo.Id, AnimalWelfareProfileVersionSectionId)
				HumanHealthProfileVersionSection = ProfileVersionSection.GetProfileVersionSection(mProfileVersionInfo.Id, HumanHealthProfileVersionSectionProfileVersionSectionId)
				WiderSocietyProfileVersionSection = ProfileVersionSection.GetProfileVersionSection(mProfileVersionInfo.Id, WiderSocietyProfileVersionSectionId)
				LegislationMandatesProfileVersionSection = ProfileVersionSection.GetProfileVersionSection(mProfileVersionInfo.Id, LegislationMandatesProfileVersionSectionId)
				ApproachControlProfileVersionSection = ProfileVersionSection.GetProfileVersionSection(mProfileVersionInfo.Id, ApproachControlProfileVersionSectionId)
				RiskAssessmentProfileVersionSection = ProfileVersionSection.GetProfileVersionSection(mProfileVersionInfo.Id, RiskAssessmentProfileVersionSectionId)
				LaboratoriesProfileVersionSection = ProfileVersionSection.GetProfileVersionSection(mProfileVersionInfo.Id, LaboratoriesProfileVersionSectionId)
				SurveillanceProfileVersionSection = ProfileVersionSection.GetProfileVersionSection(mProfileVersionInfo.Id, SurveillanceProfileVersionSectionId)
				InternationalTradeProfileVersionSection = ProfileVersionSection.GetProfileVersionSection(mProfileVersionInfo.Id, InternationalTradeProfileVersionSectionId)
				OpportunityProfileVersionSection = ProfileVersionSection.GetProfileVersionSection(mProfileVersionInfo.Id, OpportunityProfileVersionSectionId)
				PublicAndStakeholderPerceptionProfileVersionSection = ProfileVersionSection.GetProfileVersionSection(mProfileVersionInfo.Id, PublicAndStakeholderPerceptionProfileVersionSectionId)
				AreasOfUncertaintyProfileVersionSection = ProfileVersionSection.GetProfileVersionSection(mProfileVersionInfo.Id, AreasOfUncertaintyProfileVersionSectionId)

				tabStrip.Tabs.Item(0).Text = CurrentProfileVersionSection.SectionShortName

				Dim profileData As ProfilesLibrary.Profile = ProfilesLibrary.Profile.GetProfile(mProfileVersionInfo.ProfileId)
				lnkPublish.Visible = profileData.CanPublish()
				lnkPublishPublic.Visible = profileData.CanPublishPublic()

				InitalizeSectionPanel(master)
			End If

			DisplayTopRightButtons()

		Else
			mProfileVersionInfo = Session("EditProfileVersionInfo")
			mCanEditProfileVersionSection = ProfileVersionSection.CanEditProfileVersionSection(mProfileVersionInfo.Id, CurrentProfileSectionId)
		End If

		tabStrip.Tabs.Item(0).Text = CurrentProfileVersionSection.FormattedSectionShortName
		tabStrip.Tabs.Item(3).Visible = ReviewCommentList.CanGetReviewCommentList(mProfileVersionInfo.Id)

		Dim profilesTemplateMaster = CType(Page.Master.Master, ProfilesTemplate)
		Breadcrumb.UpdateBreadcrumb(profilesTemplateMaster, mProfileVersionInfo.FullTitle, 4)

	End Sub

	Private Function GetAllControls(container As Control) As IEnumerable(Of Control)
		Dim controls = container.Controls.Cast(Of Control)()
		Return controls.SelectMany(Function(ctrl) GetAllControls(ctrl)).Concat(controls)
	End Function

	Private Sub SetAccessibility()
		Dim allControls = GetAllControls(Me)

		Dim labels = allControls.OfType(Of Label)().Where(Function(x)
															  Return x.Text <> String.Empty AndAlso x.Text <> "*"
														  End Function).ToList

		Dim textBoxes = allControls.OfType(Of TextBox)().ToList

		Dim dropdowns = allControls.OfType(Of DropDownList)().ToList

		textBoxes.ForEach(Sub(control)
							  control.CssClass = "govuk-input w-auto"
							  control.Attributes("aria-label") = "Date"
						  End Sub)

		dropdowns.ForEach(Sub(control)
							  control.CssClass = "govuk-select"
						  End Sub)

		labels.ForEach(Sub(label)
						   label.CssClass = "govuk-label d-inline me-2"

						   Dim possibleDropdown = dropdowns.SingleOrDefault(Function(y)
																				Return label.ID.Replace("lbl", "ddl") = y.ID
																			End Function)

						   Dim possibleTextBox = textBoxes.SingleOrDefault(Function(y)
																			   Return label.ID.Replace("lbl", "txt") = y.ID
																		   End Function)

						   Dim foundControl As Control = If(possibleDropdown Is Nothing, possibleTextBox, possibleDropdown)

						   If foundControl IsNot Nothing Then
							   label.AssociatedControlID = foundControl.ID
						   End If
					   End Sub)
	End Sub

	Private Sub DisplayTopRightButtons()

		btnSave.Visible = mCanEditProfileVersionSection
		btnSave2.Visible = mCanEditProfileVersionSection

	End Sub

	Private Sub InitalizeSectionPanel(ByVal master As ProfilesTemplate)

		SetUIValues()

	End Sub

	Private Sub DisplayReadOnlyReviewFrequencies(ByVal isVisible As Boolean)
		lblVAReviewFreqSummary.Visible = isVisible
		lblPolicyReviewFreqSummary.Visible = isVisible
		lblAuthorReviewFreqSummary.Visible = isVisible
		lblItemVAReviewFreqSummary.Visible = isVisible
		lblItemPolicyReviewFreqSummary.Visible = isVisible
		lblItemAuthorReviewFreqSummary.Visible = isVisible

		lblVAReviewFreqGeographicDistributionLevelsDisease.Visible = isVisible
		lblPolicyReviewFreqGeographicDistributionLevelsDisease.Visible = isVisible
		lblAuthorReviewFreqGeographicDistributionLevelsDisease.Visible = isVisible
		lblItemVAReviewFreqGeographicDistributionLevelsDisease.Visible = isVisible
		lblItemPolicyReviewFreqGeographicDistributionLevelsDisease.Visible = isVisible
		lblItemAuthorReviewFreqGeographicDistributionLevelsDisease.Visible = isVisible

		lblVAReviewFreqEpidemiology.Visible = isVisible
		lblPolicyReviewFreqEpidemiology.Visible = isVisible
		lblAuthorReviewFreqEpidemiology.Visible = isVisible
		lblItemVAReviewFreqEpidemiology.Visible = isVisible
		lblItemPolicyReviewFreqEpidemiology.Visible = isVisible
		lblItemAuthorReviewFreqEpidemiology.Visible = isVisible

		lblVAReviewFreqCharacteristicsAgent.Visible = isVisible
		lblPolicyReviewFreqCharacteristicsAgent.Visible = isVisible
		lblAuthorReviewFreqCharacteristicsAgent.Visible = isVisible
		lblItemVAReviewFreqCharacteristicsAgent.Visible = isVisible
		lblItemPolicyReviewFreqCharacteristicsAgent.Visible = isVisible
		lblItemAuthorReviewFreqCharacteristicsAgent.Visible = isVisible

		lblVAReviewFreqAnimalWelfare.Visible = isVisible
		lblPolicyReviewFreqAnimalWelfare.Visible = isVisible
		lblAuthorReviewFreqAnimalWelfare.Visible = isVisible
		lblItemVAReviewFreqAnimalWelfare.Visible = isVisible
		lblItemPolicyReviewFreqAnimalWelfare.Visible = isVisible
		lblItemAuthorReviewFreqAnimalWelfare.Visible = isVisible

		lblVAReviewFreqHumanHealth.Visible = isVisible
		lblPolicyReviewFreqHumanHealth.Visible = isVisible
		lblAuthorReviewFreqHumanHealth.Visible = isVisible
		lblItemVAReviewFreqHumanHealth.Visible = isVisible
		lblItemPolicyReviewFreqHumanHealth.Visible = isVisible
		lblItemAuthorReviewFreqHumanHealth.Visible = isVisible

		lblVAReviewFreqWiderSociety.Visible = isVisible
		lblPolicyReviewFreqWiderSociety.Visible = isVisible
		lblAuthorReviewFreqWiderSociety.Visible = isVisible
		lblItemVAReviewFreqWiderSociety.Visible = isVisible
		lblItemPolicyReviewFreqWiderSociety.Visible = isVisible
		lblItemAuthorReviewFreqWiderSociety.Visible = isVisible

		lblVAReviewFreqLegislationMandates.Visible = isVisible
		lblPolicyReviewFreqLegislationMandates.Visible = isVisible
		lblAuthorReviewFreqLegislationMandates.Visible = isVisible
		lblItemVAReviewFreqLegislationMandates.Visible = isVisible
		lblItemPolicyReviewFreqLegislationMandates.Visible = isVisible
		lblItemAuthorReviewFreqLegislationMandates.Visible = isVisible

		lblVAReviewFreqApproachControl.Visible = isVisible
		lblPolicyReviewFreqApproachControl.Visible = isVisible
		lblAuthorReviewFreqApproachControl.Visible = isVisible
		lblItemVAReviewFreqApproachControl.Visible = isVisible
		lblItemPolicyReviewFreqApproachControl.Visible = isVisible
		lblItemAuthorReviewFreqApproachControl.Visible = isVisible

		lblVAReviewFreqRiskAssessment.Visible = isVisible
		lblPolicyReviewFreqRiskAssessment.Visible = isVisible
		lblAuthorReviewFreqRiskAssessment.Visible = isVisible
		lblItemVAReviewFreqRiskAssessment.Visible = isVisible
		lblItemPolicyReviewFreqRiskAssessment.Visible = isVisible
		lblItemAuthorReviewFreqRiskAssessment.Visible = isVisible

		lblVAReviewFreqLaboratories.Visible = isVisible
		lblPolicyReviewFreqLaboratories.Visible = isVisible
		lblAuthorReviewFreqLaboratories.Visible = isVisible
		lblItemVAReviewFreqLaboratories.Visible = isVisible
		lblItemPolicyReviewFreqLaboratories.Visible = isVisible
		lblItemAuthorReviewFreqLaboratories.Visible = isVisible

		lblVAReviewFreqSurveillance.Visible = isVisible
		lblPolicyReviewFreqSurveillance.Visible = isVisible
		lblAuthorReviewFreqSurveillance.Visible = isVisible
		lblItemVAReviewFreqSurveillance.Visible = isVisible
		lblItemPolicyReviewFreqSurveillance.Visible = isVisible
		lblItemAuthorReviewFreqSurveillance.Visible = isVisible

		lblVAReviewFreqInternationalTrade.Visible = isVisible
		lblPolicyReviewFreqInternationalTrade.Visible = isVisible
		lblAuthorReviewFreqInternationalTrade.Visible = isVisible
		lblItemVAReviewFreqInternationalTrade.Visible = isVisible
		lblItemPolicyReviewFreqInternationalTrade.Visible = isVisible
		lblItemAuthorReviewFreqInternationalTrade.Visible = isVisible

		lblVAReviewFreqOpportunity.Visible = isVisible
		lblPolicyReviewFreqOpportunity.Visible = isVisible
		lblAuthorReviewFreqOpportunity.Visible = isVisible
		lblItemVAReviewFreqOpportunity.Visible = isVisible
		lblItemPolicyReviewFreqOpportunity.Visible = isVisible
		lblItemAuthorReviewFreqOpportunity.Visible = isVisible

		lblVAReviewFreqPublicAndStakeholderPerception.Visible = isVisible
		lblPolicyReviewFreqPublicAndStakeholderPerception.Visible = isVisible
		lblAuthorReviewFreqPublicAndStakeholderPerception.Visible = isVisible
		lblItemVAReviewFreqPublicAndStakeholderPerception.Visible = isVisible
		lblItemPolicyReviewFreqPublicAndStakeholderPerception.Visible = isVisible
		lblItemAuthorReviewFreqPublicAndStakeholderPerception.Visible = isVisible

		lblVAReviewFreqAreasOfUncertainty.Visible = isVisible
		lblPolicyReviewFreqAreasOfUncertainty.Visible = isVisible
		lblAuthorReviewFreqAreasOfUncertainty.Visible = isVisible
		lblItemVAReviewFreqAreasOfUncertainty.Visible = isVisible
		lblItemPolicyReviewFreqAreasOfUncertainty.Visible = isVisible
		lblItemAuthorReviewFreqAreasOfUncertainty.Visible = isVisible
	End Sub

	Private Sub DisplayEditableReviewFrequencies(ByVal isVisible As Boolean)
		lblVAReviewFreqSummary.Visible = isVisible
		lblPolicyReviewFreqSummary.Visible = isVisible
		lblAuthorReviewFreqSummary.Visible = isVisible
		ddlVAReviewFreqSummary.Visible = isVisible
		ddlPolicyReviewFreqSummary.Visible = isVisible
		ddlAuthorReviewFreqSummary.Visible = isVisible

		lblVAReviewFreqGeographicDistributionLevelsDisease.Visible = isVisible
		lblPolicyReviewFreqGeographicDistributionLevelsDisease.Visible = isVisible
		lblAuthorReviewFreqGeographicDistributionLevelsDisease.Visible = isVisible
		ddlVAReviewFreqGeographicDistributionLevelsDisease.Visible = isVisible
		ddlPolicyReviewFreqGeographicDistributionLevelsDisease.Visible = isVisible
		ddlAuthorReviewFreqGeographicDistributionLevelsDisease.Visible = isVisible

		lblVAReviewFreqEpidemiology.Visible = isVisible
		lblPolicyReviewFreqEpidemiology.Visible = isVisible
		lblAuthorReviewFreqEpidemiology.Visible = isVisible
		ddlVAReviewFreqEpidemiology.Visible = isVisible
		ddlPolicyReviewFreqEpidemiology.Visible = isVisible
		ddlAuthorReviewFreqEpidemiology.Visible = isVisible

		lblVAReviewFreqCharacteristicsAgent.Visible = isVisible
		lblPolicyReviewFreqCharacteristicsAgent.Visible = isVisible
		lblAuthorReviewFreqCharacteristicsAgent.Visible = isVisible
		ddlVAReviewFreqCharacteristicsAgent.Visible = isVisible
		ddlPolicyReviewFreqCharacteristicsAgent.Visible = isVisible
		ddlAuthorReviewFreqCharacteristicsAgent.Visible = isVisible

		lblVAReviewFreqAnimalWelfare.Visible = isVisible
		lblPolicyReviewFreqAnimalWelfare.Visible = isVisible
		lblAuthorReviewFreqAnimalWelfare.Visible = isVisible
		ddlVAReviewFreqAnimalWelfare.Visible = isVisible
		ddlPolicyReviewFreqAnimalWelfare.Visible = isVisible
		ddlAuthorReviewFreqAnimalWelfare.Visible = isVisible

		lblVAReviewFreqHumanHealth.Visible = isVisible
		lblPolicyReviewFreqHumanHealth.Visible = isVisible
		lblAuthorReviewFreqHumanHealth.Visible = isVisible
		ddlVAReviewFreqHumanHealth.Visible = isVisible
		ddlPolicyReviewFreqHumanHealth.Visible = isVisible
		ddlAuthorReviewFreqHumanHealth.Visible = isVisible

		lblVAReviewFreqWiderSociety.Visible = isVisible
		lblPolicyReviewFreqWiderSociety.Visible = isVisible
		lblAuthorReviewFreqWiderSociety.Visible = isVisible
		ddlVAReviewFreqWiderSociety.Visible = isVisible
		ddlPolicyReviewFreqWiderSociety.Visible = isVisible
		ddlAuthorReviewFreqWiderSociety.Visible = isVisible

		lblVAReviewFreqLegislationMandates.Visible = isVisible
		lblPolicyReviewFreqLegislationMandates.Visible = isVisible
		lblAuthorReviewFreqLegislationMandates.Visible = isVisible
		ddlVAReviewFreqLegislationMandates.Visible = isVisible
		ddlPolicyReviewFreqLegislationMandates.Visible = isVisible
		ddlAuthorReviewFreqLegislationMandates.Visible = isVisible

		lblVAReviewFreqApproachControl.Visible = isVisible
		lblPolicyReviewFreqApproachControl.Visible = isVisible
		lblAuthorReviewFreqApproachControl.Visible = isVisible
		ddlVAReviewFreqApproachControl.Visible = isVisible
		ddlPolicyReviewFreqApproachControl.Visible = isVisible
		ddlAuthorReviewFreqApproachControl.Visible = isVisible

		lblVAReviewFreqRiskAssessment.Visible = isVisible
		lblPolicyReviewFreqRiskAssessment.Visible = isVisible
		lblAuthorReviewFreqRiskAssessment.Visible = isVisible
		ddlVAReviewFreqRiskAssessment.Visible = isVisible
		ddlPolicyReviewFreqRiskAssessment.Visible = isVisible
		ddlAuthorReviewFreqRiskAssessment.Visible = isVisible

		lblVAReviewFreqLaboratories.Visible = isVisible
		lblPolicyReviewFreqLaboratories.Visible = isVisible
		lblAuthorReviewFreqLaboratories.Visible = isVisible
		ddlVAReviewFreqLaboratories.Visible = isVisible
		ddlPolicyReviewFreqLaboratories.Visible = isVisible
		ddlAuthorReviewFreqLaboratories.Visible = isVisible

		lblVAReviewFreqSurveillance.Visible = isVisible
		lblPolicyReviewFreqSurveillance.Visible = isVisible
		lblAuthorReviewFreqSurveillance.Visible = isVisible
		ddlVAReviewFreqSurveillance.Visible = isVisible
		ddlPolicyReviewFreqSurveillance.Visible = isVisible
		ddlAuthorReviewFreqSurveillance.Visible = isVisible

		lblVAReviewFreqInternationalTrade.Visible = isVisible
		lblPolicyReviewFreqInternationalTrade.Visible = isVisible
		lblAuthorReviewFreqInternationalTrade.Visible = isVisible
		ddlVAReviewFreqInternationalTrade.Visible = isVisible
		ddlPolicyReviewFreqInternationalTrade.Visible = isVisible
		ddlAuthorReviewFreqInternationalTrade.Visible = isVisible

		lblVAReviewFreqOpportunity.Visible = isVisible
		lblPolicyReviewFreqOpportunity.Visible = isVisible
		lblAuthorReviewFreqOpportunity.Visible = isVisible
		ddlVAReviewFreqOpportunity.Visible = isVisible
		ddlPolicyReviewFreqOpportunity.Visible = isVisible
		ddlAuthorReviewFreqOpportunity.Visible = isVisible

		lblVAReviewFreqPublicAndStakeholderPerception.Visible = isVisible
		lblPolicyReviewFreqPublicAndStakeholderPerception.Visible = isVisible
		lblAuthorReviewFreqPublicAndStakeholderPerception.Visible = isVisible
		ddlVAReviewFreqPublicAndStakeholderPerception.Visible = isVisible
		ddlPolicyReviewFreqPublicAndStakeholderPerception.Visible = isVisible
		ddlAuthorReviewFreqPublicAndStakeholderPerception.Visible = isVisible

		lblVAReviewFreqAreasOfUncertainty.Visible = isVisible
		lblPolicyReviewFreqAreasOfUncertainty.Visible = isVisible
		lblAuthorReviewFreqAreasOfUncertainty.Visible = isVisible
		ddlVAReviewFreqAreasOfUncertainty.Visible = isVisible
		ddlPolicyReviewFreqAreasOfUncertainty.Visible = isVisible
		ddlAuthorReviewFreqAreasOfUncertainty.Visible = isVisible
	End Sub

	Private Sub DisplayReadOnlyReviewDates(ByVal isVisible As Boolean)
		SetAllSections.Visible = False

		lblNextVAReviewSummary.Visible = isVisible
		lblNextPolicyReviewSummary.Visible = isVisible
		lblNextAuthorReviewSummary.Visible = isVisible
		lblItemNextVAReviewSummary.Visible = isVisible
		lblItemNextPolicyReviewSummary.Visible = isVisible
		lblItemNextAuthorReviewSummary.Visible = isVisible
		ImgCalNextVAReviewSummary.Visible = False
		ImgCalNextPolReviewSummary.Visible = False
		ImgCalNextAuthorReviewSummary.Visible = False

		lblNextVAReviewGeographicDistributionLevelsDisease.Visible = isVisible
		lblNextPolicyReviewGeographicDistributionLevelsDisease.Visible = isVisible
		lblNextAuthorReviewGeographicDistributionLevelsDisease.Visible = isVisible
		lblItemNextVAReviewGeographicDistributionLevelsDisease.Visible = isVisible
		lblItemNextPolicyReviewGeographicDistributionLevelsDisease.Visible = isVisible
		lblItemNextAuthorReviewGeographicDistributionLevelsDisease.Visible = isVisible
		ImgCalNextVAReviewGeographicDistributionLevelsDisease.Visible = False
		ImgCalNextPolReviewGeographicDistributionLevelsDisease.Visible = False
		ImgCalNextAuthorReviewGeographicDistributionLevelsDisease.Visible = False

		lblNextVAReviewEpidemiology.Visible = isVisible
		lblNextPolicyReviewEpidemiology.Visible = isVisible
		lblNextAuthorReviewEpidemiology.Visible = isVisible
		lblItemNextVAReviewEpidemiology.Visible = isVisible
		lblItemNextPolicyReviewEpidemiology.Visible = isVisible
		lblItemNextAuthorReviewEpidemiology.Visible = isVisible
		ImgCalNextVAReviewEpidemiology.Visible = False
		ImgCalNextPolReviewEpidemiology.Visible = False
		ImgCalNextAuthorReviewEpidemiology.Visible = False

		lblNextVAReviewCharacteristicsAgent.Visible = isVisible
		lblNextPolicyReviewCharacteristicsAgent.Visible = isVisible
		lblNextAuthorReviewCharacteristicsAgent.Visible = isVisible
		lblItemNextVAReviewCharacteristicsAgent.Visible = isVisible
		lblItemNextPolicyReviewCharacteristicsAgent.Visible = isVisible
		lblItemNextAuthorReviewCharacteristicsAgent.Visible = isVisible
		ImgCalNextVAReviewCharacteristicsAgent.Visible = False
		ImgCalNextPolReviewCharacteristicsAgent.Visible = False
		ImgCalNextAuthorReviewCharacteristicsAgent.Visible = False

		lblNextVAReviewAnimalWelfare.Visible = isVisible
		lblNextPolicyReviewAnimalWelfare.Visible = isVisible
		lblNextAuthorReviewAnimalWelfare.Visible = isVisible
		lblItemNextVAReviewAnimalWelfare.Visible = isVisible
		lblItemNextPolicyReviewAnimalWelfare.Visible = isVisible
		lblItemNextAuthorReviewAnimalWelfare.Visible = isVisible
		ImgCalNextVAReviewAnimalWelfare.Visible = False
		ImgCalNextPolReviewAnimalWelfare.Visible = False
		ImgCalNextAuthorReviewAnimalWelfare.Visible = False

		lblNextVAReviewHumanHealth.Visible = isVisible
		lblNextPolicyReviewHumanHealth.Visible = isVisible
		lblNextAuthorReviewHumanHealth.Visible = isVisible
		lblItemNextVAReviewHumanHealth.Visible = isVisible
		lblItemNextPolicyReviewHumanHealth.Visible = isVisible
		lblItemNextAuthorReviewHumanHealth.Visible = isVisible
		ImgCalNextVAReviewHumanHealth.Visible = False
		ImgCalNextPolReviewHumanHealth.Visible = False
		ImgCalNextAuthorReviewHumanHealth.Visible = False

		lblNextVAReviewWiderSociety.Visible = isVisible
		lblNextPolicyReviewWiderSociety.Visible = isVisible
		lblNextAuthorReviewWiderSociety.Visible = isVisible
		lblItemNextVAReviewWiderSociety.Visible = isVisible
		lblItemNextPolicyReviewWiderSociety.Visible = isVisible
		lblItemNextAuthorReviewWiderSociety.Visible = isVisible
		ImgCalNextVAReviewWiderSociety.Visible = False
		ImgCalNextPolReviewWiderSociety.Visible = False
		ImgCalNextAuthorReviewWiderSociety.Visible = False

		lblNextVAReviewLegislationMandates.Visible = isVisible
		lblNextPolicyReviewLegislationMandates.Visible = isVisible
		lblNextAuthorReviewLegislationMandates.Visible = isVisible
		lblItemNextVAReviewLegislationMandates.Visible = isVisible
		lblItemNextPolicyReviewLegislationMandates.Visible = isVisible
		lblItemNextAuthorReviewLegislationMandates.Visible = isVisible
		ImgCalNextVAReviewLegislationMandates.Visible = False
		ImgCalNextPolReviewLegislationMandates.Visible = False
		ImgCalNextAuthorReviewLegislationMandates.Visible = False

		lblNextVAReviewApproachControl.Visible = isVisible
		lblNextPolicyReviewApproachControl.Visible = isVisible
		lblNextAuthorReviewApproachControl.Visible = isVisible
		lblItemNextVAReviewApproachControl.Visible = isVisible
		lblItemNextPolicyReviewApproachControl.Visible = isVisible
		lblItemNextAuthorReviewApproachControl.Visible = isVisible
		ImgCalNextVAReviewApproachControl.Visible = False
		ImgCalNextPolReviewApproachControl.Visible = False
		ImgCalNextAuthorReviewApproachControl.Visible = False

		lblNextVAReviewRiskAssessment.Visible = isVisible
		lblNextPolicyReviewRiskAssessment.Visible = isVisible
		lblNextAuthorReviewRiskAssessment.Visible = isVisible
		lblItemNextVAReviewRiskAssessment.Visible = isVisible
		lblItemNextPolicyReviewRiskAssessment.Visible = isVisible
		lblItemNextAuthorReviewRiskAssessment.Visible = isVisible
		ImgCalNextVAReviewRiskAssessment.Visible = False
		ImgCalNextPolReviewRiskAssessment.Visible = False
		ImgCalNextAuthorReviewRiskAssessment.Visible = False

		lblNextVAReviewLaboratories.Visible = isVisible
		lblNextPolicyReviewLaboratories.Visible = isVisible
		lblNextAuthorReviewLaboratories.Visible = isVisible
		lblItemNextVAReviewLaboratories.Visible = isVisible
		lblItemNextPolicyReviewLaboratories.Visible = isVisible
		lblItemNextAuthorReviewLaboratories.Visible = isVisible
		ImgCalNextVAReviewLaboratories.Visible = False
		ImgCalNextPolReviewLaboratories.Visible = False
		ImgCalNextAuthorReviewLaboratories.Visible = False

		lblNextVAReviewSurveillance.Visible = isVisible
		lblNextPolicyReviewSurveillance.Visible = isVisible
		lblNextAuthorReviewSurveillance.Visible = isVisible
		lblItemNextVAReviewSurveillance.Visible = isVisible
		lblItemNextPolicyReviewSurveillance.Visible = isVisible
		lblItemNextAuthorReviewSurveillance.Visible = isVisible
		ImgCalNextVAReviewSurveillance.Visible = False
		ImgCalNextPolReviewSurveillance.Visible = False
		ImgCalNextAuthorReviewSurveillance.Visible = False

		lblNextVAReviewInternationalTrade.Visible = isVisible
		lblNextPolicyReviewInternationalTrade.Visible = isVisible
		lblNextAuthorReviewInternationalTrade.Visible = isVisible
		lblItemNextVAReviewInternationalTrade.Visible = isVisible
		lblItemNextPolicyReviewInternationalTrade.Visible = isVisible
		lblItemNextAuthorReviewInternationalTrade.Visible = isVisible
		ImgCalNextVAReviewInternationalTrade.Visible = False
		ImgCalNextPolReviewInternationalTrade.Visible = False
		ImgCalNextAuthorReviewInternationalTrade.Visible = False

		lblNextVAReviewOpportunity.Visible = isVisible
		lblNextPolicyReviewOpportunity.Visible = isVisible
		lblNextAuthorReviewOpportunity.Visible = isVisible
		lblItemNextVAReviewOpportunity.Visible = isVisible
		lblItemNextPolicyReviewOpportunity.Visible = isVisible
		lblItemNextAuthorReviewOpportunity.Visible = isVisible
		ImgCalNextVAReviewOpportunity.Visible = False
		ImgCalNextPolReviewOpportunity.Visible = False
		ImgCalNextAuthorReviewOpportunity.Visible = False

		lblNextVAReviewPublicAndStakeholderPerception.Visible = isVisible
		lblNextPolicyReviewPublicAndStakeholderPerception.Visible = isVisible
		lblNextAuthorReviewPublicAndStakeholderPerception.Visible = isVisible
		lblItemNextVAReviewPublicAndStakeholderPerception.Visible = isVisible
		lblItemNextPolicyReviewPublicAndStakeholderPerception.Visible = isVisible
		lblItemNextAuthorReviewPublicAndStakeholderPerception.Visible = isVisible
		ImgCalNextVAReviewPublicAndStakeholderPerception.Visible = False
		ImgCalNextPolReviewPublicAndStakeholderPerception.Visible = False
		ImgCalNextAuthorReviewPublicAndStakeholderPerception.Visible = False

		lblNextVAReviewAreasOfUncertainty.Visible = isVisible
		lblNextPolicyReviewAreasOfUncertainty.Visible = isVisible
		lblNextAuthorReviewAreasOfUncertainty.Visible = isVisible
		lblItemNextVAReviewAreasOfUncertainty.Visible = isVisible
		lblItemNextPolicyReviewAreasOfUncertainty.Visible = isVisible
		lblItemNextAuthorReviewAreasOfUncertainty.Visible = isVisible
		ImgCalNextVAReviewAreasOfUncertainty.Visible = False
		ImgCalNextPolReviewAreasOfUncertainty.Visible = False
		ImgCalNextAuthorReviewAreasOfUncertainty.Visible = False
	End Sub

	Private Sub DisplayEditableReviewDates(ByVal isVisible As Boolean)
		SetAllSections.Visible = isVisible

		lblNextVAReviewSummary.Visible = isVisible
		lblNextPolicyReviewSummary.Visible = isVisible
		lblNextAuthorReviewSummary.Visible = isVisible
		txtNextVAReviewSummary.Visible = isVisible
		txtNextPolicyReviewSummary.Visible = isVisible
		txtNextAuthorReviewSummary.Visible = isVisible
		ImgCalNextVAReviewSummary.Visible = isVisible
		ImgCalNextPolReviewSummary.Visible = isVisible
		ImgCalNextAuthorReviewSummary.Visible = isVisible

		lblNextVAReviewGeographicDistributionLevelsDisease.Visible = isVisible
		lblNextPolicyReviewGeographicDistributionLevelsDisease.Visible = isVisible
		lblNextAuthorReviewGeographicDistributionLevelsDisease.Visible = isVisible
		txtNextVAReviewGeographicDistributionLevelsDisease.Visible = isVisible
		txtNextPolicyReviewGeographicDistributionLevelsDisease.Visible = isVisible
		txtNextAuthorReviewGeographicDistributionLevelsDisease.Visible = isVisible
		ImgCalNextVAReviewGeographicDistributionLevelsDisease.Visible = isVisible
		ImgCalNextPolReviewGeographicDistributionLevelsDisease.Visible = isVisible
		ImgCalNextAuthorReviewGeographicDistributionLevelsDisease.Visible = isVisible

		lblNextVAReviewEpidemiology.Visible = isVisible
		lblNextPolicyReviewEpidemiology.Visible = isVisible
		lblNextAuthorReviewEpidemiology.Visible = isVisible
		txtNextVAReviewEpidemiology.Visible = isVisible
		txtNextPolicyReviewEpidemiology.Visible = isVisible
		txtNextAuthorReviewEpidemiology.Visible = isVisible
		ImgCalNextVAReviewEpidemiology.Visible = isVisible
		ImgCalNextPolReviewEpidemiology.Visible = isVisible
		ImgCalNextAuthorReviewEpidemiology.Visible = isVisible

		lblNextVAReviewCharacteristicsAgent.Visible = isVisible
		lblNextPolicyReviewCharacteristicsAgent.Visible = isVisible
		lblNextAuthorReviewCharacteristicsAgent.Visible = isVisible
		txtNextVAReviewCharacteristicsAgent.Visible = isVisible
		txtNextPolicyReviewCharacteristicsAgent.Visible = isVisible
		txtNextAuthorReviewCharacteristicsAgent.Visible = isVisible
		ImgCalNextVAReviewCharacteristicsAgent.Visible = isVisible
		ImgCalNextPolReviewCharacteristicsAgent.Visible = isVisible
		ImgCalNextAuthorReviewCharacteristicsAgent.Visible = isVisible

		lblNextVAReviewAnimalWelfare.Visible = isVisible
		lblNextPolicyReviewAnimalWelfare.Visible = isVisible
		lblNextAuthorReviewAnimalWelfare.Visible = isVisible
		txtNextVAReviewAnimalWelfare.Visible = isVisible
		txtNextPolicyReviewAnimalWelfare.Visible = isVisible
		txtNextAuthorReviewAnimalWelfare.Visible = isVisible
		ImgCalNextVAReviewAnimalWelfare.Visible = isVisible
		ImgCalNextPolReviewAnimalWelfare.Visible = isVisible
		ImgCalNextAuthorReviewAnimalWelfare.Visible = isVisible

		lblNextVAReviewHumanHealth.Visible = isVisible
		lblNextPolicyReviewHumanHealth.Visible = isVisible
		lblNextAuthorReviewHumanHealth.Visible = isVisible
		txtNextVAReviewHumanHealth.Visible = isVisible
		txtNextPolicyReviewHumanHealth.Visible = isVisible
		txtNextAuthorReviewHumanHealth.Visible = isVisible
		ImgCalNextVAReviewHumanHealth.Visible = isVisible
		ImgCalNextPolReviewHumanHealth.Visible = isVisible
		ImgCalNextAuthorReviewHumanHealth.Visible = isVisible

		lblNextVAReviewWiderSociety.Visible = isVisible
		lblNextPolicyReviewWiderSociety.Visible = isVisible
		lblNextAuthorReviewWiderSociety.Visible = isVisible
		txtNextVAReviewWiderSociety.Visible = isVisible
		txtNextPolicyReviewWiderSociety.Visible = isVisible
		txtNextAuthorReviewWiderSociety.Visible = isVisible
		ImgCalNextVAReviewWiderSociety.Visible = isVisible
		ImgCalNextPolReviewWiderSociety.Visible = isVisible
		ImgCalNextAuthorReviewWiderSociety.Visible = isVisible

		lblNextVAReviewLegislationMandates.Visible = isVisible
		lblNextPolicyReviewLegislationMandates.Visible = isVisible
		lblNextAuthorReviewLegislationMandates.Visible = isVisible
		txtNextVAReviewLegislationMandates.Visible = isVisible
		txtNextPolicyReviewLegislationMandates.Visible = isVisible
		txtNextAuthorReviewLegislationMandates.Visible = isVisible
		ImgCalNextVAReviewLegislationMandates.Visible = isVisible
		ImgCalNextPolReviewLegislationMandates.Visible = isVisible
		ImgCalNextAuthorReviewLegislationMandates.Visible = isVisible

		lblNextVAReviewApproachControl.Visible = isVisible
		lblNextPolicyReviewApproachControl.Visible = isVisible
		lblNextAuthorReviewApproachControl.Visible = isVisible
		txtNextVAReviewApproachControl.Visible = isVisible
		txtNextPolicyReviewApproachControl.Visible = isVisible
		txtNextAuthorReviewApproachControl.Visible = isVisible
		ImgCalNextVAReviewApproachControl.Visible = isVisible
		ImgCalNextPolReviewApproachControl.Visible = isVisible
		ImgCalNextAuthorReviewApproachControl.Visible = isVisible

		lblNextVAReviewRiskAssessment.Visible = isVisible
		lblNextPolicyReviewRiskAssessment.Visible = isVisible
		lblNextAuthorReviewRiskAssessment.Visible = isVisible
		txtNextVAReviewRiskAssessment.Visible = isVisible
		txtNextPolicyReviewRiskAssessment.Visible = isVisible
		txtNextAuthorReviewRiskAssessment.Visible = isVisible
		ImgCalNextVAReviewRiskAssessment.Visible = isVisible
		ImgCalNextPolReviewRiskAssessment.Visible = isVisible
		ImgCalNextAuthorReviewRiskAssessment.Visible = isVisible

		lblNextVAReviewLaboratories.Visible = isVisible
		lblNextPolicyReviewLaboratories.Visible = isVisible
		lblNextAuthorReviewLaboratories.Visible = isVisible
		txtNextVAReviewLaboratories.Visible = isVisible
		txtNextPolicyReviewLaboratories.Visible = isVisible
		txtNextAuthorReviewLaboratories.Visible = isVisible
		ImgCalNextVAReviewLaboratories.Visible = isVisible
		ImgCalNextPolReviewLaboratories.Visible = isVisible
		ImgCalNextAuthorReviewLaboratories.Visible = isVisible

		lblNextVAReviewSurveillance.Visible = isVisible
		lblNextPolicyReviewSurveillance.Visible = isVisible
		lblNextAuthorReviewSurveillance.Visible = isVisible
		txtNextVAReviewSurveillance.Visible = isVisible
		txtNextPolicyReviewSurveillance.Visible = isVisible
		txtNextAuthorReviewSurveillance.Visible = isVisible
		ImgCalNextVAReviewSurveillance.Visible = isVisible
		ImgCalNextPolReviewSurveillance.Visible = isVisible
		ImgCalNextAuthorReviewSurveillance.Visible = isVisible

		lblNextVAReviewInternationalTrade.Visible = isVisible
		lblNextPolicyReviewInternationalTrade.Visible = isVisible
		lblNextAuthorReviewInternationalTrade.Visible = isVisible
		txtNextVAReviewInternationalTrade.Visible = isVisible
		txtNextPolicyReviewInternationalTrade.Visible = isVisible
		txtNextAuthorReviewInternationalTrade.Visible = isVisible
		ImgCalNextVAReviewInternationalTrade.Visible = isVisible
		ImgCalNextPolReviewInternationalTrade.Visible = isVisible
		ImgCalNextAuthorReviewInternationalTrade.Visible = isVisible

		lblNextVAReviewOpportunity.Visible = isVisible
		lblNextPolicyReviewOpportunity.Visible = isVisible
		lblNextAuthorReviewOpportunity.Visible = isVisible
		txtNextVAReviewOpportunity.Visible = isVisible
		txtNextPolicyReviewOpportunity.Visible = isVisible
		txtNextAuthorReviewOpportunity.Visible = isVisible
		ImgCalNextVAReviewOpportunity.Visible = isVisible
		ImgCalNextPolReviewOpportunity.Visible = isVisible
		ImgCalNextAuthorReviewOpportunity.Visible = isVisible

		lblNextVAReviewPublicAndStakeholderPerception.Visible = isVisible
		lblNextPolicyReviewPublicAndStakeholderPerception.Visible = isVisible
		lblNextAuthorReviewPublicAndStakeholderPerception.Visible = isVisible
		txtNextVAReviewPublicAndStakeholderPerception.Visible = isVisible
		txtNextPolicyReviewPublicAndStakeholderPerception.Visible = isVisible
		txtNextAuthorReviewPublicAndStakeholderPerception.Visible = isVisible
		ImgCalNextVAReviewPublicAndStakeholderPerception.Visible = isVisible
		ImgCalNextPolReviewPublicAndStakeholderPerception.Visible = isVisible
		ImgCalNextAuthorReviewPublicAndStakeholderPerception.Visible = isVisible

		lblNextVAReviewAreasOfUncertainty.Visible = isVisible
		lblNextPolicyReviewAreasOfUncertainty.Visible = isVisible
		lblNextAuthorReviewAreasOfUncertainty.Visible = isVisible
		txtNextVAReviewAreasOfUncertainty.Visible = isVisible
		txtNextPolicyReviewAreasOfUncertainty.Visible = isVisible
		txtNextAuthorReviewAreasOfUncertainty.Visible = isVisible
		ImgCalNextVAReviewAreasOfUncertainty.Visible = isVisible
		ImgCalNextPolReviewAreasOfUncertainty.Visible = isVisible
		ImgCalNextAuthorReviewAreasOfUncertainty.Visible = isVisible
	End Sub

	Private Sub DisplayReadOnlyReviewStatuses(ByVal isVisible As Boolean)
		lblVAReviewStatusSummary.Visible = isVisible
		lblPolicyReviewStatusSummary.Visible = isVisible
		lblAuthorReviewStatusSummary.Visible = isVisible
		lblItemVAReviewStatusSummary.Visible = isVisible
		lblItemPolicyReviewStatusSummary.Visible = isVisible
		lblItemAuthorReviewStatusSummary.Visible = isVisible

		lblVAReviewStatusGeographicDistributionLevelsDisease.Visible = isVisible
		lblPolicyReviewStatusGeographicDistributionLevelsDisease.Visible = isVisible
		lblAuthorReviewStatusGeographicDistributionLevelsDisease.Visible = isVisible
		lblItemVAReviewStatusGeographicDistributionLevelsDisease.Visible = isVisible
		lblItemPolicyReviewStatusGeographicDistributionLevelsDisease.Visible = isVisible
		lblItemAuthorReviewStatusGeographicDistributionLevelsDisease.Visible = isVisible

		lblVAReviewStatusEpidemiology.Visible = isVisible
		lblPolicyReviewStatusEpidemiology.Visible = isVisible
		lblAuthorReviewStatusEpidemiology.Visible = isVisible
		lblItemVAReviewStatusEpidemiology.Visible = isVisible
		lblItemPolicyReviewStatusEpidemiology.Visible = isVisible
		lblItemAuthorReviewStatusEpidemiology.Visible = isVisible

		lblVAReviewStatusCharacteristicsAgent.Visible = isVisible
		lblPolicyReviewStatusCharacteristicsAgent.Visible = isVisible
		lblAuthorReviewStatusCharacteristicsAgent.Visible = isVisible
		lblItemVAReviewStatusCharacteristicsAgent.Visible = isVisible
		lblItemPolicyReviewStatusCharacteristicsAgent.Visible = isVisible
		lblItemAuthorReviewStatusCharacteristicsAgent.Visible = isVisible

		lblVAReviewStatusAnimalWelfare.Visible = isVisible
		lblPolicyReviewStatusAnimalWelfare.Visible = isVisible
		lblAuthorReviewStatusAnimalWelfare.Visible = isVisible
		lblItemVAReviewStatusAnimalWelfare.Visible = isVisible
		lblItemPolicyReviewStatusAnimalWelfare.Visible = isVisible
		lblItemAuthorReviewStatusAnimalWelfare.Visible = isVisible

		lblVAReviewStatusHumanHealth.Visible = isVisible
		lblPolicyReviewStatusHumanHealth.Visible = isVisible
		lblAuthorReviewStatusHumanHealth.Visible = isVisible
		lblItemVAReviewStatusHumanHealth.Visible = isVisible
		lblItemPolicyReviewStatusHumanHealth.Visible = isVisible
		lblItemAuthorReviewStatusHumanHealth.Visible = isVisible

		lblVAReviewStatusWiderSociety.Visible = isVisible
		lblPolicyReviewStatusWiderSociety.Visible = isVisible
		lblAuthorReviewStatusWiderSociety.Visible = isVisible
		lblItemVAReviewStatusWiderSociety.Visible = isVisible
		lblItemPolicyReviewStatusWiderSociety.Visible = isVisible
		lblItemAuthorReviewStatusWiderSociety.Visible = isVisible

		lblVAReviewStatusLegislationMandates.Visible = isVisible
		lblPolicyReviewStatusLegislationMandates.Visible = isVisible
		lblAuthorReviewStatusLegislationMandates.Visible = isVisible
		lblItemVAReviewStatusLegislationMandates.Visible = isVisible
		lblItemPolicyReviewStatusLegislationMandates.Visible = isVisible
		lblItemAuthorReviewStatusLegislationMandates.Visible = isVisible

		lblVAReviewStatusApproachControl.Visible = isVisible
		lblPolicyReviewStatusApproachControl.Visible = isVisible
		lblAuthorReviewStatusApproachControl.Visible = isVisible
		lblItemVAReviewStatusApproachControl.Visible = isVisible
		lblItemPolicyReviewStatusApproachControl.Visible = isVisible
		lblItemAuthorReviewStatusApproachControl.Visible = isVisible

		lblVAReviewStatusRiskAssessment.Visible = isVisible
		lblPolicyReviewStatusRiskAssessment.Visible = isVisible
		lblAuthorReviewStatusRiskAssessment.Visible = isVisible
		lblItemVAReviewStatusRiskAssessment.Visible = isVisible
		lblItemPolicyReviewStatusRiskAssessment.Visible = isVisible
		lblItemAuthorReviewStatusRiskAssessment.Visible = isVisible

		lblVAReviewStatusLaboratories.Visible = isVisible
		lblPolicyReviewStatusLaboratories.Visible = isVisible
		lblAuthorReviewStatusLaboratories.Visible = isVisible
		lblItemVAReviewStatusLaboratories.Visible = isVisible
		lblItemPolicyReviewStatusLaboratories.Visible = isVisible
		lblItemAuthorReviewStatusLaboratories.Visible = isVisible

		lblVAReviewStatusSurveillance.Visible = isVisible
		lblPolicyReviewStatusSurveillance.Visible = isVisible
		lblAuthorReviewStatusSurveillance.Visible = isVisible
		lblItemVAReviewStatusSurveillance.Visible = isVisible
		lblItemPolicyReviewStatusSurveillance.Visible = isVisible
		lblItemAuthorReviewStatusSurveillance.Visible = isVisible

		lblVAReviewStatusInternationalTrade.Visible = isVisible
		lblPolicyReviewStatusInternationalTrade.Visible = isVisible
		lblAuthorReviewStatusInternationalTrade.Visible = isVisible
		lblItemVAReviewStatusInternationalTrade.Visible = isVisible
		lblItemPolicyReviewStatusInternationalTrade.Visible = isVisible
		lblItemAuthorReviewStatusInternationalTrade.Visible = isVisible

		lblVAReviewStatusOpportunity.Visible = isVisible
		lblPolicyReviewStatusOpportunity.Visible = isVisible
		lblAuthorReviewStatusOpportunity.Visible = isVisible
		lblItemVAReviewStatusOpportunity.Visible = isVisible
		lblItemPolicyReviewStatusOpportunity.Visible = isVisible
		lblItemAuthorReviewStatusOpportunity.Visible = isVisible

		lblVAReviewStatusPublicAndStakeholderPerception.Visible = isVisible
		lblPolicyReviewStatusPublicAndStakeholderPerception.Visible = isVisible
		lblAuthorReviewStatusPublicAndStakeholderPerception.Visible = isVisible
		lblItemVAReviewStatusPublicAndStakeholderPerception.Visible = isVisible
		lblItemPolicyReviewStatusPublicAndStakeholderPerception.Visible = isVisible
		lblItemAuthorReviewStatusPublicAndStakeholderPerception.Visible = isVisible

		lblVAReviewStatusAreasOfUncertainty.Visible = isVisible
		lblPolicyReviewStatusAreasOfUncertainty.Visible = isVisible
		lblAuthorReviewStatusAreasOfUncertainty.Visible = isVisible
		lblItemVAReviewStatusAreasOfUncertainty.Visible = isVisible
		lblItemPolicyReviewStatusAreasOfUncertainty.Visible = isVisible
		lblItemAuthorReviewStatusAreasOfUncertainty.Visible = isVisible
	End Sub

	Private Sub DisplayEditableReviewStatuses(ByVal isVisible As Boolean)
		SetAllSections.Visible = isVisible

		lblVAReviewStatusSummary.Visible = isVisible
		lblPolicyReviewStatusSummary.Visible = isVisible
		lblAuthorReviewStatusSummary.Visible = isVisible
		ddlVAReviewStatusSummary.Visible = isVisible
		ddlPolicyReviewStatusSummary.Visible = isVisible
		ddlAuthorReviewStatusSummary.Visible = isVisible

		lblVAReviewStatusGeographicDistributionLevelsDisease.Visible = isVisible
		lblPolicyReviewStatusGeographicDistributionLevelsDisease.Visible = isVisible
		lblAuthorReviewStatusGeographicDistributionLevelsDisease.Visible = isVisible
		ddlVAReviewStatusGeographicDistributionLevelsDisease.Visible = isVisible
		ddlPolicyReviewStatusGeographicDistributionLevelsDisease.Visible = isVisible
		ddlAuthorReviewStatusGeographicDistributionLevelsDisease.Visible = isVisible

		lblVAReviewStatusEpidemiology.Visible = isVisible
		lblPolicyReviewStatusEpidemiology.Visible = isVisible
		lblAuthorReviewStatusEpidemiology.Visible = isVisible
		ddlVAReviewStatusEpidemiology.Visible = isVisible
		ddlPolicyReviewStatusEpidemiology.Visible = isVisible
		ddlAuthorReviewStatusEpidemiology.Visible = isVisible

		lblVAReviewStatusCharacteristicsAgent.Visible = isVisible
		lblPolicyReviewStatusCharacteristicsAgent.Visible = isVisible
		lblAuthorReviewStatusCharacteristicsAgent.Visible = isVisible
		ddlVAReviewStatusCharacteristicsAgent.Visible = isVisible
		ddlPolicyReviewStatusCharacteristicsAgent.Visible = isVisible
		ddlAuthorReviewStatusCharacteristicsAgent.Visible = isVisible

		lblVAReviewStatusAnimalWelfare.Visible = isVisible
		lblPolicyReviewStatusAnimalWelfare.Visible = isVisible
		lblAuthorReviewStatusAnimalWelfare.Visible = isVisible
		ddlVAReviewStatusAnimalWelfare.Visible = isVisible
		ddlPolicyReviewStatusAnimalWelfare.Visible = isVisible
		ddlAuthorReviewStatusAnimalWelfare.Visible = isVisible

		lblVAReviewStatusHumanHealth.Visible = isVisible
		lblPolicyReviewStatusHumanHealth.Visible = isVisible
		lblAuthorReviewStatusHumanHealth.Visible = isVisible
		ddlVAReviewStatusHumanHealth.Visible = isVisible
		ddlPolicyReviewStatusHumanHealth.Visible = isVisible
		ddlAuthorReviewStatusHumanHealth.Visible = isVisible

		lblVAReviewStatusWiderSociety.Visible = isVisible
		lblPolicyReviewStatusWiderSociety.Visible = isVisible
		lblAuthorReviewStatusWiderSociety.Visible = isVisible
		ddlVAReviewStatusWiderSociety.Visible = isVisible
		ddlPolicyReviewStatusWiderSociety.Visible = isVisible
		ddlAuthorReviewStatusWiderSociety.Visible = isVisible

		lblVAReviewStatusLegislationMandates.Visible = isVisible
		lblPolicyReviewStatusLegislationMandates.Visible = isVisible
		lblAuthorReviewStatusLegislationMandates.Visible = isVisible
		ddlVAReviewStatusLegislationMandates.Visible = isVisible
		ddlPolicyReviewStatusLegislationMandates.Visible = isVisible
		ddlAuthorReviewStatusLegislationMandates.Visible = isVisible

		lblVAReviewStatusApproachControl.Visible = isVisible
		lblPolicyReviewStatusApproachControl.Visible = isVisible
		lblAuthorReviewStatusApproachControl.Visible = isVisible
		ddlVAReviewStatusApproachControl.Visible = isVisible
		ddlPolicyReviewStatusApproachControl.Visible = isVisible
		ddlAuthorReviewStatusApproachControl.Visible = isVisible

		lblVAReviewStatusRiskAssessment.Visible = isVisible
		lblPolicyReviewStatusRiskAssessment.Visible = isVisible
		lblAuthorReviewStatusRiskAssessment.Visible = isVisible
		ddlVAReviewStatusRiskAssessment.Visible = isVisible
		ddlPolicyReviewStatusRiskAssessment.Visible = isVisible
		ddlAuthorReviewStatusRiskAssessment.Visible = isVisible

		lblVAReviewStatusLaboratories.Visible = isVisible
		lblPolicyReviewStatusLaboratories.Visible = isVisible
		lblAuthorReviewStatusLaboratories.Visible = isVisible
		ddlVAReviewStatusLaboratories.Visible = isVisible
		ddlPolicyReviewStatusLaboratories.Visible = isVisible
		ddlAuthorReviewStatusLaboratories.Visible = isVisible

		lblVAReviewStatusSurveillance.Visible = isVisible
		lblPolicyReviewStatusSurveillance.Visible = isVisible
		lblAuthorReviewStatusSurveillance.Visible = isVisible
		ddlVAReviewStatusSurveillance.Visible = isVisible
		ddlPolicyReviewStatusSurveillance.Visible = isVisible
		ddlAuthorReviewStatusSurveillance.Visible = isVisible

		lblVAReviewStatusInternationalTrade.Visible = isVisible
		lblPolicyReviewStatusInternationalTrade.Visible = isVisible
		lblAuthorReviewStatusInternationalTrade.Visible = isVisible
		ddlVAReviewStatusInternationalTrade.Visible = isVisible
		ddlPolicyReviewStatusInternationalTrade.Visible = isVisible
		ddlAuthorReviewStatusInternationalTrade.Visible = isVisible

		lblVAReviewStatusOpportunity.Visible = isVisible
		lblPolicyReviewStatusOpportunity.Visible = isVisible
		lblAuthorReviewStatusOpportunity.Visible = isVisible
		ddlVAReviewStatusOpportunity.Visible = isVisible
		ddlPolicyReviewStatusOpportunity.Visible = isVisible
		ddlAuthorReviewStatusOpportunity.Visible = isVisible

		lblVAReviewStatusPublicAndStakeholderPerception.Visible = isVisible
		lblPolicyReviewStatusPublicAndStakeholderPerception.Visible = isVisible
		lblAuthorReviewStatusPublicAndStakeholderPerception.Visible = isVisible
		ddlVAReviewStatusPublicAndStakeholderPerception.Visible = isVisible
		ddlPolicyReviewStatusPublicAndStakeholderPerception.Visible = isVisible
		ddlAuthorReviewStatusPublicAndStakeholderPerception.Visible = isVisible

		lblVAReviewStatusAreasOfUncertainty.Visible = isVisible
		lblPolicyReviewStatusAreasOfUncertainty.Visible = isVisible
		lblAuthorReviewStatusAreasOfUncertainty.Visible = isVisible
		ddlVAReviewStatusAreasOfUncertainty.Visible = isVisible
		ddlPolicyReviewStatusAreasOfUncertainty.Visible = isVisible
		ddlAuthorReviewStatusAreasOfUncertainty.Visible = isVisible
	End Sub

	Private Sub DisplayReviewDetail(ByVal isVisible As Boolean)
		DisplayReadOnlyReviewFrequencies(isVisible)
		DisplayEditableReviewFrequencies(isVisible)
		DisplayReadOnlyReviewDates(isVisible)
		DisplayEditableReviewDates(isVisible)
		DisplayReadOnlyReviewStatuses(isVisible)
		DisplayEditableReviewStatuses(isVisible)

	End Sub

	Private Sub SetUIValues()

		Dim canGetNextReviewDates As Boolean = ProfileVersionSection.CanGetNextReviewDates(CurrentProfileVersionSection.ProfileVersionId)
		Dim canEditNextReviewDates As Boolean = ProfileVersionSection.CanEditNextReviewDates(CurrentProfileVersionSection.ProfileVersionId)

		'hide everything to begin with
		DisplayReviewDetail(False)

		'If the user does not have edit rights, show the values read-only
		If Not mCanEditProfileVersionSection Then

			'set the values of the read-only UI controls to the values in the business layer
			If canGetNextReviewDates Then
				lblItemNextVAReviewSummary.Text = SummaryProfileVersionSection.NextVAReview.ToString("d MMMM yyyy") & "&nbsp;"
				lblItemNextPolicyReviewSummary.Text = SummaryProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy") & "&nbsp;"
				lblItemNextAuthorReviewSummary.Text = SummaryProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy") & "&nbsp;"

				lblItemNextVAReviewGeographicDistributionLevelsDisease.Text = GeographicDistributionLevelsDiseaseProfileVersionSection.NextVAReview.ToString("d MMMM yyyy") & "&nbsp;"
				lblItemNextPolicyReviewGeographicDistributionLevelsDisease.Text = GeographicDistributionLevelsDiseaseProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy") & "&nbsp;"
				lblItemNextAuthorReviewGeographicDistributionLevelsDisease.Text = GeographicDistributionLevelsDiseaseProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy") & "&nbsp;"

				lblItemNextVAReviewEpidemiology.Text = EpidemiologyProfileVersionSection.NextVAReview.ToString("d MMMM yyyy") & "&nbsp;"
				lblItemNextPolicyReviewEpidemiology.Text = EpidemiologyProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy") & "&nbsp;"
				lblItemNextAuthorReviewEpidemiology.Text = EpidemiologyProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy") & "&nbsp;"

				lblItemNextVAReviewCharacteristicsAgent.Text = CharacteristicsAgentProfileVersionSection.NextVAReview.ToString("d MMMM yyyy") & "&nbsp;"
				lblItemNextPolicyReviewCharacteristicsAgent.Text = CharacteristicsAgentProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy") & "&nbsp;"
				lblItemNextAuthorReviewCharacteristicsAgent.Text = CharacteristicsAgentProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy") & "&nbsp;"

				lblItemNextVAReviewAnimalWelfare.Text = AnimalWelfareProfileVersionSection.NextVAReview.ToString("d MMMM yyyy") & "&nbsp;"
				lblItemNextPolicyReviewAnimalWelfare.Text = AnimalWelfareProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy") & "&nbsp;"
				lblItemNextAuthorReviewAnimalWelfare.Text = AnimalWelfareProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy") & "&nbsp;"

				lblItemNextVAReviewHumanHealth.Text = HumanHealthProfileVersionSection.NextVAReview.ToString("d MMMM yyyy") & "&nbsp;"
				lblItemNextPolicyReviewHumanHealth.Text = HumanHealthProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy") & "&nbsp;"
				lblItemNextAuthorReviewHumanHealth.Text = HumanHealthProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy") & "&nbsp;"

				lblItemNextVAReviewWiderSociety.Text = WiderSocietyProfileVersionSection.NextVAReview.ToString("d MMMM yyyy") & "&nbsp;"
				lblItemNextPolicyReviewWiderSociety.Text = WiderSocietyProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy") & "&nbsp;"
				lblItemNextAuthorReviewWiderSociety.Text = WiderSocietyProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy") & "&nbsp;"

				lblItemNextVAReviewLegislationMandates.Text = LegislationMandatesProfileVersionSection.NextVAReview.ToString("d MMMM yyyy") & "&nbsp;"
				lblItemNextPolicyReviewLegislationMandates.Text = LegislationMandatesProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy") & "&nbsp;"
				lblItemNextAuthorReviewLegislationMandates.Text = LegislationMandatesProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy") & "&nbsp;"

				lblItemNextVAReviewApproachControl.Text = ApproachControlProfileVersionSection.NextVAReview.ToString("d MMMM yyyy") & "&nbsp;"
				lblItemNextPolicyReviewApproachControl.Text = ApproachControlProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy") & "&nbsp;"
				lblItemNextAuthorReviewApproachControl.Text = ApproachControlProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy") & "&nbsp;"

				lblItemNextVAReviewRiskAssessment.Text = RiskAssessmentProfileVersionSection.NextVAReview.ToString("d MMMM yyyy") & "&nbsp;"
				lblItemNextPolicyReviewRiskAssessment.Text = RiskAssessmentProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy") & "&nbsp;"
				lblItemNextAuthorReviewRiskAssessment.Text = RiskAssessmentProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy") & "&nbsp;"

				lblItemNextVAReviewLaboratories.Text = LaboratoriesProfileVersionSection.NextVAReview.ToString("d MMMM yyyy") & "&nbsp;"
				lblItemNextPolicyReviewLaboratories.Text = LaboratoriesProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy") & "&nbsp;"
				lblItemNextAuthorReviewLaboratories.Text = LaboratoriesProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy") & "&nbsp;"

				lblItemNextVAReviewSurveillance.Text = SurveillanceProfileVersionSection.NextVAReview.ToString("d MMMM yyyy") & "&nbsp;"
				lblItemNextPolicyReviewSurveillance.Text = SurveillanceProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy") & "&nbsp;"
				lblItemNextAuthorReviewSurveillance.Text = SurveillanceProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy") & "&nbsp;"

				lblItemNextVAReviewInternationalTrade.Text = InternationalTradeProfileVersionSection.NextVAReview.ToString("d MMMM yyyy") & "&nbsp;"
				lblItemNextPolicyReviewInternationalTrade.Text = InternationalTradeProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy") & "&nbsp;"
				lblItemNextAuthorReviewInternationalTrade.Text = InternationalTradeProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy") & "&nbsp;"

				lblItemNextVAReviewOpportunity.Text = OpportunityProfileVersionSection.NextVAReview.ToString("d MMMM yyyy") & "&nbsp;"
				lblItemNextPolicyReviewOpportunity.Text = OpportunityProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy") & "&nbsp;"
				lblItemNextAuthorReviewOpportunity.Text = OpportunityProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy") & "&nbsp;"

				lblItemNextVAReviewPublicAndStakeholderPerception.Text = PublicAndStakeholderPerceptionProfileVersionSection.NextVAReview.ToString("d MMMM yyyy") & "&nbsp;"
				lblItemNextPolicyReviewPublicAndStakeholderPerception.Text = PublicAndStakeholderPerceptionProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy") & "&nbsp;"
				lblItemNextAuthorReviewPublicAndStakeholderPerception.Text = PublicAndStakeholderPerceptionProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy") & "&nbsp;"

				lblItemNextVAReviewAreasOfUncertainty.Text = AreasOfUncertaintyProfileVersionSection.NextVAReview.ToString("d MMMM yyyy") & "&nbsp;"
				lblItemNextPolicyReviewAreasOfUncertainty.Text = AreasOfUncertaintyProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy") & "&nbsp;"
				lblItemNextAuthorReviewAreasOfUncertainty.Text = AreasOfUncertaintyProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy") & "&nbsp;"
			End If

			Dim listSectionReviewFrequency As SectionReviewFrequencyList = SectionReviewFrequencyList.GetList()

			For Each ReviewFrequencyItem As SectionReviewFrequencyList.NameValuePair In listSectionReviewFrequency
				If Not SummaryProfileVersionSection.VAReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = SummaryProfileVersionSection.VAReviewFrequency Then
					lblItemVAReviewFreqSummary.Text = ReviewFrequencyItem.Value
				End If

				If Not SummaryProfileVersionSection.PolicyReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = SummaryProfileVersionSection.PolicyReviewFrequency Then
					lblItemPolicyReviewFreqSummary.Text = ReviewFrequencyItem.Value
				End If

				If Not SummaryProfileVersionSection.AuthorReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = SummaryProfileVersionSection.AuthorReviewFrequency Then
					lblItemAuthorReviewFreqSummary.Text = ReviewFrequencyItem.Value
				End If

				If Not GeographicDistributionLevelsDiseaseProfileVersionSection.VAReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = GeographicDistributionLevelsDiseaseProfileVersionSection.VAReviewFrequency Then
					lblItemVAReviewFreqGeographicDistributionLevelsDisease.Text = ReviewFrequencyItem.Value
				End If

				If Not GeographicDistributionLevelsDiseaseProfileVersionSection.PolicyReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = GeographicDistributionLevelsDiseaseProfileVersionSection.PolicyReviewFrequency Then
					lblItemPolicyReviewFreqGeographicDistributionLevelsDisease.Text = ReviewFrequencyItem.Value
				End If

				If Not GeographicDistributionLevelsDiseaseProfileVersionSection.AuthorReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = GeographicDistributionLevelsDiseaseProfileVersionSection.AuthorReviewFrequency Then
					lblItemAuthorReviewFreqGeographicDistributionLevelsDisease.Text = ReviewFrequencyItem.Value
				End If

				If Not EpidemiologyProfileVersionSection.VAReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = EpidemiologyProfileVersionSection.VAReviewFrequency Then
					lblItemVAReviewFreqEpidemiology.Text = ReviewFrequencyItem.Value
				End If

				If Not EpidemiologyProfileVersionSection.PolicyReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = EpidemiologyProfileVersionSection.PolicyReviewFrequency Then
					lblItemPolicyReviewFreqEpidemiology.Text = ReviewFrequencyItem.Value
				End If

				If Not EpidemiologyProfileVersionSection.AuthorReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = EpidemiologyProfileVersionSection.AuthorReviewFrequency Then
					lblItemAuthorReviewFreqEpidemiology.Text = ReviewFrequencyItem.Value
				End If

				If Not CharacteristicsAgentProfileVersionSection.VAReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = CharacteristicsAgentProfileVersionSection.VAReviewFrequency Then
					lblItemVAReviewFreqCharacteristicsAgent.Text = ReviewFrequencyItem.Value
				End If

				If Not CharacteristicsAgentProfileVersionSection.PolicyReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = CharacteristicsAgentProfileVersionSection.PolicyReviewFrequency Then
					lblItemPolicyReviewFreqCharacteristicsAgent.Text = ReviewFrequencyItem.Value
				End If

				If Not CharacteristicsAgentProfileVersionSection.AuthorReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = CharacteristicsAgentProfileVersionSection.AuthorReviewFrequency Then
					lblItemAuthorReviewFreqCharacteristicsAgent.Text = ReviewFrequencyItem.Value
				End If

				If Not AnimalWelfareProfileVersionSection.VAReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = AnimalWelfareProfileVersionSection.VAReviewFrequency Then
					lblItemVAReviewFreqAnimalWelfare.Text = ReviewFrequencyItem.Value
				End If

				If Not AnimalWelfareProfileVersionSection.PolicyReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = AnimalWelfareProfileVersionSection.PolicyReviewFrequency Then
					lblItemPolicyReviewFreqAnimalWelfare.Text = ReviewFrequencyItem.Value
				End If

				If Not AnimalWelfareProfileVersionSection.AuthorReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = AnimalWelfareProfileVersionSection.AuthorReviewFrequency Then
					lblItemAuthorReviewFreqAnimalWelfare.Text = ReviewFrequencyItem.Value
				End If

				If Not HumanHealthProfileVersionSection.VAReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = HumanHealthProfileVersionSection.VAReviewFrequency Then
					lblItemVAReviewFreqHumanHealth.Text = ReviewFrequencyItem.Value
				End If

				If Not HumanHealthProfileVersionSection.PolicyReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = HumanHealthProfileVersionSection.PolicyReviewFrequency Then
					lblItemPolicyReviewFreqHumanHealth.Text = ReviewFrequencyItem.Value
				End If

				If Not HumanHealthProfileVersionSection.AuthorReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = HumanHealthProfileVersionSection.AuthorReviewFrequency Then
					lblItemAuthorReviewFreqHumanHealth.Text = ReviewFrequencyItem.Value
				End If

				If Not WiderSocietyProfileVersionSection.VAReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = WiderSocietyProfileVersionSection.VAReviewFrequency Then
					lblItemVAReviewFreqWiderSociety.Text = ReviewFrequencyItem.Value
				End If

				If Not WiderSocietyProfileVersionSection.PolicyReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = WiderSocietyProfileVersionSection.PolicyReviewFrequency Then
					lblItemPolicyReviewFreqWiderSociety.Text = ReviewFrequencyItem.Value
				End If

				If Not WiderSocietyProfileVersionSection.AuthorReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = WiderSocietyProfileVersionSection.AuthorReviewFrequency Then
					lblItemAuthorReviewFreqWiderSociety.Text = ReviewFrequencyItem.Value
				End If

				If Not LegislationMandatesProfileVersionSection.VAReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = LegislationMandatesProfileVersionSection.VAReviewFrequency Then
					lblItemVAReviewFreqLegislationMandates.Text = ReviewFrequencyItem.Value
				End If

				If Not LegislationMandatesProfileVersionSection.PolicyReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = LegislationMandatesProfileVersionSection.PolicyReviewFrequency Then
					lblItemPolicyReviewFreqLegislationMandates.Text = ReviewFrequencyItem.Value
				End If

				If Not LegislationMandatesProfileVersionSection.AuthorReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = LegislationMandatesProfileVersionSection.AuthorReviewFrequency Then
					lblItemAuthorReviewFreqLegislationMandates.Text = ReviewFrequencyItem.Value
				End If

				If Not ApproachControlProfileVersionSection.VAReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = ApproachControlProfileVersionSection.VAReviewFrequency Then
					lblItemVAReviewFreqApproachControl.Text = ReviewFrequencyItem.Value
				End If

				If Not ApproachControlProfileVersionSection.PolicyReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = ApproachControlProfileVersionSection.PolicyReviewFrequency Then
					lblItemPolicyReviewFreqApproachControl.Text = ReviewFrequencyItem.Value
				End If

				If Not ApproachControlProfileVersionSection.AuthorReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = ApproachControlProfileVersionSection.AuthorReviewFrequency Then
					lblItemAuthorReviewFreqApproachControl.Text = ReviewFrequencyItem.Value
				End If

				If Not RiskAssessmentProfileVersionSection.VAReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = RiskAssessmentProfileVersionSection.VAReviewFrequency Then
					lblItemVAReviewFreqRiskAssessment.Text = ReviewFrequencyItem.Value
				End If

				If Not RiskAssessmentProfileVersionSection.PolicyReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = RiskAssessmentProfileVersionSection.PolicyReviewFrequency Then
					lblItemPolicyReviewFreqRiskAssessment.Text = ReviewFrequencyItem.Value
				End If

				If Not RiskAssessmentProfileVersionSection.AuthorReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = RiskAssessmentProfileVersionSection.AuthorReviewFrequency Then
					lblItemAuthorReviewFreqRiskAssessment.Text = ReviewFrequencyItem.Value
				End If

				If Not LaboratoriesProfileVersionSection.VAReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = LaboratoriesProfileVersionSection.VAReviewFrequency Then
					lblItemVAReviewFreqLaboratories.Text = ReviewFrequencyItem.Value
				End If

				If Not LaboratoriesProfileVersionSection.PolicyReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = LaboratoriesProfileVersionSection.PolicyReviewFrequency Then
					lblItemPolicyReviewFreqLaboratories.Text = ReviewFrequencyItem.Value
				End If

				If Not LaboratoriesProfileVersionSection.AuthorReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = LaboratoriesProfileVersionSection.AuthorReviewFrequency Then
					lblItemAuthorReviewFreqLaboratories.Text = ReviewFrequencyItem.Value
				End If

				If Not SurveillanceProfileVersionSection.VAReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = SurveillanceProfileVersionSection.VAReviewFrequency Then
					lblItemVAReviewFreqSurveillance.Text = ReviewFrequencyItem.Value
				End If

				If Not SurveillanceProfileVersionSection.PolicyReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = SurveillanceProfileVersionSection.PolicyReviewFrequency Then
					lblItemPolicyReviewFreqSurveillance.Text = ReviewFrequencyItem.Value
				End If

				If Not SurveillanceProfileVersionSection.AuthorReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = SurveillanceProfileVersionSection.AuthorReviewFrequency Then
					lblItemAuthorReviewFreqSurveillance.Text = ReviewFrequencyItem.Value
				End If

				If Not InternationalTradeProfileVersionSection.VAReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = InternationalTradeProfileVersionSection.VAReviewFrequency Then
					lblItemVAReviewFreqInternationalTrade.Text = ReviewFrequencyItem.Value
				End If

				If Not InternationalTradeProfileVersionSection.PolicyReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = InternationalTradeProfileVersionSection.PolicyReviewFrequency Then
					lblItemPolicyReviewFreqInternationalTrade.Text = ReviewFrequencyItem.Value
				End If

				If Not InternationalTradeProfileVersionSection.AuthorReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = InternationalTradeProfileVersionSection.AuthorReviewFrequency Then
					lblItemAuthorReviewFreqInternationalTrade.Text = ReviewFrequencyItem.Value
				End If

				If Not OpportunityProfileVersionSection.VAReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = OpportunityProfileVersionSection.VAReviewFrequency Then
					lblItemVAReviewFreqOpportunity.Text = ReviewFrequencyItem.Value
				End If

				If Not OpportunityProfileVersionSection.PolicyReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = OpportunityProfileVersionSection.PolicyReviewFrequency Then
					lblItemPolicyReviewFreqOpportunity.Text = ReviewFrequencyItem.Value
				End If

				If Not OpportunityProfileVersionSection.AuthorReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = OpportunityProfileVersionSection.AuthorReviewFrequency Then
					lblItemAuthorReviewFreqOpportunity.Text = ReviewFrequencyItem.Value
				End If

				If Not PublicAndStakeholderPerceptionProfileVersionSection.VAReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = PublicAndStakeholderPerceptionProfileVersionSection.VAReviewFrequency Then
					lblItemVAReviewFreqPublicAndStakeholderPerception.Text = ReviewFrequencyItem.Value
				End If

				If Not PublicAndStakeholderPerceptionProfileVersionSection.PolicyReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = PublicAndStakeholderPerceptionProfileVersionSection.PolicyReviewFrequency Then
					lblItemPolicyReviewFreqPublicAndStakeholderPerception.Text = ReviewFrequencyItem.Value
				End If

				If Not PublicAndStakeholderPerceptionProfileVersionSection.AuthorReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = PublicAndStakeholderPerceptionProfileVersionSection.AuthorReviewFrequency Then
					lblItemAuthorReviewFreqPublicAndStakeholderPerception.Text = ReviewFrequencyItem.Value
				End If

				If Not AreasOfUncertaintyProfileVersionSection.VAReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = AreasOfUncertaintyProfileVersionSection.VAReviewFrequency Then
					lblItemVAReviewFreqAreasOfUncertainty.Text = ReviewFrequencyItem.Value
				End If

				If Not AreasOfUncertaintyProfileVersionSection.PolicyReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = AreasOfUncertaintyProfileVersionSection.PolicyReviewFrequency Then
					lblItemPolicyReviewFreqAreasOfUncertainty.Text = ReviewFrequencyItem.Value
				End If

				If Not AreasOfUncertaintyProfileVersionSection.AuthorReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = AreasOfUncertaintyProfileVersionSection.AuthorReviewFrequency Then
					lblItemAuthorReviewFreqAreasOfUncertainty.Text = ReviewFrequencyItem.Value
				End If
			Next

			Dim listSectionReviewStatusType As ReviewStatusTypeList = ReviewStatusTypeList.GetReviewStatusTypeList
			If canGetNextReviewDates Then

				For Each reviewStatusTypeItem As ReviewStatusType In listSectionReviewStatusType
					If Not SummaryProfileVersionSection.VAReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = SummaryProfileVersionSection.VAReviewStatusId Then
						lblItemVAReviewStatusSummary.Text = reviewStatusTypeItem.Name
					End If

					If Not SummaryProfileVersionSection.PolicyReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = SummaryProfileVersionSection.PolicyReviewStatusId Then
						lblItemPolicyReviewStatusSummary.Text = reviewStatusTypeItem.Name
					End If

					If Not SummaryProfileVersionSection.AuthorReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = SummaryProfileVersionSection.AuthorReviewStatusId Then
						lblItemAuthorReviewStatusSummary.Text = reviewStatusTypeItem.Name
					End If

					If Not GeographicDistributionLevelsDiseaseProfileVersionSection.VAReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = GeographicDistributionLevelsDiseaseProfileVersionSection.VAReviewStatusId Then
						lblItemVAReviewStatusGeographicDistributionLevelsDisease.Text = reviewStatusTypeItem.Name
					End If

					If Not GeographicDistributionLevelsDiseaseProfileVersionSection.PolicyReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = GeographicDistributionLevelsDiseaseProfileVersionSection.PolicyReviewStatusId Then
						lblItemPolicyReviewStatusGeographicDistributionLevelsDisease.Text = reviewStatusTypeItem.Name
					End If

					If Not GeographicDistributionLevelsDiseaseProfileVersionSection.AuthorReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = GeographicDistributionLevelsDiseaseProfileVersionSection.AuthorReviewStatusId Then
						lblItemAuthorReviewStatusGeographicDistributionLevelsDisease.Text = reviewStatusTypeItem.Name
					End If

					If Not EpidemiologyProfileVersionSection.VAReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = EpidemiologyProfileVersionSection.VAReviewStatusId Then
						lblItemVAReviewStatusEpidemiology.Text = reviewStatusTypeItem.Name
					End If

					If Not EpidemiologyProfileVersionSection.PolicyReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = EpidemiologyProfileVersionSection.PolicyReviewStatusId Then
						lblItemPolicyReviewStatusEpidemiology.Text = reviewStatusTypeItem.Name
					End If

					If Not EpidemiologyProfileVersionSection.AuthorReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = EpidemiologyProfileVersionSection.AuthorReviewStatusId Then
						lblItemAuthorReviewStatusEpidemiology.Text = reviewStatusTypeItem.Name
					End If

					If Not CharacteristicsAgentProfileVersionSection.VAReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = CharacteristicsAgentProfileVersionSection.VAReviewStatusId Then
						lblItemVAReviewStatusCharacteristicsAgent.Text = reviewStatusTypeItem.Name
					End If

					If Not CharacteristicsAgentProfileVersionSection.PolicyReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = CharacteristicsAgentProfileVersionSection.PolicyReviewStatusId Then
						lblItemPolicyReviewStatusCharacteristicsAgent.Text = reviewStatusTypeItem.Name
					End If

					If Not CharacteristicsAgentProfileVersionSection.AuthorReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = CharacteristicsAgentProfileVersionSection.AuthorReviewStatusId Then
						lblItemAuthorReviewStatusCharacteristicsAgent.Text = reviewStatusTypeItem.Name
					End If

					If Not AnimalWelfareProfileVersionSection.VAReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = AnimalWelfareProfileVersionSection.VAReviewStatusId Then
						lblItemVAReviewStatusAnimalWelfare.Text = reviewStatusTypeItem.Name
					End If

					If Not AnimalWelfareProfileVersionSection.PolicyReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = AnimalWelfareProfileVersionSection.PolicyReviewStatusId Then
						lblItemPolicyReviewStatusAnimalWelfare.Text = reviewStatusTypeItem.Name
					End If

					If Not AnimalWelfareProfileVersionSection.AuthorReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = AnimalWelfareProfileVersionSection.AuthorReviewStatusId Then
						lblItemAuthorReviewStatusAnimalWelfare.Text = reviewStatusTypeItem.Name
					End If

					If Not HumanHealthProfileVersionSection.VAReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = HumanHealthProfileVersionSection.VAReviewStatusId Then
						lblItemVAReviewStatusHumanHealth.Text = reviewStatusTypeItem.Name
					End If

					If Not HumanHealthProfileVersionSection.PolicyReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = HumanHealthProfileVersionSection.PolicyReviewStatusId Then
						lblItemPolicyReviewStatusHumanHealth.Text = reviewStatusTypeItem.Name
					End If

					If Not HumanHealthProfileVersionSection.AuthorReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = HumanHealthProfileVersionSection.AuthorReviewStatusId Then
						lblItemAuthorReviewStatusHumanHealth.Text = reviewStatusTypeItem.Name
					End If

					If Not WiderSocietyProfileVersionSection.VAReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = WiderSocietyProfileVersionSection.VAReviewStatusId Then
						lblItemVAReviewStatusWiderSociety.Text = reviewStatusTypeItem.Name
					End If

					If Not WiderSocietyProfileVersionSection.PolicyReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = WiderSocietyProfileVersionSection.PolicyReviewStatusId Then
						lblItemPolicyReviewStatusWiderSociety.Text = reviewStatusTypeItem.Name
					End If

					If Not WiderSocietyProfileVersionSection.AuthorReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = WiderSocietyProfileVersionSection.AuthorReviewStatusId Then
						lblItemAuthorReviewStatusWiderSociety.Text = reviewStatusTypeItem.Name
					End If

					If Not LegislationMandatesProfileVersionSection.VAReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = LegislationMandatesProfileVersionSection.VAReviewStatusId Then
						lblItemVAReviewStatusLegislationMandates.Text = reviewStatusTypeItem.Name
					End If

					If Not LegislationMandatesProfileVersionSection.PolicyReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = LegislationMandatesProfileVersionSection.PolicyReviewStatusId Then
						lblItemPolicyReviewStatusLegislationMandates.Text = reviewStatusTypeItem.Name
					End If

					If Not LegislationMandatesProfileVersionSection.AuthorReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = LegislationMandatesProfileVersionSection.AuthorReviewStatusId Then
						lblItemAuthorReviewStatusLegislationMandates.Text = reviewStatusTypeItem.Name
					End If

					If Not ApproachControlProfileVersionSection.VAReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = ApproachControlProfileVersionSection.VAReviewStatusId Then
						lblItemVAReviewStatusApproachControl.Text = reviewStatusTypeItem.Name
					End If

					If Not ApproachControlProfileVersionSection.PolicyReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = ApproachControlProfileVersionSection.PolicyReviewStatusId Then
						lblItemPolicyReviewStatusApproachControl.Text = reviewStatusTypeItem.Name
					End If

					If Not ApproachControlProfileVersionSection.AuthorReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = ApproachControlProfileVersionSection.AuthorReviewStatusId Then
						lblItemAuthorReviewStatusApproachControl.Text = reviewStatusTypeItem.Name
					End If

					If Not RiskAssessmentProfileVersionSection.VAReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = RiskAssessmentProfileVersionSection.VAReviewStatusId Then
						lblItemVAReviewStatusRiskAssessment.Text = reviewStatusTypeItem.Name
					End If

					If Not RiskAssessmentProfileVersionSection.PolicyReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = RiskAssessmentProfileVersionSection.PolicyReviewStatusId Then
						lblItemPolicyReviewStatusRiskAssessment.Text = reviewStatusTypeItem.Name
					End If

					If Not RiskAssessmentProfileVersionSection.AuthorReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = RiskAssessmentProfileVersionSection.AuthorReviewStatusId Then
						lblItemAuthorReviewStatusRiskAssessment.Text = reviewStatusTypeItem.Name
					End If

					If Not LaboratoriesProfileVersionSection.VAReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = LaboratoriesProfileVersionSection.VAReviewStatusId Then
						lblItemVAReviewStatusLaboratories.Text = reviewStatusTypeItem.Name
					End If

					If Not LaboratoriesProfileVersionSection.PolicyReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = LaboratoriesProfileVersionSection.PolicyReviewStatusId Then
						lblItemPolicyReviewStatusLaboratories.Text = reviewStatusTypeItem.Name
					End If

					If Not LaboratoriesProfileVersionSection.AuthorReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = LaboratoriesProfileVersionSection.AuthorReviewStatusId Then
						lblItemAuthorReviewStatusLaboratories.Text = reviewStatusTypeItem.Name
					End If

					If Not SurveillanceProfileVersionSection.VAReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = SurveillanceProfileVersionSection.VAReviewStatusId Then
						lblItemVAReviewStatusSurveillance.Text = reviewStatusTypeItem.Name
					End If

					If Not SurveillanceProfileVersionSection.PolicyReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = SurveillanceProfileVersionSection.PolicyReviewStatusId Then
						lblItemPolicyReviewStatusSurveillance.Text = reviewStatusTypeItem.Name
					End If

					If Not SurveillanceProfileVersionSection.AuthorReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = SurveillanceProfileVersionSection.AuthorReviewStatusId Then
						lblItemAuthorReviewStatusSurveillance.Text = reviewStatusTypeItem.Name
					End If

					If Not InternationalTradeProfileVersionSection.VAReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = InternationalTradeProfileVersionSection.VAReviewStatusId Then
						lblItemVAReviewStatusInternationalTrade.Text = reviewStatusTypeItem.Name
					End If

					If Not InternationalTradeProfileVersionSection.PolicyReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = InternationalTradeProfileVersionSection.PolicyReviewStatusId Then
						lblItemPolicyReviewStatusInternationalTrade.Text = reviewStatusTypeItem.Name
					End If

					If Not InternationalTradeProfileVersionSection.AuthorReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = InternationalTradeProfileVersionSection.AuthorReviewStatusId Then
						lblItemAuthorReviewStatusInternationalTrade.Text = reviewStatusTypeItem.Name
					End If

					If Not OpportunityProfileVersionSection.VAReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = OpportunityProfileVersionSection.VAReviewStatusId Then
						lblItemVAReviewStatusOpportunity.Text = reviewStatusTypeItem.Name
					End If

					If Not OpportunityProfileVersionSection.PolicyReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = OpportunityProfileVersionSection.PolicyReviewStatusId Then
						lblItemPolicyReviewStatusOpportunity.Text = reviewStatusTypeItem.Name
					End If

					If Not OpportunityProfileVersionSection.AuthorReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = OpportunityProfileVersionSection.AuthorReviewStatusId Then
						lblItemAuthorReviewStatusOpportunity.Text = reviewStatusTypeItem.Name
					End If

					If Not PublicAndStakeholderPerceptionProfileVersionSection.VAReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = PublicAndStakeholderPerceptionProfileVersionSection.VAReviewStatusId Then
						lblItemVAReviewStatusPublicAndStakeholderPerception.Text = reviewStatusTypeItem.Name
					End If

					If Not PublicAndStakeholderPerceptionProfileVersionSection.PolicyReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = PublicAndStakeholderPerceptionProfileVersionSection.PolicyReviewStatusId Then
						lblItemPolicyReviewStatusPublicAndStakeholderPerception.Text = reviewStatusTypeItem.Name
					End If

					If Not PublicAndStakeholderPerceptionProfileVersionSection.AuthorReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = PublicAndStakeholderPerceptionProfileVersionSection.AuthorReviewStatusId Then
						lblItemAuthorReviewStatusPublicAndStakeholderPerception.Text = reviewStatusTypeItem.Name
					End If

					If Not AreasOfUncertaintyProfileVersionSection.VAReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = AreasOfUncertaintyProfileVersionSection.VAReviewStatusId Then
						lblItemVAReviewStatusAreasOfUncertainty.Text = reviewStatusTypeItem.Name
					End If

					If Not AreasOfUncertaintyProfileVersionSection.PolicyReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = AreasOfUncertaintyProfileVersionSection.PolicyReviewStatusId Then
						lblItemPolicyReviewStatusAreasOfUncertainty.Text = reviewStatusTypeItem.Name
					End If

					If Not AreasOfUncertaintyProfileVersionSection.AuthorReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = AreasOfUncertaintyProfileVersionSection.AuthorReviewStatusId Then
						lblItemAuthorReviewStatusAreasOfUncertainty.Text = reviewStatusTypeItem.Name
					End If
				Next
			End If

			'Add a whitespace to the end of the label text to ensure it renders correctly in standards compliant browsers.
			lblItemVAReviewFreqSummary.Text += "&nbsp;"
			lblItemPolicyReviewFreqSummary.Text += "&nbsp;"
			lblItemAuthorReviewFreqSummary.Text += "&nbsp;"
			lblItemVAReviewStatusSummary.Text += "&nbsp;"
			lblItemPolicyReviewStatusSummary.Text += "&nbsp;"
			lblItemAuthorReviewStatusSummary.Text += "&nbsp;"

			lblItemVAReviewFreqGeographicDistributionLevelsDisease.Text += "&nbsp;"
			lblItemPolicyReviewFreqGeographicDistributionLevelsDisease.Text += "&nbsp;"
			lblItemAuthorReviewFreqGeographicDistributionLevelsDisease.Text += "&nbsp;"
			lblItemVAReviewStatusGeographicDistributionLevelsDisease.Text += "&nbsp;"
			lblItemPolicyReviewStatusGeographicDistributionLevelsDisease.Text += "&nbsp;"
			lblItemAuthorReviewStatusGeographicDistributionLevelsDisease.Text += "&nbsp;"

			lblItemVAReviewFreqEpidemiology.Text += "&nbsp;"
			lblItemPolicyReviewFreqEpidemiology.Text += "&nbsp;"
			lblItemAuthorReviewFreqEpidemiology.Text += "&nbsp;"
			lblItemVAReviewStatusEpidemiology.Text += "&nbsp;"
			lblItemPolicyReviewStatusEpidemiology.Text += "&nbsp;"
			lblItemAuthorReviewStatusEpidemiology.Text += "&nbsp;"

			lblItemVAReviewFreqCharacteristicsAgent.Text += "&nbsp;"
			lblItemPolicyReviewFreqCharacteristicsAgent.Text += "&nbsp;"
			lblItemAuthorReviewFreqCharacteristicsAgent.Text += "&nbsp;"
			lblItemVAReviewStatusCharacteristicsAgent.Text += "&nbsp;"
			lblItemPolicyReviewStatusCharacteristicsAgent.Text += "&nbsp;"
			lblItemAuthorReviewStatusCharacteristicsAgent.Text += "&nbsp;"

			lblItemVAReviewFreqAnimalWelfare.Text += "&nbsp;"
			lblItemPolicyReviewFreqAnimalWelfare.Text += "&nbsp;"
			lblItemAuthorReviewFreqAnimalWelfare.Text += "&nbsp;"
			lblItemVAReviewStatusAnimalWelfare.Text += "&nbsp;"
			lblItemPolicyReviewStatusAnimalWelfare.Text += "&nbsp;"
			lblItemAuthorReviewStatusAnimalWelfare.Text += "&nbsp;"

			lblItemVAReviewFreqHumanHealth.Text += "&nbsp;"
			lblItemPolicyReviewFreqHumanHealth.Text += "&nbsp;"
			lblItemAuthorReviewFreqHumanHealth.Text += "&nbsp;"
			lblItemVAReviewStatusHumanHealth.Text += "&nbsp;"
			lblItemPolicyReviewStatusHumanHealth.Text += "&nbsp;"
			lblItemAuthorReviewStatusHumanHealth.Text += "&nbsp;"

			lblItemVAReviewFreqWiderSociety.Text += "&nbsp;"
			lblItemPolicyReviewFreqWiderSociety.Text += "&nbsp;"
			lblItemAuthorReviewFreqWiderSociety.Text += "&nbsp;"
			lblItemVAReviewStatusWiderSociety.Text += "&nbsp;"
			lblItemPolicyReviewStatusWiderSociety.Text += "&nbsp;"
			lblItemAuthorReviewStatusWiderSociety.Text += "&nbsp;"

			lblItemVAReviewFreqLegislationMandates.Text += "&nbsp;"
			lblItemPolicyReviewFreqLegislationMandates.Text += "&nbsp;"
			lblItemAuthorReviewFreqLegislationMandates.Text += "&nbsp;"
			lblItemVAReviewStatusLegislationMandates.Text += "&nbsp;"
			lblItemPolicyReviewStatusLegislationMandates.Text += "&nbsp;"
			lblItemAuthorReviewStatusLegislationMandates.Text += "&nbsp;"

			lblItemVAReviewFreqApproachControl.Text += "&nbsp;"
			lblItemPolicyReviewFreqApproachControl.Text += "&nbsp;"
			lblItemAuthorReviewFreqApproachControl.Text += "&nbsp;"
			lblItemVAReviewStatusApproachControl.Text += "&nbsp;"
			lblItemPolicyReviewStatusApproachControl.Text += "&nbsp;"
			lblItemAuthorReviewStatusApproachControl.Text += "&nbsp;"

			lblItemVAReviewFreqRiskAssessment.Text += "&nbsp;"
			lblItemPolicyReviewFreqRiskAssessment.Text += "&nbsp;"
			lblItemAuthorReviewFreqRiskAssessment.Text += "&nbsp;"
			lblItemVAReviewStatusRiskAssessment.Text += "&nbsp;"
			lblItemPolicyReviewStatusRiskAssessment.Text += "&nbsp;"
			lblItemAuthorReviewStatusRiskAssessment.Text += "&nbsp;"

			lblItemVAReviewFreqLaboratories.Text += "&nbsp;"
			lblItemPolicyReviewFreqLaboratories.Text += "&nbsp;"
			lblItemAuthorReviewFreqLaboratories.Text += "&nbsp;"
			lblItemVAReviewStatusLaboratories.Text += "&nbsp;"
			lblItemPolicyReviewStatusLaboratories.Text += "&nbsp;"
			lblItemAuthorReviewStatusLaboratories.Text += "&nbsp;"

			lblItemVAReviewFreqSurveillance.Text += "&nbsp;"
			lblItemPolicyReviewFreqSurveillance.Text += "&nbsp;"
			lblItemAuthorReviewFreqSurveillance.Text += "&nbsp;"
			lblItemVAReviewStatusSurveillance.Text += "&nbsp;"
			lblItemPolicyReviewStatusSurveillance.Text += "&nbsp;"
			lblItemAuthorReviewStatusSurveillance.Text += "&nbsp;"

			lblItemVAReviewFreqInternationalTrade.Text += "&nbsp;"
			lblItemPolicyReviewFreqInternationalTrade.Text += "&nbsp;"
			lblItemAuthorReviewFreqInternationalTrade.Text += "&nbsp;"
			lblItemVAReviewStatusInternationalTrade.Text += "&nbsp;"
			lblItemPolicyReviewStatusInternationalTrade.Text += "&nbsp;"
			lblItemAuthorReviewStatusInternationalTrade.Text += "&nbsp;"

			lblItemVAReviewFreqOpportunity.Text += "&nbsp;"
			lblItemPolicyReviewFreqOpportunity.Text += "&nbsp;"
			lblItemAuthorReviewFreqOpportunity.Text += "&nbsp;"
			lblItemVAReviewStatusOpportunity.Text += "&nbsp;"
			lblItemPolicyReviewStatusOpportunity.Text += "&nbsp;"
			lblItemAuthorReviewStatusOpportunity.Text += "&nbsp;"

			lblItemVAReviewFreqPublicAndStakeholderPerception.Text += "&nbsp;"
			lblItemPolicyReviewFreqPublicAndStakeholderPerception.Text += "&nbsp;"
			lblItemAuthorReviewFreqPublicAndStakeholderPerception.Text += "&nbsp;"
			lblItemVAReviewStatusPublicAndStakeholderPerception.Text += "&nbsp;"
			lblItemPolicyReviewStatusPublicAndStakeholderPerception.Text += "&nbsp;"
			lblItemAuthorReviewStatusPublicAndStakeholderPerception.Text += "&nbsp;"

			lblItemVAReviewFreqAreasOfUncertainty.Text += "&nbsp;"
			lblItemPolicyReviewFreqAreasOfUncertainty.Text += "&nbsp;"
			lblItemAuthorReviewFreqAreasOfUncertainty.Text += "&nbsp;"
			lblItemVAReviewStatusAreasOfUncertainty.Text += "&nbsp;"
			lblItemPolicyReviewStatusAreasOfUncertainty.Text += "&nbsp;"
			lblItemAuthorReviewStatusAreasOfUncertainty.Text += "&nbsp;"

			'show the read-only UI
			DisplayReadOnlyReviewFrequencies(True)
			DisplayReadOnlyReviewDates(canGetNextReviewDates)
			DisplayReadOnlyReviewStatuses(canGetNextReviewDates)

		Else

			'set the values of the editable UI controls to the values in the business layer
			If canGetNextReviewDates Then
				txtNextAuthorReviewAll.Text = ""
				txtNextVAReviewAll.Text = ""
				txtNextPolicyReviewAll.Text = ""

				If canEditNextReviewDates Then
					txtNextVAReviewSummary.Text = SummaryProfileVersionSection.NextVAReview.ToString("d MMMM yyyy")
					txtNextPolicyReviewSummary.Text = SummaryProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy")
					txtNextAuthorReviewSummary.Text = SummaryProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy")

					txtNextVAReviewGeographicDistributionLevelsDisease.Text = GeographicDistributionLevelsDiseaseProfileVersionSection.NextVAReview.ToString("d MMMM yyyy")
					txtNextPolicyReviewGeographicDistributionLevelsDisease.Text = GeographicDistributionLevelsDiseaseProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy")
					txtNextAuthorReviewGeographicDistributionLevelsDisease.Text = GeographicDistributionLevelsDiseaseProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy")

					txtNextVAReviewEpidemiology.Text = EpidemiologyProfileVersionSection.NextVAReview.ToString("d MMMM yyyy")
					txtNextPolicyReviewEpidemiology.Text = EpidemiologyProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy")
					txtNextAuthorReviewEpidemiology.Text = EpidemiologyProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy")

					txtNextVAReviewCharacteristicsAgent.Text = CharacteristicsAgentProfileVersionSection.NextVAReview.ToString("d MMMM yyyy")
					txtNextPolicyReviewCharacteristicsAgent.Text = CharacteristicsAgentProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy")
					txtNextAuthorReviewCharacteristicsAgent.Text = CharacteristicsAgentProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy")

					txtNextVAReviewAnimalWelfare.Text = AnimalWelfareProfileVersionSection.NextVAReview.ToString("d MMMM yyyy")
					txtNextPolicyReviewAnimalWelfare.Text = AnimalWelfareProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy")
					txtNextAuthorReviewAnimalWelfare.Text = AnimalWelfareProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy")

					txtNextVAReviewHumanHealth.Text = HumanHealthProfileVersionSection.NextVAReview.ToString("d MMMM yyyy")
					txtNextPolicyReviewHumanHealth.Text = HumanHealthProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy")
					txtNextAuthorReviewHumanHealth.Text = HumanHealthProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy")

					txtNextVAReviewWiderSociety.Text = WiderSocietyProfileVersionSection.NextVAReview.ToString("d MMMM yyyy")
					txtNextPolicyReviewWiderSociety.Text = WiderSocietyProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy")
					txtNextAuthorReviewWiderSociety.Text = WiderSocietyProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy")

					txtNextVAReviewLegislationMandates.Text = LegislationMandatesProfileVersionSection.NextVAReview.ToString("d MMMM yyyy")
					txtNextPolicyReviewLegislationMandates.Text = LegislationMandatesProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy")
					txtNextAuthorReviewLegislationMandates.Text = LegislationMandatesProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy")

					txtNextVAReviewApproachControl.Text = ApproachControlProfileVersionSection.NextVAReview.ToString("d MMMM yyyy")
					txtNextPolicyReviewApproachControl.Text = ApproachControlProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy")
					txtNextAuthorReviewApproachControl.Text = ApproachControlProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy")

					txtNextVAReviewRiskAssessment.Text = RiskAssessmentProfileVersionSection.NextVAReview.ToString("d MMMM yyyy")
					txtNextPolicyReviewRiskAssessment.Text = RiskAssessmentProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy")
					txtNextAuthorReviewRiskAssessment.Text = RiskAssessmentProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy")

					txtNextVAReviewLaboratories.Text = LaboratoriesProfileVersionSection.NextVAReview.ToString("d MMMM yyyy")
					txtNextPolicyReviewLaboratories.Text = LaboratoriesProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy")
					txtNextAuthorReviewLaboratories.Text = LaboratoriesProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy")

					txtNextVAReviewSurveillance.Text = SurveillanceProfileVersionSection.NextVAReview.ToString("d MMMM yyyy")
					txtNextPolicyReviewSurveillance.Text = SurveillanceProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy")
					txtNextAuthorReviewSurveillance.Text = SurveillanceProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy")

					txtNextVAReviewInternationalTrade.Text = InternationalTradeProfileVersionSection.NextVAReview.ToString("d MMMM yyyy")
					txtNextPolicyReviewInternationalTrade.Text = InternationalTradeProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy")
					txtNextAuthorReviewInternationalTrade.Text = InternationalTradeProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy")

					txtNextVAReviewOpportunity.Text = OpportunityProfileVersionSection.NextVAReview.ToString("d MMMM yyyy")
					txtNextPolicyReviewOpportunity.Text = OpportunityProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy")
					txtNextAuthorReviewOpportunity.Text = OpportunityProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy")

					txtNextVAReviewPublicAndStakeholderPerception.Text = PublicAndStakeholderPerceptionProfileVersionSection.NextVAReview.ToString("d MMMM yyyy")
					txtNextPolicyReviewPublicAndStakeholderPerception.Text = PublicAndStakeholderPerceptionProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy")
					txtNextAuthorReviewPublicAndStakeholderPerception.Text = PublicAndStakeholderPerceptionProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy")

					txtNextVAReviewAreasOfUncertainty.Text = AreasOfUncertaintyProfileVersionSection.NextVAReview.ToString("d MMMM yyyy")
					txtNextPolicyReviewAreasOfUncertainty.Text = AreasOfUncertaintyProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy")
					txtNextAuthorReviewAreasOfUncertainty.Text = AreasOfUncertaintyProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy")
				Else
					lblItemNextVAReviewSummary.Text = SummaryProfileVersionSection.NextVAReview.ToString("d MMMM yyyy")
					lblItemNextPolicyReviewSummary.Text = SummaryProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy")
					lblItemNextAuthorReviewSummary.Text = SummaryProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy")

					lblItemNextVAReviewGeographicDistributionLevelsDisease.Text = GeographicDistributionLevelsDiseaseProfileVersionSection.NextVAReview.ToString("d MMMM yyyy")
					lblItemNextPolicyReviewGeographicDistributionLevelsDisease.Text = GeographicDistributionLevelsDiseaseProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy")
					lblItemNextAuthorReviewGeographicDistributionLevelsDisease.Text = GeographicDistributionLevelsDiseaseProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy")

					lblItemNextVAReviewEpidemiology.Text = EpidemiologyProfileVersionSection.NextVAReview.ToString("d MMMM yyyy")
					lblItemNextPolicyReviewEpidemiology.Text = EpidemiologyProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy")
					lblItemNextAuthorReviewEpidemiology.Text = EpidemiologyProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy")

					lblItemNextVAReviewCharacteristicsAgent.Text = CharacteristicsAgentProfileVersionSection.NextVAReview.ToString("d MMMM yyyy")
					lblItemNextPolicyReviewCharacteristicsAgent.Text = CharacteristicsAgentProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy")
					lblItemNextAuthorReviewCharacteristicsAgent.Text = CharacteristicsAgentProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy")

					lblItemNextVAReviewAnimalWelfare.Text = AnimalWelfareProfileVersionSection.NextVAReview.ToString("d MMMM yyyy")
					lblItemNextPolicyReviewAnimalWelfare.Text = AnimalWelfareProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy")
					lblItemNextAuthorReviewAnimalWelfare.Text = AnimalWelfareProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy")

					lblItemNextVAReviewHumanHealth.Text = HumanHealthProfileVersionSection.NextVAReview.ToString("d MMMM yyyy")
					lblItemNextPolicyReviewHumanHealth.Text = HumanHealthProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy")
					lblItemNextAuthorReviewHumanHealth.Text = HumanHealthProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy")

					lblItemNextVAReviewWiderSociety.Text = WiderSocietyProfileVersionSection.NextVAReview.ToString("d MMMM yyyy")
					lblItemNextPolicyReviewWiderSociety.Text = WiderSocietyProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy")
					lblItemNextAuthorReviewWiderSociety.Text = WiderSocietyProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy")

					lblItemNextVAReviewLegislationMandates.Text = LegislationMandatesProfileVersionSection.NextVAReview.ToString("d MMMM yyyy")
					lblItemNextPolicyReviewLegislationMandates.Text = LegislationMandatesProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy")
					lblItemNextAuthorReviewLegislationMandates.Text = LegislationMandatesProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy")

					lblItemNextVAReviewApproachControl.Text = ApproachControlProfileVersionSection.NextVAReview.ToString("d MMMM yyyy")
					lblItemNextPolicyReviewApproachControl.Text = ApproachControlProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy")
					lblItemNextAuthorReviewApproachControl.Text = ApproachControlProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy")

					lblItemNextVAReviewRiskAssessment.Text = RiskAssessmentProfileVersionSection.NextVAReview.ToString("d MMMM yyyy")
					lblItemNextPolicyReviewRiskAssessment.Text = RiskAssessmentProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy")
					lblItemNextAuthorReviewRiskAssessment.Text = RiskAssessmentProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy")

					lblItemNextVAReviewLaboratories.Text = LaboratoriesProfileVersionSection.NextVAReview.ToString("d MMMM yyyy")
					lblItemNextPolicyReviewLaboratories.Text = LaboratoriesProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy")
					lblItemNextAuthorReviewLaboratories.Text = LaboratoriesProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy")

					lblItemNextVAReviewSurveillance.Text = SurveillanceProfileVersionSection.NextVAReview.ToString("d MMMM yyyy")
					lblItemNextPolicyReviewSurveillance.Text = SurveillanceProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy")
					lblItemNextAuthorReviewSurveillance.Text = SurveillanceProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy")

					lblItemNextVAReviewInternationalTrade.Text = InternationalTradeProfileVersionSection.NextVAReview.ToString("d MMMM yyyy")
					lblItemNextPolicyReviewInternationalTrade.Text = InternationalTradeProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy")
					lblItemNextAuthorReviewInternationalTrade.Text = InternationalTradeProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy")

					lblItemNextVAReviewOpportunity.Text = OpportunityProfileVersionSection.NextVAReview.ToString("d MMMM yyyy")
					lblItemNextPolicyReviewOpportunity.Text = OpportunityProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy")
					lblItemNextAuthorReviewOpportunity.Text = OpportunityProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy")

					lblItemNextVAReviewPublicAndStakeholderPerception.Text = PublicAndStakeholderPerceptionProfileVersionSection.NextVAReview.ToString("d MMMM yyyy")
					lblItemNextPolicyReviewPublicAndStakeholderPerception.Text = PublicAndStakeholderPerceptionProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy")
					lblItemNextAuthorReviewPublicAndStakeholderPerception.Text = PublicAndStakeholderPerceptionProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy")

					lblItemNextVAReviewAreasOfUncertainty.Text = AreasOfUncertaintyProfileVersionSection.NextVAReview.ToString("d MMMM yyyy")
					lblItemNextPolicyReviewAreasOfUncertainty.Text = AreasOfUncertaintyProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy")
					lblItemNextAuthorReviewAreasOfUncertainty.Text = AreasOfUncertaintyProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy")
				End If

				Dim listSectionReviewStatusType As ReviewStatusTypeList = ReviewStatusTypeList.GetReviewStatusTypeList
				For Each reviewStatusTypeItem As ReviewStatusType In listSectionReviewStatusType
					If Not SummaryProfileVersionSection.VAReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = SummaryProfileVersionSection.VAReviewStatusId Then
						lblItemVAReviewStatusSummary.Text = reviewStatusTypeItem.Name
					End If

					If Not SummaryProfileVersionSection.PolicyReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = SummaryProfileVersionSection.PolicyReviewStatusId Then
						lblItemPolicyReviewStatusSummary.Text = reviewStatusTypeItem.Name
					End If

					If Not SummaryProfileVersionSection.AuthorReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = SummaryProfileVersionSection.AuthorReviewStatusId Then
						lblItemAuthorReviewStatusSummary.Text = reviewStatusTypeItem.Name
					End If

					If Not GeographicDistributionLevelsDiseaseProfileVersionSection.VAReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = GeographicDistributionLevelsDiseaseProfileVersionSection.VAReviewStatusId Then
						lblItemVAReviewStatusGeographicDistributionLevelsDisease.Text = reviewStatusTypeItem.Name
					End If

					If Not GeographicDistributionLevelsDiseaseProfileVersionSection.PolicyReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = GeographicDistributionLevelsDiseaseProfileVersionSection.PolicyReviewStatusId Then
						lblItemPolicyReviewStatusGeographicDistributionLevelsDisease.Text = reviewStatusTypeItem.Name
					End If

					If Not GeographicDistributionLevelsDiseaseProfileVersionSection.AuthorReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = GeographicDistributionLevelsDiseaseProfileVersionSection.AuthorReviewStatusId Then
						lblItemAuthorReviewStatusGeographicDistributionLevelsDisease.Text = reviewStatusTypeItem.Name
					End If

					If Not EpidemiologyProfileVersionSection.VAReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = EpidemiologyProfileVersionSection.VAReviewStatusId Then
						lblItemVAReviewStatusEpidemiology.Text = reviewStatusTypeItem.Name
					End If

					If Not EpidemiologyProfileVersionSection.PolicyReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = EpidemiologyProfileVersionSection.PolicyReviewStatusId Then
						lblItemPolicyReviewStatusEpidemiology.Text = reviewStatusTypeItem.Name
					End If

					If Not EpidemiologyProfileVersionSection.AuthorReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = EpidemiologyProfileVersionSection.AuthorReviewStatusId Then
						lblItemAuthorReviewStatusEpidemiology.Text = reviewStatusTypeItem.Name
					End If

					If Not CharacteristicsAgentProfileVersionSection.VAReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = CharacteristicsAgentProfileVersionSection.VAReviewStatusId Then
						lblItemVAReviewStatusCharacteristicsAgent.Text = reviewStatusTypeItem.Name
					End If

					If Not CharacteristicsAgentProfileVersionSection.PolicyReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = CharacteristicsAgentProfileVersionSection.PolicyReviewStatusId Then
						lblItemPolicyReviewStatusCharacteristicsAgent.Text = reviewStatusTypeItem.Name
					End If

					If Not CharacteristicsAgentProfileVersionSection.AuthorReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = CharacteristicsAgentProfileVersionSection.AuthorReviewStatusId Then
						lblItemAuthorReviewStatusCharacteristicsAgent.Text = reviewStatusTypeItem.Name
					End If

					If Not AnimalWelfareProfileVersionSection.VAReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = AnimalWelfareProfileVersionSection.VAReviewStatusId Then
						lblItemVAReviewStatusAnimalWelfare.Text = reviewStatusTypeItem.Name
					End If

					If Not AnimalWelfareProfileVersionSection.PolicyReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = AnimalWelfareProfileVersionSection.PolicyReviewStatusId Then
						lblItemPolicyReviewStatusAnimalWelfare.Text = reviewStatusTypeItem.Name
					End If

					If Not AnimalWelfareProfileVersionSection.AuthorReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = AnimalWelfareProfileVersionSection.AuthorReviewStatusId Then
						lblItemAuthorReviewStatusAnimalWelfare.Text = reviewStatusTypeItem.Name
					End If

					If Not HumanHealthProfileVersionSection.VAReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = HumanHealthProfileVersionSection.VAReviewStatusId Then
						lblItemVAReviewStatusHumanHealth.Text = reviewStatusTypeItem.Name
					End If

					If Not HumanHealthProfileVersionSection.PolicyReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = HumanHealthProfileVersionSection.PolicyReviewStatusId Then
						lblItemPolicyReviewStatusHumanHealth.Text = reviewStatusTypeItem.Name
					End If

					If Not HumanHealthProfileVersionSection.AuthorReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = HumanHealthProfileVersionSection.AuthorReviewStatusId Then
						lblItemAuthorReviewStatusHumanHealth.Text = reviewStatusTypeItem.Name
					End If

					If Not WiderSocietyProfileVersionSection.VAReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = WiderSocietyProfileVersionSection.VAReviewStatusId Then
						lblItemVAReviewStatusWiderSociety.Text = reviewStatusTypeItem.Name
					End If

					If Not WiderSocietyProfileVersionSection.PolicyReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = WiderSocietyProfileVersionSection.PolicyReviewStatusId Then
						lblItemPolicyReviewStatusWiderSociety.Text = reviewStatusTypeItem.Name
					End If

					If Not WiderSocietyProfileVersionSection.AuthorReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = WiderSocietyProfileVersionSection.AuthorReviewStatusId Then
						lblItemAuthorReviewStatusWiderSociety.Text = reviewStatusTypeItem.Name
					End If

					If Not LegislationMandatesProfileVersionSection.VAReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = LegislationMandatesProfileVersionSection.VAReviewStatusId Then
						lblItemVAReviewStatusLegislationMandates.Text = reviewStatusTypeItem.Name
					End If

					If Not LegislationMandatesProfileVersionSection.PolicyReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = LegislationMandatesProfileVersionSection.PolicyReviewStatusId Then
						lblItemPolicyReviewStatusLegislationMandates.Text = reviewStatusTypeItem.Name
					End If

					If Not LegislationMandatesProfileVersionSection.AuthorReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = LegislationMandatesProfileVersionSection.AuthorReviewStatusId Then
						lblItemAuthorReviewStatusLegislationMandates.Text = reviewStatusTypeItem.Name
					End If

					If Not ApproachControlProfileVersionSection.VAReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = ApproachControlProfileVersionSection.VAReviewStatusId Then
						lblItemVAReviewStatusApproachControl.Text = reviewStatusTypeItem.Name
					End If

					If Not ApproachControlProfileVersionSection.PolicyReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = ApproachControlProfileVersionSection.PolicyReviewStatusId Then
						lblItemPolicyReviewStatusApproachControl.Text = reviewStatusTypeItem.Name
					End If

					If Not ApproachControlProfileVersionSection.AuthorReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = ApproachControlProfileVersionSection.AuthorReviewStatusId Then
						lblItemAuthorReviewStatusApproachControl.Text = reviewStatusTypeItem.Name
					End If

					If Not RiskAssessmentProfileVersionSection.VAReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = RiskAssessmentProfileVersionSection.VAReviewStatusId Then
						lblItemVAReviewStatusRiskAssessment.Text = reviewStatusTypeItem.Name
					End If

					If Not RiskAssessmentProfileVersionSection.PolicyReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = RiskAssessmentProfileVersionSection.PolicyReviewStatusId Then
						lblItemPolicyReviewStatusRiskAssessment.Text = reviewStatusTypeItem.Name
					End If

					If Not RiskAssessmentProfileVersionSection.AuthorReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = RiskAssessmentProfileVersionSection.AuthorReviewStatusId Then
						lblItemAuthorReviewStatusRiskAssessment.Text = reviewStatusTypeItem.Name
					End If

					If Not LaboratoriesProfileVersionSection.VAReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = LaboratoriesProfileVersionSection.VAReviewStatusId Then
						lblItemVAReviewStatusLaboratories.Text = reviewStatusTypeItem.Name
					End If

					If Not LaboratoriesProfileVersionSection.PolicyReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = LaboratoriesProfileVersionSection.PolicyReviewStatusId Then
						lblItemPolicyReviewStatusLaboratories.Text = reviewStatusTypeItem.Name
					End If

					If Not LaboratoriesProfileVersionSection.AuthorReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = LaboratoriesProfileVersionSection.AuthorReviewStatusId Then
						lblItemAuthorReviewStatusLaboratories.Text = reviewStatusTypeItem.Name
					End If

					If Not SurveillanceProfileVersionSection.VAReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = SurveillanceProfileVersionSection.VAReviewStatusId Then
						lblItemVAReviewStatusSurveillance.Text = reviewStatusTypeItem.Name
					End If

					If Not SurveillanceProfileVersionSection.PolicyReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = SurveillanceProfileVersionSection.PolicyReviewStatusId Then
						lblItemPolicyReviewStatusSurveillance.Text = reviewStatusTypeItem.Name
					End If

					If Not SurveillanceProfileVersionSection.AuthorReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = SurveillanceProfileVersionSection.AuthorReviewStatusId Then
						lblItemAuthorReviewStatusSurveillance.Text = reviewStatusTypeItem.Name
					End If

					If Not InternationalTradeProfileVersionSection.VAReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = InternationalTradeProfileVersionSection.VAReviewStatusId Then
						lblItemVAReviewStatusInternationalTrade.Text = reviewStatusTypeItem.Name
					End If

					If Not InternationalTradeProfileVersionSection.PolicyReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = InternationalTradeProfileVersionSection.PolicyReviewStatusId Then
						lblItemPolicyReviewStatusInternationalTrade.Text = reviewStatusTypeItem.Name
					End If

					If Not InternationalTradeProfileVersionSection.AuthorReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = InternationalTradeProfileVersionSection.AuthorReviewStatusId Then
						lblItemAuthorReviewStatusInternationalTrade.Text = reviewStatusTypeItem.Name
					End If

					If Not OpportunityProfileVersionSection.VAReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = OpportunityProfileVersionSection.VAReviewStatusId Then
						lblItemVAReviewStatusOpportunity.Text = reviewStatusTypeItem.Name
					End If

					If Not OpportunityProfileVersionSection.PolicyReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = OpportunityProfileVersionSection.PolicyReviewStatusId Then
						lblItemPolicyReviewStatusOpportunity.Text = reviewStatusTypeItem.Name
					End If

					If Not OpportunityProfileVersionSection.AuthorReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = OpportunityProfileVersionSection.AuthorReviewStatusId Then
						lblItemAuthorReviewStatusOpportunity.Text = reviewStatusTypeItem.Name
					End If

					If Not PublicAndStakeholderPerceptionProfileVersionSection.VAReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = PublicAndStakeholderPerceptionProfileVersionSection.VAReviewStatusId Then
						lblItemVAReviewStatusPublicAndStakeholderPerception.Text = reviewStatusTypeItem.Name
					End If

					If Not PublicAndStakeholderPerceptionProfileVersionSection.PolicyReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = PublicAndStakeholderPerceptionProfileVersionSection.PolicyReviewStatusId Then
						lblItemPolicyReviewStatusPublicAndStakeholderPerception.Text = reviewStatusTypeItem.Name
					End If

					If Not PublicAndStakeholderPerceptionProfileVersionSection.AuthorReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = PublicAndStakeholderPerceptionProfileVersionSection.AuthorReviewStatusId Then
						lblItemAuthorReviewStatusPublicAndStakeholderPerception.Text = reviewStatusTypeItem.Name
					End If

					If Not AreasOfUncertaintyProfileVersionSection.VAReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = AreasOfUncertaintyProfileVersionSection.VAReviewStatusId Then
						lblItemVAReviewStatusAreasOfUncertainty.Text = reviewStatusTypeItem.Name
					End If

					If Not AreasOfUncertaintyProfileVersionSection.PolicyReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = AreasOfUncertaintyProfileVersionSection.PolicyReviewStatusId Then
						lblItemPolicyReviewStatusAreasOfUncertainty.Text = reviewStatusTypeItem.Name
					End If

					If Not AreasOfUncertaintyProfileVersionSection.AuthorReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = AreasOfUncertaintyProfileVersionSection.AuthorReviewStatusId Then
						lblItemAuthorReviewStatusAreasOfUncertainty.Text = reviewStatusTypeItem.Name
					End If
				Next
			End If

			If Not SummaryProfileVersionSection.VAReviewFrequency = Guid.Empty Then
				ddlVAReviewFreqSummary.SelectedValue = SummaryProfileVersionSection.VAReviewFrequency.ToString()
			End If

			If Not SummaryProfileVersionSection.PolicyReviewFrequency = Guid.Empty Then
				ddlPolicyReviewFreqSummary.SelectedValue = SummaryProfileVersionSection.PolicyReviewFrequency.ToString()
			End If

			If Not SummaryProfileVersionSection.AuthorReviewFrequency = Guid.Empty Then
				ddlAuthorReviewFreqSummary.SelectedValue = SummaryProfileVersionSection.AuthorReviewFrequency.ToString()
			End If

			If Not SummaryProfileVersionSection.VAReviewStatusId = Guid.Empty Then
				ddlVAReviewStatusSummary.SelectedValue = SummaryProfileVersionSection.VAReviewStatusId.ToString()
			End If

			If Not SummaryProfileVersionSection.PolicyReviewStatusId = Guid.Empty Then
				ddlPolicyReviewStatusSummary.SelectedValue = SummaryProfileVersionSection.PolicyReviewStatusId.ToString()
			End If

			If Not SummaryProfileVersionSection.AuthorReviewStatusId = Guid.Empty Then
				ddlAuthorReviewStatusSummary.SelectedValue = SummaryProfileVersionSection.AuthorReviewStatusId.ToString()
			End If
			'-------------------------------------------------------------------------------------------------------------------------------------------------------------------
			If Not GeographicDistributionLevelsDiseaseProfileVersionSection.VAReviewFrequency = Guid.Empty Then
				ddlVAReviewFreqGeographicDistributionLevelsDisease.SelectedValue = GeographicDistributionLevelsDiseaseProfileVersionSection.VAReviewFrequency.ToString()
			End If

			If Not GeographicDistributionLevelsDiseaseProfileVersionSection.PolicyReviewFrequency = Guid.Empty Then
				ddlPolicyReviewFreqGeographicDistributionLevelsDisease.SelectedValue = GeographicDistributionLevelsDiseaseProfileVersionSection.PolicyReviewFrequency.ToString()
			End If

			If Not GeographicDistributionLevelsDiseaseProfileVersionSection.VAReviewFrequency = Guid.Empty Then
				ddlVAReviewFreqGeographicDistributionLevelsDisease.SelectedValue = GeographicDistributionLevelsDiseaseProfileVersionSection.VAReviewFrequency.ToString()
			End If

			If Not GeographicDistributionLevelsDiseaseProfileVersionSection.PolicyReviewFrequency = Guid.Empty Then
				ddlPolicyReviewFreqGeographicDistributionLevelsDisease.SelectedValue = GeographicDistributionLevelsDiseaseProfileVersionSection.PolicyReviewFrequency.ToString()
			End If

			If Not GeographicDistributionLevelsDiseaseProfileVersionSection.AuthorReviewFrequency = Guid.Empty Then
				ddlAuthorReviewFreqGeographicDistributionLevelsDisease.SelectedValue = GeographicDistributionLevelsDiseaseProfileVersionSection.AuthorReviewFrequency.ToString()
			End If

			If Not GeographicDistributionLevelsDiseaseProfileVersionSection.VAReviewStatusId = Guid.Empty Then
				ddlVAReviewStatusGeographicDistributionLevelsDisease.SelectedValue = GeographicDistributionLevelsDiseaseProfileVersionSection.VAReviewStatusId.ToString()
			End If

			If Not GeographicDistributionLevelsDiseaseProfileVersionSection.PolicyReviewStatusId = Guid.Empty Then
				ddlPolicyReviewStatusGeographicDistributionLevelsDisease.SelectedValue = GeographicDistributionLevelsDiseaseProfileVersionSection.PolicyReviewStatusId.ToString()
			End If

			If Not GeographicDistributionLevelsDiseaseProfileVersionSection.AuthorReviewStatusId = Guid.Empty Then
				ddlAuthorReviewStatusGeographicDistributionLevelsDisease.SelectedValue = GeographicDistributionLevelsDiseaseProfileVersionSection.AuthorReviewStatusId.ToString()
			End If
			'-------------------------------------------------------------------------------------------------------------------------------------------------------------------
			If Not EpidemiologyProfileVersionSection.VAReviewFrequency = Guid.Empty Then
				ddlVAReviewFreqEpidemiology.SelectedValue = EpidemiologyProfileVersionSection.VAReviewFrequency.ToString()
			End If

			If Not EpidemiologyProfileVersionSection.PolicyReviewFrequency = Guid.Empty Then
				ddlPolicyReviewFreqEpidemiology.SelectedValue = EpidemiologyProfileVersionSection.PolicyReviewFrequency.ToString()
			End If

			If Not EpidemiologyProfileVersionSection.AuthorReviewFrequency = Guid.Empty Then
				ddlAuthorReviewFreqEpidemiology.SelectedValue = EpidemiologyProfileVersionSection.AuthorReviewFrequency.ToString()
			End If

			If Not EpidemiologyProfileVersionSection.VAReviewStatusId = Guid.Empty Then
				ddlVAReviewStatusEpidemiology.SelectedValue = EpidemiologyProfileVersionSection.VAReviewStatusId.ToString()
			End If

			If Not EpidemiologyProfileVersionSection.PolicyReviewStatusId = Guid.Empty Then
				ddlPolicyReviewStatusEpidemiology.SelectedValue = EpidemiologyProfileVersionSection.PolicyReviewStatusId.ToString()
			End If

			If Not EpidemiologyProfileVersionSection.AuthorReviewStatusId = Guid.Empty Then
				ddlAuthorReviewStatusEpidemiology.SelectedValue = EpidemiologyProfileVersionSection.AuthorReviewStatusId.ToString()
			End If
			'-------------------------------------------------------------------------------------------------------------------------------------------------------------------
			If Not CharacteristicsAgentProfileVersionSection.VAReviewFrequency = Guid.Empty Then
				ddlVAReviewFreqCharacteristicsAgent.SelectedValue = CharacteristicsAgentProfileVersionSection.VAReviewFrequency.ToString()
			End If

			If Not CharacteristicsAgentProfileVersionSection.PolicyReviewFrequency = Guid.Empty Then
				ddlPolicyReviewFreqCharacteristicsAgent.SelectedValue = CharacteristicsAgentProfileVersionSection.PolicyReviewFrequency.ToString()
			End If

			If Not CharacteristicsAgentProfileVersionSection.AuthorReviewFrequency = Guid.Empty Then
				ddlAuthorReviewFreqCharacteristicsAgent.SelectedValue = CharacteristicsAgentProfileVersionSection.AuthorReviewFrequency.ToString()
			End If

			If Not CharacteristicsAgentProfileVersionSection.VAReviewStatusId = Guid.Empty Then
				ddlVAReviewStatusCharacteristicsAgent.SelectedValue = CharacteristicsAgentProfileVersionSection.VAReviewStatusId.ToString()
			End If

			If Not CharacteristicsAgentProfileVersionSection.PolicyReviewStatusId = Guid.Empty Then
				ddlPolicyReviewStatusCharacteristicsAgent.SelectedValue = CharacteristicsAgentProfileVersionSection.PolicyReviewStatusId.ToString()
			End If

			If Not CharacteristicsAgentProfileVersionSection.AuthorReviewStatusId = Guid.Empty Then
				ddlAuthorReviewStatusCharacteristicsAgent.SelectedValue = CharacteristicsAgentProfileVersionSection.AuthorReviewStatusId.ToString()
			End If
			'-------------------------------------------------------------------------------------------------------------------------------------------------------------------
			If Not AnimalWelfareProfileVersionSection.VAReviewFrequency = Guid.Empty Then
				ddlVAReviewFreqAnimalWelfare.SelectedValue = AnimalWelfareProfileVersionSection.VAReviewFrequency.ToString()
			End If

			If Not AnimalWelfareProfileVersionSection.PolicyReviewFrequency = Guid.Empty Then
				ddlPolicyReviewFreqAnimalWelfare.SelectedValue = AnimalWelfareProfileVersionSection.PolicyReviewFrequency.ToString()
			End If

			If Not AnimalWelfareProfileVersionSection.AuthorReviewFrequency = Guid.Empty Then
				ddlAuthorReviewFreqAnimalWelfare.SelectedValue = AnimalWelfareProfileVersionSection.AuthorReviewFrequency.ToString()
			End If

			If Not AnimalWelfareProfileVersionSection.VAReviewStatusId = Guid.Empty Then
				ddlVAReviewStatusAnimalWelfare.SelectedValue = AnimalWelfareProfileVersionSection.VAReviewStatusId.ToString()
			End If

			If Not AnimalWelfareProfileVersionSection.PolicyReviewStatusId = Guid.Empty Then
				ddlPolicyReviewStatusAnimalWelfare.SelectedValue = AnimalWelfareProfileVersionSection.PolicyReviewStatusId.ToString()
			End If

			If Not AnimalWelfareProfileVersionSection.AuthorReviewStatusId = Guid.Empty Then
				ddlAuthorReviewStatusAnimalWelfare.SelectedValue = AnimalWelfareProfileVersionSection.AuthorReviewStatusId.ToString()
			End If
			'-------------------------------------------------------------------------------------------------------------------------------------------------------------------
			If Not HumanHealthProfileVersionSection.VAReviewFrequency = Guid.Empty Then
				ddlVAReviewFreqHumanHealth.SelectedValue = HumanHealthProfileVersionSection.VAReviewFrequency.ToString()
			End If

			If Not HumanHealthProfileVersionSection.PolicyReviewFrequency = Guid.Empty Then
				ddlPolicyReviewFreqHumanHealth.SelectedValue = HumanHealthProfileVersionSection.PolicyReviewFrequency.ToString()
			End If

			If Not HumanHealthProfileVersionSection.AuthorReviewFrequency = Guid.Empty Then
				ddlAuthorReviewFreqHumanHealth.SelectedValue = HumanHealthProfileVersionSection.AuthorReviewFrequency.ToString()
			End If

			If Not HumanHealthProfileVersionSection.VAReviewStatusId = Guid.Empty Then
				ddlVAReviewStatusHumanHealth.SelectedValue = HumanHealthProfileVersionSection.VAReviewStatusId.ToString()
			End If

			If Not HumanHealthProfileVersionSection.PolicyReviewStatusId = Guid.Empty Then
				ddlPolicyReviewStatusHumanHealth.SelectedValue = HumanHealthProfileVersionSection.PolicyReviewStatusId.ToString()
			End If

			If Not HumanHealthProfileVersionSection.AuthorReviewStatusId = Guid.Empty Then
				ddlAuthorReviewStatusHumanHealth.SelectedValue = HumanHealthProfileVersionSection.AuthorReviewStatusId.ToString()
			End If
			'-------------------------------------------------------------------------------------------------------------------------------------------------------------------
			If Not WiderSocietyProfileVersionSection.VAReviewFrequency = Guid.Empty Then
				ddlVAReviewFreqWiderSociety.SelectedValue = WiderSocietyProfileVersionSection.VAReviewFrequency.ToString()
			End If

			If Not WiderSocietyProfileVersionSection.PolicyReviewFrequency = Guid.Empty Then
				ddlPolicyReviewFreqWiderSociety.SelectedValue = WiderSocietyProfileVersionSection.PolicyReviewFrequency.ToString()
			End If

			If Not WiderSocietyProfileVersionSection.AuthorReviewFrequency = Guid.Empty Then
				ddlAuthorReviewFreqWiderSociety.SelectedValue = WiderSocietyProfileVersionSection.AuthorReviewFrequency.ToString()
			End If

			If Not WiderSocietyProfileVersionSection.VAReviewStatusId = Guid.Empty Then
				ddlVAReviewStatusWiderSociety.SelectedValue = WiderSocietyProfileVersionSection.VAReviewStatusId.ToString()
			End If

			If Not WiderSocietyProfileVersionSection.PolicyReviewStatusId = Guid.Empty Then
				ddlPolicyReviewStatusWiderSociety.SelectedValue = WiderSocietyProfileVersionSection.PolicyReviewStatusId.ToString()
			End If

			If Not WiderSocietyProfileVersionSection.AuthorReviewStatusId = Guid.Empty Then
				ddlAuthorReviewStatusWiderSociety.SelectedValue = WiderSocietyProfileVersionSection.AuthorReviewStatusId.ToString()
			End If
			'-------------------------------------------------------------------------------------------------------------------------------------------------------------------
			If Not LegislationMandatesProfileVersionSection.VAReviewFrequency = Guid.Empty Then
				ddlVAReviewFreqLegislationMandates.SelectedValue = LegislationMandatesProfileVersionSection.VAReviewFrequency.ToString()
			End If

			If Not LegislationMandatesProfileVersionSection.PolicyReviewFrequency = Guid.Empty Then
				ddlPolicyReviewFreqLegislationMandates.SelectedValue = LegislationMandatesProfileVersionSection.PolicyReviewFrequency.ToString()
			End If

			If Not LegislationMandatesProfileVersionSection.AuthorReviewFrequency = Guid.Empty Then
				ddlAuthorReviewFreqLegislationMandates.SelectedValue = LegislationMandatesProfileVersionSection.AuthorReviewFrequency.ToString()
			End If

			If Not LegislationMandatesProfileVersionSection.VAReviewStatusId = Guid.Empty Then
				ddlVAReviewStatusLegislationMandates.SelectedValue = LegislationMandatesProfileVersionSection.VAReviewStatusId.ToString()
			End If

			If Not LegislationMandatesProfileVersionSection.PolicyReviewStatusId = Guid.Empty Then
				ddlPolicyReviewStatusLegislationMandates.SelectedValue = LegislationMandatesProfileVersionSection.PolicyReviewStatusId.ToString()
			End If

			If Not LegislationMandatesProfileVersionSection.AuthorReviewStatusId = Guid.Empty Then
				ddlAuthorReviewStatusLegislationMandates.SelectedValue = LegislationMandatesProfileVersionSection.AuthorReviewStatusId.ToString()
			End If
			'-------------------------------------------------------------------------------------------------------------------------------------------------------------------
			If Not ApproachControlProfileVersionSection.VAReviewFrequency = Guid.Empty Then
				ddlVAReviewFreqApproachControl.SelectedValue = ApproachControlProfileVersionSection.VAReviewFrequency.ToString()
			End If

			If Not ApproachControlProfileVersionSection.PolicyReviewFrequency = Guid.Empty Then
				ddlPolicyReviewFreqApproachControl.SelectedValue = ApproachControlProfileVersionSection.PolicyReviewFrequency.ToString()
			End If

			If Not ApproachControlProfileVersionSection.AuthorReviewFrequency = Guid.Empty Then
				ddlAuthorReviewFreqApproachControl.SelectedValue = ApproachControlProfileVersionSection.AuthorReviewFrequency.ToString()
			End If

			If Not ApproachControlProfileVersionSection.VAReviewStatusId = Guid.Empty Then
				ddlVAReviewStatusApproachControl.SelectedValue = ApproachControlProfileVersionSection.VAReviewStatusId.ToString()
			End If

			If Not ApproachControlProfileVersionSection.PolicyReviewStatusId = Guid.Empty Then
				ddlPolicyReviewStatusApproachControl.SelectedValue = ApproachControlProfileVersionSection.PolicyReviewStatusId.ToString()
			End If

			If Not ApproachControlProfileVersionSection.AuthorReviewStatusId = Guid.Empty Then
				ddlAuthorReviewStatusApproachControl.SelectedValue = ApproachControlProfileVersionSection.AuthorReviewStatusId.ToString()
			End If
			'-------------------------------------------------------------------------------------------------------------------------------------------------------------------
			If Not RiskAssessmentProfileVersionSection.VAReviewFrequency = Guid.Empty Then
				ddlVAReviewFreqRiskAssessment.SelectedValue = RiskAssessmentProfileVersionSection.VAReviewFrequency.ToString()
			End If

			If Not RiskAssessmentProfileVersionSection.PolicyReviewFrequency = Guid.Empty Then
				ddlPolicyReviewFreqRiskAssessment.SelectedValue = RiskAssessmentProfileVersionSection.PolicyReviewFrequency.ToString()
			End If

			If Not RiskAssessmentProfileVersionSection.AuthorReviewFrequency = Guid.Empty Then
				ddlAuthorReviewFreqRiskAssessment.SelectedValue = RiskAssessmentProfileVersionSection.AuthorReviewFrequency.ToString()
			End If

			If Not RiskAssessmentProfileVersionSection.VAReviewStatusId = Guid.Empty Then
				ddlVAReviewStatusRiskAssessment.SelectedValue = RiskAssessmentProfileVersionSection.VAReviewStatusId.ToString()
			End If

			If Not RiskAssessmentProfileVersionSection.PolicyReviewStatusId = Guid.Empty Then
				ddlPolicyReviewStatusRiskAssessment.SelectedValue = RiskAssessmentProfileVersionSection.PolicyReviewStatusId.ToString()
			End If

			If Not RiskAssessmentProfileVersionSection.AuthorReviewStatusId = Guid.Empty Then
				ddlAuthorReviewStatusRiskAssessment.SelectedValue = RiskAssessmentProfileVersionSection.AuthorReviewStatusId.ToString()
			End If
			'-------------------------------------------------------------------------------------------------------------------------------------------------------------------
			If Not LaboratoriesProfileVersionSection.VAReviewFrequency = Guid.Empty Then
				ddlVAReviewFreqLaboratories.SelectedValue = LaboratoriesProfileVersionSection.VAReviewFrequency.ToString()
			End If

			If Not LaboratoriesProfileVersionSection.PolicyReviewFrequency = Guid.Empty Then
				ddlPolicyReviewFreqLaboratories.SelectedValue = LaboratoriesProfileVersionSection.PolicyReviewFrequency.ToString()
			End If

			If Not LaboratoriesProfileVersionSection.AuthorReviewFrequency = Guid.Empty Then
				ddlAuthorReviewFreqLaboratories.SelectedValue = LaboratoriesProfileVersionSection.AuthorReviewFrequency.ToString()
			End If

			If Not LaboratoriesProfileVersionSection.VAReviewStatusId = Guid.Empty Then
				ddlVAReviewStatusLaboratories.SelectedValue = LaboratoriesProfileVersionSection.VAReviewStatusId.ToString()
			End If

			If Not LaboratoriesProfileVersionSection.PolicyReviewStatusId = Guid.Empty Then
				ddlPolicyReviewStatusLaboratories.SelectedValue = LaboratoriesProfileVersionSection.PolicyReviewStatusId.ToString()
			End If

			If Not LaboratoriesProfileVersionSection.AuthorReviewStatusId = Guid.Empty Then
				ddlAuthorReviewStatusLaboratories.SelectedValue = LaboratoriesProfileVersionSection.AuthorReviewStatusId.ToString()
			End If
			'-------------------------------------------------------------------------------------------------------------------------------------------------------------------
			If Not SurveillanceProfileVersionSection.VAReviewFrequency = Guid.Empty Then
				ddlVAReviewFreqSurveillance.SelectedValue = SurveillanceProfileVersionSection.VAReviewFrequency.ToString()
			End If

			If Not SurveillanceProfileVersionSection.PolicyReviewFrequency = Guid.Empty Then
				ddlPolicyReviewFreqSurveillance.SelectedValue = SurveillanceProfileVersionSection.PolicyReviewFrequency.ToString()
			End If

			If Not SurveillanceProfileVersionSection.AuthorReviewFrequency = Guid.Empty Then
				ddlAuthorReviewFreqSurveillance.SelectedValue = SurveillanceProfileVersionSection.AuthorReviewFrequency.ToString()
			End If

			If Not SurveillanceProfileVersionSection.VAReviewStatusId = Guid.Empty Then
				ddlVAReviewStatusSurveillance.SelectedValue = SurveillanceProfileVersionSection.VAReviewStatusId.ToString()
			End If

			If Not SurveillanceProfileVersionSection.PolicyReviewStatusId = Guid.Empty Then
				ddlPolicyReviewStatusSurveillance.SelectedValue = SurveillanceProfileVersionSection.PolicyReviewStatusId.ToString()
			End If

			If Not SurveillanceProfileVersionSection.AuthorReviewStatusId = Guid.Empty Then
				ddlAuthorReviewStatusSurveillance.SelectedValue = SurveillanceProfileVersionSection.AuthorReviewStatusId.ToString()
			End If
			'-------------------------------------------------------------------------------------------------------------------------------------------------------------------
			If Not InternationalTradeProfileVersionSection.VAReviewFrequency = Guid.Empty Then
				ddlVAReviewFreqInternationalTrade.SelectedValue = InternationalTradeProfileVersionSection.VAReviewFrequency.ToString()
			End If

			If Not InternationalTradeProfileVersionSection.PolicyReviewFrequency = Guid.Empty Then
				ddlPolicyReviewFreqInternationalTrade.SelectedValue = InternationalTradeProfileVersionSection.PolicyReviewFrequency.ToString()
			End If

			If Not InternationalTradeProfileVersionSection.AuthorReviewFrequency = Guid.Empty Then
				ddlAuthorReviewFreqInternationalTrade.SelectedValue = InternationalTradeProfileVersionSection.AuthorReviewFrequency.ToString()
			End If

			If Not InternationalTradeProfileVersionSection.VAReviewStatusId = Guid.Empty Then
				ddlVAReviewStatusInternationalTrade.SelectedValue = InternationalTradeProfileVersionSection.VAReviewStatusId.ToString()
			End If

			If Not InternationalTradeProfileVersionSection.PolicyReviewStatusId = Guid.Empty Then
				ddlPolicyReviewStatusInternationalTrade.SelectedValue = InternationalTradeProfileVersionSection.PolicyReviewStatusId.ToString()
			End If

			If Not InternationalTradeProfileVersionSection.AuthorReviewStatusId = Guid.Empty Then
				ddlAuthorReviewStatusInternationalTrade.SelectedValue = InternationalTradeProfileVersionSection.AuthorReviewStatusId.ToString()
			End If
			'-------------------------------------------------------------------------------------------------------------------------------------------------------------------
			If Not OpportunityProfileVersionSection.VAReviewFrequency = Guid.Empty Then
				ddlVAReviewFreqOpportunity.SelectedValue = OpportunityProfileVersionSection.VAReviewFrequency.ToString()
			End If

			If Not OpportunityProfileVersionSection.PolicyReviewFrequency = Guid.Empty Then
				ddlPolicyReviewFreqOpportunity.SelectedValue = OpportunityProfileVersionSection.PolicyReviewFrequency.ToString()
			End If

			If Not OpportunityProfileVersionSection.AuthorReviewFrequency = Guid.Empty Then
				ddlAuthorReviewFreqOpportunity.SelectedValue = OpportunityProfileVersionSection.AuthorReviewFrequency.ToString()
			End If

			If Not OpportunityProfileVersionSection.VAReviewStatusId = Guid.Empty Then
				ddlVAReviewStatusOpportunity.SelectedValue = OpportunityProfileVersionSection.VAReviewStatusId.ToString()
			End If

			If Not OpportunityProfileVersionSection.PolicyReviewStatusId = Guid.Empty Then
				ddlPolicyReviewStatusOpportunity.SelectedValue = OpportunityProfileVersionSection.PolicyReviewStatusId.ToString()
			End If

			If Not OpportunityProfileVersionSection.AuthorReviewStatusId = Guid.Empty Then
				ddlAuthorReviewStatusOpportunity.SelectedValue = OpportunityProfileVersionSection.AuthorReviewStatusId.ToString()
			End If
			'-------------------------------------------------------------------------------------------------------------------------------------------------------------------
			If Not PublicAndStakeholderPerceptionProfileVersionSection.VAReviewFrequency = Guid.Empty Then
				ddlVAReviewFreqPublicAndStakeholderPerception.SelectedValue = PublicAndStakeholderPerceptionProfileVersionSection.VAReviewFrequency.ToString()
			End If

			If Not PublicAndStakeholderPerceptionProfileVersionSection.PolicyReviewFrequency = Guid.Empty Then
				ddlPolicyReviewFreqPublicAndStakeholderPerception.SelectedValue = PublicAndStakeholderPerceptionProfileVersionSection.PolicyReviewFrequency.ToString()
			End If

			If Not PublicAndStakeholderPerceptionProfileVersionSection.AuthorReviewFrequency = Guid.Empty Then
				ddlAuthorReviewFreqPublicAndStakeholderPerception.SelectedValue = PublicAndStakeholderPerceptionProfileVersionSection.AuthorReviewFrequency.ToString()
			End If

			If Not PublicAndStakeholderPerceptionProfileVersionSection.VAReviewStatusId = Guid.Empty Then
				ddlVAReviewStatusPublicAndStakeholderPerception.SelectedValue = PublicAndStakeholderPerceptionProfileVersionSection.VAReviewStatusId.ToString()
			End If

			If Not PublicAndStakeholderPerceptionProfileVersionSection.PolicyReviewStatusId = Guid.Empty Then
				ddlPolicyReviewStatusPublicAndStakeholderPerception.SelectedValue = PublicAndStakeholderPerceptionProfileVersionSection.PolicyReviewStatusId.ToString()
			End If

			If Not PublicAndStakeholderPerceptionProfileVersionSection.AuthorReviewStatusId = Guid.Empty Then
				ddlAuthorReviewStatusPublicAndStakeholderPerception.SelectedValue = PublicAndStakeholderPerceptionProfileVersionSection.AuthorReviewStatusId.ToString()
			End If
			'-------------------------------------------------------------------------------------------------------------------------------------------------------------------
			If Not AreasOfUncertaintyProfileVersionSection.VAReviewFrequency = Guid.Empty Then
				ddlVAReviewFreqAreasOfUncertainty.SelectedValue = AreasOfUncertaintyProfileVersionSection.VAReviewFrequency.ToString()
			End If

			If Not AreasOfUncertaintyProfileVersionSection.PolicyReviewFrequency = Guid.Empty Then
				ddlPolicyReviewFreqAreasOfUncertainty.SelectedValue = AreasOfUncertaintyProfileVersionSection.PolicyReviewFrequency.ToString()
			End If

			If Not AreasOfUncertaintyProfileVersionSection.AuthorReviewFrequency = Guid.Empty Then
				ddlAuthorReviewFreqAreasOfUncertainty.SelectedValue = AreasOfUncertaintyProfileVersionSection.AuthorReviewFrequency.ToString()
			End If

			If Not AreasOfUncertaintyProfileVersionSection.VAReviewStatusId = Guid.Empty Then
				ddlVAReviewStatusAreasOfUncertainty.SelectedValue = AreasOfUncertaintyProfileVersionSection.VAReviewStatusId.ToString()
			End If

			If Not AreasOfUncertaintyProfileVersionSection.PolicyReviewStatusId = Guid.Empty Then
				ddlPolicyReviewStatusAreasOfUncertainty.SelectedValue = AreasOfUncertaintyProfileVersionSection.PolicyReviewStatusId.ToString()
			End If

			If Not AreasOfUncertaintyProfileVersionSection.AuthorReviewStatusId = Guid.Empty Then
				ddlAuthorReviewStatusAreasOfUncertainty.SelectedValue = AreasOfUncertaintyProfileVersionSection.AuthorReviewStatusId.ToString()
			End If

			'show the editable UI
			DisplayEditableReviewFrequencies(True)

			If canEditNextReviewDates Then
				DisplayEditableReviewDates(True)
			Else
				DisplayReadOnlyReviewDates(True)
			End If

			DisplayEditableReviewStatuses(True)

		End If

	End Sub

	Protected Sub tabStrip_TabClick(ByVal sender As Object, ByVal e As TabClickEventArgs) Handles tabStrip.TabClick

		Page.Validate()

		If Not Page.IsValid Then
			Exit Sub
		End If

		'If mCanEditProfileVersionSection Then
		'    If Not PersistSectionInfoToDatabase() Then
		'        Exit Sub
		'    End If
		'End If

		Select Case e.Tab.Text
			Case "References"
				Response.Redirect(String.Format("~/EditProfileReferences.aspx?ProfileVersionId={0}&ProfileSectionId={1}", mProfileVersionInfo.Id.ToString(), CurrentProfileSectionId.ToString()))
			Case "Further information"
				Response.Redirect(String.Format("~/EditProfileFurtherInformation.aspx?ProfileVersionId={0}&ProfileSectionId={1}", mProfileVersionInfo.Id.ToString(), CurrentProfileSectionId.ToString()))
			Case "Review comments"
				Response.Redirect(String.Format("~/EditProfileReviewComments.aspx?ProfileVersionId={0}&ProfileSectionId={1}", mProfileVersionInfo.Id.ToString(), CurrentProfileSectionId.ToString()))
			Case "All Revision dates"
				Response.Redirect(String.Format("~/EditProfileAllRevisionDates.aspx?ProfileVersionId={0}&ProfileSectionId={1}", mProfileVersionInfo.Id.ToString(), CurrentProfileSectionId.ToString()))
			Case "Contributions"
				Response.Redirect(String.Format("~/EditProfileContributions.aspx?ProfileVersionId={0}&ProfileSectionId={1}", mProfileVersionInfo.Id.ToString(), CurrentProfileSectionId.ToString()))
			Case Else
				Response.Redirect(String.Format("~/EditProfileQuestions.aspx?ProfileVersionId={0}&ProfileSectionId={1}", mProfileVersionInfo.Id.ToString(), CurrentProfileSectionId.ToString()))
		End Select

	End Sub

	Protected Sub ctlSectionLinks_NavigateHome(ByVal sender As Object, ByVal e As System.ComponentModel.CancelEventArgs) Handles savePrompt.AttemptNavigateAwayEvent
		' if navigating away from profile then save changes to profile object
		If mCanEditProfileVersionSection Then
			PersistSectionInfoToProfileVersion()
			e.Cancel = CurrentProfileVersionSection.IsDirty
		End If
	End Sub

	Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click, btnSave2.Click
		If mCanEditProfileVersionSection Then
			PersistSectionInfoToDatabase()
		End If
	End Sub

	Protected Sub lnkPublish_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkPublish.Click, lnkPublishPublic.Click

		Dim profileData As ProfilesLibrary.Profile = ProfilesLibrary.Profile.GetProfile(mProfileVersionInfo.ProfileId)
		If profileData Is Nothing Then
			lblErrorDesc.Text = "Profile publication failed: You may have used the back button or your session timed out"
			Exit Sub
		End If

		Try
			Dim invalidReasonList As List(Of InvalidReason) = New List(Of InvalidReason)(profileData.Validate())

			If invalidReasonList.Count > 0 Then
				ctlInvalidReasonList.InvalidReasons = invalidReasonList
			Else
				Dim newPublishedVersion As Guid
				If DirectCast(sender, LinkButton).ID = "lnkPublishPublic" Then
					newPublishedVersion = profileData.Publish(True)
				Else
					newPublishedVersion = profileData.Publish(False)
				End If
				CurrentProfile = Nothing
				Session("PublishFlag") = 1
				Response.Redirect("~/ProfileReports.aspx?ProfileVersionId=" & newPublishedVersion.ToString())
			End If
		Catch ex As Csla.DataPortalException
			lblErrorDesc.Text = ex.BusinessException.Message
			Dim profileId As Guid = New Guid(Request.QueryString("ProfileId"))
			CurrentProfile = ProfilesLibrary.Profile.GetProfile(profileId)
			SetUIValues()
		End Try
	End Sub

	Private Sub EditProfileAllRevisionDates_Load(sender As Object, e As EventArgs) Handles Me.Load

		If Page.IsPostBack Then
			HandleCustomPostBackFromTabManager()
		End If

		SectionPagination.TargetUrl = "EditProfileAllRevisionDates.aspx?ProfileVersionId=" & mProfileVersionInfo.Id.ToString & "&ProfileSectionId={0}"
		SectionPagination.SetupPaginationLinks(ProfileVersionSectionList.GetProfileVersionSectionList(mProfileVersionInfo.Id), CurrentProfileSectionId)

	End Sub

	Private Sub HandleCustomPostBackFromTabManager()
		If Not String.IsNullOrEmpty(Request.Form("__EVENTTARGET")) Then
			If Request.Form("__EVENTTARGET") = "tabStrip" Then
				Dim t As TabItem = New TabItem
				Dim o As String = Request.Form("__EVENTARGUMENT")
				t.Text = o
				Dim ev As TabClickEventArgs = New TabClickEventArgs(t)
				tabStrip_TabClick(Me, ev)
			End If
		End If
	End Sub
End Class