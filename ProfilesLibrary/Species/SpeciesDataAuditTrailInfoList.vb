Imports Csla
Imports Profiles.Contracts

<System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Naming", "CA1710:IdentifiersShouldHaveCorrectSuffix")> <Serializable()> _
Public Class SpeciesDataAuditTrailInfoList
    Inherits ReadOnlyListBase(Of SpeciesDataAuditTrailInfoList, SpeciesDataAuditTrailInfo)

    Public Function GetItemById(ByVal speciesDataAuditTrailInfoId As Guid) As SpeciesDataAuditTrailInfo

        For Each currentInfo As SpeciesDataAuditTrailInfo In Me
            If currentInfo.Id = speciesDataAuditTrailInfoId Then
                Return currentInfo
            End If
        Next

        Return Nothing
    End Function


#Region " Authorization Rules "

    Public Shared Function CanGetList() As Boolean
        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return identity.IsProfileEditor AndAlso Not identity.IsUserManagementSystem
    End Function

#End Region

#Region " Factory Methods "

    Public Shared Function GetSpeciesDataAuditTrailInfoList() As SpeciesDataAuditTrailInfoList

        If Not CanGetList() Then
            Throw New System.Security.SecurityException("You do not have permission to view species data audit lists.")
        End If

        Return DataPortal.Fetch(Of SpeciesDataAuditTrailInfoList)(New Criteria())
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


    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA1801:ReviewUnusedParameters", MessageId:="criteria")> _
    Protected Overrides Sub DataPortal_Fetch(ByVal criteria As Object)

        RaiseListChangedEvents = False
        IsReadOnly = False
        ' load values

        Dim db As ServiceContracts.ISpeciesMaintenanceService = DataFactory.GetSpeciesMaintenanceService()
        Dim entries As List(Of DataContracts.SpeciesAuditTrailEntry) = db.GetSpeciesAuditTrail()

        For Each entry As DataContracts.SpeciesAuditTrailEntry In entries
            Add(SpeciesDataAuditTrailInfo.GetReadOnlyChild(entry))
        Next
        IsReadOnly = True
        RaiseListChangedEvents = True

    End Sub

#End Region

End Class
