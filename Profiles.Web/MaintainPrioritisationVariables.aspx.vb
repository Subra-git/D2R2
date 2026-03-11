Imports ProfilesLibrary
Imports System.ComponentModel
Imports System.IO
Imports System.Collections.Generic
Imports System.Drawing

Partial Class MaintainPrioritisationVariables
    Inherits System.Web.UI.Page


    Private mSelectedCriterionId As Guid = Guid.Empty


#Region " Private Methods & Properties "

    Private Property CurrentPrioritisationMetadata() As ProfilePrioritisationMetadata
        Get
            'if session expired and data requested, reload the metadata object into session
            If Session("PrioritisationMetadata") Is Nothing Then
                'if lblPendingChanges is visible then the session expired with changes pending. inform the user
                If lblPendingChanges.Visible = True Then
                    lblError.Text = "Your pending changes have timed out. Please undertake all required modifications and click on the update button."
                    divPendingChanges.Style.Item("Visibility") = "hidden"
                End If

                Session("PrioritisationMetadata") = ProfilePrioritisationMetadata.GetPrioritisationMetadata
            End If

            Return DirectCast(Session("PrioritisationMetadata"), ProfilePrioritisationMetadata)
        End Get
        Set(ByVal value As ProfilePrioritisationMetadata)
            Session("PrioritisationMetadata") = value
        End Set
    End Property

    ' save category object category to session to avoid continuously looping through list to obtain category
    Private Property SelectedPrioritisationCategory() As ProfilePrioritisationCategory
        Get
            If Not Session("SelectedPrioritisationCategory") Is Nothing Then
                Return DirectCast(Session("SelectedPrioritisationCategory"), ProfilePrioritisationCategory)
            Else
                Return Nothing
            End If
        End Get
        Set(ByVal value As ProfilePrioritisationCategory)
            Session("SelectedPrioritisationCategory") = value
        End Set
    End Property

    Private Sub SaveSelectedCategoryToSession()

        Dim selectedCategoryId As Guid = Guid.Empty

        If ddlPrioritisationCategories.SelectedIndex > 0 Then
            selectedCategoryId = New Guid(ddlPrioritisationCategories.SelectedValue)

            'save selected category to session to prevent repetition of category lookup when selecting from criterion grid
            SelectedPrioritisationCategory = CurrentPrioritisationMetadata.Categories.GetById(selectedCategoryId)
        Else
            SelectedPrioritisationCategory = Nothing
        End If
    End Sub

#End Region

