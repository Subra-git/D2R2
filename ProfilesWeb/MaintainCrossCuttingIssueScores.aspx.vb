Imports ProfilesLibrary
Imports System.ComponentModel

Partial Class MaintainCrossCuttingIssueScores
    Inherits System.Web.UI.Page


    Private mSelectedCriterionId As Guid = Guid.Empty


#Region " Private Methods & Properties "

    Private Property CurrentPrioritisationMetadata() As SpeciesPrioritisationMetadata
        Get
            'if session expired and data requested, reload the metadata object into session
            If Session("SpeciesPrioritisationMetadata") Is Nothing Then
                'if lblPendingChanges is visible then the session expired with changes pending. inform the user
                If lblPendingChanges.Visible = True Then
                    lblError.Text = "Your pending changes have timed out. Please undertake all required modifications and click on the update button."
                    divPendingChanges.Style.Item("Visibility") = "hidden"
                End If

                Session("SpeciesPrioritisationMetadata") = SpeciesPrioritisationMetadata.GetPrioritisationMetadata
            End If

            Return DirectCast(Session("SpeciesPrioritisationMetadata"), SpeciesPrioritisationMetadata)
        End Get
        Set(ByVal value As SpeciesPrioritisationMetadata)
            Session("SpeciesPrioritisationMetadata") = value
        End Set
    End Property

    ' save category object category to session to avoid continuously looping through list to obtain category
    Private Property SelectedPrioritisationCategory() As SpeciesPrioritisationCategory
        Get
            If Not Session("SelectedSpeciesPrioritisationCategory") Is Nothing Then
                Return DirectCast(Session("SelectedSpeciesPrioritisationCategory"), SpeciesPrioritisationCategory)
            Else
                Return Nothing
            End If
        End Get
        Set(ByVal value As SpeciesPrioritisationCategory)
            Session("SelectedSpeciesPrioritisationCategory") = value
        End Set
    End Property

    Private Sub SaveSelectedCategoryToSession()

        Dim selectedCategoryId As Guid = Guid.Empty

        If ddlSpeciesPrioritisationCategories.SelectedIndex > 0 Then
            selectedCategoryId = New Guid(ddlSpeciesPrioritisationCategories.SelectedValue)

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
            CurrentPrioritisationMetadata = SpeciesPrioritisationMetadata.GetPrioritisationMetadata
        End If

        btnUpdate.Attributes.Add("onclick", "return confirm('Are you sure you wish to update the cross-cutting issue scores?');")
    End Sub

    Protected Sub dsSpeciesPrioritisationCategories_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsSpeciesPrioritisationCategories.SelectObject
        e.BusinessObject = CurrentPrioritisationMetadata.Categories
    End Sub

    Protected Sub dsSpeciesPrioritisationCriterionList_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsSpeciesPrioritisationCriterionList.SelectObject

        If (Not SelectedPrioritisationCategory Is Nothing) Then
            e.BusinessObject = SelectedPrioritisationCategory.Criterion
        End If
    End Sub

    Protected Sub ddlSpeciesPrioritisationCategories_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlSpeciesPrioritisationCategories.SelectedIndexChanged
        'call databind on criterion grid to load criteria
        SaveSelectedCategoryToSession()
        pnlSpeciesCriterionValues.Visible = False
        grdSpeciesCategoryCriterion.DataBind()
        'If there is only one criterion in the gridview, automatically expand the criterion value list
        If grdSpeciesCategoryCriterion.Rows.Count = 1 Then
            ShowCriterionValueList(CurrentPrioritisationMetadata.Categories.GetById(New Guid(ddlSpeciesPrioritisationCategories.SelectedValue)).Criterion(0).Id.ToString)
        End If
    End Sub

    Protected Sub grdCategoryCriterion_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles grdSpeciesCategoryCriterion.RowCommand
        If (e.CommandName.ToLower = "loadcriterionvalues") Then
            ShowCriterionValueList(e.CommandArgument.ToString)
        End If
    End Sub


    Protected Sub dsPrioritisationCriterionValueList_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsSpeciesPrioritisationCriterionValueList.SelectObject

        SaveSelectedCategoryToSession()
        If mSelectedCriterionId <> Guid.Empty And Not SelectedPrioritisationCategory Is Nothing Then
            Dim selectedCriterion As SpeciesPrioritisationCriterion = CurrentPrioritisationMetadata.Categories.GetById(SelectedPrioritisationCategory.Id).Criterion.GetById(mSelectedCriterionId)
            If Not selectedCriterion Is Nothing Then
                e.BusinessObject = selectedCriterion.Values
                lblSpeciesCriterionCode.Text = selectedCriterion.Name
            End If
        End If
    End Sub


    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click

        If Not CurrentPrioritisationMetadata.IsDirty Then
            lblError.Text = "There are no changes to save"
            Exit Sub
        End If

        Try
            CurrentPrioritisationMetadata.Save()
            lblError.Text = "Your changes were successfully saved"
            divPendingChanges.Style.Item("Visibility") = "hidden"
        Catch ex As Csla.DataPortalException
            lblError.Text = ex.BusinessException.Message
            'Reload the data from the db
            CurrentPrioritisationMetadata = SpeciesPrioritisationMetadata.GetPrioritisationMetadata
            ddlSpeciesPrioritisationCategories.SelectedIndex = 0
            SelectedPrioritisationCategory = Nothing
            grdSpeciesCategoryCriterion.DataBind()
            divPendingChanges.Style.Item("Visibility") = "hidden"
        Catch vex As Csla.Validation.ValidationException
            lblError.Text = vex.Message
        End Try

        CurrentPrioritisationMetadata = SpeciesPrioritisationMetadata.GetPrioritisationMetadata

    End Sub




    Protected Sub btnSaveCriterion_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        PersistCriterionValues()
        pnlSpeciesCriterionValues.Visible = False

        If CurrentPrioritisationMetadata.IsDirty Then
            divPendingChanges.Style.Item("Visibility") = "visible"
        End If
    End Sub

    Protected Sub btnCancelCriterion_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        pnlSpeciesCriterionValues.Visible = False
    End Sub

