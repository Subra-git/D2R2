Imports ProfilesLibrary
Imports System.ComponentModel
Imports System.Configuration.ConfigurationManager

Friend Class MyFooterTemplate
    Implements Web.UI.ITemplate

    Private mItemNumber As Integer
    Private mProfileVersionId As String

    Public Sub InstantiateIn(ByVal container As System.Web.UI.Control) Implements System.Web.UI.ITemplate.InstantiateIn
        Dim lit As New Literal()
        lit.Text = "<li><a href='" & String.Format("ViewProfileData.aspx?ProfileVersionId={0}&ProfileSection={1}", mProfileVersionId, "References") & "'>" & mItemNumber.ToString() & ".&nbsp;References</a></li></ul>"
        container.Controls.Add(lit)
    End Sub

    Public Sub New(ByVal itemNumber As Integer, ByVal profileId As String)
        mItemNumber = itemNumber
        mProfileVersionId = profileId
    End Sub

End Class

Partial Class SectionLinks
    Inherits System.Web.UI.UserControl

    Protected Sub dsProfileSectionInfoList_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsProfileSectionInfoList.SelectObject

        Dim sectionList As SectionMetadataListBase
        If Context.Items("profileVersionId") IsNot Nothing Then
            sectionList = ProfileSectionMetadataList.GetProfileSectionMetadataList()
        Else
            sectionList = SpeciesSectionMetadataList.GetSpeciesSectionMetadataList()
        End If

        e.BusinessObject = sectionList

        If Context.Items("profileVersionId") IsNot Nothing Then
            rptSectionLinks.FooterTemplate = New MyFooterTemplate(sectionList.Count + 1, Context.Items("profileVersionId").ToString())
        End If

    End Sub

    Protected Sub rptSectionLinks_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.RepeaterCommandEventArgs) Handles rptSectionLinks.ItemCommand
        If Context.Items("profileVersionId") IsNot Nothing Then
            Response.Redirect(String.Format("ViewProfileData.aspx?ProfileVersionId={0}&ProfileSectionId={1}", Context.Items("profileVersionId").ToString(), e.CommandArgument.ToString()))
        Else
            Response.Redirect(String.Format("ViewSpeciesData.aspx?SpeciesId={0}&SpeciesSectionId={1}", Context.Items("speciesId").ToString(), e.CommandArgument.ToString()))
        End If
    End Sub

End Class
