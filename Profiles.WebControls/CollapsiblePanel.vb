Imports System
Imports System.ComponentModel
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Text


Namespace Profiles.WebControls

    Public Class NoteEventArgs
        Inherits EventArgs

        Private mExcludedId As Guid

        Public Sub New(ByVal excludedId As Guid)
            MyBase.New()
            mExcludedId = excludedId
        End Sub

        Public ReadOnly Property ExcludedId() As Guid
            Get
                Return mExcludedId
            End Get
        End Property
    End Class

    Public Class CollapsiblePanel
        Inherits WebControl
        Implements IPostBackEventHandler

        Private mQuestion As ProfilesLibrary.QuestionBase
        Private mPanel As Panel
        Private mLnkAddNote As ImageButton

#Region "Control public properties"

        <
        Category("Appearance"),
        Description("Whether the panel is collapsed"),
        DefaultValue(True)
        >
        Public Property IsCollapsed() As Boolean
            Get
                If (ViewState("Collapsed") IsNot Nothing) Then
                    Return CType(ViewState("Collapsed"), Boolean)
                End If
                Return True
            End Get
            Set(ByVal value As Boolean)
                ViewState("Collapsed") = value
            End Set
        End Property

        <
        Category("Appearance"),
        Description("Whether the panel has a help link"),
        DefaultValue(True)
        >
        Public Property HasHelpLink() As Boolean
            Get
                If (ViewState("HelpLink") IsNot Nothing) Then
                    Return CType(ViewState("HelpLink"), Boolean)
                End If
                Return True
            End Get
            Set(ByVal value As Boolean)
                ViewState("HelpLink") = value
            End Set
        End Property

        Public Property Question() As ProfilesLibrary.QuestionBase
            Get
                Return mQuestion
            End Get
            Set(ByVal value As ProfilesLibrary.QuestionBase)
                mQuestion = value
            End Set
        End Property

        <
        Category("Appearance"),
        Description("Whether the panel has an icon to indicate validity"),
        DefaultValue(False)
        >
        Public Property HasValidIcon() As Boolean
            Get
                If (ViewState("HasValidIcon") IsNot Nothing) Then
                    Return CType(ViewState("HasValidIcon"), Boolean)
                End If
                Return True
            End Get
            Set(ByVal value As Boolean)
                ViewState("HasValidIcon") = value
            End Set
        End Property

        <
        Category("Behavior"),
        Description("If the panel has a validity icon, whether to indicate valid or invalid"),
        DefaultValue(True)
        >
        Public Property IsValid() As Boolean
            Get
                If (ViewState("IsValid") IsNot Nothing) Then
                    Return CType(ViewState("IsValid"), Boolean)
                End If
                Return True
            End Get
            Set(ByVal value As Boolean)
                ViewState("IsValid") = value
            End Set
        End Property

        <
        Category("Appearance"),
        Description("Whether the panel has an add question reference link"),
        DefaultValue(True)
        >
        Public Property HasNoteLink() As Boolean
            Get
                If (ViewState("HasNoteLink") IsNot Nothing) Then
                    Return CType(ViewState("HasNoteLink"), Boolean)
                End If
                Return True
            End Get
            Set(ByVal value As Boolean)
                ViewState("HasNoteLink") = value
            End Set
        End Property

        <
        Category("Appearance"),
        Description("The title that appears in the panel header"),
        DefaultValue("")
        >
        Public Property Title() As String
            Get
                If (ViewState("Title") IsNot Nothing) Then
                    Return CType(ViewState("Title"), String)
                End If
                Return String.Empty
            End Get
            Set(ByVal value As String)
                ViewState("Title") = value
            End Set
        End Property

        <
            Category("Behavior"),
            Description("The name of the anchor for the panel"),
            DefaultValue("")
        >
        Public Property AnchorName() As String
            Get
                If (ViewState("AnchorName") IsNot Nothing) Then
                    Return CType(ViewState("AnchorName"), String).Trim()
                End If
                Return String.Empty
            End Get
            Set(ByVal value As String)
                ViewState("AnchorName") = value
            End Set
        End Property

        Public Overrides ReadOnly Property Controls() As System.Web.UI.ControlCollection
            Get
                EnsureChildControls()
                Return MyBase.Controls
            End Get
        End Property

        Public ReadOnly Property PanelControls() As System.Web.UI.ControlCollection
            Get
                Return mPanel.Controls
            End Get
        End Property

