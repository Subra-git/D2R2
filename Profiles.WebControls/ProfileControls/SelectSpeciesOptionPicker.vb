Imports System.Web.UI.WebControls
Imports System.Web.UI
Imports System.Text

Namespace Profiles.WebControls.ProfileControls

    Public Class SelectSpeciesOptionPicker
        Inherits WebControl
        Implements INamingContainer

        Private mUpdatePanel As UpdatePanel
        Private mParentSpan As Label
        Private mAccordionToggle As Label
        Private mToggleImage As Literal

        Private mResultPanel As System.Web.UI.HtmlControls.HtmlButton
        Private mToggleText As Label

        Private mAriaLabelText As String
        Private mResultLabelText As String
        Private mResultSelectionText As String = ""
        Private mCheckboxPanel As Panel
        Private mCheckAll As CheckBox
        Private mPickerRowList As New Generic.List(Of PickerRow)
        Private mOptionList As New List(Of OptionItem)
        Private mSelectedList As New List(Of Guid)
        Private mExcludeItemId As Guid
        Private mDialoguePicker As Boolean = False
        Private mPersistentScroll As PersistentScrollPosition

        Private Class OptionItem

            Private mId As Guid
            Private mOptionText As String
            Private mOptionSummaryText As String

            Public Sub New(ByVal id As Guid, ByVal optionText As String, ByVal optionSummaryText As String)
                mId = id
                mOptionText = optionText
                mOptionSummaryText = optionSummaryText
            End Sub

            Public ReadOnly Property Id() As Guid
                Get
                    Return mId
                End Get
            End Property

            Public ReadOnly Property OptionText() As String
                Get
                    Return mOptionText
                End Get
            End Property

            Public ReadOnly Property OptionSummaryText() As String
                Get
                    Return mOptionSummaryText
                End Get
            End Property

        End Class

        Public Property ResultLabelText() As String
            Get
                Return mResultLabelText
            End Get
            Set(ByVal value As String)
                mResultLabelText = value
            End Set
        End Property

        Public Property AriaLabelText() As String
            Get
                Return mAriaLabelText
            End Get
            Set(ByVal value As String)
                mAriaLabelText = value
            End Set
        End Property

        Public Property ExcludeItemId() As Guid
            Get
                If mExcludeItemId = Guid.Empty Then
                    If Not ViewState("ExcludedItemId") Is Nothing Then
                        mExcludeItemId = New Guid(ViewState("ExcludedItemId").ToString)
                    End If
                End If
                Return mExcludeItemId
            End Get
            Set(ByVal value As Guid)
                mExcludeItemId = value
                ViewState("ExcludedItemId") = mExcludeItemId.ToString
            End Set
        End Property

        Public ReadOnly Property SelectedOptions() As Generic.List(Of Guid)
            Get
                Dim selectedList As New Generic.List(Of Guid)
                For currentOptionIndex As Integer = 0 To mOptionList.Count - 1
                    If mPickerRowList(currentOptionIndex).RowCheckBox.Checked Then
                        selectedList.Add(mOptionList(currentOptionIndex).Id)
                    End If
                Next
                Return selectedList
            End Get
        End Property

        Public ReadOnly Property NotSelectedOptions() As Generic.List(Of Guid)
            Get
                Dim notSelectedList As New Generic.List(Of Guid)
                For currentOptionIndex As Integer = 0 To mOptionList.Count - 1
                    If Not mPickerRowList(currentOptionIndex).RowCheckBox.Checked Then
                        notSelectedList.Add(mOptionList(currentOptionIndex).Id)
                    End If
                Next
                Return notSelectedList
            End Get
        End Property

        Public Property DialoguePicker() As Boolean
            Get
                Return mDialoguePicker
            End Get
            Set(ByVal value As Boolean)
                mDialoguePicker = value
            End Set
        End Property

        Public Sub AddOptionItem(ByVal id As Guid, ByVal optionText As String)
            mOptionList.Add(New OptionItem(id, optionText, optionText))
        End Sub
        Public Sub AddOptionItem(ByVal id As Guid, ByVal optionText As String, ByVal optionSummaryText As String)
            mOptionList.Add(New OptionItem(id, optionText, optionSummaryText))
        End Sub

        Public Sub AddSelectedItem(ByVal id As Guid)
            mSelectedList.Add(id)
        End Sub

        Public Sub UpdateSelectedOptions()
            Dim currentIndex As Integer = 0
            For Each item As OptionItem In mOptionList
                For Each selectedId As Guid In mSelectedList
                    If item.Id = selectedId Then
                        mPickerRowList(currentIndex).RowCheckBox.Checked = True
                    End If
                Next
                currentIndex += 1
            Next
            UpdateResultText()
        End Sub


        Public Sub ClearSelectedOptions()
            For Each row As PickerRow In mPickerRowList
                row.RowCheckBox.Checked = False
            Next
            UpdateResultText()
            SpeciesSelectorShowOff()
        End Sub

        Public Overrides ReadOnly Property Controls() As System.Web.UI.ControlCollection
            Get
                EnsureChildControls()
                Return MyBase.Controls
            End Get
        End Property

        Protected Overrides Sub CreateChildControls()

            Controls.Clear()

            mUpdatePanel = New UpdatePanel
            Controls.Add(mUpdatePanel)
            mUpdatePanel.UpdateMode = UpdatePanelUpdateMode.Conditional
            mUpdatePanel.ChildrenAsTriggers = True
            mUpdatePanel.ID = "udpOptionList"

            mResultPanel = New System.Web.UI.HtmlControls.HtmlButton
            mUpdatePanel.ContentTemplateContainer.Controls.Add(mResultPanel)
            mResultPanel.ID = "lblResult"
            mResultPanel.Attributes.Add("aria-label", "accordion")
            mResultPanel.Attributes.Add("class", "govuk-accordion__show-all")
            mResultPanel.Attributes.Add("aria-controls", "accordion-default-content-1")
            mResultPanel.Attributes.Add("aria-expanded", "false")
            mResultPanel.Attributes.Add("href", "#")
            mResultPanel.Controls.Add(MakePanelHeader())

            mResultPanel.Attributes.Add("onclick", "tinyMCE.triggerSave(false,true); showSpeciesSelector(this); return false;")

            mCheckboxPanel = New Panel

            mUpdatePanel.ContentTemplateContainer.Controls.Add(mCheckboxPanel)
            mCheckboxPanel.ID = "pnlPopup"
            mCheckboxPanel.CssClass = "ContextMenuPanel"
            mCheckboxPanel.Style.Add("display", "none")

            Dim literal1 As New LiteralControl
            mCheckboxPanel.Controls.Add(literal1)

            literal1.Text = $"<table style=""width: 90%""><tbody><tr class=""govuk-checkboxes govuk-checkboxes--small"">
                               <td class=""govuk-checkboxes__item checkbox-inline"">"

            mCheckAll = New CheckBox
            mCheckboxPanel.Controls.Add(mCheckAll)
            mCheckAll.ID = "chkAll"
            mCheckAll.AutoPostBack = True
            If mCheckAll.Checked Then
                mCheckAll.Attributes.Add("checked", "checked")
                mCheckAll.InputAttributes.Add("checked", "checked")
            End If
            mCheckAll.InputAttributes.Add("class", "govuk-checkboxes__input")
            mCheckAll.Attributes.Add("onclick", "tinyMCE.triggerSave(false,true);")
            AddHandler mCheckAll.CheckedChanged, AddressOf chkAll_CheckedChanged

            Dim literal2 As New LiteralControl
            mCheckboxPanel.Controls.Add(literal2)
            literal2.Text = "<label for='" & mCheckAll.ClientID & "' class='govuk-label govuk-checkboxes__label'>All</label>"
            literal2.Text += "</td></tr>"

            literal2.Text += "<tr><td><hr /></td></tr></tbody></table>"

            If mDialoguePicker Then
                mPersistentScroll = New PersistentScrollPosition
                mPersistentScroll.ID = "persistentScroll"
                mPersistentScroll.ControlToPersist = "pnlPopup"
                mUpdatePanel.ContentTemplateContainer.Controls.Add(mPersistentScroll)
            End If

            For Each item As OptionItem In mOptionList
                Dim currentRow As New PickerRow
                mPickerRowList.Add(currentRow)
                mCheckboxPanel.Controls.Add(currentRow)
                currentRow.RowText = item.OptionText
                currentRow.RowId = item.OptionSummaryText
                currentRow.Attributes.Add("aria-label", currentRow.RowText)

                AddHandler currentRow.RowCheckBoxChanged, AddressOf chkSpecies_CheckedChanged

                For Each selectedID As Guid In mSelectedList
                    If item.Id = selectedID Then
                        currentRow.Checked = True
                        currentRow.Attributes.Add("checked", "checked")
                    End If
                Next
            Next

        End Sub

        Private Function MakePanelHeader() As Control
            mParentSpan = New Label
            mAccordionToggle = New Label
            mToggleImage = New Literal

            mParentSpan.CssClass = "govuk-accordion__section-toggle"
            mParentSpan.Attributes.Add("data-nosnippet", "")
            mParentSpan.Controls.Add(mAccordionToggle)

            mAccordionToggle.CssClass = "govuk-accordion__section-toggle-focus apha-font-size-19"

            mToggleText = New Label
            mAccordionToggle.Controls.Add(mToggleText)

            mToggleText.CssClass = "govuk-accordion__section-toggle-text"
            mToggleText.Text = mResultSelectionText

            mAccordionToggle.Controls.Add(mToggleImage)
            mToggleImage.Text = "<i id='speciesSelectShowIcon' class='govuk-accordion-nav__chevron govuk-accordion-nav__chevron--down'></i>"

            Return mParentSpan
        End Function

        Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
            mUpdatePanel.RenderControl(writer)
        End Sub

        Protected Sub chkSpecies_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)

            If Not DirectCast(sender, CheckBox).Checked Then
                mCheckAll.Checked = False
            End If
            UpdateResultText()
            SpeciesSelectorShowOn()

        End Sub

        Protected Sub chkAll_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)

            For Each row As PickerRow In mPickerRowList
                row.RowCheckBox.Checked = mCheckAll.Checked
            Next
            UpdateResultText()
            SpeciesSelectorShowOn()

        End Sub
        Protected Overrides Sub OnPreRender(ByVal e As System.EventArgs)

            Dim currentIndex As Integer = 0
            For Each item As OptionItem In mOptionList
                mPickerRowList(currentIndex).Visible = Not item.Id.Equals(ExcludeItemId)
                currentIndex += 1
            Next
            MyBase.OnPreRender(e)

        End Sub

        Private Sub UpdateResultText()

            Dim result As New StringBuilder
            result.Append(ResultLabelText)
            Dim firstChecked As Boolean
            Dim allChecked As Boolean

            mResultSelectionText = ""

            If mPickerRowList.Count > 1 Then
                allChecked = True
            Else
                allChecked = mCheckAll.Checked
            End If

            Dim optionIndex As Integer = 0
            For Each row As PickerRow In mPickerRowList
                If row.Visible Then
                    If row.RowCheckBox.Checked Then
                        If firstChecked Then
                            result.Append(", ")
                        End If
                        firstChecked = True
                        result.Append(mOptionList(optionIndex).OptionSummaryText)
                    Else
                        allChecked = False
                    End If
                End If
                optionIndex = optionIndex + 1
            Next

            mCheckAll.Checked = allChecked
            If allChecked Then
                mCheckAll.InputAttributes.Add("checked", "checked")
            Else
                mCheckAll.InputAttributes.Remove("checked")
            End If

            mResultSelectionText = result.ToString() & " "
            mToggleText.Text = mResultSelectionText

        End Sub

        Private Sub SpeciesSelectorShowOn()
            mToggleImage.Text = "<i id='speciesSelectShowIcon' class='govuk-accordion-nav__chevron'></i>"
            mCheckboxPanel.Style.Add("display", "block")
            mResultPanel.Attributes.Add("aria-expanded", "true")
        End Sub

        Private Sub SpeciesSelectorShowOff()
            mToggleImage.Text = "<i id='speciesSelectShowIcon' class='govuk-accordion-nav__chevron govuk-accordion-nav__chevron--down'></i>"
            mCheckboxPanel.Style.Add("display", "none")
            mResultPanel.Attributes.Add("aria-expanded", "false")
        End Sub

    End Class
End Namespace
