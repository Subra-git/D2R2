Imports Csla
Imports Profiles.Contracts

<System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Naming", "CA1710:IdentifiersShouldHaveCorrectSuffix")> _
<Serializable()> _
Public Class GlobalUserList
    Inherits BusinessListBase(Of GlobalUserList, GlobalUser)

    Public Function GetById(ByVal userId As Guid) As GlobalUser

        For Each currentEditor As GlobalUser In Me
            If currentEditor.Id.Equals(userId) Then
                Return currentEditor
            End If
        Next

        Return Nothing

    End Function

#Region " Authorization Rules "

    Public Shared Function CanGetGlobalUserList() As Boolean
        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return identity.IsProfileEditor AndAlso Not identity.IsUserManagementSystem
    End Function

    Public Shared Function CanEditGlobalUserList() As Boolean
        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return identity.IsProfileEditor AndAlso Not identity.IsUserManagementSystem
    End Function

#End Region

#Region " Factory Methods "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1024:UsePropertiesWhereAppropriate")> _
    Public Shared Function GetProfileEditorList() As GlobalUserList

        If Not CanGetGlobalUserList() Then
            Throw New System.Security.SecurityException("You do not have permission to view a list of global users.")
        End If

        Return DataPortal.Fetch(Of GlobalUserList)(New Criteria())

    End Function

    Public Overloads Function AddNew() As GlobalUser

        Dim editor As GlobalUser = GlobalUser.NewGlobalUser()
        Add(editor)
        Return editor

    End Function

    Public Overloads Function AddNew(ByVal profileEditorId As Guid) As GlobalUser

        Dim editor As GlobalUser = GlobalUser.NewGlobalUser(profileEditorId)
        Add(editor)
        Return editor

    End Function

    Public Overrides Function Save() As GlobalUserList

        If Not CanEditGlobalUserList() Then
            Throw New System.Security.SecurityException("You do not have permission to make changes to a list of global users.")
        End If
        Return MyBase.Save()

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

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA1801:ReviewUnusedParameters")> _
    Private Overloads Sub DataPortal_Fetch(ByVal criteria As Criteria)

        RaiseListChangedEvents = False

        Dim db As ServiceContracts.IUserMaintenanceService = DataFactory.GetUserMaintenanceService()
        Dim users As List(Of DataContracts.GlobalUser) = db.GetGlobalUsers()
        For Each user As DataContracts.GlobalUser In users
            Add(GlobalUser.GetGlobalUser(user))
        Next

        RaiseListChangedEvents = True

    End Sub

    Protected Overrides Sub DataPortal_Update()

        RaiseListChangedEvents = False

        Dim db As ServiceContracts.IUserMaintenanceService = DataFactory.GetUserMaintenanceService()
        Dim changeset As New DataContracts.GlobalUserChangeset

        Dim updateRequired As Boolean

        For Each item As GlobalUser In DeletedList
            'deletes are handled as updates in the data layer
            changeset.UpdateList.Add(item.GetUpdate())
            updateRequired = True
        Next

        For Each item As GlobalUser In Me
            If item.IsDirty OrElse item.IsNew Then
                'any other change is handled as an insert in the data layer
                changeset.InsertList.Add(item.GetInsert())
            End If
            updateRequired = True
        Next

        If updateRequired Then
            Dim result As DataContracts.ChangeResult = db.UpdateGlobalUsers(changeset)
            Dim currentInsert As Integer
            Dim currentUpdate As Integer

            RaiseListChangedEvents = False

            For Each item As GlobalUser In DeletedList
                item.DeleteSelf(result.LastUpdatedUpdateList(currentUpdate))
                currentUpdate += 1
            Next

            For Each item As GlobalUser In Me
                If item.IsDirty OrElse item.IsNew Then
                    item.InsertUpdate(result.IdInsertList(currentInsert), result.LastUpdatedInsertList(currentInsert))
                    currentInsert += 1
                End If
            Next

            RaiseListChangedEvents = True

        End If

    End Sub

#End Region

End Class

