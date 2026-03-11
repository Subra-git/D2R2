
Partial Class ProfilesPublicTemplate
    Inherits System.Web.UI.MasterPage

    Private mBreadCrumb As New OrderedDictionary

    Public Sub AddBreadCrumb(ByVal url As String, ByVal title As String)
        mBreadCrumb.Add(url, title)
    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        AddBreadCrumb("http://www.defra.gov.uk/", "Homepage")
        AddBreadCrumb("http://www.defra.gov.uk/foodfarm/index.htm", "Food and Farming")
        AddBreadCrumb("http://www.defra.gov.uk/foodfarm/farmanimal/index.htm", "Farm animals")
        AddBreadCrumb("http://www.defra.gov.uk/foodfarm/farmanimal/diseases/index.htm", "Animal diseases")
        AddBreadCrumb("http://www.defra.gov.uk/foodfarm/farmanimal/diseases/vetsurveillance/index.htm", "Veterinary surveillance")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        BuildBreadCrumb()
    End Sub

    Private Sub BuildBreadCrumb()
        litBreadCrumb.Text = "<ul>"
        Dim count As Integer = 0
        For Each url As String In mBreadCrumb.Keys
            count += 1
            If count = mBreadCrumb.Keys.Count Then
                litBreadCrumb.Text &= "<li>" & mBreadCrumb(url) & "</li>"
            Else
                litBreadCrumb.Text &= "<li><a href='" & url & "'>" & mBreadCrumb(url) & "</a></li>"
            End If
        Next
        litBreadCrumb.Text &= "</ul>"
    End Sub

End Class

