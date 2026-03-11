Imports System
Imports System.ComponentModel
Imports System.Web.UI
Imports System.Web.UI.WebControls

Namespace Profiles.WebControls

    <ParseChildren(True, "Tabs"),
    PersistChildren(False)>
    Public Class TabStrip
        Inherits WebControl
        Implements IPostBackEventHandler

        Private mTabItems As TabItemCollection

        Public Event TabClick As EventHandler(Of TabClickEventArgs)

        <PersistenceMode(PersistenceMode.InnerDefaultProperty)>
        Public ReadOnly Property Tabs() As TabItemCollection
            Get
                If mTabItems Is Nothing Then
                    mTabItems = New TabItemCollection
                End If

                Return mTabItems
            End Get

        End Property

        Protected Overridable Sub OnTabClick(ByVal e As TabClickEventArgs)
            RaiseEvent TabClick(Me, e)
        End Sub

        Public Sub RaisePostBackEvent(ByVal eventArgument As String) Implements System.Web.UI.IPostBackEventHandler.RaisePostBackEvent

            OnTabClick(New TabClickEventArgs(Tabs(eventArgument)))

        End Sub

        Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
            Dim LeftTabNavigation As String = $"<svg class='govuk-pagination__icon govuk-pagination__icon--prev' xmlns='http://www.w3.org/2000/svg' height='13' width='15' aria-hidden='true' focusable='false' viewBox='0 0 15 13'>
            <path d='m6.5938-0.0078125-6.7266 6.7266 6.7441 6.4062 1.377-1.449-4.1856-3.9768h12.896v-2h-12.984l4.2931-4.293-1.414-1.414z'></path>
        </svg>view more tabs"
            Dim RightTabNavigation As String = $"view more tabs<svg class='govuk-pagination__icon govuk-pagination__icon--next' xmlns='http://www.w3.org/2000/svg' height='13' width='15' aria-hidden='true' focusable='false' viewBox='0 0 15 13'>
            <path d='m8.107-0.0078125-1.4136 1.414 4.2926 4.293h-12.986v2h12.896l-4.1855 3.9766 1.377 1.4492 6.7441-6.4062-6.7246-6.7266z'></path>
        </svg>"

            writer.AddAttribute(HtmlTextWriterAttribute.Class, "HideTabButtons")
            writer.AddAttribute(HtmlTextWriterAttribute.Id, "TabButtonsDiv")
            writer.RenderBeginTag(HtmlTextWriterTag.Div)

            writer.AddAttribute(HtmlTextWriterAttribute.Class, "govuk-body apha-font-size-19")
            writer.RenderBeginTag(HtmlTextWriterTag.Div)

            writer.AddAttribute(HtmlTextWriterAttribute.Class, "govuk-link")
            writer.AddAttribute(HtmlTextWriterAttribute.Href, "javascript: goLeft()")
            writer.AddAttribute(HtmlTextWriterAttribute.Title, "scroll tabs left")
            writer.RenderBeginTag(HtmlTextWriterTag.A)
            writer.Write(LeftTabNavigation)
            writer.RenderEndTag() 'A - left

            writer.Write("&nbsp;&nbsp;&nbsp;&nbsp;")

            writer.AddAttribute(HtmlTextWriterAttribute.Class, "govuk-link")
            writer.AddAttribute(HtmlTextWriterAttribute.Href, "javascript: goRight()")
            writer.AddAttribute(HtmlTextWriterAttribute.Title, "scroll tabs right")
            writer.RenderBeginTag(HtmlTextWriterTag.A)
            writer.Write(RightTabNavigation)
            writer.RenderEndTag() 'A - right

            writer.RenderEndTag() 'govuk-body </div>
            writer.RenderEndTag() 'TabButtons </div>

            writer.AddAttribute(HtmlTextWriterAttribute.Class, "TabDefault TabXp")
            writer.RenderBeginTag(HtmlTextWriterTag.Div)

            writer.AddAttribute(HtmlTextWriterAttribute.Class, "TabHeader")
            writer.AddAttribute(HtmlTextWriterAttribute.Id, "TabHeaderDiv")
            writer.RenderBeginTag(HtmlTextWriterTag.Div)

            For Each currentTab As TabItem In Tabs

                If Not currentTab.Visible Then
                    Continue For
                End If

                If currentTab.IsActive Then
                    writer.AddAttribute(HtmlTextWriterAttribute.Class, "ActiveTab")
                End If
                writer.RenderBeginTag(HtmlTextWriterTag.Span)

                writer.AddAttribute(HtmlTextWriterAttribute.Class, "TabOuter")
                If Not currentTab.IsActive Then
                    writer.AddAttribute(HtmlTextWriterAttribute.Onclick, Page.ClientScript.GetPostBackEventReference(Me, currentTab.Text))
                End If

                writer.RenderBeginTag(HtmlTextWriterTag.Span)

                writer.AddAttribute(HtmlTextWriterAttribute.Class, "TabInner")
                writer.RenderBeginTag(HtmlTextWriterTag.Span)

                writer.AddAttribute(HtmlTextWriterAttribute.Class, "Tab")
				writer.AddAttribute(HtmlTextWriterAttribute.Tabindex, "0")

                If Not currentTab.IsActive Then
                    writer.AddAttribute("OnKeyPress", String.Format("tabKeyPressed('{0}')", currentTab.Text))
                    writer.AddAttribute("aria-current", "false")
                Else
                    writer.AddAttribute("aria-current", "tab")

                End If

                writer.AddAttribute("role", "tab")

                writer.RenderBeginTag(HtmlTextWriterTag.Span)
                writer.Write(currentTab.Text)

                writer.RenderEndTag() 'Tab </span>
                writer.RenderEndTag() 'TabInner </span>
                writer.RenderEndTag() 'TabOuter </span>

                'If currentTab.IsActive Then
                writer.RenderEndTag() ' </span>
                'End If

            Next

            writer.RenderEndTag() 'TabHeader </div>

            writer.RenderEndTag() 'TabDefault TabXp </div>

            Dim filePath As String = "Javascript/tab-manager.js"
            writer.AddAttribute(HtmlTextWriterAttribute.Id, "tab_script")
            writer.AddAttribute(HtmlTextWriterAttribute.Type, "text/javascript")
            writer.AddAttribute(HtmlTextWriterAttribute.Src, filePath)
            writer.RenderBeginTag(HtmlTextWriterTag.Script)
            writer.RenderEndTag()

            Dim strScript As String = "TabButtonsShowHide()"
            writer.AddAttribute(HtmlTextWriterAttribute.Id, "tab_startup")
            writer.AddAttribute(HtmlTextWriterAttribute.Type, "text/javascript")
            writer.RenderBeginTag(HtmlTextWriterTag.Script)
            writer.Write(strScript)
            writer.RenderEndTag()

        End Sub

    End Class

    Public Class TabItem

        Private mText As String = String.Empty
        Private mIsActive As Boolean
        Private mVisible As Boolean = True

        <NotifyParentProperty(True)>
        Public Property Text() As String
            Get
                Return mText
            End Get
            Set(ByVal value As String)
                mText = value
            End Set
        End Property

        <NotifyParentProperty(True)>
        Public Property IsActive() As Boolean
            Get
                Return mIsActive
            End Get
            Set(ByVal value As Boolean)
                mIsActive = value
            End Set
        End Property

        <NotifyParentProperty(True)>
        Public Property Visible() As Boolean
            Get
                Return mVisible
            End Get
            Set(ByVal value As Boolean)
                mVisible = value
            End Set
        End Property

    End Class

    Public Class TabItemCollection
        Inherits CollectionBase

        Default Public ReadOnly Property Item(ByVal index As Integer) As TabItem
            Get
                Return CType(Me.List(index), TabItem)
            End Get
        End Property

        Default Public ReadOnly Property Item(ByVal text As String) As TabItem
            Get
                For Each currentTab As TabItem In Me.List
                    If currentTab.Text = text Then
                        Return currentTab
                    End If
                Next
                Return Nothing
            End Get
        End Property

        Public Sub Add(ByVal tab As TabItem)
            Me.List.Add(tab)
        End Sub

        Public Sub Insert(ByVal index As Integer, ByVal tab As TabItem)
            Me.List.Insert(index, tab)
        End Sub

        Public Sub Remove(ByVal tab As TabItem)
            Me.List.Remove(tab)
        End Sub

        Public Function Contains(ByVal tab As TabItem) As Boolean
            Return Me.List.Contains(tab)
        End Function

        Public Sub CopyTo(ByVal array As TabItem(), ByVal index As Integer)
            DirectCast(Me, ICollection).CopyTo(array, index)
        End Sub

        Public Function IndexOf(ByVal value As TabItem) As Integer
            Return DirectCast(Me, IList).IndexOf(value)
        End Function

    End Class

    Public Class TabClickEventArgs
        Inherits EventArgs

        Private mTab As TabItem
        Private mText As String

        Public ReadOnly Property Tab() As TabItem
            Get
                Return mTab
            End Get
        End Property

        Public Sub New(ByVal tab As TabItem)
            mTab = tab
        End Sub
    End Class

End Namespace