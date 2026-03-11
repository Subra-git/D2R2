Imports System
Imports System.ComponentModel
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Text
Imports ProfilesLibrary

Namespace Profiles.WebControls.ProfileControls

    Public Class ProfileRowListPanel
        Inherits WebControl
        Implements INamingContainer

        Private mQuestion As RepeatingQuestion
        Private mProfileFieldListPanel As ProfileFieldListPanel
        Private mEditLinkList As New Generic.List(Of LinkButton)
        Private mDeleteLinkList As New Generic.List(Of LinkButton)
        Private mAddButton As Button
        Private mOKButton As Button
        Private mCancelButton As Button

        Private Property SelectedRowId() As Guid
            Get
                Dim id As Object = ViewState("SelectedRowId")
                If id Is Nothing Then
                    Return Guid.Empty
                Else
                    Return DirectCast(id, Guid)
                End If
            End Get
            Set(ByVal value As Guid)
                ViewState("SelectedRowId") = value
                EnsureChildControls()
                mProfileFieldListPanel.FieldList = mQuestion.RowList.FieldList
            End Set
        End Property

        Private Property NewRowId() As Guid
            Get
                Dim id As Object = ViewState("NewRowId")
                If id Is Nothing Then
                    Return Guid.Empty
                Else
                    Return DirectCast(id, Guid)
                End If
            End Get
            Set(ByVal value As Guid)
                ViewState("NewRowId") = value
            End Set
        End Property

        Private Property ShowPanel() As Boolean
            Get
                Dim flag As Object = ViewState("ShowPanel")
                If flag Is Nothing Then
                    Return False
                Else
                    Return DirectCast(flag, Boolean)
                End If
            End Get
            Set(ByVal value As Boolean)
                ViewState("ShowPanel") = value
            End Set
        End Property

        Public Property Question() As RepeatingQuestion
            Get
                Return mQuestion
            End Get
            Set(ByVal value As ProfilesLibrary.RepeatingQuestion)
                mQuestion = value
                EnsureChildControls()
            End Set
        End Property

        Public Overrides ReadOnly Property Controls() As System.Web.UI.ControlCollection
            Get
                EnsureChildControls()
                Return MyBase.Controls
            End Get
        End Property

        Protected Overrides Sub CreateChildControls()

            Controls.Clear()

            mProfileFieldListPanel = New ProfileFieldListPanel
            Controls.Add(mProfileFieldListPanel)
            mProfileFieldListPanel.ID = "qplRepeating"
            mProfileFieldListPanel.FieldList = mQuestion.RowList.FieldList

            For currentRow As Integer = 0 To mQuestion.RowList.Count - 1
                Dim editLink As New LinkButton
                Controls.Add(editLink)
                mEditLinkList.Add(editLink)
                editLink.ID = "lnkEdit" & currentRow.ToString()
                editLink.CssClass = "govuk-link"
                AddHandler editLink.Click, AddressOf lnkEdit_Click

                Dim deleteLink As New LinkButton
                Controls.Add(deleteLink)
                mDeleteLinkList.Add(deleteLink)
                deleteLink.ID = "lnkDelete" & currentRow.ToString()
                deleteLink.CssClass = "govuk-link"
                AddHandler deleteLink.Click, AddressOf lnkDelete_Click

            Next

            mAddButton = New Button
            Controls.Add(mAddButton)
            mAddButton.ID = "btnAdd"
            mAddButton.CssClass = "govuk-button"
            AddHandler mAddButton.Click, AddressOf btnAdd_Click

            mOKButton = New Button
            Controls.Add(mOKButton)
            mOKButton.ID = "btnOK"
            mOKButton.CssClass = "govuk-button"
            AddHandler mOKButton.Click, AddressOf btnOK_Click

            mCancelButton = New Button
            Controls.Add(mCancelButton)
            mCancelButton.ID = "btnCancel"
            mCancelButton.CssClass = "govuk-button govuk-button--secondary"
            AddHandler mCancelButton.Click, AddressOf btnCancel_Click

        End Sub

        Protected Sub lnkEdit_Click(ByVal sender As Object, ByVal e As EventArgs)

            SaveSubPanel()
            SelectedRowId = New Guid(DirectCast(sender, LinkButton).CommandArgument)
            Question.BeginEdit()
            mProfileFieldListPanel.UpdateUIValue(mQuestion.RowList.GetById(SelectedRowId).FieldValues)
            ShowPanel = True

        End Sub

        Protected Sub lnkDelete_Click(ByVal sender As Object, ByVal e As EventArgs)

            SaveSubPanel()

            Dim rowId As New Guid(DirectCast(sender, LinkButton).CommandArgument)
            mQuestion.RowList.Remove(mQuestion.RowList.GetById(rowId))

        End Sub

        Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As EventArgs)

            SaveSubPanel()

            ShowPanel = True
            Question.BeginEdit()
            Dim row As QuestionRow = mQuestion.RowList.AddNew()
            SelectedRowId = row.Id
            NewRowId = row.Id
            mProfileFieldListPanel.UpdateUIValue(row.FieldValues)
            mProfileFieldListPanel.CloseSubPanel()

        End Sub

        Protected Sub btnOK_Click(ByVal sender As Object, ByVal e As EventArgs)
            SaveSubPanel()
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "perSpeciesPanelRefresh", "try{if(refreshPanel==true){HideAndClearIrrelevantQuestions();}refreshPanel=false;}catch(err){}", True)
        End Sub

        Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As EventArgs)

            Question.CancelEdit()
            NewRowId = Guid.Empty

            If Question.HasFieldGroup() Then
                mProfileFieldListPanel.CloseSubPanel()
            End If

            CloseSubPanel()

        End Sub

        Protected Friend Sub SaveSubPanel()

            Dim row As QuestionRow
            NewRowId = Guid.Empty
            If SelectedRowId <> Guid.Empty Then
                row = mQuestion.RowList.GetById(SelectedRowId)

                If Question.HasFieldGroup Then
                    mProfileFieldListPanel.SaveSubPanel()
                End If

                Question.ApplyEdit()
                mProfileFieldListPanel.Save(row.FieldValues)
            End If
            CloseSubPanel()

        End Sub

        Protected Friend Sub CloseSubPanel()

            SelectedRowId = Guid.Empty
            ShowPanel = False

        End Sub

        Protected Overrides Sub OnPreRender(ByVal e As System.EventArgs)

            Dim isReadOnly As Boolean = mQuestion.RowList.FieldList.FieldListIsReadOnly

            For currentRow As Integer = 0 To mQuestion.RowList.Count - 1
                Dim row As QuestionRow = mQuestion.RowList(currentRow)
                If row.Id <> NewRowId Then

                    If isReadOnly Then
                        mEditLinkList(currentRow).Text = "View"
                    Else
                        mEditLinkList(currentRow).Text = "Edit"
                    End If
                    mEditLinkList(currentRow).CommandArgument = row.Id.ToString()
                    mDeleteLinkList(currentRow).Text = "Delete"
                    mDeleteLinkList(currentRow).CommandArgument = row.Id.ToString()
                    mDeleteLinkList(currentRow).Visible = Not isReadOnly
                End If
            Next

            If SelectedRowId <> Guid.Empty Then
                mProfileFieldListPanel.FieldValues = mQuestion.RowList.GetById(SelectedRowId).FieldValues
            End If

            mAddButton.Text = "Add"
            mAddButton.CssClass = "govuk-button"
            mAddButton.Visible = Not isReadOnly
            If isReadOnly Then
                mOKButton.Text = "Close"
                mOKButton.CssClass = "govuk-button govuk-button--secondary"
            Else
                mOKButton.Text = "OK"
                mOKButton.CssClass = "govuk-button"
            End If

            mCancelButton.Text = "Cancel"
            mCancelButton.CssClass = "govuk-button govuk-button--secondary"
            mCancelButton.Visible = Not isReadOnly
            mCancelButton.CausesValidation = False

            MyBase.OnPreRender(e)

        End Sub

        Private Sub RenderNoAnswers(ByVal writer As System.Web.UI.HtmlTextWriter)
            writer.AddStyleAttribute("padding-top", "3px") 'To stop the top line of the text appearing in a collapsed panel
            writer.RenderBeginTag(HtmlTextWriterTag.P)
            writer.Write("There are no answers to display.")
            writer.RenderEndTag() '/P
        End Sub


        Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)

            If mQuestion.RowList.Count = 0 Then
                RenderNoAnswers(writer)
            ElseIf mQuestion.RowList.Count = 1 Then
                If mQuestion.RowList(0).Id = NewRowId Then
                    RenderNoAnswers(writer)
                Else
                    RenderSummaryTable(writer)
                End If
            Else
                RenderSummaryTable(writer)
            End If

            writer.RenderBeginTag(HtmlTextWriterTag.P)
            mAddButton.RenderControl(writer)
            writer.RenderEndTag()

            If ShowPanel Then
                writer.AddStyleAttribute(HtmlTextWriterStyle.Width, "100%")
                writer.RenderBeginTag(HtmlTextWriterTag.Table)
                writer.RenderBeginTag(HtmlTextWriterTag.Tbody)
                writer.RenderBeginTag(HtmlTextWriterTag.Tr)
                writer.RenderBeginTag(HtmlTextWriterTag.Td)

                writer.AddStyleAttribute(HtmlTextWriterStyle.Width, "96%")
                writer.AddAttribute(HtmlTextWriterAttribute.Class, "collapsePanelHeader-NoPointer govuk-heading-s")
                writer.AddAttribute(HtmlTextWriterAttribute.Id, mProfileFieldListPanel.ClientID)
                writer.RenderBeginTag(HtmlTextWriterTag.Div)
                If mQuestion.RowList.FieldList.FieldListIsReadOnly Then
                    writer.Write("View answer")
                Else
                    writer.Write("Edit answer")
                End If
                writer.RenderEndTag()
                writer.AddStyleAttribute(HtmlTextWriterStyle.Width, "95%")
                writer.AddAttribute(HtmlTextWriterAttribute.Class, "collapsePanel")
                writer.RenderBeginTag(HtmlTextWriterTag.Div)
                mProfileFieldListPanel.RenderControl(writer)

                writer.AddAttribute(HtmlTextWriterAttribute.Align, "Right")
                writer.RenderBeginTag(HtmlTextWriterTag.Div)
                mOKButton.RenderControl(writer)
                writer.Write("&nbsp;")
                mCancelButton.RenderControl(writer)
                writer.RenderEndTag()

                writer.RenderEndTag()

                writer.RenderEndTag()
                writer.RenderEndTag()
                writer.RenderEndTag()
                writer.RenderEndTag()
            End If

        End Sub

        Private Sub RenderSummaryTable(ByVal writer As HtmlTextWriter)

            Dim headerComplete As Boolean

            For currentRow As Integer = 0 To mQuestion.RowList.Count - 1
                If Not headerComplete Then
                    Dim fieldList As FieldMetadataListWrapper = mQuestion.RowList.FieldList
                    writer.AddStyleAttribute(HtmlTextWriterStyle.Width, "100%")
                    writer.AddAttribute(HtmlTextWriterAttribute.Class, "govuk-table")
                    writer.RenderBeginTag(HtmlTextWriterTag.Table)
                    writer.AddAttribute(HtmlTextWriterAttribute.Class, "govuk-table__head")
                    writer.RenderBeginTag(HtmlTextWriterTag.Thead)
                    writer.AddAttribute(HtmlTextWriterAttribute.Class, "govuk-table__row")
                    writer.RenderBeginTag(HtmlTextWriterTag.Tr)

                    For Each field As FieldMetadataWrapper In fieldList
                        If field.IncludeInSummary Then
                            writer.AddStyleAttribute(HtmlTextWriterStyle.FontWeight, "bold")
                            writer.AddAttribute(HtmlTextWriterAttribute.Class, "govuk-table__cell")
                            writer.RenderBeginTag(HtmlTextWriterTag.Td)
                            writer.Write(field.Name)
                            'If field.IsMandatory Then
                            '    writer.Write(" (*)")
                            'End If
                            writer.RenderEndTag()
                        End If
                    Next
                    writer.AddStyleAttribute(HtmlTextWriterStyle.Width, "5%")
                    writer.AddAttribute(HtmlTextWriterAttribute.Class, "govuk-table__cell")
                    writer.RenderBeginTag(HtmlTextWriterTag.Td)
                    writer.Write("&nbsp;")
                    writer.RenderEndTag()
                    writer.AddStyleAttribute(HtmlTextWriterStyle.Width, "5%")
                    writer.AddAttribute(HtmlTextWriterAttribute.Class, "govuk-table__cell")
                    writer.RenderBeginTag(HtmlTextWriterTag.Td)
                    writer.Write("&nbsp;")
                    writer.RenderEndTag()
                    writer.RenderEndTag()
                    writer.RenderEndTag()

                    writer.AddAttribute(HtmlTextWriterAttribute.Class, "govuk-table__body")
                    writer.RenderBeginTag(HtmlTextWriterTag.Tbody)

                    headerComplete = True
                End If
                RenderRow(writer, currentRow)
            Next

            If headerComplete Then
                writer.RenderEndTag()
                writer.RenderEndTag()
            End If

        End Sub

        Private Sub RenderRow(ByVal writer As HtmlTextWriter, ByVal currentRow As Integer)

            Dim row As QuestionRow = mQuestion.RowList(currentRow)
            If row.Id = NewRowId Then
                Exit Sub
            End If

            writer.AddAttribute(HtmlTextWriterAttribute.Class, "govuk-table__row")
            writer.RenderBeginTag(HtmlTextWriterTag.Tr)

            For Each field As FieldValueBase In row.FieldValues
                If field.IncludeInSummary Then
                    writer.AddAttribute(HtmlTextWriterAttribute.Class, "govuk-table__cell")
                    writer.RenderBeginTag(HtmlTextWriterTag.Td)
                    RenderRowField(writer, field)
                    writer.RenderEndTag()
                End If
            Next

            writer.AddStyleAttribute("Align", "Right")
            writer.AddAttribute(HtmlTextWriterAttribute.Class, "govuk-table__cell")
            writer.RenderBeginTag(HtmlTextWriterTag.Td)
            writer.AddAttribute(HtmlTextWriterAttribute.Class, "govuk-link")
            mEditLinkList(currentRow).RenderControl(writer)
            writer.RenderEndTag()

            writer.AddStyleAttribute("Align", "Right")
            writer.AddAttribute(HtmlTextWriterAttribute.Class, "govuk-table__cell")
            writer.RenderBeginTag(HtmlTextWriterTag.Td)
            writer.AddAttribute(HtmlTextWriterAttribute.Class, "govuk-link")
            mDeleteLinkList(currentRow).RenderControl(writer)
            writer.RenderEndTag()

            writer.RenderEndTag()

        End Sub

        Private Sub RenderRowField(ByVal writer As HtmlTextWriter, ByVal field As FieldValueBase)

            writer.Write(field.ToString(50))

        End Sub

    End Class
End Namespace