Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class SsoUserMaintenance
    Inherits BusinessBase(Of SsoUserMaintenance)

    Private mSsoUserList As SsoUserList
    Private mSsoProfileList As SsoProfileInfoList

#Region " Business Methods "

    Public ReadOnly Property SsoProfileList() As SsoProfileInfoList
        Get
            Return mSsoProfileList
        End Get
    End Property

    Public ReadOnly Property SsoUserList() As SsoUserList
        Get
            Return mSsoUserList
        End Get
    End Property

    Public Overrides ReadOnly Property IsDirty() As Boolean
        Get
            Return MyBase.IsDirty OrElse mSsoUserList.IsDirty
        End Get
    End Property

    Public Overrides ReadOnly Property IsValid() As Boolean
        Get
            Return MyBase.IsValid AndAlso mSsoUserList.IsValid
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return "SsoMaintenance"
    End Function

#End Region

#Region " Authorisation Rules "

    Public Shared Function CanGetSsoUserMaintenance() As Boolean
        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return identity.IsProfileEditor AndAlso Not identity.IsUserManagementSystem
    End Function

#End Region

#Region " Factory Methods "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1024:UsePropertiesWhereAppropriate")> _
    Public Shared Function GetSsoUserMaintenance() As SsoUserMaintenance

        If Not CanGetSsoUserMaintenance() Then
            Throw New System.Security.SecurityException("You do not have permission to get the list of sso users.")
        End If

        Return DataPortal.Fetch(Of SsoUserMaintenance)(New Criteria())

    End Function

    Private Sub New()
        'requires use of factory 
    End Sub

#End Region

#Region " Data Access "

    <Serializable()> _
   Private Class Criteria

        Public Sub New()
            '
        End Sub

    End Class

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA1801:ReviewUnusedParameters")> _
    Private Overloads Sub DataPortal_Fetch(ByVal criteria As Criteria)

        Dim db As ServiceContracts.IUserMaintenanceService = DataFactory.GetUserMaintenanceService
        Dim dtoSsoMaintenance As DataContracts.SsoUserMaintenance = db.GetSsoUserMaintenance()

        mSsoProfileList = SsoProfileInfoList.GetSsoProfileInfoList(dtoSsoMaintenance.SsoProfileList)
        mSsoUserList = SsoUserList.GetSsoUserList(dtoSsoMaintenance.SsoUserList, mSsoProfileList)

    End Sub

    Protected Overrides Sub DataPortal_Update()

        Dim db As ServiceContracts.IUserMaintenanceService = DataFactory.GetUserMaintenanceService()
        Dim changeset As New DataContracts.SsoUserChangeset

        Dim updateRequired As Boolean = False

        If mSsoUserList.IsDirty Then
            mSsoUserList.GetUpdate(changeset.SsoUserUpdateList)
            Dim result As DataContracts.ChangeResult = db.UpdateSsoUsers(changeset)
            mSsoUserList.DoUpdate(result)
            MarkOld()
        End If

    End Sub

#End Region

End Class
