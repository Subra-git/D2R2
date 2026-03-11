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

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1011:ConsiderPassingBaseTypesAsParameters")> _
    Protected Sub rptSectionLinks_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.RepeaterCommandEventArgs) Handles rptSectionLinks.ItemCommand

        Dim args As New CancelEventArgs(False)
        OnChangeSection(args)

        If Not args.Cancel Then
            Response.Redirect(String.Format("~/EditSpecies.aspx?SpeciesId={0}&SpeciesSectionId={1}", CurrentSpeciesData.SpeciesId, e.CommandArgument.ToString()))
        End If

    End Sub

    Protected Sub lnkHome_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkHome.Click

        Dim args As New CancelEventArgs(False)
        OnNavigateHome(args)

        If args.Cancel Then
            Dim script As String = "<script language=""JavaScript"">"
            script &= "if(confirm('Changes made to the species will not be saved. Do you wish to continue?')){location.href = 'Home.aspx'};"
            script &= "</script>"
            If (Not Page.ClientScript.IsStartupScriptRegistered("SaveScript")) Then
                Page.ClientScript.RegisterStartupScript(Me.GetType(), "SaveScript", script)
            End If
        Else
            Response.Redirect("~/Home.aspx")
        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

End Class
