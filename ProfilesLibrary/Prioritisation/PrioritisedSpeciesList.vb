Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class PrioritisedSpeciesList
    Inherits NameValueListBase(Of Guid, String)

    Public Shared Function CanGetList() As Boolean
        Return Csla.ApplicationContext.User.Identity.IsAuthenticated
    End Function

#Region " Factory Methods "

    Public Shared Function GetList(ByVal profileVersionId As Guid) As PrioritisedSpeciesList

        If Not CanGetList() Then
            Throw New System.Security.SecurityException("You do not have permission to get a list of prioritised species for a profile version")
        End If

        Return DataPortal.Fetch(Of PrioritisedSpeciesList)(New ProfileVersionCriteria(profileVersionId))

    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

#End Region

#Region " Data Access "

    <Serializable()> _
    Private Class ProfileVersionCriteria
        Private mProfileVersionId As Guid
        Public ReadOnly Property ProfileVersionId() As Guid
            Get
                Return mProfileVersionId
            End Get
        End Property
        Public Sub New(ByVal profileVersionId As Guid)
            mProfileVersionId = profileVersionId
        End Sub
    End Class

    Protected Overrides Sub DataPortal_Fetch(ByVal criteria As Object)

        Dim profileCriteria As ProfileVersionCriteria = DirectCast(criteria, ProfileVersionCriteria)

        Dim db As ServiceContracts.IPrioritisationService = DataFactory.GetPrioritisationService()
        Dim dtoPrioritisedSpeciesList As List(Of DataContracts.PrioritisedSpecies) = db.GetPrioritisedSpecies(New DataContracts.ProfileVersionIdRequest(profileCriteria.ProfileVersionId))

        RaiseListChangedEvents = False
        IsReadOnly = False

        For Each item As DataContracts.PrioritisedSpecies In dtoPrioritisedSpeciesList

            Add(New NameValueListBase(Of Guid, String).NameValuePair(item.SpeciesId, item.Name))

        Next

        IsReadOnly = True
        RaiseListChangedEvents = True

    End Sub

#End Region

End Class
