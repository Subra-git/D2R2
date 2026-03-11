Imports System
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.ComponentModel
Imports Microsoft.VisualBasic

Namespace Profiles.WebControls

    Public Enum PageSizeOption
        PageSize10
        PageSize15
        PageSize20
        PageSize30
        PageSizeAll
    End Enum

    Public Class PageSelector
        Inherits WebControl
        Implements INamingContainer

        Dim ddlPageSize As DropDownList
        Dim lnkPagerFirst As ImageButton
        Dim lnkPagerPrev As ImageButton
        Dim lblCurrentPage As Label
        Dim lnkPagerNext As ImageButton
        Dim lnkPagerLast As ImageButton

#Region "Events"

        Public Event PageSizeChanged As EventHandler
        Public Event PageFirst As EventHandler
        Public Event PagePrevious As EventHandler
        Public Event PageNext As EventHandler
        Public Event PageLast As EventHandler

        Protected Overridable Sub OnPageSizeChanged(ByVal e As EventArgs)
            RaiseEvent PageSizeChanged(Me, e)
        End Sub

        Protected Overridable Sub OnPageFirst(ByVal e As EventArgs)
            RaiseEvent PageFirst(Me, e)
        End Sub

        Protected Overridable Sub OnPagePrevious(ByVal e As EventArgs)
            RaiseEvent PagePrevious(Me, e)
        End Sub

        Protected Overridable Sub OnPageNext(ByVal e As EventArgs)
            RaiseEvent PageNext(Me, e)
        End Sub

        Protected Overridable Sub OnPageLast(ByVal e As EventArgs)
            RaiseEvent PageLast(Me, e)
        End Sub

        Public Sub MoveFirst()
            OnPageFirst(EventArgs.Empty)
        End Sub

        Public Sub MovePrevious()
            OnPagePrevious(EventArgs.Empty)
        End Sub

        Public Sub MoveNext()
            OnPageNext(EventArgs.Empty)
        End Sub

        Public Sub MoveLast()
            OnPageLast(EventArgs.Empty)
        End Sub

#End Region

        Public Property SizeOption() As PageSizeOption
            Get
                Return CType(ddlPageSize.SelectedIndex, PageSizeOption)
            End Get
            Private Set(ByVal value As PageSizeOption)
                ddlPageSize.SelectedIndex = ddlPageSize.Items.IndexOf(ddlPageSize.Items.FindByValue(value.ToString()))
            End Set
        End Property

        Public Sub SetPager(ByVal index As Integer, ByVal count As Integer, ByVal size As PageSizeOption)

            EnsureChildControls()

            lblCurrentPage.Text = "Page " & (index + 1).ToString() & " of " & count.ToString()

            lnkPagerFirst.Visible = (index > 0)
            lnkPagerPrev.Visible = (index > 0)

            lnkPagerNext.Visible = (index < count - 1)
            lnkPagerLast.Visible = (index < count - 1)

            SizeOption = size

        End Sub

        Public Overrides ReadOnly Property Controls() As System.Web.UI.ControlCollection
            Get
                EnsureChildControls()
                Return MyBase.Controls
            End Get
        End Property

        Protected Overrides Sub CreateChildControls()

            ddlPageSize = New DropDownList
            Controls.Add(ddlPageSize)
            ddlPageSize.ID = "ddlPageSize"
            ddlPageSize.Items.Add(New ListItem("10", PageSizeOption.PageSize10.ToString()))
            ddlPageSize.Items.Add(New ListItem("15", PageSizeOption.PageSize15.ToString()))
            ddlPageSize.Items.Add(New ListItem("20", PageSizeOption.PageSize20.ToString()))
            ddlPageSize.Items.Add(New ListItem("30", PageSizeOption.PageSize30.ToString()))
            ddlPageSize.Items.Add(New ListItem("All", PageSizeOption.PageSizeAll.ToString()))
            ddlPageSize.AutoPostBack = True
            AddHandler ddlPageSize.SelectedIndexChanged, AddressOf ddlPageSize_SelectedIndexChanged

            lnkPagerFirst = New ImageButton
            AddLink(lnkPagerFirst, "First")
            lnkPagerFirst.ID = "lnkPagerFirst"
            AddHandler lnkPagerFirst.Click, AddressOf lnkPagerFirst_Click

            lnkPagerPrev = New ImageButton
            AddLink(lnkPagerPrev, "Previous")
            lnkPagerPrev.ID = "lnkPagerPrev"
            AddHandler lnkPagerPrev.Click, AddressOf lnkPagerPrev_Click

            lnkPagerNext = New ImageButton
            AddLink(lnkPagerNext, "Next")
            lnkPagerNext.ID = "lnkPagerNext"
            AddHandler lnkPagerNext.Click, AddressOf lnkPagerNext_Click

            lnkPagerLast = New ImageButton
            AddLink(lnkPagerLast, "Last")
            lnkPagerLast.ID = "lnkPagerLast"
            AddHandler lnkPagerLast.Click, AddressOf lnkPagerLast_Click

            lblCurrentPage = New Label
            Controls.Add(lblCurrentPage)
            lblCurrentPage.ID = "lblCurrentPage"

        End Sub

        Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)

            writer.AddAttribute(HtmlTextWriterAttribute.Class, "gridviewPage")
            writer.AddAttribute(HtmlTextWriterAttribute.Id, Me.ClientID)
            writer.RenderBeginTag(HtmlTextWriterTag.Div)
            writer.Write("Items per page: ")
            ddlPageSize.RenderControl(writer)
            writer.Write("&nbsp;")
            lnkPagerFirst.RenderControl(writer)
            lnkPagerPrev.RenderControl(writer)
            lblCurrentPage.RenderControl(writer)
            lnkPagerNext.RenderControl(writer)
            lnkPagerLast.RenderControl(writer)
            writer.RenderEndTag() 'Div

        End Sub

        Private Sub AddLink(ByVal button As ImageButton, ByVal command As String)

            Controls.Add(button)
            button.ImageUrl = String.Format("~/Images/{0}Page.gif", command)

            If command = "First" Or command = "Next" Then
                button.Style.Add(HtmlTextWriterStyle.PaddingRight, "4px")
            End If

        End Sub

        Private Sub ddlPageSize_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
            OnPageSizeChanged(EventArgs.Empty)
        End Sub

        Private Sub lnkPagerFirst_Click(ByVal sender As Object, ByVal e As ImageClickEventArgs)
            MoveFirst()
        End Sub

        Private Sub lnkPagerPrev_Click(ByVal sender As Object, ByVal e As ImageClickEventArgs)
            MovePrevious()
        End Sub

        Private Sub lnkPagerNext_Click(ByVal sender As Object, ByVal e As ImageClickEventArgs)
            MoveNext()
        End Sub

        Private Sub lnkPagerLast_Click(ByVal sender As Object, ByVal e As ImageClickEventArgs)
            MoveLast()
        End Sub


    End Class

End Namespace
