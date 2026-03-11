Imports System.ComponentModel
Imports ProfilesLibrary

Partial Class ProfileSectionLinks
    Inherits System.Web.UI.UserControl

    Public Event Save As CancelEventHandler
    Public Event NavigateHome As CancelEventHandler

    Protected ReadOnly Property EditProfileVersionInfo() As ProfileVersionInfo
        Get
            If Not Session("EditProfileVersionInfo") Is Nothing Then
                Return DirectCast(Session("EditProfileVersionInfo"), ProfileVersionInfo)
            Else
                Return Nothing
            End If
        End Get
    End Property

    Protected Overridable Sub OnSave(ByVal e As CancelEventArgs)
        RaiseEvent Save(Me, e)
    End Sub

    Protected Overridable Sub OnNavigateHome(ByVal e As CancelEventArgs)
        RaiseEvent NavigateHome(Me, e)
    End Sub

    Protected Sub dsProfileSectionInfoList_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsProfileSectionInfoList.SelectObject
        e.BusinessObject = ProfileSectionMetadataList.GetProfileSectionMetadataList()
    End Sub

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1011:ConsiderPassingBaseTypesAsParameters")>
    Protected Sub rptSectionLinks_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.RepeaterCommandEventArgs) Handles rptSectionLinks.ItemCommand

        Dim args As New CancelEventArgs(False)
        OnSave(args)

        If Not args.Cancel Then
            Response.Redirect(String.Format("~/EditProfileQuestions.aspx?ProfileVersionId={0}&ProfileSectionId={1}", EditProfileVersionInfo.Id.ToString(), e.CommandArgument.ToString()))
        End If

    End Sub

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

		If EditProfileVersionInfo Is Nothing Then
			Return
		End If

		If EditProfileVersionInfo.CanGetPrintVersion() Then
			litPrint.Text = LinkTemplate("Print full profile", "#", $"window.open('ShowProfilePrintVersion.aspx?ProfileVersionId={EditProfileVersionInfo.Id}');return false;")
		End If

		If EditProfileVersionInfo.CanGetSummaryProfileReport() Then
			litSummaryProfileReport.Text = LinkTemplate("Summary profile report", $"ShowDraftSummaryProfileReport.aspx?ProfileVersionId={EditProfileVersionInfo.Id}")
		End If

		If EditProfileVersionInfo.CanGetSummaryPrioritisationReport() Then
			litSummaryPrioritisationReport.Text = LinkTemplate("Summary prioritisation report", $"ShowDraftSummaryPrioritisationReport.aspx?ProfileVersionId={EditProfileVersionInfo.Id}")
		End If

		If ProfileVersionReportInfoList.CanGetList(EditProfileVersionInfo) Then
			litProfileReports.Text = LinkTemplate("Profile reports", $"ProfileReports.aspx?ProfileVersionId={EditProfileVersionInfo.Id}")
		End If

		If NoteList.CanGetNoteList(EditProfileVersionInfo.ProfileId) Then
			Dim currentClass = If(IsProfileReferencePage(), "--current reference-linknav-background", "")

			litReferences.Text = LinkTemplate("Profile references", $"Notes.aspx?ProfileVersionId={EditProfileVersionInfo.Id}", Nothing, currentClass)
		End If

	End Sub

	Private Sub rptSectionLinks_PreRender(sender As Object, e As EventArgs) Handles rptSectionLinks.PreRender
        Dim strProfileSectionId As String = Request.QueryString("ProfileSectionId")
        If rptSectionLinks.Items.Count = 0 Then
            rptSectionLinks.DataBind()
        End If
        For Each item As RepeaterItem In rptSectionLinks.Items
            Dim button As LinkButton = CType(item.FindControl("lnkProfileSection"), LinkButton)
            Dim li As HtmlGenericControl = CType(item.FindControl("liWrapper"), HtmlGenericControl)

            If IsProfileReferencePage() Then
                li.Attributes.Add("class", "app-subnav__section-item")
            Else
                If String.IsNullOrEmpty(strProfileSectionId) Then
                    ' loading for the first time, lets get the first item's id
                    strProfileSectionId = button.CommandArgument
                End If

                If button.CommandArgument = strProfileSectionId Then
                    li.Attributes.Add("class", "app-subnav__section-item--current")
                    button.Attributes.Add("aria-current", "page")
                Else
                    li.Attributes.Add("class", "app-subnav__section-item")
                    button.Attributes.Remove("aria-current")

                End If
            End If
        Next
    End Sub

	Private Function IsProfileReferencePage() As Boolean
		Return Request.Path.Contains("/Notes.aspx")
	End Function

	Private Function LinkTemplate(title As String, href As String, Optional onclick As String = "", Optional cssclass As String = "") As String
		Dim onClickAttr = If(Not String.IsNullOrEmpty(onclick), $"onclick='{ onclick.Replace("'", """")}'", "")

        Return $"<li class='app-subnav__section-item{cssclass}'>
					<a class='app-subnav__link govuk-link govuk-link--no-visited-state govuk-link--no-underline ms-3' 
					href='{href}' 
					{onClickAttr}>
						{title}
					</a>
				</li>"
    End Function
End Class