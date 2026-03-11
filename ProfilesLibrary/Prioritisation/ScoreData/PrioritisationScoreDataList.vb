Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class PrioritisationScoreDataList
    Inherits ReadOnlyListBase(Of PrioritisationScoreDataList, PrioritisationScoreData)

#Region " Business Methods "

    Public Function GetById(ByVal categoryId As Guid, ByVal speciesId As Guid) As PrioritisationScoreData

        For Each item As PrioritisationScoreData In Me

            If item.PrioritisationCategoryId = categoryId AndAlso item.SpeciesId = speciesId Then
                Return item
            End If

        Next
        Return Nothing
    End Function

#End Region

#Region " Factory Methods "

    Friend Shared Function GetPrioritisationScoreDataList(ByVal dtoPrioritisationScoreDataList As List(Of DataContracts.PrioritisationScoreData)) As PrioritisationScoreDataList
        Return New PrioritisationScoreDataList(dtoPrioritisationScoreDataList)
    End Function

    Private Sub New()
        'requires use of factory
    End Sub

    Private Sub New(ByVal dtoPrioritisationScoreDataList As List(Of DataContracts.PrioritisationScoreData))
        Fetch(dtoPrioritisationScoreDataList)
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal dtoPrioritisationScoreDataList As List(Of DataContracts.PrioritisationScoreData))

        RaiseListChangedEvents = False
        IsReadOnly = False

        For Each dtoPrioritisationScoreData As DataContracts.PrioritisationScoreData In dtoPrioritisationScoreDataList
            Me.Add(PrioritisationScoreData.GetPrioritisationScoreData(dtoPrioritisationScoreData))
        Next

        IsReadOnly = True
        RaiseListChangedEvents = True

    End Sub

#End Region

End Class
