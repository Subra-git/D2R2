Imports System.Security.Principal
Imports System.IdentityModel.Selectors
Imports System.IdentityModel.Policy
Imports System.IdentityModel.Claims
Imports ProfilesLibrary

'taken from the ProjectTracker example in CSLA
Public Class PrincipalPolicy
    Implements IAuthorizationPolicy

    Private mId As String = Guid.NewGuid().ToString()

    Public ReadOnly Property Id() As String Implements IdentityModel.Policy.IAuthorizationPolicy.Id
        Get
            Return mId
        End Get
    End Property

    Public ReadOnly Property Issuer() As ClaimSet Implements IdentityModel.Policy.IAuthorizationPolicy.Issuer
        Get
            Return ClaimSet.System
        End Get
    End Property

    Public Function Evaluate(ByVal context As EvaluationContext, ByRef state As Object) As Boolean _
      Implements IdentityModel.Policy.IAuthorizationPolicy.Evaluate

        Try
            Return DoEvaluate(context, state)
        Catch ex As Exception
            Dim errorLog As ProfilesLibrary.ErrorLogEntry = ProfilesLibrary.ErrorLogEntry.NewErrorLogEntry(ex)
            errorLog.Save()
            Throw
        End Try

    End Function

    Private Function DoEvaluate(ByVal context As EvaluationContext, ByRef state As Object) As Boolean

        ' get the identities list from the context
        Dim obj As Object = Nothing
        If (Not context.Properties.TryGetValue("Identities", obj)) Then
            Return False
        End If
        Dim identities As IList(Of IIdentity) = TryCast(obj, IList(Of IIdentity))

        ' make sure there is already a default identity
        If identities Is Nothing OrElse identities.Count <= 0 Then
            Return False
        End If

        ' try to get principal from rolling cache
        Dim username As String = identities(0).Name
        Dim principal As IPrincipal = Csla.Security.PrincipalCache.GetPrincipal(username)

        If principal Is Nothing Then
            Dim validator As New CredentialValidator()
            validator.Validate(username, String.Empty)
            principal = Csla.ApplicationContext.User
        End If

        ' tell WCF to use the custom principal 
        context.Properties("Principal") = principal

        ' tell WCF to use the custom identity 
        identities(0) = principal.Identity

        Return True

    End Function

End Class

