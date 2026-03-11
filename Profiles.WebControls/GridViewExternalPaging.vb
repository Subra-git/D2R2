Imports System
Imports System.ComponentModel
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Text
Imports System.Web

Namespace Profiles.WebControls

    Public Class GridViewExternalPaging
        Inherits System.Web.UI.WebControls.GridView

        <Browsable(True),
        Description("Default sort expression"),
        Category("Behavior")>
        Public Property DefaultSortExpression() As String
            Get
                If (ViewState("DefaultSortExpression") IsNot Nothing) Then
                    Return DirectCast(ViewState("DefaultSortExpression"), String)
                End If
                Return String.Empty
            End Get
            Set(ByVal value As String)
                ViewState("DefaultSortExpression") = value
            End Set
        End Property

        <Browsable(True),
                Description("Default sort direction"),
                Category("Behavior")>
        Public Property DefaultSortDirection() As SortDirection
            Get
                If (ViewState("DefaultSortDirection") IsNot Nothing) Then
                    Return DirectCast(ViewState("DefaultSortDirection"), SortDirection)
                End If
                Return SortDirection.Ascending
            End Get
            Set(ByVal value As SortDirection)
                ViewState("DefaultSortDirection") = value
            End Set
        End Property

        <Browsable(True),
       Description("Image to display for Ascending Sort"),
       Category("Behavior")>
        Public Property SortAscImageUrl() As String
            Get
                If (ViewState("SortAscImageUrl") IsNot Nothing) Then
                    Return DirectCast(ViewState("SortAscImageUrl"), String)
                End If
                Return String.Empty
            End Get
            Set(ByVal value As String)
                ViewState("SortAscImageUrl") = value
            End Set
        End Property

        <Browsable(True),
       Description("Image to display for Descending Sort"),
       Category("Behavior")>
        Public Property SortDescImageUrl() As String
            Get
                If (ViewState("SortDescImageUrl") IsNot Nothing) Then
                    Return DirectCast(ViewState("SortDescImageUrl"), String)
                End If
                Return String.Empty
            End Get
            Set(ByVal value As String)
                ViewState("SortDescImageUrl") = value
            End Set
        End Property

        Protected Overrides Function CreateDataSourceSelectArguments() As DataSourceSelectArguments

            Dim selectArguments As DataSourceSelectArguments = MyBase.CreateDataSourceSelectArguments()

            If String.IsNullOrEmpty(selectArguments.SortExpression) AndAlso Not String.IsNullOrEmpty(Me.DefaultSortExpression) Then
                Me.Sort(Me.DefaultSortExpression, Me.DefaultSortDirection)
            End If

            Return selectArguments

        End Function

        Protected Overrides Sub OnLoad(ByVal e As System.EventArgs)

            If AllowPaging Then
                Me.PagerStyle.HorizontalAlign = HorizontalAlign.Right
                Me.PagerSettings.Mode = PagerButtons.NextPreviousFirstLast
                Me.PagerSettings.Position = PagerPosition.TopAndBottom
            End If

            Me.SortAscImageUrl = "images/SortAsc.png"
            Me.SortDescImageUrl = "images/SortDesc.png"

            MyBase.OnLoad(e)

        End Sub

        Protected Overrides Sub OnPreRender(ByVal e As System.EventArgs)

            MyBase.OnPreRender(e)

        End Sub

        Protected Overrides Sub OnRowCreated(ByVal e As GridViewRowEventArgs)

            If e.Row.RowType = DataControlRowType.Header Then

                If SortExpression.Length > 0 Then
                    DisplaySortOrderImages(SortExpression, e.Row)
                ElseIf DefaultSortExpression.Length > 0 Then
                    Dim sort As String = DefaultSortExpression & " "
                    If DefaultSortDirection = SortDirection.Ascending Then
                        sort &= "ASC"
                    Else
                        sort &= "DESC"
                    End If
                    DisplaySortOrderImages(sort, e.Row)
                End If

            ElseIf e.Row.RowType = DataControlRowType.Pager Then
                e.Row.Cells(0).Controls.Clear()

            ElseIf e.Row.RowType = DataControlRowType.Footer Then
                If PageCount = 1 Then
                    ShowFooter = True
                    Dim cellCount As Integer = e.Row.Cells.Count
                    e.Row.Cells.Clear()
                End If

            End If

            MyBase.OnRowCreated(e)

        End Sub

        Protected Sub DisplaySortOrderImages(ByVal sortExpression As String, ByVal dgItem As GridViewRow)

            Dim sortColumns As String() = sortExpression.Split(",".ToCharArray())

            For currentCell As Integer = 0 To dgItem.Cells.Count - 1
                If dgItem.Cells(currentCell).Controls.Count > 0 AndAlso TypeOf dgItem.Cells(currentCell).Controls(0) Is LinkButton Then

                    Dim sortOrder As String = String.Empty
                    Dim sortOrderNo As Integer
                    Dim column As String = DirectCast(dgItem.Cells(currentCell).Controls(0), LinkButton).CommandArgument
                    SearchSortExpression(sortColumns, column, sortOrder, sortOrderNo)
                    If sortOrderNo > 0 Then

                        Dim sortImgLoc As String = CType(IIf(sortOrder.Equals("ASC"), SortAscImageUrl, SortDescImageUrl), String)

                        Dim imgSortDirection As New Image()
                        imgSortDirection.ImageUrl = sortImgLoc
                        dgItem.Cells(currentCell).Controls.Add(imgSortDirection)

                    End If
                End If

            Next

        End Sub

        Protected Sub SearchSortExpression(ByVal sortColumns As String(), ByVal sortColumn As String, ByRef sortOrder As String, ByRef sortOrderNo As Integer)

            sortOrder = String.Empty
            sortOrderNo = -1
            For currentColumn As Integer = 0 To sortColumns.Length - 1
                If sortColumns(currentColumn).StartsWith(sortColumn) Then
                    sortOrderNo = currentColumn + 1
                    If sortColumns(currentColumn).IndexOf(" ") > -1 Then
                        sortOrder = sortColumns(currentColumn).Substring(sortColumns(currentColumn).IndexOf(" ") + 1)
                    Else
                        sortOrder = CType(IIf(SortDirection = SortDirection.Ascending, "ASC", "DESC"), String)
                    End If
                End If
            Next

        End Sub

        Private Sub selector_PageFirst(ByVal sender As Object, ByVal e As EventArgs)
            PageIndex = 0
        End Sub

        Private Sub selector_PagePrevious(ByVal sender As Object, ByVal e As EventArgs)
            PageIndex -= 1
        End Sub

        Private Sub selector_PageNext(ByVal sender As Object, ByVal e As EventArgs)
            PageIndex += 1
        End Sub

        Private Sub selector_PageLast(ByVal sender As Object, ByVal e As EventArgs)
            PageIndex = PageCount - 1
        End Sub

    End Class

End Namespace
