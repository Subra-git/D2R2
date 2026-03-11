Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports ProfilesLibrary

Public Class Breadcrumb

	''' <summary>
	''' Updates the existing breadcrumb control located within the master page supplied.
	''' ReplaceExistingParent (set to true) determines if the parent data is used by 
	''' replacing the existing parent before the current item (currentItemIndex) 
	''' or if the new parent is injected at the current item position (currentItemIndex) 
	''' and the  new current item is rebuilt after (false)
	''' currentItemIndex is usually 2 when the page being loaded is right after home page, or
	''' 4 if the page being loaded is a subpage of another after home page.
	''' </summary>
	''' <param name="currentTitle">The title of the current breadcrumb item (active page). Paragraph HTML tags will be removed.</param>
	''' <param name="masterPage">A reference to the master page that contains the breadcrumb control</param>
	''' <param name="currentItemIndex">The position of the current item within the existing breadcrumb control</param>
	''' <param name="parentLocation">The URL to use for the new\updated parent breadcrum item</param>
	''' <param name="parentPageTitle">The title to use for the new parent breadcrum item. Paragraph HTML tags will be removed.</param>
	''' <param name="ReplaceExistingParent">Removes breadcrumb items at positions currentItemIndex-1
	''' and currentItemIndex-2 before injecting the new parent. Has no effect if the parentLocation or 
	''' parentPageTitle is left blank</param>
	''' <param name="BreadcrumbControlId">Optionally override the default breadcrumb control id. Default is assumed as 'breadcrumbs'.</param>
	Public Shared Sub UpdateBreadcrumb(master As MasterPage, currentTitle As String, currentItemIndex As Integer, Optional parentLocation As String = "", Optional parentPageTitle As String = "", Optional ReplaceExistingParent As Boolean = False, Optional BreadcrumbControlId As String = "breadcrumbs")

		Dim breadcrumbControlParent As ControlCollection
		Dim breadcrumbControlItems As ControlCollection
		breadcrumbControlItems = master.FindControl(BreadcrumbControlId)?.Controls
		breadcrumbControlParent = breadcrumbControlItems(0).Parent.Controls

		RemoveBreadcrumbItem(breadcrumbControlParent, breadcrumbControlItems, currentItemIndex)

		If Not String.IsNullOrEmpty(parentPageTitle) And Not String.IsNullOrEmpty(parentLocation) Then
			If ReplaceExistingParent Then
				RemoveBreadcrumbItem(breadcrumbControlParent, breadcrumbControlItems, currentItemIndex - 1)
				RemoveBreadcrumbItem(breadcrumbControlParent, breadcrumbControlItems, currentItemIndex - 2)
			End If
			breadcrumbControlParent.Add(BuildSitemapNode(1, SiteMapNodeItemType.Parent, BuildLink(parentPageTitle, parentLocation, parentPageTitle)))
			breadcrumbControlParent.Add(BuildSitemapNode(2, SiteMapNodeItemType.PathSeparator, BuildLabel("&nbsp;>&nbsp;")))
		End If

		breadcrumbControlParent.Add(BuildSitemapNode(3, SiteMapNodeItemType.Current, BuildLabel(currentTitle)))

	End Sub

	Public Shared Sub RemoveBreadcrumbItem(master As MasterPage, ItemIndex As Integer, Optional BreadcrumbControlId As String = "breadcrumbs")
		Dim breadcrumbControlParent As ControlCollection
		Dim breadcrumbControlItems As ControlCollection
		breadcrumbControlItems = master.FindControl(BreadcrumbControlId)?.Controls
		breadcrumbControlParent = breadcrumbControlItems(0).Parent.Controls

		RemoveBreadcrumbItem(breadcrumbControlParent, breadcrumbControlItems, ItemIndex)
	End Sub

	Private Shared Sub RemoveBreadcrumbItem(breadcrumbControlParent As ControlCollection, breadcrumbControlItems As ControlCollection, ItemIndex As Integer)

		breadcrumbControlParent.Remove(breadcrumbControlItems(ItemIndex))

	End Sub

	Private Shared Function BuildLink(linkText As String, LinkUrl As String, LinkTooltip As String) As HyperLink
		Dim link As HyperLink = New HyperLink

		With link
			.Text = linkText.StripPTags
			.NavigateUrl = LinkUrl
			.ToolTip = LinkTooltip.StripHtmlTags
		End With

		Return link
	End Function

	Public Shared Function BuildLabel(labelText As String) As Label
		Dim labelControl As Label = New Label

		labelControl.Text = labelText.StripPTags

		Return labelControl
	End Function

	Public Shared Function BuildSitemapNode(itemIndex As Integer, itemType As SiteMapNodeItemType, childControl As Control) As SiteMapNodeItem
		Dim nodeItem As SiteMapNodeItem = New SiteMapNodeItem(itemIndex, itemType)
		nodeItem.Controls.Add(childControl)
		Return nodeItem
	End Function
End Class
