Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class UpdateSsoUserCommand
    Inherits CommandBase

#Region " Authorization Rules "

    Public Shared Function CanExecuteCommand() As Boolean
        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return (identity.IsProfileEditor Or identity.IsUserManagementSystem) AndAlso identity.IsAuthenticated
    End Function

#End Region

#Region " Client-side Code "

    Private mUsername As String
    Private mFullName As String
    Private mEmail As String
    Private mOrganisation As String
    Private mSsoUserId As Guid
    Private mSubscribedToEmails As Boolean

    Public ReadOnly Property Username() As String
        Get
            Return mUsername
        End Get
    End Property

    Public ReadOnly Property FullName() As String
        Get
            Return mFullName
        End Get
    End Property

    Public ReadOnly Property Email() As String
        Get
            Return mEmail
        End Get
    End Property

    Public ReadOnly Property Organisation() As String
        Get
            Return mOrganisation
        End Get
    End Property

    Public ReadOnly Property SsoUserId() As Guid
        Get
            Return mSsoUserId
        End Get
    End Property

    Public Property SusbcribedToEmails() As Boolean
        Get
            Return mSubscribedToEmails
        End Get
        Set(value As Boolean)
            mSubscribedToEmails = value
        End Set
    End Property


#End Region

#Region " Factory Methods "

    Public Shared Function Execute(ByVal username As String, _
                                   ByVal fullName As String, _
                                   ByVal email As String, _
                                   ByVal organisation As String, _
                                   ByVal subscribedToEmails As Boolean, _
                                   ByVal ssoUserId As Guid) As UpdateSsoUserCommand

        Dim command As New UpdateSsoUserCommand(username, fullName, email, organisation, ssoUserId, subscribedToEmails)
        command = DataPortal.Execute(Of UpdateSsoUserCommand)(command)
        Return command

    End Function

    Private Sub New(ByVal username As String, _
                    ByVal fullName As String, _
                    ByVal email As String, _
                    ByVal organsiation As String, _
                    ByVal ssoUserId As Guid, _
                    ByVal subscribedToEmails As Boolean)
        mUsername = username
        mFullName = fullName
        mEmail = email
        mOrganisation = organsiation
        mSsoUserId = ssoUserId
        mSubscribedToEmails = subscribedToEmails
    End Sub

#End Region

#Region " Server-side Code "

    Protected Overrides Sub DataPortal_Execute()

        If Not CanExecuteCommand() Then
            Throw New System.Security.SecurityException("You do not have permission to update this user")
        End If

        If System.Text.RegularExpressions.Regex.IsMatch(Username, RegexPatterns.Username) Then
            Throw New InvalidOperationException("SSO users cannot have a username in the format domain\username")
        End If

        Dim db As ServiceContracts.IUserMaintenanceService = DataFactory.GetUserMaintenanceService()
        db.UpdateSsoUser(New DataContracts.SsoUserDetailUpdate() With { _
                         .UserName = mUsername, _
                         .FullName = mFullName, _
                         .Email = mEmail, _
                         .Organisation = mOrganisation, _
                         .SubscribedToEmails = mSubscribedToEmails, _
                         .SsoUserId = mSsoUserId})

    End Sub

#End Region

End Class
