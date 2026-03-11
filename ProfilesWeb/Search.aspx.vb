Imports System.Data
Imports System.Collections.Generic
Imports ProfilesLibrary

Partial Class Search
    Inherits System.Web.UI.Page

    Private Property ProfileList() As ProfileInfoList
        Get
            Return DirectCast(Session("ProfileList"), ProfileInfoList)
        End Get
        Set(ByVal value As ProfileInfoList)
            Session("ProfileList") = value
        End Set
    End Property

    Private Property DisplayPublished() As Boolean
        Get
            If Session("SearchFilterDisplayPublished") IsNot Nothing Then
                Return DirectCast(Session("SearchFilterDisplayPublished"), Boolean)
            Else
                Return True
            End If
        End Get
        Set(ByVal value As Boolean)
            Session("SearchFilterDisplayPublished") = value
        End Set
    End Property

    Private Property DisplayDraft() As Boolean
        Get
            If Session("SearchFilterDisplayDraft") IsNot Nothing Then
                Return DirectCast(Session("SearchFilterDisplayDraft"), Boolean)
            Else
                Return False
            End If
        End Get
        Set(ByVal value As Boolean)
            Session("SearchFilterDisplayDraft") = value
        End Set
    End Property

    Private Property DisplayScenarios() As Boolean
        Get
            If Session("SearchFilterDisplayScenarios") IsNot Nothing Then
                Return DirectCast(Session("SearchFilterDisplayScenarios"), Boolean)
            Else
                Return False
            End If
        End Get
        Set(ByVal value As Boolean)
            Session("SearchFilterDisplayScenarios") = value
        End Set
    End Property

    Private Property DisplayMyProfiles() As Boolean
        Get
            If Session("SearchFilterDisplayMyProfiles") IsNot Nothing Then
                Return DirectCast(Session("SearchFilterDisplayMyProfiles"), Boolean)
            Else
                Return False
            End If
        End Get
        Set(ByVal value As Boolean)
            Session("SearchFilterDisplayMyProfiles") = value
        End Set
    End Property

    Private Property SelectedLetter() As String
        Get
            If Session("SearchFilterSelectedLetter") IsNot Nothing Then
                Return DirectCast(Session("SearchFilterSelectedLetter"), String)
            Else
                Return "All"
            End If
        End Get
        Set(ByVal value As String)
            Session("SearchFilterSelectedLetter") = value
        End Set
    End Property

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

        'set the page to expire immediately, so that if the user presses the back button a new request
        'will be sent to the server
        SetPageExpireImmediately(Response)

        If Not Page.IsPostBack Then
            ProfileList = ProfileInfoList.GetProfileInfoList()
            Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
            chkDisplayMyProfiles.Visible = identity.IsContributorOrReviewer()
            pnlMyProfiles.Visible = identity.IsContributorOrReviewer()
        End If

        ctlResultList.ResultList = ProfileList

        If Not Page.IsPostBack Then
            chkDisplayPublished.Checked = DisplayPublished
            chkDisplayDraft.Checked = DisplayDraft
            chkDisplayScenarios.Checked = DisplayScenarios
            chkDisplayMyProfiles.Checked = DisplayMyProfiles
            ctlLetterSelector.SelectedItem = SelectedLetter
            RefreshResults()
        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

       

    End Sub

    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearch.Click
        RefreshResults()
    End Sub

    Protected Sub chkDisplayPublished_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkDisplayPublished.CheckedChanged
        DisplayPublished = chkDisplayPublished.Checked
        RefreshResults()
    End Sub

    Protected Sub chkDisplayDraft_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkDisplayDraft.CheckedChanged
        DisplayDraft = chkDisplayDraft.Checked
        RefreshResults()
    End Sub

    Protected Sub chkDisplayScenarios_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkDisplayScenarios.CheckedChanged
        DisplayScenarios = chkDisplayScenarios.Checked
        RefreshResults()
    End Sub

    Protected Sub chkDisplayMyProfiles_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkDisplayMyProfiles.CheckedChanged
        DisplayMyProfiles = chkDisplayMyProfiles.Checked
        RefreshResults()
    End Sub

    Protected Sub ctlLetterSelector_ItemSelected(ByVal sender As Object, ByVal e As System.EventArgs) Handles ctlLetterSelector.ItemSelected
        SelectedLetter = ctlLetterSelector.SelectedItem
        RefreshResults()
    End Sub

    Private Sub RefreshResults()
        ctlResultList.FilterList(chkDisplayPublished.Checked, chkDisplayDraft.Checked, chkDisplayScenarios.Checked, _
        chkDisplayMyProfiles.Checked, ctlLetterSelector.SelectedItem, txtTitle.Text, spsSelector.GetSelectedSpecies(True))
    End Sub

   
End Class