#Region " Events "

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            SelectedPrioritisationCategory = Nothing
            CurrentPrioritisationMetadata = ProfilePrioritisationMetadata.GetPrioritisationMetadata

            txtLowerBound.Text = CurrentPrioritisationMetadata.RankingRangeLowerBound
            txtUpperBound.Text = CurrentPrioritisationMetadata.RankingRangeUpperBound
        End If

        btnPrint.Attributes.Add("onclick", "window.open('PrintPrioritisationvariables.aspx?categoryid= " & ddlPrioritisationCategories.SelectedValue & "');")

		btnUpdate.Attributes.Add("onclick", "if (!Page_IsValid) {
													document.getElementById('" & lblError.ClientID & "').innerText = 'Please correct validation errors to continue';
												} else {
													apha.confirmPrompt('Are you sure you want to update the global prioritisation variables?', this); return false;
												};")

		txtUpperBound.Attributes.Add("onchange", "document.getElementById('" & divPendingChanges.ClientID.ToString & "').style.visibility='visible';")
        txtLowerBound.Attributes.Add("onchange", "document.getElementById('" & divPendingChanges.ClientID.ToString & "').style.visibility='visible';")

        TinyMCEHelper.RegisterTinyMCE($"#{txtCriterionName.ClientID}", TinyMCEHelper.TinyMCEEditorType.SingleLineEditor, Me, , "body { font-size: 20px;}")

    End Sub

    Protected Sub dsPrioritisationCategories_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsPrioritisationCategories.SelectObject
        e.BusinessObject = CurrentPrioritisationMetadata.Categories
    End Sub

    Protected Sub dsPrioritisationCriterionList_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsPrioritisationCriterionList.SelectObject

        If (Not SelectedPrioritisationCategory Is Nothing) Then
            e.BusinessObject = SelectedPrioritisationCategory.Criterion
        End If
    End Sub

    Protected Sub ddlPrioritisationCategories_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlPrioritisationCategories.SelectedIndexChanged
        'call databind on criterion grid to load criteria
        SaveSelectedCategoryToSession()
        pnlCriterionValues.Visible = False
        If (ddlPrioritisationCategories.SelectedIndex > 0) Then
            grdCategoryCriterion.DataBind()
            btnPrint.Enabled = True
            btnExportScoreData.Enabled = True
        Else
            btnPrint.Enabled = False
            btnExportScoreData.Enabled = False
            grdCategoryCriterion.DataBind()
        End If

    End Sub

    Protected Sub grdCategoryCriterion_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles grdCategoryCriterion.RowCommand
        If (e.CommandName.ToLower = "loadcriterionvalues") Then
            mSelectedCriterionId = New Guid(e.CommandArgument.ToString)
            grdCriterionValues.DataBind()
            pnlCriterionValues.Visible = True
            lblCriterionIdHidden.Text = mSelectedCriterionId.ToString
        End If
    End Sub


    Protected Sub dsPrioritisationCriterionValueList_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsPrioritisationCriterionValueList.SelectObject
        SaveSelectedCategoryToSession()
        If mSelectedCriterionId <> Guid.Empty And Not SelectedPrioritisationCategory Is Nothing Then
            Dim selectedCriterion As ProfilePrioritisationCriterion = CurrentPrioritisationMetadata.Categories.GetById(SelectedPrioritisationCategory.Id).Criterion.GetById(mSelectedCriterionId)
            If Not selectedCriterion Is Nothing Then
                e.BusinessObject = selectedCriterion.Values
                txtCriterionName.Text = selectedCriterion.Name
                txtCriterionWeight.Text = selectedCriterion.Weight
                lblCriterionCode.Text = selectedCriterion.Code
            End If
        End If
    End Sub


    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click

        Try
            'persist ranking range to business layer
            CurrentPrioritisationMetadata.RankingRangeLowerBound = System.Convert.ToInt32(txtLowerBound.Text)
            CurrentPrioritisationMetadata.RankingRangeUpperBound = System.Convert.ToInt32(txtUpperBound.Text)

            CurrentPrioritisationMetadata.Save()
            lblError.Text = "Your changes were successfully saved"
            divPendingChanges.Style.Item("Visibility") = "hidden"
        Catch ex As Csla.DataPortalException
            lblError.Text = ex.BusinessException.Message
            RestorePageAfterException()
        Catch vex As Csla.Validation.ValidationException
            RestorePageAfterException()
            lblError.Text = vex.Message
        End Try

        CurrentPrioritisationMetadata = ProfilePrioritisationMetadata.GetPrioritisationMetadata

    End Sub

    Protected Sub RestorePageAfterException()
        'Reload the data from the db
        CurrentPrioritisationMetadata = ProfilePrioritisationMetadata.GetPrioritisationMetadata
        txtLowerBound.Text = CurrentPrioritisationMetadata.RankingRangeLowerBound
        txtUpperBound.Text = CurrentPrioritisationMetadata.RankingRangeUpperBound
        ddlPrioritisationCategories.SelectedIndex = 0
        SelectedPrioritisationCategory = Nothing
        grdCategoryCriterion.DataBind()
        divPendingChanges.Style.Item("Visibility") = "hidden"
    End Sub

#End Region

    Protected Sub btnSaveCriterion_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        If txtCriterionName.Text.StripHtmlTags.Replace(vbLf, "").Length > 255 Then
            Dim err As New CustomValidator
            err.ValidationGroup = "Criterion"
            err.IsValid = False
            err.ErrorMessage = "The criterion text must be no longer than 255 characters"
            Page.Validators.Add(err)
            Return
        End If

        If Page.IsValid Then
            PersistCriterionValues()
            pnlCriterionValues.Visible = False

            If CurrentPrioritisationMetadata.IsDirty Then
                divPendingChanges.Style.Item("Visibility") = "visible"
            End If
        End If
    End Sub

    Private Sub PersistCriterionValues()
        Dim criterionId As Guid = New Guid(lblCriterionIdHidden.Text)
        Dim criterion As ProfilePrioritisationCriterion

        If (Not SelectedPrioritisationCategory Is Nothing) Then
            criterion = CurrentPrioritisationMetadata.Categories.GetById(SelectedPrioritisationCategory.Id).Criterion.GetById(criterionId)

            'persist criterion name to business objects
            criterion.Name = txtCriterionName.Text.StripPTags().StripBreakTags.Replace(vbLf, "")

            'persist criterion weight to business objects
            Dim weight As String = txtCriterionWeight.Text
            criterion.Weight = System.Convert.ToInt32(weight)

            'persist criterion scores to business objects
            For Each row As GridViewRow In Me.grdCriterionValues.Rows

                Dim criterionValue As ProfilePrioritisationCriterionValue
                Dim criterionValueId As Guid

                criterionValueId = grdCriterionValues.DataKeys(row.RowIndex).Value
                criterionValue = CurrentPrioritisationMetadata.Categories.GetById(SelectedPrioritisationCategory.Id).Criterion.GetById(criterionId).Values.GetById(criterionValueId)

                'perform check as posting back although validation error on page
                Dim score As String = DirectCast(row.FindControl("txtScore"), System.Web.UI.WebControls.TextBox).Text
                criterionValue.Score = System.Convert.ToInt32(score)

            Next

        End If

        'rebind category grid to display modified name and weighting
        grdCategoryCriterion.DataBind()

    End Sub

    Protected Sub btnCancelCriterion_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        pnlCriterionValues.Visible = False
    End Sub

