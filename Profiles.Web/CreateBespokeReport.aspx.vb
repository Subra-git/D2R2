Imports ProfilesLibrary
Imports Profiles.WebControls
Imports Telerik.Web.UI
Imports Profiles.Contracts.ServiceContracts
Imports Profiles.Contracts.DataContracts
Imports Profiles.Contracts

Public Class CreateBespokeReport
	Inherits System.Web.UI.Page

	Private mProfileVersionInfo As ProfileVersionInfo
	Private mProfileScenarioInfo As ProfileScenarioInfo

	Private mProfileNode As RadTreeNode
	Private msectionNode As RadTreeNode
	Private mQuestionNode As RadTreeNode

	Protected errorMessage As String
	Protected isProfileEditor As Boolean

	Private mBespokeReportTemplateService As IBespokeReportTemplateService

	Public Enum ProfileNodeTypeEnum
		Profile = 0
		Section = 1
		Question = 2
		Guidance = 3
	End Enum

	Protected Property SelectedReportTemplate() As Contracts.DataContracts.BespokeReportTemplateResponse
		Get
			Return DirectCast(ViewState("BespokeReportTemplateResponse"), Contracts.DataContracts.BespokeReportTemplateResponse)
		End Get
		Set(ByVal value As Contracts.DataContracts.BespokeReportTemplateResponse)
			ViewState("BespokeReportTemplateResponse") = value
		End Set
	End Property

	Private Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init
		'set the page to expire immediately, so that if the user presses the back button a new request
		'will be sent to the server
		SetPageExpireImmediately(Response)

		mBespokeReportTemplateService = DataFactory.GetBespokeReportTemplateService()

		GuardCanView()

		isProfileEditor = TemplateService.CanEdit()

		If Not Page.IsPostBack Then
			errorMessage = Nothing

			If Not CommonUI.IsValidGuid(Request.QueryString("ProfileVersionId")) Then
				Throw New InvalidOperationException("There was an invalid or missing profile version id passed to the page.")
			End If

			Dim profileVersionId As Guid = New Guid(Request.QueryString("ProfileVersionId"))

			mProfileVersionInfo = ProfileVersionInfo.GetProfileVersionInfo(profileVersionId)

			SetBreadCrumb(profileVersionId)

			ScriptManager.RegisterStartupScript(Me, Me.GetType(),
										"bespokeReportsTemplates",
										$"<script>window.apha.bespokeReportsTemplates.init('{ templateTitle.ClientID }', '{templatesDropdown.ClientID}') </script>",
										False)
		End If
	End Sub



	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		If Page.IsPostBack Then
			Return
		End If

		Dim templateId As Guid = If(Request.QueryString("TemplateId") Is Nothing, Guid.Empty, New Guid(Request.QueryString("TemplateId")))

		If Not templateId.Equals(Guid.Empty) Then
			SelectedReportTemplate = TemplateService.GetSingleOrDefault(templateId)
		End If

		AddTreeNodes(ProfileSectionInfo.Nodes)

		RefreshDropdown()

		RefreshText()

		If SelectedReportTemplate IsNot Nothing Then
			CheckNodes(ProfileSectionInfo.Nodes)
		End If
	End Sub

	Private Sub AddTreeNodes(ByVal nodeList As RadTreeNodeCollection)
		mProfileNode = New RadTreeNode(mProfileVersionInfo.Title)
		mProfileNode.Checkable = True
		mProfileNode.Category = ProfileNodeTypeEnum.Profile
		mProfileNode.Expanded = True
		mProfileNode.Value = mProfileVersionInfo.Id.ToString

		nodeList.Add(mProfileNode)

		Dim Sections As ProfileSectionMetadataList = ProfileSectionMetadataList.GetProfileSectionMetadataList()
		For Each section As ProfilesLibrary.ProfileSectionMetadata In Sections

			msectionNode = New RadTreeNode((section.SectionNumber.ToString + " : " + section.Name))
			msectionNode.Category = ProfileNodeTypeEnum.Section
			msectionNode.Value = section.Id.ToString

			msectionNode.DataBind()
			mProfileNode.Nodes.Add(msectionNode)

			Dim CurrentProfileVersionSection = ProfilesLibrary.ProfileVersionSection.GetProfileVersionSection(mProfileVersionInfo.Id, section.Id)
			For Each question As QuestionBase In CurrentProfileVersionSection.Questions
				Dim questionNode As New RadTreeNode((question.QuestionNumber.ToString + " : " + question.Name))
				questionNode.Value = question.Id.ToString
				questionNode.Category = ProfileNodeTypeEnum.Question

				Dim guidanceNode As New RadTreeNode(question.QuestionNumber.ToString + " Guidance : " + question.Name)
				guidanceNode.Value = question.Id.ToString
				guidanceNode.Category = ProfileNodeTypeEnum.Guidance
				guidanceNode.Attributes.Add("data-is-guidance", "1")
				questionNode.DataBind()
				guidanceNode.DataBind()

				msectionNode.Nodes.Add(guidanceNode)
				msectionNode.Nodes.Add(questionNode)
			Next
		Next
	End Sub

	Public Sub GenerateCustomPdf(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGenerateReport.Click
		Dim selectedSections As New List(Of String)
		Dim selectedQuestions As New List(Of String)
		Dim selectedGuidance As New List(Of String)
		Dim checkedNodes = ProfileSectionInfo.CheckedNodes

		For Each item As RadTreeNode In checkedNodes
			Dim category As ProfileNodeTypeEnum = [Enum].Parse(GetType(ProfileNodeTypeEnum), item.Category)

			If category.Equals(ProfileNodeTypeEnum.Section) Then
				selectedSections.Add(item.Value.ToString)
			End If

			If category.Equals(ProfileNodeTypeEnum.Question) Then
				selectedQuestions.Add(item.Value.ToString)
			End If


			If category.Equals(ProfileNodeTypeEnum.Guidance) Then
				selectedGuidance.Add(item.Value.ToString)
			End If
		Next

		GetCustomReport(Request.QueryString("ProfileVersionId"), selectedSections, selectedQuestions, selectedGuidance)
	End Sub

	Private Sub GetCustomReport(profileVersionId, sections, questions, guidance)
		Dim reportService = DataFactory.GetProfileReportService()

		Dim templateTitle = If(SelectedReportTemplate Is Nothing, "Bespoke Profile Report", SelectedReportTemplate.Title)

		Dim bespokeReportReq = New GetProfileVersionBespokeReportRequest(New Guid(profileVersionId.ToString), sections, questions, guidance, templateTitle)

		Dim pdfData As Byte() = reportService _
								.GetProfileVersionBespokeReport(bespokeReportReq) _
								.PdfData

		If pdfData Is Nothing Then
			Throw New InvalidOperationException("Could not create a custom bespoke report")
		End If

		Response.DownloadPdfBytes(pdfData, templateTitle)
	End Sub

	Protected Sub templatesDropdown_SelectedIndexChanged(sender As Object, e As EventArgs)
		Dim guid As New Guid(sender.SelectedValue.ToString)

		If guid.Equals(Guid.Empty) Then
			SelectedReportTemplate = Nothing

			CheckNodes(ProfileSectionInfo.Nodes)

			RedirectToSelf("")
		End If

		RedirectToSelf("", guid.ToString)
	End Sub

	Protected Sub SaveTemplateAs_Click(sender As Object, e As EventArgs)
		Dim selectedReportTemplate = TemplateService.SaveAs(New Contracts.DataContracts.BespokeReportTemplateRequest() With {.Title = templateTitle.Text, .CheckedList = CheckedNodes})

		RedirectToSelf("TEMPLATESAVED", selectedReportTemplate.Id.ToString)
	End Sub

	Protected Sub SaveTemplate_Click(sender As Object, e As EventArgs)
		If SelectedReportTemplate Is Nothing Then
			Return
		End If

		Dim template = TemplateService.Save(New Contracts.DataContracts.BespokeReportTemplateRequest With
													  {
														  .Title = SelectedReportTemplate.Title,
														  .CheckedList = CheckedNodes,
														  .Id = SelectedReportTemplate.Id
													  })

		RedirectToSelf("TEMPLATESAVED", template.Id.ToString)
	End Sub

	Protected Sub SaveTemplateTitle_Click(sender As Object, e As EventArgs)
		Dim template = TemplateService.SaveTitle(templateEditTitle.Text, SelectedReportTemplate.Id)

		RedirectToSelf("TEMPLATETITLESAVED", template.Id.ToString)
	End Sub

	Protected Sub DeleteButton_Click(sender As Object, e As EventArgs)
		If SelectedReportTemplate Is Nothing Then
			Return
		End If

		TemplateService.Delete(SelectedReportTemplate.Id)

		SelectedReportTemplate = Nothing

		RedirectToSelf("TEMPLATEDELETED")
	End Sub

	Protected Sub TitleExistsValidator_ServerValidate(source As Object, args As ServerValidateEventArgs)
		Dim possiblyExists = TemplateService.GetSingleByTitleOrDefault(args.Value)

		args.IsValid = (possiblyExists Is Nothing)
	End Sub

	Protected Function IntroductoryText() As String
		Dim result = ""

		If Not Me.isProfileEditor Then
			result = "Using the dropdown below, select a template to generate a bespoke report on the selected disease profile."
		Else
			result = "Using the tree below, select sections, questions and guidance to create a bespoke report on the selected disease profile. 
                To save, update or delete a template, select a template from the dropdown below. Template titles can be edited once a template has been selected from the dropdown."
		End If

		Return result
	End Function

	Private Sub RedirectToSelf(message As String, Optional templateId As String = "")
		Dim profileVersionId As Guid = New Guid(Request.QueryString("ProfileVersionId"))

		Dim messagaQuery = If(String.IsNullOrEmpty(message), "", $"&message={message}")
		Dim templateIdQuery = If(String.IsNullOrEmpty(templateId), "", $"&TemplateId={templateId}")

		Response.Redirect($"CreateBespokeReport.aspx?ProfileVersionId={profileVersionId}{messagaQuery}{templateIdQuery}")
	End Sub

	Private Sub RefreshText()
		If SelectedReportTemplate IsNot Nothing Then
			templateTitle.Text = SelectedReportTemplate.Title
			templateEditTitle.Text = SelectedReportTemplate.Title
		End If
	End Sub

	Private Sub CheckNodes(ByVal nodes As RadTreeNodeCollection)
		Traverse(nodes, Sub(node As RadTreeNode)
							node.Checked = False
							If (SelectedReportTemplate IsNot Nothing) Then
								node.Checked = SelectedReportTemplate.CheckedList.Contains(UniqueNodeValue(node))

								If node.ParentNode IsNot Nothing AndAlso node.Checked Then
									node.ParentNode.Checked = True
								End If
							End If
						End Sub)
	End Sub

	Private Sub Traverse(ByVal nodes As RadTreeNodeCollection, action As Action(Of RadTreeNode))
		For Each node As RadTreeNode In nodes
			action(node)

			Traverse(node.Nodes, action)
		Next
	End Sub

	Private ReadOnly Property CheckedNodes() As List(Of String)
		Get
			Return ProfileSectionInfo.CheckedNodes.Cast(Of RadTreeNode).Select(Function(x)
																				   Return UniqueNodeValue(x)
																			   End Function).ToList()
		End Get
	End Property

	Private Function UniqueNodeValue(node As RadTreeNode) As String
		Return node.Value + node.Category
	End Function

	Private Sub SetBreadCrumb(profileVersionId As Guid)
		Dim master = CType(Page.Master, ProfilesTemplate)

		Dim link As System.Web.UI.WebControls.HyperLink
		link = CType(master.FindControl("breadcrumbs").Controls(4).Controls(0), System.Web.UI.WebControls.HyperLink)
		link.NavigateUrl = link.NavigateUrl & "?ProfileVersionId=" & profileVersionId.ToString()
	End Sub

	Private Sub RefreshDropdown()
		Dim templates = TemplateService.GetAll()

		templatesDropdown.Items.Clear()

		templatesDropdown.Items.Add(New ListItem("Select template (optional)", Guid.Empty.ToString(), True))

		templates.ToList().ForEach(Sub(x)
									   templatesDropdown.Items.Add(New ListItem() With {.Text = x.Title, .Value = x.Id.ToString()})
								   End Sub)

		If SelectedReportTemplate IsNot Nothing Then
			Dim possiblyExists = TemplateService.GetSingleOrDefault(SelectedReportTemplate.Id)

			If possiblyExists Is Nothing Then
				SelectedReportTemplate = Nothing
			End If

			If possiblyExists IsNot Nothing Then
				templatesDropdown.SelectedValue = SelectedReportTemplate.Id.ToString()
			End If
		End If
	End Sub

	Private ReadOnly Property TemplateService() As IBespokeReportTemplateService
		Get
			Return Me.mBespokeReportTemplateService
		End Get
	End Property

	Private Sub GuardCanView()
		If Not TemplateService.CanView() Then
			Throw New System.Security.SecurityException("You do not have permission to generate bespoke reports")
		End If
	End Sub
End Class