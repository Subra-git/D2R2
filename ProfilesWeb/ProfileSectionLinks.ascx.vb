Imports ProfilesLibrary
Imports System.ComponentModel

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

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1011:ConsiderPassingBaseTypesAsParameters")> _
    Protected Sub rptSectionLinks_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.RepeaterCommandEventArgs) Handles rptSectionLinks.ItemCommand

        Dim args As New CancelEventArgs(False)
        OnSave(args)

        If Not args.Cancel Then
            Response.Redirect(String.Format("~/EditProfileQuestions.aspx?ProfileVersionId={0}&ProfileSectionId={1}", EditProfileVersionInfo.Id.ToString(), e.CommandArgument.ToString()))
        End If

    End Sub

    Protected Sub lnkHome_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkHome.Click

        NavigateAway("Home")

    End Sub

    Protected Sub lnkSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkSearch.Click

        NavigateAway("Search")

    End Sub

    Private Sub NavigateAway(ByVal webPage As String)

        Dim args As New CancelEventArgs(False)
        OnNavigateHome(args)

        If args.Cancel Then
            Dim script As String = "<script language=""JavaScript"">"
            script &= "if(confirm('Changes made to the profile will not be saved. Do you wish to continue?')){location.href = '" & webPage & ".aspx'};"
            script &= "</script>"
            If (Not page.ClientScript.IsStartupScriptRegistered("SaveScript")) Then
                page.ClientScript.RegisterStartupScript(Me.GetType(), "SaveScript", script)
            End If
        Else
            Response.Redirect("~/" & webPage & ".aspx")
        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If EditProfileVersionInfo IsNot Nothing AndAlso EditProfileVersionInfo.CanGetPrintVersion() Then
            'use javascript rather than target="_blank", because it gives a better user experience if the SSO session has timed out
            'when the user clicks the link
            litPrint.Text = String.Format("<li><a href=""#"" onclick=""window.open('ShowProfilePrintVersion.aspx?ProfileVersionId={0}');return false;"">Print full profile</a></li>", EditProfileVersionInfo.Id.ToString())
        End If

        If EditProfileVersionInfo IsNot Nothing AndAlso EditProfileVersionInfo.CanGetSummaryProfileReport() Then
            litSummaryProfileReport.Text = String.Format("<li><a href=""ShowDraftSummaryProfileReport.aspx?ProfileVersionId={0}"" target=""_blank"">Summary profile report</a></li>", EditProfileVersionInfo.Id.ToString())
        End If

        If EditProfileVersionInfo IsNot Nothing AndAlso EditProfileVersionInfo.CanGetSummaryPrioritisationReport() Then
            litSummaryPrioritisationReport.Text = String.Format("<li><a href=""ShowDraftSummaryPrioritisationReport.aspx?ProfileVersionId={0}"" target=""_blank"">Summary prioritisation report</a></li>", EditProfileVersionInfo.Id.ToString())
        End If

        If EditProfileVersionInfo IsNot Nothing AndAlso ProfileVersionReportInfoList.CanGetList(EditProfileVersionInfo) Then
            litProfileReports.Text = String.Format("<li><a href=""ProfileReports.aspx?ProfileVersionId={0}"">Profile reports</a></li>", EditProfileVersionInfo.Id.ToString())
        End If

        'If EditProfileVersionInfo IsNot Nothing AndAlso NoteList.CanGetNoteList(EditProfileVersionInfo.ProfileId) Then
        litReferences.Text = String.Format("<li><a href=""Notes.aspx?ProfileVersionId={0}"">Profile references</a></li>", EditProfileVersionInfo.Id.ToString())
        ' End If

    End Sub

End Class
