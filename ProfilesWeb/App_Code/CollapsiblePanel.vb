Imports System
Imports System.ComponentModel
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Text


Namespace ProfilesWeb.Controls

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

        < _
        Category("Appearance"), _
        Description("Whether the panel is collapsed"), _
        DefaultValue(True) _
        > _
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

        < _
        Category("Appearance"), _
        Description("Whether the panel has a help link"), _
        DefaultValue(True) _
        > _
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

        < _
        Category("Appearance"), _
        Description("Whether the panel has an icon to indicate validity"), _
        DefaultValue(False) _
        > _
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

        < _
        Category("Behavior"), _
        Description("If the panel has a validity icon, whether to indicate valid or invalid"), _
        DefaultValue(True) _
        > _
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

        < _
        Category("Appearance"), _
        Description("Whether the panel has an add question reference link"), _
        DefaultValue(True) _
        > _
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

        < _
        Category("Appearance"), _
        Description("The title that appears in the panel header"), _
        DefaultValue("") _
        > _
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

        < _
            Category("Behavior"), _
            Description("The name of the anchor for the panel"), _
            DefaultValue("") _
        > _
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
            sbJscript.Append("function helpPopup(id) {var w = 175; var h = 125; var wleft = (screen.width - w) / 2;")
            sbJscript.Append("var wtop = (screen.height - h) / 2;")
            sbJscript.Append("var winHelp = window.open ('ProfileQuestionHelp.aspx?ProfileQuestionId=' + id,'helpPopup',")
            sbJscript.Append("'status=0,toolbar=0,location=0,menubar=0,directories=0,resizable=1,scrollbars=1,width=400,height=250,left=' + wleft + ', top=' + wtop);")
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
            Me.RenderButton(writer)
            If Me.AnchorName <> String.Empty Then
                writer.Write("&nbsp;" & "<a name=""" & AnchorName & """>" & Me.Title & "</a>")
            Else
                writer.Write("&nbsp;" & Me.Title)
            End If

            writer.RenderEndTag() '/td

            If Me.HasNoteLink Then
                writer.AddStyleAttribute(HtmlTextWriterStyle.Width, "16px")
                writer.AddStyleAttribute(HtmlTextWriterStyle.TextAlign, "right")
                writer.RenderBeginTag(HtmlTextWriterTag.Td)

                mLnkAddNote.RenderControl(writer)

                writer.RenderEndTag() '/td
            End If

            If Me.HasValidIcon Then
                writer.AddStyleAttribute(HtmlTextWriterStyle.Width, "16px")
                writer.AddStyleAttribute(HtmlTextWriterStyle.TextAlign, "right")
                writer.RenderBeginTag(HtmlTextWriterTag.Td)

                writer.AddAttribute(HtmlTextWriterAttribute.Width, "16px")
                writer.AddAttribute(HtmlTextWriterAttribute.Height, "16px")
                If Me.IsValid Then
                    writer.AddAttribute(HtmlTextWriterAttribute.Src, Page.ResolveUrl("~/Images/ValidGreen.gif"))
                    writer.AddAttribute(HtmlTextWriterAttribute.Alt, "This question has no validation errors")
                Else
                    writer.AddAttribute(HtmlTextWriterAttribute.Src, Page.ResolveUrl("~/Images/InvalidGreen.gif"))
                    writer.AddAttribute(HtmlTextWriterAttribute.Alt, "This question has validation errors")
                End If
                writer.RenderBeginTag(HtmlTextWriterTag.Img)
                writer.RenderEndTag() '/img
                writer.RenderEndTag() '/td
            End If

            If Me.HasHelpLink Then
                writer.AddStyleAttribute(HtmlTextWriterStyle.Width, "16px")
                writer.AddStyleAttribute(HtmlTextWriterStyle.TextAlign, "right")
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
                writer.AddStyleAttribute("height", "0px")
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
            mLnkAddNote.ImageUrl = "Images/NoteEdit.gif"
            mLnkAddNote.Width = 15

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

            writer.AddAttribute(HtmlTextWriterAttribute.Src, "Images/Help.gif")
            writer.AddAttribute(HtmlTextWriterAttribute.Onclick, "helpPopup('" & mQuestion.Id.ToString() & "')")
            writer.RenderBeginTag(HtmlTextWriterTag.Img)
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
