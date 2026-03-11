
Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class ChangeSpeciesPositionCommand
    Inherits CommandBase

#Region " Authorization Rules "

    Public Shared Function CanExecuteCommand() As Boolean

        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return identity.IsProfileEditor AndAlso Not identity.IsUserManagementSystem

    End Function

#End Region

#Region " Client-side Code "

    Private mSpeciesId As Guid
    Private mIsMovingUp As Boolean

    Public ReadOnly Property SpeciesId() As Guid
        Get
            Return mSpeciesId
        End Get
    End Property

    Public ReadOnly Property IsMovingUp() As Boolean
        Get
            Return mIsMovingUp
        End Get
    End Property

#End Region


#Region " Factory Methods "

    Public Shared Function Execute(ByVal speciesId As Guid, ByVal isMovingUp As Boolean) As Boolean
        If CanExecuteCommand() Then
            Dim command As New ChangeSpeciesPositionCommand(speciesId, isMovingUp)
            command = DataPortal.Execute(Of ChangeSpeciesPositionCommand)(command)
            Return True
        Else
            Return False
        End If

    End Function

    Private Sub New(ByVal speciesId As Guid, ByVal isMovingUp As Boolean)
        mSpeciesId = speciesId
        mIsMovingUp = isMovingUp
    End Sub

#End Region

#Region " Server-side Code "

    Protected Overrides Sub DataPortal_Execute()

        Dim db As ServiceContracts.ISpeciesMaintenanceService = DataFactory.GetSpeciesMaintenanceService()
        db.ChangeSpeciesPosition(New DataContracts.ChangeSpeciesPositionRequest(mSpeciesId, mIsMovingUp))

    End Sub

#End Region

End Class

