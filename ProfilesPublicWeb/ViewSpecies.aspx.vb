Imports ProfilesLibrary
Imports System.Text

Partial Class ViewSpecies
    Inherits System.Web.UI.Page

    Private mSpeciesList As SpeciesInfoList
    Private mRootSpecies As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            Dim masterPage As ProfilesPublicTemplate = DirectCast(Master, ProfilesPublicTemplate)
            masterPage.AddBreadCrumb("Home.aspx", "Surveillance profiles")
            masterPage.AddBreadCrumb("ViewSpecies.aspx", "View species")
            mSpeciesList = SpeciesInfoList.GetList()
            BuildSpeciesList()
        End If

    End Sub

    Private Sub BuildSpeciesList()

        mRootSpecies = Request.QueryString("RootSpecies")

        Dim rootSpeciesOutput As New StringBuilder()
        For Each species As SpeciesInfo In mSpeciesList
            If species.Id.ToString() = mRootSpecies Then
                rootSpeciesOutput.Append(species.Description)
                DirectCast(Master, ProfilesPublicTemplate).AddBreadCrumb("ViewSpecies.aspx?RootSpecies=" & species.Id.ToString(), species.Description)
            Else
                rootSpeciesOutput.Append("<a href='ViewSpecies.aspx?RootSpecies=").Append(species.Id.ToString())
                rootSpeciesOutput.Append("'>").Append(species.Description).Append("</a>")
            End If
            rootSpeciesOutput.Append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;")
        Next
        litRootSpecies.Text = rootSpeciesOutput.ToString()

        If Not mRootSpecies Is Nothing AndAlso IsValidGuid(mRootSpecies) Then
            Dim speciesListOutput As New StringBuilder()
            speciesListOutput.Append("<br /><br /><ul>")

            For Each species As SpeciesInfo In mSpeciesList
                If species.Id.ToString() = mRootSpecies Then
                    speciesListOutput.Append("<li><a href='ViewSpeciesData.aspx?SpeciesId=").Append(species.Id.ToString())
                    speciesListOutput.Append("'>").Append(species.Description).Append("</a><ul>")
                    BuildTree(species.ChildList, speciesListOutput)
                    speciesListOutput.Append("</ul></li>")
                    Exit For
                End If
            Next

            speciesListOutput.Append("</ul>")
            litSpeciesList.Text = speciesListOutput.ToString()
        End If

    End Sub

    Private Sub BuildTree(ByVal childSpecies As SpeciesInfoList, ByVal speciesListOutput As StringBuilder)

        For Each species As SpeciesInfo In childSpecies

            If species.ParentId.ToString() = mRootSpecies Then
                speciesListOutput.Append("<br />")
            End If

            speciesListOutput.Append("<li><a href='ViewSpeciesData.aspx?SpeciesId=").Append(species.Id.ToString())
            speciesListOutput.Append("'>").Append(species.Description).Append("</a></li>")

            If species.ChildList.Count > 0 Then
                speciesListOutput.Append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<ul>")
                BuildTree(species.ChildList, speciesListOutput)
                speciesListOutput.Append("</ul>")
            Else
                speciesListOutput.Append("<br/>")
            End If

            speciesListOutput.Append("</li>")

        Next

    End Sub

End Class
