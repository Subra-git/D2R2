Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class GetReferenceTableNameCommand
    Inherits CommandBase

#Region " Authorization Rules "

    Public Shared Function CanExecuteCommand() As Boolean

        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return identity.IsProfileEditor AndAlso Not identity.IsUserManagementSystem

    End Function

#End Region

#Region " Client-side Code "

    Private mReferenceTableId As Guid
    Private mReferenceTableName As String

    Public ReadOnly Property ReferenceTableId() As Guid
        Get
            Return mReferenceTableId
        End Get
    End Property

    Public ReadOnly Property ReferenceTableName() As String
        Get
            Return mReferenceTableName
        End Get
    End Property

#End Region


#Region " Factory Methods "

    Public Shared Function Execute(ByVal referenceTableId As Guid) As GetReferenceTableNameCommand

        If Not CanExecuteCommand() Then
            Throw New System.Security.SecurityException("You do not have permission to get the name of a reference table")
        End If

        Dim command As New GetReferenceTableNameCommand(referenceTableId)
        command = DataPortal.Execute(Of GetReferenceTableNameCommand)(command)
        Return command

    End Function

    Private Sub New(ByVal referenceTableId As Guid)

        mReferenceTableId = referenceTableId

    End Sub

#End Region

#Region " Server-side Code "

    Protected Overrides Sub DataPortal_Execute()

        Dim db As ServiceContracts.IReferenceValueService = DataFactory.GetReferenceValueService()
        Dim tableName As DataContracts.ReferenceTable = db.GetReferenceTable(New DataContracts.GetReferenceTableRequest(mReferenceTableId))
        If tableName IsNot Nothing Then
            mReferenceTableName = tableName.Name
        End If

    End Sub

#End Region

End Class