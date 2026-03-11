Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class ProfileUserRoleList
    Inherits ReadOnlyListBase(Of ProfileUserRoleList, ProfileUserRole)

    Private Shared mProfileUserRoleList As ProfileUserRoleList = Nothing

#Region " Authorization Rules "

    Public Shared Function CanGetProfileUserRoles() As Boolean

        If DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity).IsUserManagementSystem Then
            Return False
        End If

        Return Csla.ApplicationContext.User.Identity.IsAuthenticated
    End Function

#End Region

#Region " Factory Methods "

    Public Shared Function GetProfileUserRole(ByVal roleId As Guid) As ProfileUserRole

        If Not CanGetProfileUserRoles() Then
            Throw New System.Security.SecurityException("You do not have permission to view a profile user role")
        End If

        If mProfileUserRoleList Is Nothing Then
            mProfileUserRoleList = DataPortal.Fetch(Of ProfileUserRoleList)(New Criteria())
        End If

        For Each role As ProfileUserRole In mProfileUserRoleList
            If role.Id = roleId Then
                Return role
            End If
        Next

        Return Nothing
    End Function


    Public Shared Function GetProfileUserRoleList() As ProfileUserRoleList

        If Not CanGetProfileUserRoles() Then
            Throw New System.Security.SecurityException("You do not have permission to view a list of profile user roles")
        End If

        'Use Lazy initialization
        If Not mProfileUserRoleList Is Nothing Then
            Return mProfileUserRoleList
        Else
            mProfileUserRoleList = DataPortal.Fetch(Of ProfileUserRoleList)(New Criteria())
            Return mProfileUserRoleList
        End If
    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

#End Region

#Region " Data Access "

    <Serializable()> _
   Private Class Criteria

        Public Sub New()
        End Sub

    End Class

    Private Overloads Sub DataPortal_Fetch(ByVal criteria As Criteria)

        RaiseListChangedEvents = False
        IsReadOnly = False

        Dim db As ServiceContracts.IUserMaintenanceService = DataFactory.GetUserMaintenanceService()
        Dim results As List(Of DataContracts.ProfileUserRole) = db.GetProfileUserRoles()

        For Each resultItem As DataContracts.ProfileUserRole In results
            Me.Add(ProfileUserRole.GetProfileUserRole(resultItem))
        Next
        
        IsReadOnly = True
        RaiseListChangedEvents = True

    End Sub

#End Region

End Class
