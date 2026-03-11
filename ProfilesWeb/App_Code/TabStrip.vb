Imports System
Imports System.ComponentModel
Imports System.Web.UI
Imports System.Web.UI.WebControls

Namespace ProfilesWeb.Controls

    <ParseChildren(True, "Tabs"), _
    PersistChildren(False)> _
    Public Class TabStrip
        Inherits WebControl
        Implements IPostBackEventHandler

        Private mTabItems As TabItemCollection

        Public Event TabClick As EventHandler(Of TabClickEventArgs)

        <PersistenceMode(PersistenceMode.InnerDefaultProperty)> _
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

            writer.AddAttribute(HtmlTextWriterAttribute.Class, "TabDefault TabXp")
            writer.RenderBeginTag(HtmlTextWriterTag.Div)

            writer.AddAttribute(HtmlTextWriterAttribute.Class, "TabHeader")
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

        End Sub

    End Class

    Public Class TabItem

        Private mText As String = String.Empty
        Private mIsActive As Boolean
        Private mVisible As Boolean = True

        <NotifyParentProperty(True)> _
        Public Property Text() As String
            Get
                Return mText
            End Get
            Set(ByVal value As String)
                mText = value
            End Set
        End Property

        <NotifyParentProperty(True)> _
        Public Property IsActive() As Boolean
            Get
                Return mIsActive
            End Get
            Set(ByVal value As Boolean)
                mIsActive = value
            End Set
        End Property

        <NotifyParentProperty(True)> _
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
                Return Me.List(index)
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