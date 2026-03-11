Imports ProfilesLibrary

Partial Class ViewSpeciesData
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim sectionList As SpeciesSectionList
        Dim currentSection As SpeciesSection = Nothing

        If Request.QueryString("SpeciesId") Is Nothing OrElse Not IsValidGuid(Request.QueryString("SpeciesId")) Then
            Throw New InvalidOperationException("This page requires the species id of a species.")
        End If

        Dim speciesId As Guid = New Guid(Request.QueryString("SpeciesId"))
        sectionList = SpeciesSectionList.GetSpeciesSectionList(speciesId)

        If Request.QueryString("SpeciesSectionId") Is Nothing OrElse Not IsValidGuid(Request.QueryString("SpeciesSectionId")) Then
            currentSection = sectionList(0)
        Else
            currentSection = sectionList.GetById(New Guid(Request.QueryString("SpeciesSectionId")))
        End If

        'Add id to the context object for use by the navigation links
        Context.Items.Add("speciesId", speciesId)

        If Not Page.IsPostBack Then
            Dim masterPage As ProfilesPublicTemplate = DirectCast(Master, ProfilesPublicTemplate)
            masterPage.AddBreadCrumb("Home.aspx", "Surveillance profiles")
            masterPage.AddBreadCrumb("ViewSpecies.aspx", "View species")
            masterPage.AddBreadCrumb("ViewSpeciesData.aspx?SpeciesId=" & speciesId.ToString(), sectionList.SpeciesName)
            Page.Title = "Species data for " & sectionList.SpeciesName

            pwcSection.Section = currentSection
            lblSectionName.Text = currentSection.SectionName

        End If

    End Sub

End Class
