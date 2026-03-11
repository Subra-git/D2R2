Imports Microsoft.VisualBasic
Imports System.Collections.Generic
Imports Profiles.WebControls

Namespace ProfilesWeb.Controls

    Public Class PopupOptionPicker
        Inherits WebControl
        Implements INamingContainer

        Private mUpdatePanel As UpdatePanel
        Private mResultLabel As Label
        Private mResultLabelText As String
        Private mPopupPanel As Panel
        Private mCheckAll As CheckBox
        Private mPopupExtender As AjaxControlToolkit.PopupControlExtender
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

            mResultLabel = New Label
            mUpdatePanel.ContentTemplateContainer.Controls.Add(mResultLabel)
            mResultLabel.ID = "lblResult"
            mResultLabel.CssClass = "HyperlinkStyle"
            mResultLabel.Text = mResultLabelText

            mPopupPanel = New Panel

            mUpdatePanel.ContentTemplateContainer.Controls.Add(mPopupPanel)
            mPopupPanel.ID = "pnlPopup"
            mPopupPanel.CssClass = "ContextMenuPanel"
            mPopupPanel.Style.Add("visibility", "hidden")
            mPopupPanel.Style.Add("display", "none")

            If mDialoguePicker Then
                mPopupPanel.Style.Add("height", "150px")
                mPopupPanel.Style.Add("overflow-y", "scroll")
                mPopupPanel.Style.Add("overflow-x", "hidden")

                mPersistentScroll = New PersistentScrollPosition
                mPersistentScroll.ID = "persistentScroll"
                mPersistentScroll.ControlToPersist = "pnlPopup"
                mUpdatePanel.ContentTemplateContainer.Controls.Add(mPersistentScroll)
            End If

            Dim literal1 As New LiteralControl
            mPopupPanel.Controls.Add(literal1)

            If mDialoguePicker Then
                literal1.Text = "<span class=""menulinkdesc"" style=""color:Black;font-weight:bold;width:500px;"">"
            Else
                literal1.Text = "<span class=""menulinkdesc"" style=""color:Black;font-weight:bold"">"
            End If

            mCheckAll = New CheckBox
            mPopupPanel.Controls.Add(mCheckAll)
            mCheckAll.ID = "chkAll"
            mCheckAll.AutoPostBack = True
            AddHandler mCheckAll.CheckedChanged, AddressOf chkAll_CheckedChanged
            mCheckAll.Text = "All"

            Dim literal2 As New LiteralControl
            mPopupPanel.Controls.Add(literal2)
            literal2.Text = "</span><span class=""ContextMenuBreak"""

            If mDialoguePicker Then
                literal2.Text += " style=""width:400px""><hr /></span>"
            Else
                literal2.Text += "><hr /></span>"
            End If

            For Each item As OptionItem In mOptionList
                Dim currentRow As New PickerRow                
                mPickerRowList.Add(currentRow)
                mPopupPanel.Controls.Add(currentRow)
                currentRow.RowText = item.OptionText
                currentRow.RowId = item.OptionSummaryText
                AddHandler currentRow.RowCheckBoxChanged, AddressOf chkSpecies_CheckedChanged

                For Each selectedID As Guid In mSelectedList
                    If item.Id = selectedID Then
                        currentRow.Checked = True
                    End If
                Next
            Next

            mPopupExtender = New AjaxControlToolkit.PopupControlExtender
            mUpdatePanel.ContentTemplateContainer.Controls.Add(mPopupExtender)
            mPopupExtender.TargetControlID = "lblResult"
            mPopupExtender.PopupControlID = "pnlPopup"
            mPopupExtender.Position = AjaxControlToolkit.PopupControlPopupPosition.Bottom

        End Sub

        Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
            mUpdatePanel.RenderControl(writer)
        End Sub

        Protected Sub chkSpecies_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)

            If Not DirectCast(sender, CheckBox).Checked Then
                mCheckAll.Checked = False
            End If
            UpdateResultText()

        End Sub

        Protected Sub chkAll_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)

            For Each row As PickerRow In mPickerRowList
                row.RowCheckBox.Checked = mCheckAll.Checked
            Next
            UpdateResultText()

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
            Dim allChecked As Boolean = True

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
            mResultLabel.Text = result.ToString()
        End Sub

    End Class
End Namespace
