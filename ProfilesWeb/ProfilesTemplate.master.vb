Imports ProfilesLibrary
Imports System.ComponentModel
Imports System.Configuration.ConfigurationManager
Partial Class ProfilesTemplate
    Inherits System.Web.UI.MasterPage

    Public Event NavigateHome As CancelEventHandler

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If lblPageTitle.Text.Length = 0 Then
            lblPageTitle.Text = Page.Title
        End If

        Dim principal As ProfilesPrincipal = DirectCast(Csla.ApplicationContext.User, ProfilesLibrary.ProfilesPrincipal)
        If Not principal Is Nothing Then
            Dim identity As ProfilesIdentity = DirectCast(principal.Identity, ProfilesIdentity)
            lblUsername.Text = identity.DisplayName
            lblUserRole.Text = identity.GlobalUserRole
            lnkLogout.Visible = LogoutCommand.CanExecuteCommand()
        End If

        If AppSettings("ShowVersion") = "1" Then
            lnkHome.Text = "D2R2 - Surveillance profiles (" & AppSettings("VersionName") & ")"
        End If

    End Sub

    Public ReadOnly Property ScriptManager() As ScriptManager
        Get
            Return scrManager
        End Get
    End Property

    Public Property PageTitle() As String
        Get
            Return lblPageTitle.Text
        End Get
        Set(ByVal value As String)
            lblPageTitle.Text = value
        End Set
    End Property

    Public Property ProfileTitle() As String
        Get
            Return lblProfileTitle.Text
        End Get
        Set(ByVal value As String)
            lblProfileTitle.Text = value
        End Set
    End Property

    Public Sub UpdateTitle(ByVal title As String)
        Page.Title = title
        lblPageTitle.Text = title
    End Sub

    Protected Overridable Sub OnNavigateHome(ByVal e As CancelEventArgs)
        RaiseEvent NavigateHome(Me, e)
    End Sub


    Protected Sub lnkHome_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkHome.Click
        Dim args As New CancelEventArgs(False)
        OnNavigateHome(args)

        If args.Cancel Then
            Dim script As String = "<script language=""JavaScript"">"
            script &= "if(confirm('Changes made to the profile will not be saved. Do you wish to continue?')){location.href = 'Home.aspx'};"
            script &= "</script>"
            If (Not Page.ClientScript.IsStartupScriptRegistered("SaveScript")) Then
                Page.ClientScript.RegisterStartupScript(Me.GetType(), "SaveScript", script)
            End If
        Else
            Response.Redirect("~/Home.aspx")
        End If
    End Sub

   
    Protected Sub scrManager_AsyncPostBackError(ByVal sender As Object, ByVal e As System.Web.UI.AsyncPostBackErrorEventArgs) Handles scrManager.AsyncPostBackError

        Response.Redirect(CommonUI.HandleError())

    End Sub

    Protected Sub lnkLogout_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkLogout.Click
        LogoutCommand.Execute()
        FormsAuthentication.SignOut()
        Response.Redirect("~/Home.aspx")
    End Sub

End Class

