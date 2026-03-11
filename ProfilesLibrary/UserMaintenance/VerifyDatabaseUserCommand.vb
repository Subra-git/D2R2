Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class VerifyDatabaseUserCommand
    Inherits CommandBase

#Region " Authorization Rules "

    Public Shared Function CanExecuteCommand() As Boolean

        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return identity.IsProfileEditor AndAlso Not identity.IsUserManagementSystem

    End Function

#End Region

#Region " Client-side Code "

    Private mIsValidUser As Boolean
    Private mUserId As Guid
    Private mUsername As String
    Private mFullName As String
    Private mOrganisation As String
    Private mIsSsoUser As Boolean
    Private mIsUserManagement As Boolean

    Public ReadOnly Property IsValidUser() As Boolean
        Get
            Return mIsValidUser
        End Get
    End Property

    Public ReadOnly Property UserId() As Guid
        Get
            Return mUserId
        End Get
    End Property

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

    Public ReadOnly Property Organisation() As String
        Get
            Return mOrganisation
        End Get
    End Property

    Public ReadOnly Property IsSsoUser() As Boolean
        Get
            Return mIsSsoUser
        End Get
    End Property

    Public ReadOnly Property IsUserManagement() As Boolean
        Get
            Return mIsUserManagement
        End Get
    End Property

#End Region

#Region " Factory Methods "

    Public Shared Function Execute(ByVal username As String) As VerifyDatabaseUserCommand

        Dim command As New VerifyDatabaseUserCommand(username)
        command = DataPortal.Execute(Of VerifyDatabaseUserCommand)(command)
        Return command

    End Function

    Private Sub New(ByVal username As String)

        mUsername = username

    End Sub

#End Region

#Region " Server-side Code "

    Protected Overrides Sub DataPortal_Execute()

        If Not CanExecuteCommand() Then
            Throw New System.Security.SecurityException("You do not have permission to verify this user")
        End If

        Dim db As ServiceContracts.IUserMaintenanceService = DataFactory.GetUserMaintenanceService()
        Dim verification As DataContracts.UserVerification = db.VerifyDatabaseUser(New DataContracts.VerifyDatabaseUserRequest(mUsername))

        If verification IsNot Nothing Then
            mIsValidUser = True
            mUserId = verification.UserId
            mFullName = verification.FullName
            mOrganisation = verification.Organisation
            mIsSsoUser = verification.IsSsoUser
            mIsUserManagement = verification.IsUserManagementSystem
        End If

    End Sub

#End Region

End Class



