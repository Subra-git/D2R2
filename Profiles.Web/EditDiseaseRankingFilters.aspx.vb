Imports ProfilesLibrary
Imports Telerik.WebControls
Imports System.Collections.Generic
Imports System
Imports Profiles.WebControls

Partial Class EditDiseaseRankingFilters
    Inherits System.Web.UI.Page
    Private mEditProfile As Profile

    Protected Sub btnFilter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnFilter.Click
        txtDiseaseText.Value = String.Empty
        lblErrorMsg.Text = ""
        btnSaveFilter.Text = "Submit"
        hfFNum.Value = 0
        pnlSelectionFilterArea.Visible = True
        Clear()
        Dim speciesList As SpeciesInfoList = SpeciesInfoList.GetList()
        spsSelector.ReBindAddTreeNodes(speciesList)

    End Sub


    Protected Sub drpDiseaseRanking_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpDiseaseRanking.SelectedIndexChanged

        If drpDiseaseRanking.SelectedIndex > 0 Then

            Dim speciesList As SelectedDiseaseSpeciesInfoList = SelectedDiseaseSpeciesInfoList.GetList(drpDiseaseRanking.SelectedItem.Value)

            If speciesList.Count > 0 Then

                Dim list As New List(Of Guid)
                For Each species As SelectedDiseaseSpeciesInfo In speciesList
                    list.Add(species.Id)
                Next

                spsSelector.SetAffectedSpeciesForDisease(list)

                txtDiseaseText.Value = speciesList(0).DiseaseName
                rdBtnFirst.SelectedIndex = speciesList(0).Disease1
                rdBtnSecond.SelectedIndex = speciesList(0).Disease2
                rdBtnThird.SelectedIndex = speciesList(0).Disease3
                rdBtnFourth.SelectedIndex = speciesList(0).Disease4
                hfFNum.Value = CStr(speciesList(0).FilterNumber)

                Dim splittedval() As String = speciesList(0).Disease5.Split(",")
                Dim count As Integer

                For Each item As ListItem In chkLstTypes.Items

                    If item.Selected Then

                        item.Selected = False

                    End If

                Next

                For count = 0 To splittedval.Length - 1

                    For Each item As ListItem In chkLstTypes.Items

                        If item.Text = splittedval(count) Then

                            item.Selected = True
                            Exit For

                        End If

                    Next

                Next

                spsSelector.GetLabelSelectedValues()
                btnSaveFilter.Text = "Update"
                lblErrorMsg.Text = ""

                pnlSelectionFilterArea.Visible = True

            End If

        Else

            pnlSelectionFilterArea.Visible = False

        End If

    End Sub

    Protected Sub btnSaveFilter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSaveFilter.Click

        Dim speciesList As List(Of Guid) = spsSelector.GetSelectedSpecies(True)

        If Page.IsValid And speciesList.Count() > 0 Then

            Try

                If btnSaveFilter.Text <> "Update" Then

                    Dim i As Integer = 0
                    Dim CurrentFilterNumber As New DiseaseRankingValues()
                    CurrentFilterNumber = DiseaseRankingValues.DiseaseFilterRankingValues(txtDiseaseText.Value)

                    If CurrentFilterNumber.FilterNumber > 0 Then

                        Dim diseaseChecked As String = ""

                        For Each item As ListItem In chkLstTypes.Items

                            If item.Selected Then

                                If diseaseChecked = "" Then

                                    diseaseChecked = item.Text

                                Else

                                    diseaseChecked = diseaseChecked + "," + item.Text

                                End If

                            End If

                        Next


                        For Each newSpeciesId As Guid In speciesList

                            Dim CurrentDiseaseRakingValues As New DiseaseRankingValues()
                            CurrentDiseaseRakingValues.DiseaseName = DiseaseFilterValues.FormatName(txtDiseaseText.Value)
                            CurrentDiseaseRakingValues.FilterNumber = CurrentFilterNumber.FilterNumber
                            CurrentDiseaseRakingValues.Disease1 = rdBtnFirst.SelectedItem.Value.ToString()
                            CurrentDiseaseRakingValues.Disease2 = rdBtnSecond.SelectedItem.Value.ToString()
                            CurrentDiseaseRakingValues.Disease3 = rdBtnThird.SelectedItem.Value.ToString()
                            CurrentDiseaseRakingValues.Disease4 = rdBtnFourth.SelectedItem.Value.ToString()
                            CurrentDiseaseRakingValues.Disease5 = diseaseChecked
                            CurrentDiseaseRakingValues.SelectedSpecies = newSpeciesId

                            CurrentDiseaseRakingValues.ApplyEdit()
                            CurrentDiseaseRakingValues.Save()

                        Next

                        lblErrorMsg.Text = "Filter value successfully saved"
                        pnlSelectionFilterArea.Visible = False
                        BindDropDownList()
                        Clear()
                    Else

                        lblErrorMsg.Text = "Filter name is already exists"

                    End If

                End If

                If btnSaveFilter.Text = "Update" Then

                    If Convert.ToInt64(hfFNum.Value) > 0 Then

                        Dim diseaseChecked As String = ""

                        For Each item As ListItem In chkLstTypes.Items

                            If item.Selected Then

                                If diseaseChecked = "" Then

                                    diseaseChecked = item.Text

                                Else

                                    diseaseChecked = diseaseChecked + "," + item.Text

                                End If

                            End If

                        Next

                        Dim change As DiseaseEditValues = DiseaseEditValues.DiseaseFilterUpdate(Convert.ToInt64(hfFNum.Value))

                        For Each newSpeciesId As Guid In speciesList

                            Dim CurrentDiseaseRakingValues As New DiseaseEditValues()
                            CurrentDiseaseRakingValues.DiseaseName = DiseaseFilterValues.FormatName(txtDiseaseText.Value)
                            CurrentDiseaseRakingValues.FilterNumber = Convert.ToInt64(hfFNum.Value)
                            CurrentDiseaseRakingValues.Disease1 = rdBtnFirst.SelectedItem.Value.ToString()
                            CurrentDiseaseRakingValues.Disease2 = rdBtnSecond.SelectedItem.Value.ToString()
                            CurrentDiseaseRakingValues.Disease3 = rdBtnThird.SelectedItem.Value.ToString()
                            CurrentDiseaseRakingValues.Disease4 = rdBtnFourth.SelectedItem.Value.ToString()
                            CurrentDiseaseRakingValues.Disease5 = diseaseChecked
                            CurrentDiseaseRakingValues.SelectedSpecies = newSpeciesId

                            CurrentDiseaseRakingValues.ApplyEdit()
                            CurrentDiseaseRakingValues.Save()

                        Next

                        lblErrorMsg.Text = "Filter value successfully updated"
                        pnlSelectionFilterArea.Visible = False
                        BindDropDownList()
                        Clear()

                    End If

                End If

            Catch ex As Csla.DataPortalException
                lblErrorMsg.Text = "Filter value change failed:" & ex.BusinessException.Message
            End Try

        Else

            lblErrorMsg.Text = "Please select the species from the List"

        End If

    End Sub

    Private Sub Clear()

        txtDiseaseText.Value = ""
        drpDiseaseRanking.SelectedIndex = -1
        rdBtnFirst.SelectedIndex = -1
        rdBtnSecond.SelectedIndex = -1
        rdBtnThird.SelectedIndex = -1
        rdBtnFourth.SelectedIndex = -1
        chkLstTypes.SelectedIndex = -1
        lblAffectedSpecies.Text = ""

    End Sub

    Protected Sub rdBtnFourth_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rdBtnFourth.SelectedIndexChanged

        If rdBtnFourth.SelectedIndex = 0 Or rdBtnFourth.SelectedIndex = 2 Then

            For Each item As ListItem In chkLstTypes.Items

                item.Selected = True
                item.Enabled = True

            Next

        ElseIf rdBtnFourth.SelectedIndex = 1 Then

            For Each item As ListItem In chkLstTypes.Items

                item.Selected = False
                item.Enabled = False

            Next

        End If

    End Sub

    Protected Sub btnDeleteFilter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDeleteFilter.Click

        If drpDiseaseRanking.SelectedIndex > 0 Then

            Try

                Dim change As DiseaseRankingValues = DiseaseRankingValues.DiseaseFilterRankingValuesDelete(drpDiseaseRanking.SelectedItem.Value)

                lblErrorMsg.Text = "Filter value successfully deleted"
                Clear()
                BindDropDownList()

            Catch ex As Csla.DataPortalException
                lblErrorMsg.Text = "Filter value delete failed:" & ex.BusinessException.Message
            End Try

        End If

    End Sub

    Protected Sub DiseaseFilter_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            BindDropDownList()
        End If

    End Sub

    Protected Sub BindDropDownList()

        Dim strippedList = CommonUI.GetDiseaseReferenceTableInfoListStripped()

        drpDiseaseRanking.DataSource = strippedList

        drpDiseaseRanking.DataTextField = "Value"
        drpDiseaseRanking.DataValueField = "Key"
        drpDiseaseRanking.DataBind()
        drpDiseaseRanking.AppendDataBoundItems = False

        drpDiseaseRanking.Items.Insert(0, "Select Filter")

    End Sub

    Private Sub speciesSelector_SelectionChanged(sender As Object, e As SpeciesListLabelUpdatedEventArgs) Handles spsSelector.SpeciesListUpdated
        Me.lblAffectedSpecies.Text = e.ListLabel
    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        spsSelector.ShowLabel = False
        spsSelector.LabelId = lblAffectedSpecies.ClientID
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        TinyMCEHelper.RegisterSingleLineTinyMCE($"{txtDiseaseText.ClientID}", Me)

        ScriptManager.RegisterStartupScript(Me, Me.GetType(), $"aspRadioButtonListGdsStyling{rdBtnFirst.ClientID}", $"aspRadioButtonListGdsStyling('{rdBtnFirst.ClientID}');", True)
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), $"aspRadioButtonListGdsStyling{rdBtnSecond.ClientID}", $"aspRadioButtonListGdsStyling('{rdBtnSecond.ClientID}');", True)
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), $"aspRadioButtonListGdsStyling{rdBtnThird.ClientID}", $"aspRadioButtonListGdsStyling('{rdBtnThird.ClientID}');", True)
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), $"aspRadioButtonListGdsStyling{rdBtnFourth.ClientID}", $"aspRadioButtonListGdsStyling('{rdBtnFourth.ClientID}');", True)
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), $"aspCheckboxListGdsStyling{chkLstTypes.ClientID}", $"aspCheckboxListGdsStyling('{chkLstTypes.ClientID}', false);", True)
    End Sub

End Class
