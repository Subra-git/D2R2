Imports System
Imports System.ComponentModel
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Text
Imports ProfilesLibrary
Imports System.Collections.Generic
Imports System.Web.UI.HtmlControls
Imports System.Web

Namespace Profiles.WebControls.SearchControls

    Public Class SearchResultList
        Inherits WebControl
        Implements INamingContainer

        Private mResultList As ProfileInfoList

        Private mExpandCollapseAllCell As HtmlTableCell
        Private mTopPageSelector As PageSelector
        Private mBottomPageSelector As PageSelector
        Private mChildItemDictionary As New Dictionary(Of Guid, ProfileResultListItem)
        Private mChildItemList As New List(Of ProfileResultListItem)
        Private mNoDataLabel As Label
        Private mPagingChanged As Boolean

        Public Property ResultList() As ProfileInfoList
            Get
                Return mResultList
            End Get
            Set(ByVal value As ProfileInfoList)
                mResultList = value
            End Set
        End Property

        Public Property IncludedCount() As Integer
            Get
                If (ViewState("IncludedCount") IsNot Nothing) Then
                    Return CInt(ViewState("IncludedCount"))
                End If
                Return -1
            End Get
            Set(ByVal value As Integer)
                ViewState("IncludedCount") = value
            End Set
        End Property

        Public Property PageIndex() As Integer
            Get
                If (ViewState("PageIndex") IsNot Nothing) Then
                    Return CInt(ViewState("PageIndex"))
                End If
                Return 0
            End Get
            Set(ByVal value As Integer)
                ViewState("PageIndex") = value
            End Set
        End Property

        Private Property PageCount() As Integer
            Get
                If (ViewState("PageCount") IsNot Nothing) Then
                    Return CInt(ViewState("PageCount"))
                End If
                Return 1
            End Get
            Set(ByVal value As Integer)
                ViewState("PageCount") = value
            End Set
        End Property

        Public Property SizeOption() As PageSizeOption
            Get
                If (HttpContext.Current.Session("SizeOption") IsNot Nothing) Then
                    Return DirectCast(HttpContext.Current.Session("SizeOption"), PageSizeOption)
                End If
                Return PageSizeOption.PageSize10
            End Get
            Set(ByVal value As PageSizeOption)
                HttpContext.Current.Session("SizeOption") = value
            End Set
        End Property

        Public Overrides ReadOnly Property Controls() As System.Web.UI.ControlCollection
            Get
                EnsureChildControls()
                Return MyBase.Controls
            End Get
        End Property

        Protected Overrides Sub CreateChildControls()

            CreatePageSelector(mTopPageSelector, "ctlTopPageSelector", True)

            For Each result As ProfileInfo In mResultList
                Dim udpProfile As New UpdatePanel
                Controls.Add(udpProfile)
                udpProfile.ID = "udpProfile" & result.Id.ToString().Replace("-", String.Empty)
                udpProfile.UpdateMode = UpdatePanelUpdateMode.Conditional
                udpProfile.ChildrenAsTriggers = True

                Dim listItem As New ProfileResultListItem
                udpProfile.ContentTemplateContainer.Controls.Add(listItem)
                listItem.ID = "_profile" & result.Id.ToString().Replace("-", String.Empty)
                listItem.Profile = result
                mChildItemDictionary.Add(result.Id, listItem)
                mChildItemList.Add(listItem)
            Next

            mNoDataLabel = New Label
            Controls.Add(mNoDataLabel)
            mNoDataLabel.ID = "lblNoData"
            mNoDataLabel.Text = "There are no profiles that match the selected criteria."

            CreatePageSelector(mBottomPageSelector, "ctlBottomPageSelector", False)

        End Sub

        Private Sub CreatePageSelector(ByRef selector As PageSelector, ByVal id As String, ByVal includeExpandCollapseAll As Boolean)

            Dim table As New HtmlTable
            table.Width = "100%"
            Controls.Add(table)
            Dim row As New HtmlTableRow
            table.Controls.Add(row)
            If includeExpandCollapseAll Then
                mExpandCollapseAllCell = New HtmlTableCell
                mExpandCollapseAllCell.Width = "250px"
                row.Controls.Add(mExpandCollapseAllCell)
                CreateExpandCollapseAllLinks()
            Else
                Dim cell1 As New HtmlTableCell
                cell1.Width = "250px"
                row.Controls.Add(cell1)
            End If
            Dim cell2 As New HtmlTableCell
            cell2.Align = "right"
            row.Controls.Add(cell2)

            selector = New PageSelector
            cell2.Controls.Add(selector)
            cell2.Attributes.Add("class", "gridview")
            selector.ID = id
            selector.Style.Add("align", "right")
            AddHandler selector.PageFirst, AddressOf selector_PageFirst
            AddHandler selector.PagePrevious, AddressOf selector_PagePrevious
            AddHandler selector.PageNext, AddressOf selector_PageNext
            AddHandler selector.PageLast, AddressOf selector_PageLast
            AddHandler selector.PageSizeChanged, AddressOf selector_PageSizeChanged

        End Sub

        Private Sub CreateExpandCollapseAllLinks()

            Dim imgExpandAll As New ImageButton
            mExpandCollapseAllCell.Controls.Add(imgExpandAll)
            imgExpandAll.AlternateText = "Expand all"
            imgExpandAll.ImageUrl = "~/Images/ExpandPanel.gif"
            AddHandler imgExpandAll.Click, AddressOf imgExpandAll_Click

            Dim lnkExpandAll As New LinkButton
            mExpandCollapseAllCell.Controls.Add(lnkExpandAll)
            lnkExpandAll.Style.Add(HtmlTextWriterStyle.FontSize, "80%")
            lnkExpandAll.Text = "Expand all"
            AddHandler lnkExpandAll.Click, AddressOf lnkExpandAll_Click

            Dim litBreak As New LiteralControl
            mExpandCollapseAllCell.Controls.Add(litBreak)
            litBreak.Text = " | "

            Dim imgCollapseAll As New ImageButton
            mExpandCollapseAllCell.Controls.Add(imgCollapseAll)
            imgCollapseAll.AlternateText = "Collapse all"
            imgCollapseAll.ImageUrl = "~/Images/CollapsePanel.gif"
            AddHandler imgCollapseAll.Click, AddressOf imgCollapseAll_Click

            Dim lnkCollapseAll As New LinkButton
            mExpandCollapseAllCell.Controls.Add(lnkCollapseAll)
            lnkCollapseAll.Style.Add(HtmlTextWriterStyle.FontSize, "80%")
            lnkCollapseAll.Text = "Collapse all"
            AddHandler lnkCollapseAll.Click, AddressOf lnkCollapseAll_Click

        End Sub

        Public Sub FilterList(ByVal displayPublished As Boolean, ByVal displayDraft As Boolean, ByVal displayScenarios As Boolean, _
                              ByVal displayMyProfiles As Boolean, ByVal filterLetter As String, ByVal title As String, _
                              ByVal speciesList As List(Of Guid))

            EnsureChildControls()

            'initialise all profiles to not included
            For Each item As ProfileResultListItem In mChildItemList
                item.Included = False
            Next

            Dim filteredItems As New List(Of ProfileResultListItem)

            Dim filteredList As Csla.FilteredBindingList(Of ProfileInfo) = mResultList.GetFilteredList(displayPublished, displayDraft, displayScenarios, displayMyProfiles, filterLetter, title, speciesList, Nothing, Nothing, Nothing, False, SortByType.Az)
            'include only those profiles that are in the filtered binding list
            For Each currentProfile As ProfileInfo In filteredList
                Dim currentItem As ProfileResultListItem = mChildItemDictionary(currentProfile.Id)
                currentItem.FilterList(displayPublished, displayDraft, displayScenarios, displayMyProfiles, speciesList)
                If currentItem.Included Then
                    filteredItems.Add(currentItem)
                End If
            Next

            IncludedCount = filteredItems.Count
            mNoDataLabel.Visible = (filteredItems.Count = 0)
            mTopPageSelector.Visible = (filteredItems.Count > 0)
            mBottomPageSelector.Visible = (filteredItems.Count > 0)
            mExpandCollapseAllCell.Visible = (filteredItems.Count > 0)

            PageIndex = 0
            mPagingChanged = True

        End Sub

        Protected Overrides Sub OnPreRender(ByVal e As System.EventArgs)

            MyBase.OnPreRender(e)

            If IncludedCount = -1 Then
                FilterList(True, False, False, False, "All", String.Empty, Nothing)
            End If

            If mPagingChanged Then
                RecalculatePaging()
            End If

        End Sub

        Private Sub RecalculatePaging()

            Dim minItem As Integer
            Dim maxItem As Integer

            If SizeOption = PageSizeOption.PageSizeAll Then
                minItem = 0
                maxItem = IncludedCount - 1
                PageIndex = 0
                PageCount = 1
            Else
                Dim pageSize As Integer = GetPageSizeFromOption(SizeOption)
                PageCount = IncludedCount \ pageSize
                If IncludedCount Mod pageSize > 0 Then
                    PageCount += 1
                End If

                minItem = PageIndex * pageSize
                maxItem = ((PageIndex + 1) * pageSize) - 1
                If maxItem > IncludedCount - 1 Then
                    maxItem = IncludedCount - 1
                End If
            End If

            Dim runningIncludedCount As Integer = -1
            For Each item As ProfileResultListItem In mChildItemList
                If item.Included Then
                    runningIncludedCount += 1
                End If
                item.Visible = item.Included AndAlso (runningIncludedCount >= minItem And runningIncludedCount <= maxItem)
                If item.Visible Then
                    Console.WriteLine(item.Profile.Title)
                End If
            Next

            mTopPageSelector.SetPager(PageIndex, PageCount, SizeOption)
            mBottomPageSelector.SetPager(PageIndex, PageCount, SizeOption)

        End Sub

        Private Function GetPageSizeFromOption(ByVal sizeOption As PageSizeOption) As Integer

            Select Case sizeOption
                Case PageSizeOption.PageSize10
                    Return 10
                Case PageSizeOption.PageSize15
                    Return 15
                Case PageSizeOption.PageSize20
                    Return 20
                Case PageSizeOption.PageSize30
                    Return 30
                Case PageSizeOption.PageSizeAll
                    Return 0 'PageCount * Rows.Count
            End Select
        End Function

        Private Sub selector_PageFirst(ByVal sender As Object, ByVal e As EventArgs)
            PageIndex = 0
            mPagingChanged = True
        End Sub

        Private Sub selector_PagePrevious(ByVal sender As Object, ByVal e As EventArgs)
            PageIndex -= 1
            mPagingChanged = True
        End Sub

        Private Sub selector_PageNext(ByVal sender As Object, ByVal e As EventArgs)
            PageIndex += 1
            mPagingChanged = True
        End Sub

        Private Sub selector_PageLast(ByVal sender As Object, ByVal e As EventArgs)
            PageIndex = PageCount - 1
            mPagingChanged = True
        End Sub

        Private Sub selector_PageSizeChanged(ByVal sender As Object, ByVal e As EventArgs)

            Dim pageSelect As PageSelector = CType(sender, PageSelector)
            SizeOption = pageSelect.SizeOption
            PageIndex = 0
            mPagingChanged = True
        End Sub

        Private Sub imgExpandAll_Click(ByVal sender As Object, ByVal e As ImageClickEventArgs)
            ExpandCollapseAll(True)
        End Sub

        Private Sub lnkExpandAll_Click(ByVal sender As Object, ByVal e As EventArgs)
            ExpandCollapseAll(True)
        End Sub

        Private Sub ExpandCollapseAll(ByVal expand As Boolean)
            For Each profileItem As ProfileResultListItem In mChildItemList
                profileItem.Expanded = expand
            Next
        End Sub

        Private Sub imgCollapseAll_Click(ByVal sender As Object, ByVal e As ImageClickEventArgs)
            ExpandCollapseAll(False)
        End Sub

        Private Sub lnkCollapseAll_Click(ByVal sender As Object, ByVal e As EventArgs)
            ExpandCollapseAll(False)
        End Sub

    End Class

End Namespace

