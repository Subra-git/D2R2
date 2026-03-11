Imports ProfilesLibrary
Imports Profiles.WebControls
Imports Profiles.Infrastructure

Partial Class Search
    Inherits System.Web.UI.Page

    Protected CanCreateScenario As Boolean
    Protected CanCreateProfile As Boolean
    Protected CanEditProfile As Boolean
    Protected CanGetContributionsReport As Boolean

    Private CheckBoxInputStyle As String = "govuk-checkboxes__input"
    Private CheckBoxLabelStyle As String = "govuk-label govuk-checkboxes__label apha-font-size-19"

    Private Property ProfileSections() As Dictionary(Of Integer, String)
        Get
            Return DirectCast(Session("ProfileSections"), Dictionary(Of Integer, String))
        End Get
        Set(ByVal value As Dictionary(Of Integer, String))
            Session("ProfileSections") = value
        End Set
    End Property

    Private Property ProfileList() As ProfileInfoList
        Get
            Return DirectCast(Session("ProfileList"), ProfileInfoList)
        End Get
        Set(ByVal value As ProfileInfoList)
            Session("ProfileList") = value
        End Set
    End Property

    Protected Property DisplayPublished() As Boolean
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

    Protected Property DisplayDraft() As Boolean
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

    Protected Property DisplayScenarios() As Boolean
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

        CanCreateScenario = Profile.CanCreateScenario()
        CanCreateProfile = Profile.CanCreateProfile()
        CanEditProfile = Profile.CanEditProfile()
        CanGetContributionsReport = Profile.CanGetContributionsReport()

        If Not Page.IsPostBack Then
            ProfileList = ProfileInfoList.GetProfileInfoList(False, False, String.Empty, False, Nothing)
            Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
            chkDisplayMyProfiles.Visible = identity.IsContributorOrReviewer()

            ProfileSections = ProfileSectionMetadataList.GetProfileSectionMetadataList().ToDictionary(Function(item) item.SectionNumber, Function(item) $"{item.SectionNumber}. {item.FormattedShortName}")
        End If

        spsSelector.ShowLabel = False
        spsSelector.LabelId = lblAffectedSpecies.ClientID

        If Not Page.IsPostBack Then
            chkDisplayPublished.Checked = DisplayPublished
            chkDisplayDraft.Checked = DisplayDraft
            chkDisplayScenarios.Checked = DisplayScenarios
            chkDisplayMyProfiles.Checked = DisplayMyProfiles
            ctlLetterSelector.SelectedItem = SelectedLetter

            Dim profileTitlesValues() As SearchAppearsInType = DirectCast(System.Enum.GetValues(GetType(SearchAppearsInType)), SearchAppearsInType())
            For Each searchType In profileTitlesValues
                ddlWordSearchType.Items.Add(New ListItem(searchType.GetEnumDescription(), CInt(searchType).ToString()))
            Next

            Dim sortByValues() As SortByType = DirectCast(System.Enum.GetValues(GetType(SortByType)), SortByType())
            For Each sortBy In sortByValues
                ddlSortBy.Items.Add(New ListItem(sortBy.GetEnumDescription(), CInt(sortBy).ToString()))
            Next

            rbExactWordOrPhase.Text = SearchForType.ExactWordOrPhrase.GetEnumDescription()
            rbExactAllWords.Text = SearchForType.AllWords.GetEnumDescription()
        End If

    End Sub

    Private Sub speciesSelector_SelectionChanged(sender As Object, e As SpeciesListLabelUpdatedEventArgs) Handles spsSelector.SpeciesListUpdated
        Me.lblAffectedSpecies.Text = e.ListLabel
    End Sub

    Protected Sub PaginatorPageSize_PageSizeChanged(sender As Object, e As PageSizeChangedEvent) Handles PaginatorPageSize.PageSizeChanged
        bottomPaginator.CurrentPage = 1
        bottomPaginator.PageSize = e.PageSize
        RefreshResults()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            RefreshResults()

            rptSections.DataSource = ProfileSections
            rptSections.DataBind()
        End If

		ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "AdvancedScript", "$(document).ready(() => { apha.searchPage.hideShowAdvanced() });", True)

		Dim chboxes = New List(Of CheckBox) From {chkDisplayPublished, chkDisplayDraft, chkDisplayScenarios, chkDisplayMyProfiles}
        chboxes.ForEach(Sub(checkbox)
                            checkbox.InputAttributes("class") = "govuk-checkboxes__input"
                            checkbox.LabelAttributes("class") = "govuk-label govuk-checkboxes__label apha-font-size-19"
                        End Sub)

        Dim radios = New List(Of RadioButton) From {rbExactAllWords, rbExactWordOrPhase}
        radios.ForEach(Sub(radio)
                           radio.InputAttributes("class") = CheckBoxInputStyle
                           radio.LabelAttributes("class") = CheckBoxLabelStyle
                       End Sub)

        chkUnselectSections.InputAttributes("class") = CheckBoxInputStyle
        chkUnselectSections.LabelAttributes("class") = CheckBoxLabelStyle

        For Each item As RepeaterItem In rptSections.Items
            If item.ItemType = ListItemType.Item OrElse item.ItemType = ListItemType.AlternatingItem Then
                Dim chkBox As CheckBox = DirectCast(item.FindControl("chkSection"), CheckBox)

                chkBox.InputAttributes("class") = "govuk-checkboxes__input"
                chkBox.LabelAttributes("class") = "govuk-label govuk-checkboxes__label apha-font-size-19"
            End If
        Next
    End Sub

    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearch.Click
        bottomPaginator.CurrentPage = 1
        Me.RefreshResults()
    End Sub

    Protected Sub chkDisplayPublished_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkDisplayPublished.CheckedChanged
        DisplayPublished = chkDisplayPublished.Checked
        bottomPaginator.CurrentPage = 1
        Me.RefreshResults()
    End Sub

    Protected Sub chkDisplayDraft_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkDisplayDraft.CheckedChanged
        DisplayDraft = chkDisplayDraft.Checked
        bottomPaginator.CurrentPage = 1
        Me.RefreshResults()
    End Sub

    Protected Sub chkDisplayScenarios_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkDisplayScenarios.CheckedChanged
        DisplayScenarios = chkDisplayScenarios.Checked
        bottomPaginator.CurrentPage = 1
        Me.RefreshResults()
    End Sub

    Protected Sub chkDisplayMyProfiles_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkDisplayMyProfiles.CheckedChanged
        DisplayMyProfiles = chkDisplayMyProfiles.Checked
        bottomPaginator.CurrentPage = 1
        Me.RefreshResults()
    End Sub

    Protected Sub ctlLetterSelector_ItemSelected(ByVal sender As Object, ByVal e As System.EventArgs) Handles ctlLetterSelector.ItemSelected
        SelectedLetter = ctlLetterSelector.SelectedItem
        bottomPaginator.CurrentPage = 1
        Me.RefreshResults()
    End Sub

    Public Function MapToProfileInfo(profileInfo As ProfileInfo) As ProfileInfoViewModel
        Return New ProfileInfoViewModel With
            {.ProfileInfo = profileInfo}
    End Function

    Protected Sub BottomPaginator_OnPageChanged(sender As Object, ev As PageChangedEvent) Handles bottomPaginator.PageChanged
        Me.RefreshResults(True)
    End Sub

    Private Sub RefreshResults(Optional ByVal indexChanged As Boolean = False)
        Dim speciesList = spsSelector.GetSelectedSpecies(True)

        Dim searchAppearsInType As SearchAppearsInType = DirectCast([Enum].Parse(GetType(SearchAppearsInType), ddlWordSearchType.SelectedValue, True), SearchAppearsInType)
        Dim searchType As SearchForType = DirectCast(IIf(rbExactWordOrPhase.Checked, SearchForType.ExactWordOrPhrase, SearchForType.AllWords), SearchForType)
        Dim sortBy As SortByType = DirectCast([Enum].Parse(GetType(SortByType), ddlSortBy.SelectedValue, True), SortByType)

        Dim returnQuestionAnswers As Boolean = False
        Dim returnNotes As Boolean = False
        Dim refreshData As Boolean = False

        Dim selectedSections As List(Of Integer) = New List(Of Integer)
        For Each item As RepeaterItem In rptSections.Items
            If item.ItemType = ListItemType.Item OrElse item.ItemType = ListItemType.AlternatingItem Then
                Dim chkSection As CheckBox = DirectCast(item.FindControl("chkSection"), CheckBox)
                Dim hdnSectionNumber As HiddenField = DirectCast(item.FindControl("hdnSectionNumber"), HiddenField)

                If chkSection IsNot Nothing AndAlso chkSection.Checked AndAlso hdnSectionNumber.Value IsNot Nothing Or searchAppearsInType = SearchAppearsInType.All Then
                    selectedSections.Add(Integer.Parse(hdnSectionNumber.Value))
                End If
            End If
        Next

        If searchAppearsInType = SearchAppearsInType.All Or searchAppearsInType = SearchAppearsInType.ProfileAnswers Then
            returnQuestionAnswers = True
            refreshData = True
        End If

        If searchAppearsInType = SearchAppearsInType.All Or searchAppearsInType = SearchAppearsInType.FurtherInformation Or searchAppearsInType = SearchAppearsInType.References Then
            returnNotes = True
            refreshData = True
        End If

        If refreshData And Not indexChanged Then
            ProfileList = ProfileInfoList.GetProfileInfoList(returnQuestionAnswers, returnNotes, txtTitle.Text, GlobalSettings.SearchUseTextSearch, selectedSections)
        End If

        Dim serverFiltered = ProfileList.GetFilteredList(chkDisplayPublished.Checked,
                             chkDisplayDraft.Checked,
                             chkDisplayScenarios.Checked,
                             chkDisplayMyProfiles.Checked,
                             ctlLetterSelector.SelectedItem,
                             txtTitle.Text,
                             speciesList,
                             searchAppearsInType,
                             searchType,
                             selectedSections,
                             GlobalSettings.SearchUseExactWordMatch,
                             sortBy)

        Me.bottomPaginator.TotalPages = CInt(If(bottomPaginator.PageSize = 0, 1, Math.Ceiling((serverFiltered.Count) / bottomPaginator.PageSize)))

        Dim take As Integer = If(bottomPaginator.PageSize = 0, serverFiltered.Count, bottomPaginator.PageSize)

        spnResultsCount.InnerText = serverFiltered.Count.ToString()

        Dim paginatedResult = serverFiltered _
        .Skip(bottomPaginator.PageSize * (bottomPaginator.CurrentPage - 1)) _
        .Take(take) _
        .Select(Function(x) Me.MapToProfileInfo(x))

        rptProfileList.DataSource = paginatedResult
        rptProfileList.DataBind()

        noDataLabel.Visible = paginatedResult.Count < 1
    End Sub

    Protected Sub rptProfileList_DataBinding(sender As Object, e As RepeaterItemEventArgs)
        If e.Item.ItemType = ListItemType.Item OrElse e.Item.ItemType = ListItemType.AlternatingItem Then
            Dim item As ProfileInfoViewModel = CType(e.Item.DataItem, ProfileInfoViewModel)

            Dim scenarioRepeater As Repeater = CType(e.Item.FindControl("scenarioRepeater"), Repeater)

            Dim reportsLink As Repeater = CType(e.Item.FindControl("viewReportsLink"), Repeater)

            Dim scenarios = If(Me.DisplayScenarios, item.Scenarios, item.Scenarios.Where(Function(x) x.IsWhatIfScenario = False))

            Dim mappedScenarios = scenarios.Select(Function(x) New ProfileScenarioViewModel With {.Scenario = x})
            scenarioRepeater.DataSource = mappedScenarios
            scenarioRepeater.DataBind()
        End If
    End Sub

    Public Function ShowPublic(value As Object)
        If value IsNot Nothing Then
            If value.IsPublic Then
                Return "(Public)"
            End If
        End If

        Return ""
    End Function

    Public Function ShowPublicValue(value As Object)
        If value Then
            Return "(Public)"
        Else
            Return ""
        End If
    End Function

    Protected Sub scenarioRepeater_ItemDataBound(sender As Object, e As RepeaterItemEventArgs)
        If e.Item.ItemType = ListItemType.Item OrElse e.Item.ItemType = ListItemType.AlternatingItem Then
            Dim item As ProfileScenarioViewModel = CType(e.Item.DataItem, ProfileScenarioViewModel)

            Dim viewReportsLink As HtmlAnchor = CType(e.Item.FindControl("viewReportsLink"), HtmlAnchor)

            Dim searchAppearsInType As SearchAppearsInType = DirectCast([Enum].Parse(GetType(SearchAppearsInType), ddlWordSearchType.SelectedValue, True), SearchAppearsInType)

            If item.PublishedVersion IsNot Nothing Then
                viewReportsLink.HRef = "ProfileReports.aspx?ProfileVersionId=" + item.PublishedVersion.Id.ToString
            End If

            Dim speciesList = spsSelector.GetSelectedSpecies(True)

            If speciesList IsNot Nothing And speciesList.Count > 0 Then
                If item.Scenario.ContainsSpecies(speciesList) = False Then
                    e.Item.Visible = False
                End If
            End If

            viewReportsLink.Visible = item.PublishedVersion IsNot Nothing

            Dim versionRepeater As Repeater = CType(e.Item.FindControl("publishedVersionRepeater"), Repeater)
            Dim draftVersionRepeater As Repeater = CType(e.Item.FindControl("draftVersionRepeater"), Repeater)

            Dim publishedVersionsContainer As HtmlGenericControl = CType(e.Item.FindControl("publishedVersionsContainer"), HtmlGenericControl)
            Dim draftVersionsContainer As HtmlGenericControl = CType(e.Item.FindControl("draftVersionsContainer"), HtmlGenericControl)
            Dim publishedVersionLinks As HtmlGenericControl = CType(e.Item.FindControl("publishedVersionLinks"), HtmlGenericControl)
            Dim profileStatusSection As HtmlGenericControl = CType(e.Item.FindControl("profileStatus"), HtmlGenericControl)
            Dim searchResultsContainer As HtmlGenericControl = CType(e.Item.FindControl("searchResultsContainer"), HtmlGenericControl)

            Dim showDraftVersions As Boolean = item.Scenario.GetDraftVersions().Count > 0

            publishedVersionsContainer.Visible = item.PublishedVersion IsNot Nothing
            draftVersionsContainer.Visible = item.DraftVersion IsNot Nothing Or showDraftVersions
            publishedVersionLinks.Visible = item.PublishedVersion IsNot Nothing
            profileStatusSection.Visible = item.PublishedVersion IsNot Nothing

            If item.DraftVersion?.Version Is Nothing Then
                Dim draftVersionLinks As HtmlGenericControl = CType(e.Item.FindControl("draftVersionLinks"), HtmlGenericControl)
                draftVersionLinks.Visible = False
            End If

            'refreshData is set to false for "ProfileTitle" and HasSearchResults is stale, so also hide based on searchAppearsInType selection
            searchResultsContainer.Visible = item.HasSearchResults And searchAppearsInType <> SearchAppearsInType.ProfileTitles

            versionRepeater.DataSource = item.Scenario.GetPublishedVersions()
            versionRepeater.DataBind()
            draftVersionRepeater.DataSource = item.Scenario.GetDraftVersions()
            draftVersionRepeater.DataBind()
        End If
    End Sub

    Protected Sub chkUnselectSections_CheckedChanged(sender As Object, e As EventArgs)
        If chkUnselectSections.Checked Then
            UnCheckSectionSelections()
        End If
        chkUnselectSections.Checked = False
    End Sub

    Protected Sub ddlWordSearchType_SelectedIndexChanged(sender As Object, e As EventArgs)
        Dim searchAppearsInType As SearchAppearsInType = DirectCast([Enum].Parse(GetType(SearchAppearsInType), ddlWordSearchType.SelectedValue, True), SearchAppearsInType)

        pnlSectionSelection.Visible = (searchAppearsInType = SearchAppearsInType.ProfileAnswers)
        UnCheckSectionSelections()
    End Sub

    Protected Sub ddlSortBy_SelectedIndexChanged(sender As Object, e As EventArgs)
        DisplayScenarios = chkDisplayScenarios.Checked
        bottomPaginator.CurrentPage = 1
        Me.RefreshResults()
    End Sub

    Private Sub UnCheckSectionSelections()
        For Each item As RepeaterItem In rptSections.Items
            If item.ItemType = ListItemType.Item OrElse item.ItemType = ListItemType.AlternatingItem Then
                Dim chkSection As CheckBox = DirectCast(item.FindControl("chkSection"), CheckBox)

                If chkSection IsNot Nothing Then
                    chkSection.Checked = False
                End If
            End If
        Next
    End Sub

End Class

