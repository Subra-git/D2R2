Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class SpeciesValidParentList
    Inherits NameValueListBase(Of Guid, String)

    Public Shared Function CanGetList() As Boolean
        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return identity.IsProfileEditor AndAlso Not identity.IsUserManagementSystem
    End Function

#Region " Factory Methods "

    Public Shared Function GetList(ByVal speciesId As Guid) As SpeciesValidParentList

        If Not CanGetList() Then
            Throw New System.Security.SecurityException("You do not have permission to view a list of valid parents for a given species")
        End If

        Return DataPortal.Fetch(Of SpeciesValidParentList)(New SpeciesCriteria(speciesId))

    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

#End Region

#Region " Data Access "

    <Serializable()>
    Private Class SpeciesCriteria
        Private mSpeciesId As Guid
        Public ReadOnly Property SpeciesId() As Guid
            Get
                Return mSpeciesId
            End Get
        End Property
        Public Sub New(ByVal speciesId As Guid)
            mSpeciesId = speciesId
        End Sub
    End Class

    Protected Overrides Sub DataPortal_Fetch(ByVal criteria As Object)

        RaiseListChangedEvents = False
        IsReadOnly = False
        Dim speciesCriteria As SpeciesCriteria = DirectCast(criteria, SpeciesCriteria)

        Dim db As ServiceContracts.ISpeciesMaintenanceService = DataFactory.GetSpeciesMaintenanceService()
        Dim parents As List(Of DataContracts.SpeciesValidParent) = db.GetSpeciesValidParents(New DataContracts.GetSpeciesValidParentsRequest(speciesCriteria.SpeciesId))

        For Each parent As DataContracts.SpeciesValidParent In parents
            Add(New NameValueListBase(Of Guid, String).NameValuePair(parent.Id, parent.NamePlainText))
        Next

        IsReadOnly = True
        RaiseListChangedEvents = True

    End Sub

#End Region

End Class