#Region "Draft prioritisation"

    Protected Sub btnCalculateDraftPrioritisation_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCalculateDraftPrioritisation.Click

        ltuCalculate.ProgressMessage = "Prioritising draft profiles - please wait"
        ltuCalculate.StartTask(New LongTaskUI.LongRunningTaskDelegate(AddressOf PrioritiseDraftProfilesTask))
        lblMsg.Text = String.Empty

    End Sub

    Private Function PrioritiseDraftProfilesTask() As String
        Try
            PrioritiseProfileCommand.PrioritiseProfiles(ProfileVersionStatus.Draft)
            Return "Prioritisation of draft profiles was successful"
        Catch ex As Csla.DataPortalException
            Return "Prioritisation of draft profiles failed - " & ex.BusinessException.Message
        End Try
    End Function

    Protected Sub ltuCalculate_TaskCompleted(ByVal sender As Object, ByVal e As TaskCompletedEventArgs) Handles ltuCalculate.TaskCompleted
        lblMsg.Text = e.Result
    End Sub

#End Region

#Region " Score Data Excel Export "

    Private Sub ExportTable(ByVal fileName As String, ByVal tbl As Table)

        With Response
            .Clear()
            .Charset = String.Empty
            .ContentType = "application/ms-excel"
            .AddHeader("Content-Disposition", String.Format("attachment; filename=""{0}.xls""", fileName))
            .ContentEncoding = System.Text.Encoding.Default
        End With

        Dim sw As StringWriter = New StringWriter
        Dim htw As HtmlTextWriter = New HtmlTextWriter(sw)

        '  render the table into the htmlwriter
        tbl.GridLines = GridLines.Both
        tbl.RenderControl(htw)

        '  render the htmlwriter into the response
        Try
            Response.Write(sw.ToString)
            Response.End()
        Catch ex As Exception

        End Try

    End Sub

    Private Function BuildScoreDataTable(ByVal categoryId As Guid, ByVal data As ScoreData) As Table

        Dim categoryData As PrioritisationCategoryData = data.PrioritisationCategoryDataList.GetById(categoryId)
        Dim categoryName As String = categoryData.CategoryName.ToLower()

        Dim scoreTable As New Table


        'header row
        Dim headerRow As New TableRow
        scoreTable.Rows.Add(headerRow)

        headerRow.Cells.Add(BuildHeaderCell("Disease / Issue", categoryName))
        headerRow.Cells.Add(BuildHeaderCell("Version number", categoryName))
        headerRow.Cells.Add(BuildHeaderCell("Profiled species", categoryName))
        headerRow.Cells.Add(BuildHeaderCell("Published / Draft", categoryName))
        headerRow.Cells.Add(BuildHeaderCell("Profile status", categoryName))
        headerRow.Cells.Add(BuildHeaderCell("Standard / Scenario", categoryName))

        'common questions
        For Each ques As CommonQuestionData In data.CommonQuestionDataList
            headerRow.Cells.Add(BuildHeaderCell(ques.Name & " " & "(" & ques.DisplayQuestionNumber & ")", categoryName))
        Next

        'prioritisation questions
        For Each ques As PrioritisationQuestionData In categoryData.PrioritisationQuestionDataList
            headerRow.Cells.Add(BuildHeaderCell(ques.Name & " " & "(" & ques.DisplayQuestionNumber & ")", categoryName))
            headerRow.Cells.Add(BuildHeaderCell("Weighted score for " & ques.DisplayQuestionNumber, categoryName))
        Next

        headerRow.Cells.Add(BuildHeaderCell("Normalised score", categoryName))

        ''********TESTING PURPOSES ONLY*****************************************************************
        ''second header row
        'Dim headerRow2 As New TableRow
        'scoreTable.Rows.Add(headerRow2)

        'headerRow2.Cells.Add(BuildHeaderCell(String.Empty, categoryName)) ' disease / issue
        'headerRow2.Cells.Add(BuildHeaderCell(String.Empty, categoryName)) ' version number
        'headerRow2.Cells.Add(BuildHeaderCell(String.Empty, categoryName)) ' profiled species
        'headerRow2.Cells.Add(BuildHeaderCell(String.Empty, categoryName)) ' published/draft
        'headerRow2.Cells.Add(BuildHeaderCell(String.Empty, categoryName)) ' standard/scenario

        'For Each ques As CommonQuestionData In data.CommonQuestionDataList
        '    headerRow2.Cells.Add(BuildHeaderCell(String.Empty, categoryName))
        'Next

        ''prioritisation questions
        'For Each ques As PrioritisationQuestionData In categoryData.PrioritisationQuestionDataList
        '    headerRow2.Cells.Add(BuildHeaderCell(ques.CriterionCode, categoryName))
        '    headerRow2.Cells.Add(BuildHeaderCell(String.Empty, categoryName))
        'Next

        'headerRow2.Cells.Add(BuildHeaderCell(String.Empty, categoryName))
        ''*******************************************************************************************

        'profile version rows
        For Each prof As ProfileData In data.ProfileDataList

            Dim speciesList As List(Of Guid) = prof.GetProfileSpeciesList()

            For Each speciesId As Guid In speciesList

                Dim profileVersionList As List(Of ProfileVersionData) = prof.GetProfileVersionListBySpeciesId(speciesId)

                For Each profVersion As ProfileVersionData In profileVersionList

                    Dim dataRow As New TableRow
                    scoreTable.Rows.Add(dataRow)

                    If Not profVersion.IsProfileScenario Then
                        dataRow.Cells.Add(BuildCell(prof.Title))
                    Else
                        dataRow.Cells.Add(BuildCell(prof.Title & " (" & profVersion.ScenarioTitle & ")"))
                    End If

                    dataRow.Cells.Add(BuildCell(profVersion.DisplayVersionNumber)) 'Version number
                    dataRow.Cells.Add(BuildCell(profVersion.GetProfiledSpeciesBySpeciesId(speciesId).Name)) 'Profiled species
                    dataRow.Cells.Add(BuildCell(profVersion.ProfileVersionState)) 'Draft/Published
                    dataRow.Cells.Add(BuildCell(prof.StatusName)) 'Profile status

                    If profVersion.IsProfileScenario Then
                        dataRow.Cells.Add(BuildCell("Scenario"))
                    Else
                        dataRow.Cells.Add(BuildCell("Standard"))
                    End If

                    ' Common Answers
                    For Each ques As CommonQuestionData In data.CommonQuestionDataList
                        Dim commonAns As CommonAnswerData = profVersion.CommonAnswerDataList.GetById(ques.Id)
                        If commonAns IsNot Nothing Then
                            dataRow.Cells.Add(BuildCell(commonAns.Answer))
                        Else
                            dataRow.Cells.Add(BuildCell(String.Empty))
                        End If
                    Next

                    ' Prioritised Answers
                    For Each ques As PrioritisationQuestionData In categoryData.PrioritisationQuestionDataList
                        Dim priorAns As PrioritisationAnswerData

                        If ques.IsPerSpecies Then
                            priorAns = profVersion.PrioritisationAnswerDataList.GetById(ques.Id, speciesId)
                        Else
                            priorAns = profVersion.PrioritisationAnswerDataList.GetById(ques.Id, Guid.Empty)
                        End If

                        If priorAns IsNot Nothing Then
                            dataRow.Cells.Add(BuildCell(priorAns.Answer))
                            dataRow.Cells.Add(BuildCell(priorAns.WeightedScore.ToString()))
                        Else
                            dataRow.Cells.Add(BuildCell(String.Empty))
                            dataRow.Cells.Add(BuildCell(String.Empty))
                        End If

                    Next

                    ' Normalized score
                    Dim normScore As PrioritisationScoreData = profVersion.PrioritisationScoreDataList.GetById(categoryId, speciesId)

                    If normScore IsNot Nothing Then
                        dataRow.Cells.Add(BuildCell(normScore.Rank))
                    Else
                        dataRow.Cells.Add(BuildCell(String.Empty))
                    End If

                Next

            Next

        Next

        Return scoreTable

    End Function

    Private Function BuildSummaryDataTable(ByVal data As ScoreData) As Table

        Dim scoreTable As New Table

        'header row
        Dim headerRow As New TableRow
        scoreTable.Rows.Add(headerRow)

        headerRow.Cells.Add(BuildHeaderCell("Disease / Issue", "general"))
        headerRow.Cells.Add(BuildHeaderCell("Version number", "general"))
        headerRow.Cells.Add(BuildHeaderCell("Profiled species", "general"))
        headerRow.Cells.Add(BuildHeaderCell("Published / Draft", "general"))
        headerRow.Cells.Add(BuildHeaderCell("Profile status", "general"))
        headerRow.Cells.Add(BuildHeaderCell("Standard / Scenario", "general"))

        'common questions
        For Each ques As CommonQuestionData In data.CommonQuestionDataList
            headerRow.Cells.Add(BuildHeaderCell(ques.Name & " " & "(" & ques.DisplayQuestionNumber & ")", "general"))
        Next

        ' rfi columns
        For Each category As PrioritisationCategoryData In data.PrioritisationCategoryDataList
            headerRow.Cells.Add(BuildHeaderCell(category.CategoryName & " normalised score", category.CategoryName.ToLower()))
            headerRow.Cells.Add(BuildHeaderCell(category.CategoryName & " rank", category.CategoryName.ToLower()))
        Next

        'rfi total columns
        Dim totalCell As TableCell = BuildHeaderCell("Ranking of combined RFI scores <span style='font-size: 12px;'>(calculated by adding scores for public health, welfare, wider society and international trade and then ranking this overall total)</span>", "general")
        totalCell.Width = "120"

        Dim totalPlusRiskCell As TableCell = BuildHeaderCell("Ranking of combined RFI scores plus post mitigation risk score <span style='font-size: 12px;'>(calculated by adding scores for public health, welfare, wider society, international trade and post mitigation risk and then ranking this overall total)</span>", "general")
        totalPlusRiskCell.Width = "120"

        headerRow.Cells.Add(totalCell)
        headerRow.Cells.Add(totalPlusRiskCell)



        'profile version rows
        Dim internationalTradeRankInfo As RankProfileInfoList = RankProfileInfoList.GetRankProfileInfoList()
        Dim internationalTradeRanks As List(Of RankProfileInfo) = internationalTradeRankInfo.GetFilteredSortedList(Nothing, RankCategory.International_Trade, False, False)
        internationalTradeRanks = RankProfileInfoList.FilterDiseasesWithNoRfiImpact(internationalTradeRanks, RankCategory.International_Trade)
        internationalTradeRanks = RankProfileInfoList.CalculateRankPosition(internationalTradeRanks, RankCategory.International_Trade)

        Dim publicHealthRankInfo As RankProfileInfoList = RankProfileInfoList.GetRankProfileInfoList()
        Dim publicHealthRanks As List(Of RankProfileInfo) = publicHealthRankInfo.GetFilteredSortedList(Nothing, RankCategory.Public_Health, False, False)
        publicHealthRanks = RankProfileInfoList.FilterDiseasesWithNoRfiImpact(publicHealthRanks, RankCategory.Public_Health)
        publicHealthRanks = RankProfileInfoList.CalculateRankPosition(publicHealthRanks, RankCategory.Public_Health)

        Dim welfareRankInfo As RankProfileInfoList = RankProfileInfoList.GetRankProfileInfoList()
        Dim welfareRanks As List(Of RankProfileInfo) = welfareRankInfo.GetFilteredSortedList(Nothing, RankCategory.Animal_Welfare, False, False)
        welfareRanks = RankProfileInfoList.FilterDiseasesWithNoRfiImpact(welfareRanks, RankCategory.Animal_Welfare)
        welfareRanks = RankProfileInfoList.CalculateRankPosition(welfareRanks, RankCategory.Animal_Welfare)

        Dim widerSocietyRankInfo As RankProfileInfoList = RankProfileInfoList.GetRankProfileInfoList()
        Dim widerSocietyRanks As List(Of RankProfileInfo) = widerSocietyRankInfo.GetFilteredSortedList(Nothing, RankCategory.Wider_Society, False, False)
        widerSocietyRanks = RankProfileInfoList.FilterDiseasesWithNoRfiImpact(widerSocietyRanks, RankCategory.Wider_Society)
        widerSocietyRanks = RankProfileInfoList.CalculateRankPosition(widerSocietyRanks, RankCategory.Wider_Society)

        Dim riskAndMitigationRankInfo As RankProfileInfoList = RankProfileInfoList.GetRankProfileInfoList()
        Dim riskAndMitigationRanks As List(Of RankProfileInfo) = riskAndMitigationRankInfo.GetFilteredSortedList(Nothing, RankCategory.Risk, False, False)
        riskAndMitigationRanks = RankProfileInfoList.FilterDiseasesWithNoRfiImpact(riskAndMitigationRanks, RankCategory.Risk)
        riskAndMitigationRanks = RankProfileInfoList.CalculateRankPosition(riskAndMitigationRanks, RankCategory.Risk)

        Dim potentialToAddValueRankInfo As RankProfileInfoList = RankProfileInfoList.GetRankProfileInfoList()
        Dim potentialToAddValueRanks As List(Of RankProfileInfo) = potentialToAddValueRankInfo.GetFilteredSortedList(Nothing, RankCategory.Potential_To_Add_Value, False, False)
        potentialToAddValueRanks = RankProfileInfoList.FilterDiseasesWithNoRfiImpact(potentialToAddValueRanks, RankCategory.Potential_To_Add_Value)
        potentialToAddValueRanks = RankProfileInfoList.CalculateRankPosition(potentialToAddValueRanks, RankCategory.Potential_To_Add_Value)

        Dim totalRankInfo As RankProfileInfoList = RankProfileInfoList.GetRankProfileInfoList()
        Dim totalRanks As List(Of RankProfileInfo) = totalRankInfo.GetFilteredSortedList(Nothing, RankCategory.Total, False, False)
        totalRanks = RankProfileInfoList.CalculateRankPosition(totalRanks, RankCategory.Total)

        Dim totalPlusRiskRankInfo As RankProfileInfoList = RankProfileInfoList.GetRankProfileInfoList()
        Dim totalPlusRiskRanks As List(Of RankProfileInfo) = totalPlusRiskRankInfo.GetFilteredSortedList(Nothing, RankCategory.Total_Including_Risk, False, False)
        totalPlusRiskRanks = RankProfileInfoList.CalculateRankPosition(totalPlusRiskRanks, RankCategory.Total_Including_Risk)

        For Each prof As ProfileData In data.ProfileDataList

            Dim speciesList As List(Of Guid) = prof.GetProfileSpeciesList()

            For Each speciesId As Guid In speciesList

                Dim profileVersionList As List(Of ProfileVersionData) = prof.GetProfileVersionListBySpeciesId(speciesId)

                For Each profVersion As ProfileVersionData In profileVersionList

                    Dim dataRow As New TableRow
                    scoreTable.Rows.Add(dataRow)

                    If Not profVersion.IsProfileScenario Then
                        dataRow.Cells.Add(BuildCell(prof.Title))
                    Else
                        dataRow.Cells.Add(BuildCell(prof.Title & " (" & profVersion.ScenarioTitle & ")"))
                    End If

                    dataRow.Cells.Add(BuildCell(profVersion.DisplayVersionNumber)) 'Version number
                    dataRow.Cells.Add(BuildCell(profVersion.GetProfiledSpeciesBySpeciesId(speciesId).Name)) 'Profiled species
                    dataRow.Cells.Add(BuildCell(profVersion.ProfileVersionState)) 'Draft/Published
                    dataRow.Cells.Add(BuildCell(prof.StatusName)) 'Profile status

                    If profVersion.IsProfileScenario Then
                        dataRow.Cells.Add(BuildCell("Scenario"))
                    Else
                        dataRow.Cells.Add(BuildCell("Standard"))
                    End If

                    ' Common Answers
                    For Each ques As CommonQuestionData In data.CommonQuestionDataList
                        Dim commonAns As CommonAnswerData = profVersion.CommonAnswerDataList.GetById(ques.Id)
                        If commonAns IsNot Nothing Then
                            dataRow.Cells.Add(BuildCell(commonAns.Answer))
                        Else
                            dataRow.Cells.Add(BuildCell(String.Empty))
                        End If
                    Next

                    For Each category As PrioritisationCategoryData In data.PrioritisationCategoryDataList

                        ' Normalized score
                        Dim normScore As PrioritisationScoreData = profVersion.PrioritisationScoreDataList.GetById(category.Id, speciesId)

                        If normScore IsNot Nothing Then
                            dataRow.Cells.Add(BuildCell(normScore.Rank))
                        Else
                            dataRow.Cells.Add(BuildCell(String.Empty))
                        End If

                        ' Rank
                        Dim includeRank As Boolean = True
                        Dim rankList As List(Of RankProfileInfo)
                        Dim cat As RankCategory
                        Select Case category.CategoryName.ToLower()
                            Case "international trade"
                                rankList = internationalTradeRanks
                                cat = RankCategory.International_Trade
                            Case "public health"
                                rankList = publicHealthRanks
                                cat = RankCategory.Public_Health
                            Case "welfare"
                                rankList = welfareRanks
                                cat = RankCategory.Animal_Welfare
                            Case "wider society"
                                rankList = widerSocietyRanks
                                cat = RankCategory.Wider_Society
                            Case "post mitigation risk"
                                rankList = riskAndMitigationRanks
                                cat = RankCategory.Risk
                            Case "potential to add value"
                                rankList = potentialToAddValueRanks
                                cat = RankCategory.Potential_To_Add_Value
                            Case Else
                                includeRank = False
                                rankList = Nothing
                        End Select
                        If includeRank Then
                            If Not profVersion.IsProfileScenario Then
                                Dim rank As Integer
                                rank = FindRankFromCategoryProfileVersionIdAndSpeciesId(cat, profVersion.Id, speciesId, rankList)
                                If rank > 0 Then
                                    dataRow.Cells.Add(BuildCell(rank.ToString()))
                                Else
                                    dataRow.Cells.Add(BuildCell(String.Empty))
                                End If
                            Else
                                dataRow.Cells.Add(BuildCell(String.Empty))
                            End If
                        End If
                    Next

                    ' Total rfi rank columns
                    If Not profVersion.IsProfileScenario Then
                        Dim totalRank As Integer = FindRankFromProfileIdAndSpeciesId(prof.Id, speciesId, totalRanks)
                        Dim totalPlusRiskRank As Integer = FindRankFromProfileIdAndSpeciesId(prof.Id, speciesId, totalPlusRiskRanks)
                        If totalRank > 0 Then
                            dataRow.Cells.Add(BuildCell(totalRank.ToString()))
                        Else
                            dataRow.Cells.Add(BuildCell(String.Empty))
                        End If
                        If totalPlusRiskRank > 0 Then
                            dataRow.Cells.Add(BuildCell(totalPlusRiskRank.ToString()))
                        Else
                            dataRow.Cells.Add(BuildCell(String.Empty))
                        End If
                    Else
                        dataRow.Cells.Add(BuildCell(String.Empty))
                        dataRow.Cells.Add(BuildCell(String.Empty))
                    End If

                Next

            Next

        Next

        Return scoreTable

    End Function

    Private Function FindRankFromProfileVersionIdAndSpeciesId(ByVal profileVersionId As Guid, ByVal speciesId As Guid, ByRef rankList As List(Of RankProfileInfo)) As Integer
        Dim i As Integer
        For i = 0 To rankList.Count - 1
            If rankList(i).ProfileVersionId = profileVersionId And rankList(i).SpeciesId = speciesId Then
                Return rankList(i).RankPosition.ToString()
            End If
        Next
        Return 0
    End Function

    Private Function FindRankFromProfileIdAndSpeciesId(ByVal profileId As Guid, ByVal speciesId As Guid, ByRef rankList As List(Of RankProfileInfo)) As Integer
        Dim i As Integer
        For i = 0 To rankList.Count - 1
            If rankList(i).ProfileId = profileId And rankList(i).SpeciesId = speciesId Then
                Return rankList(i).RankPosition.ToString()
            End If
        Next
        Return 0
    End Function

    Private Function FindRankFromCategoryProfileVersionIdAndSpeciesId(ByVal cat As RankCategory, ByVal profileVersionId As Guid, ByVal speciesId As Guid, ByRef rankList As List(Of RankProfileInfo)) As Integer
        Dim i As Integer
        Select Case cat
            Case RankCategory.Animal_Welfare
                For i = 0 To rankList.Count - 1
                    If rankList(i).AnimalWelfareProfileVersionId = profileVersionId AndAlso rankList(i).SpeciesId = speciesId Then
                        Return rankList(i).RankPosition.ToString()
                    End If
                Next
                Return 0
            Case RankCategory.International_Trade
                For i = 0 To rankList.Count - 1
                    If rankList(i).InternationalTradeProfileVersionId = profileVersionId AndAlso rankList(i).SpeciesId = speciesId Then
                        Return rankList(i).RankPosition.ToString()
                    End If
                Next
                Return 0
            Case RankCategory.Potential_To_Add_Value
                For i = 0 To rankList.Count - 1
                    If rankList(i).PotentialToAddValueProfileVersionId = profileVersionId AndAlso rankList(i).SpeciesId = speciesId Then
                        Return rankList(i).RankPosition.ToString()
                    End If
                Next
                Return 0
            Case RankCategory.Public_Health
                For i = 0 To rankList.Count - 1
                    If rankList(i).PublicHealthProfileVersionId = profileVersionId AndAlso rankList(i).SpeciesId = speciesId Then
                        Return rankList(i).RankPosition.ToString()
                    End If
                Next
                Return 0
            Case RankCategory.Risk
                For i = 0 To rankList.Count - 1
                    If rankList(i).RiskProfileVersionId = profileVersionId AndAlso rankList(i).SpeciesId = speciesId Then
                        Return rankList(i).RankPosition.ToString()
                    End If
                Next
                Return 0
            Case RankCategory.Wider_Society
                For i = 0 To rankList.Count - 1
                    If rankList(i).WiderSocietyProfileVersionId = profileVersionId AndAlso rankList(i).SpeciesId = speciesId Then
                        Return rankList(i).RankPosition.ToString()
                    End If
                Next
                Return 0
            Case Else
                For i = 0 To rankList.Count - 1
                    If rankList(i).ProfileVersionId = profileVersionId AndAlso rankList(i).SpeciesId = speciesId Then
                        Return rankList(i).RankPosition.ToString()
                    End If
                Next
                Return 0
        End Select
    End Function


    Private Function BuildCell(ByVal text As String) As TableCell

        Dim newCell As New TableCell
        newCell.Text = text
        newCell.Width = "80"
        newCell.Wrap = False
        newCell.Font.Name = "Arial"
        newCell.Font.Size = "10"
        Return newCell

    End Function

    Private Function BuildHeaderCell(ByVal text As String, ByVal categoryName As String) As TableCell

        Dim newHeaderCell As TableCell = BuildCell(text)
        newHeaderCell.Wrap = True
        newHeaderCell.BackColor = GetCategoryBackColor(categoryName)
        newHeaderCell.ForeColor = GetCategoryForeColor(categoryName)
        newHeaderCell.Font.Bold = True
        Return newHeaderCell

    End Function

    Private Function GetCategoryBackColor(ByVal categoryName As String) As Color

        Select Case categoryName.ToLower()
            Case "international trade"
                Return Color.FromArgb(255, 255, 189)
            Case "wider society"
                Return Color.FromArgb(153, 204, 255)
            Case "welfare"
                Return Color.FromArgb(193, 255, 193)
            Case "public health"
                Return Color.FromArgb(255, 153, 204)
            Case "post mitigation risk"
                Return Color.FromArgb(0, 0, 0)
            Case "general"
                Return Color.FromArgb(200, 200, 200)
            Case Else
                Return Color.FromArgb(102, 102, 0)
        End Select

    End Function

    Private Function GetCategoryForeColor(ByVal categoryName As String) As Color

        If categoryName.ToLower = "post mitigation risk" Then
            Return Color.White
        Else
            Return Color.Black
        End If

    End Function

#End Region


    Protected Sub btnExportScoreData_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExportScoreData.Click

        Dim categoryId As Guid = New Guid(ddlPrioritisationCategories.SelectedValue)
        Dim data As ScoreData = ScoreData.GetScoreData()
        Dim scoreDataTable As Table = BuildScoreDataTable(categoryId, data)
        Dim categoryName As String = data.PrioritisationCategoryDataList.GetById(categoryId).CategoryName
        ExportTable(categoryName, scoreDataTable)

    End Sub

    Protected Sub btnExportAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExportAll.Click

        Dim data As ScoreData = ScoreData.GetScoreData()
        Dim scoreDataTable As Table = BuildSummaryDataTable(data)
        ExportTable("NormalisedScoreSummary", scoreDataTable)

    End Sub
End Class