#End Region

#Region "Control public events "

        Public Event Collapsed As EventHandler
        Public Event CollapsedStateChanged As EventHandler
        Public Event Collapsing As CancelEventHandler
        Public Event Expanded As EventHandler
        Public Event Expanding As CancelEventHandler
        Public Event ShowNote As EventHandler(Of NoteEventArgs)

#End Region

        Public Sub Collapse()

            Dim args As New CancelEventArgs(False)
            OnCollapsing(args)

            If Not args.Cancel Then
                If Not Me.IsCollapsed Then
                    Me.IsCollapsed = True
                    OnCollapsedStateChanged(EventArgs.Empty)
                End If
                OnCollapsed(EventArgs.Empty)
            End If

        End Sub

        Public Sub Expand()

            Dim args As New CancelEventArgs(False)
            OnExpanding(args)

            If Not args.Cancel Then
                If Me.IsCollapsed Then
                    Me.IsCollapsed = False
                    OnCollapsedStateChanged(EventArgs.Empty)
                End If
                OnExpanded(EventArgs.Empty)
            End If

        End Sub

        Public Sub OnShowNote(ByVal excludedId As Guid)
            RaiseEvent ShowNote(Me, New NoteEventArgs(excludedId))
        End Sub

        Protected Overridable Sub OnCollapsed(ByVal e As EventArgs)
            RaiseEvent Collapsed(Me, e)
        End Sub

        Protected Overridable Sub OnCollapsedStateChanged(ByVal e As EventArgs)
            RaiseEvent CollapsedStateChanged(Me, e)
        End Sub

        Protected Overridable Sub OnCollapsing(ByVal e As CancelEventArgs)
            RaiseEvent Collapsing(Me, e)
        End Sub

        Protected Overridable Sub OnExpanded(ByVal e As EventArgs)
            RaiseEvent Expanded(Me, e)
        End Sub

        Protected Overridable Sub OnExpanding(ByVal e As CancelEventArgs)
            RaiseEvent Expanding(Me, e)
        End Sub

        Protected Overrides Sub OnPreRender(ByVal e As System.EventArgs)
            MyBase.OnPreRender(e)
            Page.RegisterRequiresControlState(Me)

            Dim sbJscript As New StringBuilder()
            sbJscript.Append("<script language=""Javascript"">")
            sbJscript.Append("function helpPopup(id) {var w = 600; var h = 500; var wleft = (screen.width - w) / 2;")
            sbJscript.Append("var wtop = ((screen.height - h) / 2) - 100;")
            sbJscript.Append("var winHelp = window.open ('ProfileQuestionHelp.aspx?ProfileQuestionId=' + id,'helpPopup',")
            sbJscript.Append("'status=0,toolbar=0,location=0,menubar=0,directories=0,resizable=1,scrollbars=1,width=600,height=500,left=' + wleft + ', top=' + wtop);")
            sbJscript.Append("winHelp.focus(); }</script>")

            If Not Page.ClientScript.IsClientScriptBlockRegistered("CollapsiblePanelHelpLink") Then
                Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "CollapsiblePanelHelpLink", sbJscript.ToString)
            End If

        End Sub

        Public Sub AddInnerControl(ByVal innerControl As Control)
            EnsureChildControls()
            mPanel.Controls.Add(innerControl)
        End Sub

        Public Sub RaisePostBackEvent(ByVal eventArgument As String) Implements System.Web.UI.IPostBackEventHandler.RaisePostBackEvent

            If (eventArgument = "collapse") Then
                Me.Collapse()
            ElseIf (eventArgument = "expand") Then
                Me.Expand()
            End If

        End Sub

        Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
            Dim chevClass = If(Me.IsCollapsed, "govuk-accordion-nav__chevron--down", "")
            Dim buttonText = If(Me.IsCollapsed, "Show", "Hide")

            Dim buttonTemplate As String = $"<br /><div class='collapsePanelAdjuster'>
												<span class='govuk-accordion__section-toggle-focus'>
													<span class='govuk-accordion-nav__chevron { chevClass }'></span>
													<span>&nbsp;&nbsp;</span>
													<span class='govuk-accordion__section-toggle-text'>{ buttonText }</span>
												</span>
											</div>"

            Dim newTitle As String = $"<div class='collapsePanelTitleWrapper' tabindex='0' role='button' onkeypress='collapsiblePanelKeyPressed(this)' aria-expanded='{ Not IsCollapsed }'>
											<span> 
												{ Me.Title } { buttonTemplate }
											</span>
										</div>"

            writer.AddAttribute(HtmlTextWriterAttribute.Class, "collapsePanelHeader")
            writer.AddAttribute(HtmlTextWriterAttribute.Id, Me.ClientID)
            writer.RenderBeginTag(HtmlTextWriterTag.Div)

            writer.AddAttribute(HtmlTextWriterAttribute.Border, "0")
            writer.AddAttribute(HtmlTextWriterAttribute.Width, "100%")
            writer.AddAttribute(HtmlTextWriterAttribute.Cellpadding, "0")
            writer.AddAttribute(HtmlTextWriterAttribute.Cellspacing, "0")
            writer.RenderBeginTag(HtmlTextWriterTag.Table)
            writer.RenderBeginTag(HtmlTextWriterTag.Tr)

            writer.AddAttribute(HtmlTextWriterAttribute.Onclick, Page.ClientScript.GetPostBackEventReference(Me, IIf(Me.IsCollapsed, "expand", "collapse").ToString()))
            writer.RenderBeginTag(HtmlTextWriterTag.Td)
            If Me.AnchorName <> String.Empty Then
                writer.Write("<a name=""" & AnchorName & """>" & newTitle & "</a>")
            Else
                writer.Write(newTitle)
            End If

            writer.RenderEndTag() '/td

            If Me.HasNoteLink Then
                writer.AddStyleAttribute(HtmlTextWriterStyle.Width, "1%")
                writer.AddStyleAttribute(HtmlTextWriterStyle.PaddingLeft, "5px")
                writer.AddStyleAttribute(HtmlTextWriterStyle.PaddingRight, "5px")
                writer.RenderBeginTag(HtmlTextWriterTag.Td)

                mLnkAddNote.RenderControl(writer)

                writer.RenderEndTag() '/td
            End If

            If Me.HasValidIcon Then
                writer.AddStyleAttribute(HtmlTextWriterStyle.Width, "1%")
                writer.AddStyleAttribute(HtmlTextWriterStyle.PaddingLeft, "5px")
                writer.AddStyleAttribute(HtmlTextWriterStyle.PaddingRight, "5px")
                writer.RenderBeginTag(HtmlTextWriterTag.Td)

                If Me.IsValid Then
                    writer.AddAttribute(HtmlTextWriterAttribute.Src, Page.ResolveUrl("~/Images/green-check.png"))
                    writer.AddAttribute(HtmlTextWriterAttribute.Alt, "This question has no validation errors")
                    writer.AddAttribute("title", "Validation Success")
                Else
                    writer.AddAttribute(HtmlTextWriterAttribute.Src, Page.ResolveUrl("~/Images/red-cross.png"))
                    writer.AddAttribute(HtmlTextWriterAttribute.Alt, "This question has validation errors")
                    writer.AddAttribute("title", "Validation Failed")
                End If
                writer.RenderBeginTag(HtmlTextWriterTag.Img)
                writer.RenderEndTag() '/img
                writer.RenderEndTag() '/td
            End If

            If Me.HasHelpLink Then
                writer.AddStyleAttribute(HtmlTextWriterStyle.Width, "1%")
                writer.AddStyleAttribute(HtmlTextWriterStyle.PaddingLeft, "5px")
                writer.AddStyleAttribute(HtmlTextWriterStyle.PaddingRight, "5px")
                writer.RenderBeginTag(HtmlTextWriterTag.Td)
                Me.RenderHelpLink(writer)
                writer.RenderEndTag() '/td
            End If
            writer.RenderEndTag() '/tr
            writer.RenderEndTag() '/table
            writer.RenderEndTag() '/div

            writer.RenderBeginTag(HtmlTextWriterTag.Div)
            writer.AddAttribute("class", "collapsePanel")
            If Me.IsCollapsed Then
                writer.AddStyleAttribute(HtmlTextWriterStyle.Visibility, "hidden")
                writer.AddStyleAttribute(HtmlTextWriterStyle.Height, "0px")
            End If
            'If (Not Me.IsCollapsed) Then
            'MyBase.Render(writer)
            mPanel.RenderControl(writer)
            'End If

            writer.RenderEndTag() '/div

        End Sub

        Protected Overrides Sub CreateChildControls()

            Controls.Clear()

            mPanel = New Panel
            Controls.Add(mPanel)

            mLnkAddNote = New ImageButton
            Controls.Add(mLnkAddNote)

            mLnkAddNote.ID = "lnkAddNote" + "_" + mQuestion.Id.ToString.Replace("-", "_")
            mLnkAddNote.ImageUrl = "Images/references.png"
            mLnkAddNote.AlternateText = "Edit References"
            mLnkAddNote.ToolTip = mLnkAddNote.AlternateText
            mLnkAddNote.CssClass = "govuk-element-focus"

            AddHandler mLnkAddNote.Click, AddressOf lnkAddNote_Click

        End Sub

        Private Sub lnkAddNote_Click(ByVal sender As Object, ByVal e As ImageClickEventArgs)

            OnShowNote(mQuestion.Id)

        End Sub


        Private Sub RenderButton(ByVal writer As HtmlTextWriter)

            If (Me.IsCollapsed) Then
                writer.AddAttribute(HtmlTextWriterAttribute.Src, "Images/ExpandPanel.gif")
            Else
                writer.AddAttribute(HtmlTextWriterAttribute.Src, "Images/CollapsePanel.gif")
            End If
            writer.RenderBeginTag(HtmlTextWriterTag.Img)
            writer.RenderEndTag()

        End Sub

        Private Sub RenderHelpLink(ByVal writer As HtmlTextWriter)

            writer.AddAttribute(HtmlTextWriterAttribute.Src, "Images/help-button.png")
            writer.AddAttribute(HtmlTextWriterAttribute.Onclick, "helpPopup('" & mQuestion.Id.ToString() & "')")
            writer.AddAttribute(HtmlTextWriterAttribute.Alt, "Help Popup")
            writer.AddAttribute("aria-label", "Help Popup")
            writer.AddAttribute(HtmlTextWriterAttribute.Type, "Image")
            writer.AddAttribute(HtmlTextWriterAttribute.Class, "govuk-element-focus")
            writer.AddAttribute("title", "Help Popup")
            writer.RenderBeginTag(HtmlTextWriterTag.Input)
            writer.RenderEndTag()

        End Sub

        Public Sub AddNotePopupTrigger(ByVal popupUpdatePanel As UpdatePanel)

            EnsureChildControls()
            Dim imgAddNoteTrigger As AsyncPostBackTrigger = New AsyncPostBackTrigger()
            imgAddNoteTrigger.ControlID = mLnkAddNote.ID
            imgAddNoteTrigger.EventName = "Click"
            popupUpdatePanel.Triggers.Add(imgAddNoteTrigger)

        End Sub
    End Class

End Namespace
