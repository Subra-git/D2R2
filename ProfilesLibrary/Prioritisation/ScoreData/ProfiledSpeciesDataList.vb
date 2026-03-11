Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class ProfiledSpeciesDataList
    Inherits ReadOnlyListBase(Of ProfiledSpeciesDataList, ProfiledSpeciesData)

#Region " Factory Methods "

    Friend Shared Function GetProfiledSpeciesDataList(ByVal dtoProfiledSpeciesDataList As List(Of DataContracts.ProfiledSpeciesData)) As ProfiledSpeciesDataList
        Return New ProfiledSpeciesDataList(dtoProfiledSpeciesDataList)
    End Function

    Private Sub New()
        'requires use of factory
    End Sub

    Private Sub New(ByVal dtoProfiledSpeciesDataList As List(Of DataContracts.ProfiledSpeciesData))
        Fetch(dtoProfiledSpeciesDataList)
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal dtoProfiledSpeciesDataList As List(Of DataContracts.ProfiledSpeciesData))

        RaiseListChangedEvents = False
        IsReadOnly = False

        For Each dtoProfiledSpeciesData As DataContracts.ProfiledSpeciesData In dtoProfiledSpeciesDataList
            Me.Add(ProfiledSpeciesData.GetProfiledSpeciesData(dtoProfiledSpeciesData))
        Next

        IsReadOnly = True
        RaiseListChangedEvents = True

    End Sub

#End Region


End Class
