Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Web.Script.Services
Imports ProfilesLibrary

Namespace Profiles.WebServices

    <WebService(Namespace:="http://tempuri.org/")> _
    <WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
    <Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
    <ScriptService()> _
    Public Class ProfileValidationService
        Inherits System.Web.Services.WebService

        <WebMethod()> _
        Public Function ValidateProfileVersion(ByVal profileVersionId As Guid) As String

            Authenticate()

            Dim output As String = String.Empty

            Dim sectionList As ProfileVersionSectionList = ProfileVersionSectionList.GetProfileVersionSectionList(profileVersionId)

            For Each section As ProfileVersionSection In sectionList
                output &= IIf(section.Validate().Count = 0, "1", "0").ToString()
            Next

            Return output

        End Function

        Private Sub Authenticate()
            If Context.User.Identity.IsAuthenticated Then

                Dim name As String = Context.User.Identity.Name
                If Context.User.Identity.AuthenticationType <> "Forms" Then
                    ProfilesPrincipal.Logout() 
                    ProfilesPrincipal.Login(name)
                Else
                    ProfilesPrincipal.Logout(New Guid(name)) 
                    ProfilesPrincipal.Login(New Guid(name), New Guid(name))
                End If
            End If
        End Sub

    End Class

End Namespace
