Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.ComponentModel
Imports ProfilesLibrary

<System.Web.Script.Services.ScriptService()> _
<System.Web.Services.WebService(Namespace:="http://tempuri.org/")> _
<System.Web.Services.WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<ToolboxItem(False)> _
Public Class SsoSubscriptionService
    Inherits System.Web.Services.WebService

    Public Structure VlaUser
        Public Id As Guid
        Public Login As String
        Public Email As String
        Public FirstName As String
        Public LastName As String
        Public OrganisationName As String
        Public PhoneNumber As String
    End Structure

    Public Structure VlaRole
        Public Id As Guid
        Public Name As String
    End Structure

    Private Sub Login()       
        Dim name As String = ConfigurationManager.AppSettings("DbUserContext")

        ProfilesPrincipal.Logout()
        ProfilesPrincipal.Login(name)
    End Sub

    Private Sub WriteToErrorLog(ByVal ex As Exception)
        Try
            Dim logEntry As ErrorLogEntry = ErrorLogEntry.NewErrorLogEntry(ex)
            If HttpContext.Current IsNot Nothing AndAlso HttpContext.Current.Request IsNot Nothing Then
                logEntry.Request = HttpContext.Current.Request.Url.ToString()
            End If
            logEntry.Save()
        Catch
            'Do nothing
        End Try
    End Sub

    <WebMethod()> _
    Public Function AddUserRole(ByVal user As VlaUser, ByVal role As VlaRole) As Boolean
        Try
            Login()
            Dim fullName As String = user.FirstName & " " & user.LastName
            UpdateSsoUserCommand.Execute(user.Login, fullName, user.Email, user.OrganisationName, false, user.Id)
        Catch ex As Exception
            WriteToErrorLog(ex)
            Return False
        End Try
        Return True
    End Function

    <WebMethod()> _
    Public Function UpdateUser(ByVal oldUser As VlaUser, ByVal updatedUser As VlaUser) As Boolean
        Try
            Login()
            Dim FullName As String = updatedUser.FirstName & " " & updatedUser.LastName
            UpdateSsoUserCommand.Execute(updatedUser.Login, FullName, updatedUser.Email, updatedUser.OrganisationName, false, oldUser.Id)
        Catch ex As Exception
            WriteToErrorLog(ex)
            Return False
        End Try
        Return True
    End Function

    <WebMethod()> _
    Public Function RemoveUserRole(ByVal user As VlaUser, ByVal role As VlaRole) As Boolean
        Try
            Login()
            DeleteSsoUserCommand.Execute(user.Id)
        Catch ex As Exception
            WriteToErrorLog(ex)
            Return False
        End Try
        Return True
    End Function

End Class

