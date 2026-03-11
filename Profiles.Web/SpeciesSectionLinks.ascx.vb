Imports ProfilesLibrary
Imports System.ComponentModel
Imports System.Configuration.ConfigurationManager

Partial Class SpeciesSectionLinks
    Inherits System.Web.UI.UserControl

    Public Event ChangeSection As CancelEventHandler
    Public Event NavigateHome As CancelEventHandler

    Private ReadOnly Property CurrentSpeciesData() As SpeciesSectionList
        Get
            If Session("CurrentSpeciesData") IsNot Nothing Then
                Return DirectCast(Session("CurrentSpeciesData"), SpeciesSectionList)
            Else
                Throw New InvalidOperationException("The current species data information is unavailable. The session may have timed out.")
            End If
        End Get
    End Property

    Private ReadOnly Property CurrentSpeciesSectionId() As Guid
        Get
            If Session("CurrentSpeciesSectionId") IsNot Nothing Then
                Return DirectCast(Session("CurrentSpeciesSectionId"), Guid)
            Else
                Return CurrentSpeciesData(0).SectionId
            End If
        End Get
    End Property

    Protected Overridable Sub OnChangeSection(ByVal e As CancelEventArgs)
        RaiseEvent ChangeSection(Me, e)
    End Sub

    Protected Overridable Sub OnNavigateHome(ByVal e As CancelEventArgs)
        RaiseEvent NavigateHome(Me, e)
    End Sub

    Protected Sub dsSpeciesSectionInfoList_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsSpeciesSectionInfoList.SelectObject
        e.BusinessObject = CurrentSpeciesData
    End Sub

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1011:ConsiderPassingBaseTypesAsParameters")>
    Protected Sub rptSectionLinks_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.RepeaterCommandEventArgs) Handles rptSectionLinks.ItemCommand

        Dim args As New CancelEventArgs(False)
        OnChangeSection(args)

        If Not args.Cancel Then
            Response.Redirect(String.Format("~/EditSpecies.aspx?SpeciesId={0}&SpeciesSectionId={1}", CurrentSpeciesData.SpeciesId, e.CommandArgument.ToString()))
        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub rptSectionLinks_PreRender(sender As Object, e As EventArgs) Handles rptSectionLinks.PreRender
        Dim strProfileSectionId As String = Request.QueryString("SpeciesSectionId")

        For Each item As RepeaterItem In rptSectionLinks.Items
            Dim button As LinkButton = CType(item.FindControl("lnkSpeciesSection"), LinkButton)
            Dim li As HtmlGenericControl = CType(item.FindControl("liWrapper"), HtmlGenericControl)

            If String.IsNullOrEmpty(strProfileSectionId) Then
                '' loading for the first time, lets get the first item's id
                strProfileSectionId = button.CommandArgument
            End If

            If button.CommandArgument = strProfileSectionId Then
                li.Attributes.Add("class", "app-subnav__section-item--current")
            Else
                li.Attributes.Add("class", "app-subnav__section-item")
            End If
        Next
    End Sub

End Class
