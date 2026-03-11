Imports System
Imports System.ComponentModel
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Text
Imports ProfilesLibrary
Imports System.Collections.Generic

Namespace ProfilesWeb.Controls

    Public Class PerSpeciesListPanel
        Inherits WebControl
        Implements INamingContainer

        Private mProfileFieldListPanel As ProfileFieldListPanel
        Private mEditLinkList As New Generic.List(Of LinkButton)
        Private mSpeciesPicker As PopupOptionPicker
        Private mOKButton As Button
        Private mCancelButton As Button
        Private mQuestionShortName As String
        Private mFieldList As FieldMetadataListWrapper
        Private mProfiledSpeciesList As List(Of ProfiledSpecies)
        Protected mSpeciesList As QuestionSpeciesList

        Public Overridable Property SpeciesList() As QuestionSpeciesList
            Get
                Return mSpeciesList
            End Get
            Set(ByVal value As QuestionSpeciesList)
                EnsureChildControls()
                mSpeciesList = value
            End Set
        End Property

        Public Property ProfiledSpeciesList() As List(Of ProfiledSpecies)
            Get
                Return mProfiledSpeciesList
            End Get
            Set(ByVal value As List(Of ProfiledSpecies))
                mProfiledSpeciesList = value
                EnsureChildControls()
            End Set
        End Property

        Public Property FieldList() As FieldMetadataListWrapper
            Get
                Return mFieldList
            End Get
            Set(ByVal value As FieldMetadataListWrapper)
                mFieldList = value
            End Set
        End Property

        Public Property QuestionShortName() As String
            Get
                Return mQuestionShortName
            End Get
            Set(ByVal value As String)
                mQuestionShortName = value
            End Set
        End Property

        Private Property SelectedSpeciesId() As Guid
            Get
                Dim id As Object = ViewState("SelectedSpeciesId")
                If id Is Nothing Then
                    Return Guid.Empty
                Else
                    Return DirectCast(id, Guid)
                End If
            End Get
            Set(ByVal value As Guid)
                ViewState("SelectedSpeciesId") = value
                EnsureChildControls()
                mProfileFieldListPanel.FieldList = mFieldList
            End Set
        End Property

        ''' <summary>
        ''' Required for composite web controls (ie. controls that contain other controls)
        ''' </summary>
        Public Overrides ReadOnly Property Controls() As System.Web.UI.ControlCollection
            Get
                EnsureChildControls()
                Return MyBase.Controls
            End Get
        End Property

        ''' <summary>
        ''' Creates the controls that make up the interface. This is called by the ASP.NET infrastructure after the FieldList property is
        ''' set (so we know the characteristics of the fields we are displaying) but before UpdateUIValue is called (so we don't yet
        ''' know the field values)
        ''' </summary>
        Protected Overrides Sub CreateChildControls()

            Controls.Clear()

            If mProfiledSpeciesList.Count > 0 Then
                mProfileFieldListPanel = New ProfileFieldListPanel
                Controls.Add(mProfileFieldListPanel)
                mProfileFieldListPanel.ID = "qpl" & mQuestionShortName.Replace(" ", String.Empty)
                mProfileFieldListPanel.FieldList = mFieldList
            End If

            For Each species As ProfiledSpecies In mProfiledSpeciesList
                Dim editLink As New LinkButton
                Controls.Add(editLink)
                mEditLinkList.Add(editLink)
                editLink.ID = "lnkEdit" & species.Id.ToString()

                If mFieldList.FieldListIsReadOnly Then
                    editLink.Text = "View"
                Else
                    editLink.Text = "Edit"
                End If

                editLink.CommandArgument = species.Id.ToString()
                AddHandler editLink.Click, AddressOf lnkEdit_Click
            Next

            mSpeciesPicker = New PopupOptionPicker
            Controls.Add(mSpeciesPicker)
            mSpeciesPicker.ResultLabelText = "Apply this answer also to: "

            For Each species As ProfiledSpecies In mProfiledSpeciesList
                mSpeciesPicker.AddOptionItem(species.Id, species.Name)
            Next

            mOKButton = New Button
            Controls.Add(mOKButton)
            mOKButton.Text = "OK"
            AddHandler mOKButton.Click, AddressOf btnOK_Click

            mCancelButton = New Button
            Controls.Add(mCancelButton)
            mCancelButton.Text = "Cancel"
            mCancelButton.CausesValidation = False
            AddHandler mCancelButton.Click, AddressOf btnCancel_Click

        End Sub

        Protected Overrides Sub OnPreRender(ByVal e As System.EventArgs)

            If Not SelectedSpeciesId.Equals(Guid.Empty) Then
                Dim selectedSpecies As QuestionSpecies = SpeciesList.GetById(SelectedSpeciesId)
                mSpeciesPicker.ExcludeItemId = SelectedSpeciesId

                mSpeciesPicker.Visible = Not selectedSpecies.FieldValues.IsReadOnly
                mCancelButton.Visible = Not selectedSpecies.FieldValues.IsReadOnly
                If selectedSpecies.FieldValues.IsReadOnly Then
                    mOKButton.Text = "Close"
                Else
                    mOKButton.Text = "OK"
                End If

            End If

            MyBase.OnPreRender(e)

        End Sub

        ''' <summary>
        ''' Writes out the HTML that makes up the control. This is called by the ASP.NET infrastructure late in the control lifecycle
        ''' when all properties have already been set.
        ''' </summary>
        Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)

            If mProfiledSpeciesList.Count = 0 Then
                writer.RenderBeginTag(HtmlTextWriterTag.P)
                writer.Write("This question repeats per-species, but the current profile does not have any affected species.")
                writer.RenderEndTag()
                Exit Sub
            End If

            Dim fieldList As FieldMetadataListWrapper = mFieldList
            writer.AddStyleAttribute(HtmlTextWriterStyle.Width, "100%")
            writer.RenderBeginTag(HtmlTextWriterTag.Table)
            writer.RenderBeginTag(HtmlTextWriterTag.Thead)
            writer.RenderBeginTag(HtmlTextWriterTag.Tr)
            writer.AddStyleAttribute(HtmlTextWriterStyle.Width, "180px")
            writer.AddStyleAttribute(HtmlTextWriterStyle.FontWeight, "bold")
            writer.RenderBeginTag(HtmlTextWriterTag.Td)
            writer.Write("Species / species group")
            writer.RenderEndTag()
            For Each field As FieldMetadataWrapper In fieldList
                If field.IncludeInSummary Then
                    writer.AddStyleAttribute(HtmlTextWriterStyle.FontWeight, "bold")
                    writer.RenderBeginTag(HtmlTextWriterTag.Td)
                    writer.Write(field.Name)
                    writer.RenderEndTag()
                End If
            Next
            writer.AddStyleAttribute(HtmlTextWriterStyle.Width, "5%")
            writer.RenderBeginTag(HtmlTextWriterTag.Td)
            writer.Write("&nbsp;")
            writer.RenderEndTag()
            writer.RenderEndTag()
            writer.RenderEndTag()

            writer.RenderBeginTag(HtmlTextWriterTag.Tbody)

            For currentSpecies As Integer = 0 To mProfiledSpeciesList.Count - 1
                RenderSpeciesRow(writer, currentSpecies)
            Next

            writer.RenderEndTag()
            writer.RenderEndTag()

            If Not SelectedSpeciesId.Equals(Guid.Empty) Then
                Dim selectedSpecies As QuestionSpecies = SpeciesList.GetById(SelectedSpeciesId)
                writer.AddStyleAttribute(HtmlTextWriterStyle.Width, "100%")
                writer.RenderBeginTag(HtmlTextWriterTag.Table)
                writer.RenderBeginTag(HtmlTextWriterTag.Tbody)
                writer.RenderBeginTag(HtmlTextWriterTag.Tr)
                writer.RenderBeginTag(HtmlTextWriterTag.Td)

                writer.AddStyleAttribute(HtmlTextWriterStyle.Width, "96%")
                writer.AddAttribute(HtmlTextWriterAttribute.Class, "collapsePanelHeader")
                writer.AddAttribute(HtmlTextWriterAttribute.Id, mProfileFieldListPanel.ClientID)
                writer.RenderBeginTag(HtmlTextWriterTag.Div)
                If selectedSpecies.FieldValues.IsReadOnly Then
                    writer.Write("View")
                Else
                    writer.Write("Edit")
                End If
                writer.Write(" answer for " & selectedSpecies.Name.ToLower())
                writer.RenderEndTag() 'PanelHeader Div
                writer.AddStyleAttribute(HtmlTextWriterStyle.Width, "95%")
                writer.AddAttribute(HtmlTextWriterAttribute.Class, "collapsePanel")
                writer.RenderBeginTag(HtmlTextWriterTag.Div)
                mProfileFieldListPanel.RenderControl(writer)

                writer.AddStyleAttribute(HtmlTextWriterStyle.Width, "95%")
                writer.RenderBeginTag(HtmlTextWriterTag.Table)
                writer.RenderBeginTag(HtmlTextWriterTag.Tbody)
                writer.RenderBeginTag(HtmlTextWriterTag.Tr)

                writer.RenderBeginTag(HtmlTextWriterTag.Td)
                mSpeciesPicker.RenderControl(writer)
                writer.RenderEndTag() 'Td

                writer.RenderBeginTag(HtmlTextWriterTag.Td)
                writer.AddAttribute(HtmlTextWriterAttribute.Align, "Right")
                writer.RenderBeginTag(HtmlTextWriterTag.Div)
                mOKButton.RenderControl(writer)
                writer.Write("&nbsp;")
                mCancelButton.RenderControl(writer)
                writer.RenderEndTag() 'Div

                writer.RenderEndTag() 'Td
                writer.RenderEndTag() 'Tr
                writer.RenderEndTag() 'TBody
                writer.RenderEndTag() 'Table

                writer.RenderEndTag() 'Panel Div

                writer.RenderEndTag() 'Td
                writer.RenderEndTag() 'Tr
                writer.RenderEndTag() 'TBody
                writer.RenderEndTag() 'Table
            End If

        End Sub

        Private Sub RenderSpeciesRow(ByVal writer As HtmlTextWriter, ByVal currentSpecies As Integer)

            Dim species As ProfiledSpecies = mProfiledSpeciesList(currentSpecies)

            If mSpeciesList.GetById(species.Id).IsRelevant Then
                writer.RenderBeginTag(HtmlTextWriterTag.Tr)

                writer.RenderBeginTag(HtmlTextWriterTag.Td)
                writer.Write(species.Name)
                writer.RenderEndTag()

                If SpeciesList IsNot Nothing Then
                    Dim quesSpecies As QuestionSpecies = SpeciesList(currentSpecies)
                    For Each field As FieldValueBase In quesSpecies.FieldValues
                        If field.IncludeInSummary Then
                            writer.RenderBeginTag(HtmlTextWriterTag.Td)
                            RenderSpeciesField(writer, field)
                            writer.RenderEndTag()
                        End If
                    Next
                End If

                writer.AddStyleAttribute("Align", "Right")
                writer.RenderBeginTag(HtmlTextWriterTag.Td)
                mEditLinkList(currentSpecies).RenderControl(writer)
                writer.RenderEndTag()

                writer.RenderEndTag()
            Else

            End If
        End Sub

        Private Sub RenderSpeciesField(ByVal writer As HtmlTextWriter, ByVal field As FieldValueBase)

            writer.Write(field.ToString(50))

        End Sub

        Protected Sub lnkEdit_Click(ByVal sender As Object, ByVal e As EventArgs)

            SaveSubPanel()
            mSpeciesPicker.ClearSelectedOptions()

            SelectedSpeciesId = New Guid(DirectCast(sender, LinkButton).CommandArgument)

            mProfileFieldListPanel.UpdateUIValue(SpeciesList.GetById(SelectedSpeciesId).FieldValues)

        End Sub

        Protected Sub btnOK_Click(ByVal sender As Object, ByVal e As EventArgs)

            SaveSubPanel()
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "perSpeciesPanelRefresh", "try{if(refreshPanel==true){HideAndClearIrrelevantQuestions();}refreshPanel=false;}catch(err){}", True)

        End Sub

        Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As EventArgs)
            CloseSubPanel()
        End Sub

        Protected Friend Sub CloseSubPanel()
            SelectedSpeciesId = Guid.Empty
        End Sub

        Protected Friend Sub SaveSubPanel()

            'save the values back into the relevant species
            If SelectedSpeciesId <> Guid.Empty Then
                mProfileFieldListPanel.Save(SpeciesList.GetById(SelectedSpeciesId).FieldValues)
                'and save the values back also into any other species that the user indicated through the picker
                For Each additionalSpeciesId As Guid In mSpeciesPicker.SelectedOptions
                    mProfileFieldListPanel.Save(SpeciesList.GetById(additionalSpeciesId).FieldValues)
                Next
                'wipe the selected ID
                CloseSubPanel()
            End If

        End Sub

    End Class
End Namespace


