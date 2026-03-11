Public Class NestedProfileQuestions
    Inherits ProfilesTemplate

    Public SubTitle As String = ""

    Public ReadOnly Property GetCtlSectionLinks() As Global.Profiles.Web.ProfileSectionLinks
        Get
            Return Me.ctlSectionLinks
        End Get

    End Property

    Protected Overrides Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        If String.IsNullOrEmpty(SubTitle) Then
            headPageTitle.Visible = False
        Else
            lblPageTitle.Text = Me.SubTitle
        End If

        If (SectionLinksContent.Controls.Count > 1) Then
            ctlSectionLinks.Visible = False
            SectionLinksContent.Visible = True
        Else
            SectionLinksContent.Visible = False
            ctlSectionLinks.Visible = True
        End If
    End Sub

End Class