#End Region

    Private Sub ShowCriterionValueList(ByVal Id As String)
        mSelectedCriterionId = New Guid(Id)
        grdSpeciesCriterionValues.DataBind()
        pnlSpeciesCriterionValues.Visible = True
        lblSpeciesCriterionIdHidden.Text = mSelectedCriterionId.ToString
    End Sub


    Private Sub PersistCriterionValues()
        Dim criterionId As Guid = New Guid(lblSpeciesCriterionIdHidden.Text)
        Dim criterion As SpeciesPrioritisationCriterion

        If (Not SelectedPrioritisationCategory Is Nothing) Then
            criterion = CurrentPrioritisationMetadata.Categories.GetById(SelectedPrioritisationCategory.Id).Criterion.GetById(criterionId)

            'persist criterion scores to business objects
            For Each row As GridViewRow In Me.grdSpeciesCriterionValues.Rows

                Dim criterionValue As SpeciesPrioritisationCriterionValue
                Dim criterionValueId As Guid

                criterionValueId = grdSpeciesCriterionValues.DataKeys(row.RowIndex).Value
                criterionValue = CurrentPrioritisationMetadata.Categories.GetById(SelectedPrioritisationCategory.Id).Criterion.GetById(criterionId).Values.GetById(criterionValueId)

                'perform check as posting back although validation error on page
                Dim score As String = DirectCast(row.FindControl("txtScore"), System.Web.UI.WebControls.TextBox).Text
                criterionValue.Score = System.Convert.ToInt32(score)

            Next

        End If

        'rebind category grid to display modified name and weighting
        grdSpeciesCategoryCriterion.DataBind()

    End Sub


End Class
