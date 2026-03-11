Imports System
Imports System.ComponentModel
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Text
Imports System.Collections.Generic
Imports ProfilesLibrary

Namespace Profiles.WebControls.SearchControls

    Public MustInherit Class ResultListItemBase
        Inherits WebControl
        Implements IPostBackEventHandler

        Private mChildren As New List(Of ResultListItemBase)

        Public Property Expanded() As Boolean
            Get
                If ViewState("Expanded") Is Nothing Then
                    Return DefaultExpanded
                End If
                Return CBool(ViewState("Expanded"))
            End Get
            Set(ByVal value As Boolean)
                ViewState("Expanded") = value
            End Set
        End Property

        Protected Overridable ReadOnly Property DefaultExpanded() As Boolean
            Get
                Return False
            End Get
        End Property

        Private Property Level() As Integer
            Get
                If ViewState("Level") Is Nothing Then
                    Return 0
                End If
                Return CInt(ViewState("Level"))
            End Get
            Set(ByVal value As Integer)
                ViewState("Level") = value
            End Set
        End Property

        Public Sub RaisePostBackEvent(ByVal eventArgument As String) Implements System.Web.UI.IPostBackEventHandler.RaisePostBackEvent

            If (eventArgument = "collapse") Then
                Me.Expanded = False
            ElseIf (eventArgument = "expand") Then
                Me.Expanded = True
            End If

        End Sub

        Public Overrides ReadOnly Property Controls() As System.Web.UI.ControlCollection
            Get
                EnsureChildControls()
                Return MyBase.Controls
            End Get
        End Property

        Friend Sub AddChildListItem(ByVal listItem As ResultListItemBase)
            mChildren.Add(listItem)
            Controls.Add(listItem)
            listItem.Level = Me.Level + 1
        End Sub

        Protected Overrides Sub OnPreRender(ByVal e As System.EventArgs)
            MyBase.OnPreRender(e)
        End Sub

        Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)

            writer.AddAttribute(HtmlTextWriterAttribute.Id, Me.ClientID)
            writer.AddAttribute(HtmlTextWriterAttribute.Class, MainCssClass)
            writer.AddAttribute(HtmlTextWriterAttribute.Width, "100%")
            writer.RenderBeginTag(HtmlTextWriterTag.Table)

            writer.RenderBeginTag(HtmlTextWriterTag.Tr)

            writer.AddStyleAttribute(HtmlTextWriterStyle.Padding, "0px")
            writer.AddAttribute(HtmlTextWriterAttribute.Width, "60%")
            writer.RenderBeginTag(HtmlTextWriterTag.Td)

            writer.AddStyleAttribute("float", "left")
            writer.RenderBeginTag(HtmlTextWriterTag.Div)

            writer.AddAttribute(HtmlTextWriterAttribute.Width, "19px")
            writer.AddAttribute(HtmlTextWriterAttribute.Height, "16px")
            If Level > 0 Then
                writer.AddStyleAttribute(HtmlTextWriterStyle.MarginLeft, CStr(Level * 12) & "px")
            End If
            If mChildren.Count > 0 Then
                If Me.Expanded Then
                    writer.AddStyleAttribute(HtmlTextWriterStyle.Cursor, "pointer")
                    writer.AddAttribute(HtmlTextWriterAttribute.Src, Page.ResolveUrl("~/Images/Minus.gif"))
                    writer.AddAttribute(HtmlTextWriterAttribute.Alt, "Collapse")
                Else
                    writer.AddStyleAttribute(HtmlTextWriterStyle.Cursor, "pointer")
                    writer.AddAttribute(HtmlTextWriterAttribute.Src, Page.ResolveUrl("~/Images/Plus.gif"))
                    writer.AddAttribute(HtmlTextWriterAttribute.Alt, "Expand")
                End If
            Else
                writer.AddAttribute(HtmlTextWriterAttribute.Src, Page.ResolveUrl("~/Images/Spacer.gif"))
            End If

            writer.AddAttribute(HtmlTextWriterAttribute.Onclick, Page.ClientScript.GetPostBackEventReference(Me, IIf(Me.Expanded, "collapse", "expand").ToString()))
            writer.RenderBeginTag(HtmlTextWriterTag.Img)
            writer.RenderEndTag() '/img

            writer.RenderEndTag() '/div

            writer.AddStyleAttribute(HtmlTextWriterStyle.VerticalAlign, "middle")
            writer.AddAttribute(HtmlTextWriterAttribute.Class, ItemCssClass)
            writer.RenderBeginTag(HtmlTextWriterTag.Table)
            RenderItem(writer)
            writer.RenderEndTag() 'Table
            writer.RenderEndTag() 'Td

            writer.AddAttribute(HtmlTextWriterAttribute.Width, "40%")
            writer.AddStyleAttribute(HtmlTextWriterStyle.Padding, "0px")
            writer.AddStyleAttribute(HtmlTextWriterStyle.VerticalAlign, "middle")
            writer.AddAttribute(HtmlTextWriterAttribute.Class, LinksCssClass)
            writer.RenderBeginTag(HtmlTextWriterTag.Td)
            RenderLinks(writer)
            writer.RenderEndTag() 'Td

            writer.RenderEndTag() 'Tr

            writer.RenderEndTag() 'Table

            If Me.Expanded Then
                For Each childItem As ResultListItemBase In mChildren
                    childItem.RenderControl(writer)
                Next
            End If

        End Sub

        Protected Overridable ReadOnly Property MainCssClass() As String
            Get
                Return "searchlist"
            End Get
        End Property

        Protected Overridable ReadOnly Property ItemCssClass() As String
            Get
                Return "searchlistItem"
            End Get
        End Property

        Protected Overridable ReadOnly Property LinksCssClass() As String
            Get
                Return String.Empty
            End Get
        End Property

        Protected MustOverride Sub RenderItem(ByVal writer As System.Web.UI.HtmlTextWriter)
        Protected MustOverride Sub RenderLinks(ByVal writer As System.Web.UI.HtmlTextWriter)

    End Class

End Namespace
