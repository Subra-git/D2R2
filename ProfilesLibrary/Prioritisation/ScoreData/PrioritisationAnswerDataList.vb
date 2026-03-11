Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class PrioritisationAnswerDataList
    Inherits ReadOnlyListBase(Of PrioritisationAnswerDataList, PrioritisationAnswerData)

#Region " Business Methods "

    Public Function GetById(ByVal questionId As Guid, ByVal speciesId As Guid) As PrioritisationAnswerData

        For Each item As PrioritisationAnswerData In Me

            If item.Id = questionId AndAlso item.SpeciesId = speciesId Then
                Return item
            End If
        Next
        Return Nothing

    End Function

#End Region

#Region " Factory Methods "

    Friend Shared Function GetPrioritisationAnswerDataList(ByVal dtoAnswerDataList As List(Of DataContracts.PrioritisationAnswerData)) As PrioritisationAnswerDataList
        Return New PrioritisationAnswerDataList(dtoAnswerDataList)
    End Function

    Private Sub New()
        'requires use of factory method
    End Sub

    Private Sub New(ByVal dtoAnswerDataList As List(Of DataContracts.PrioritisationAnswerData))
        Fetch(dtoAnswerDataList)
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal dtoAnswerDataList As List(Of DataContracts.PrioritisationAnswerData))

        RaiseListChangedEvents = False
        IsReadOnly = False

        For Each dtoAnswerData As DataContracts.PrioritisationAnswerData In dtoAnswerDataList
            Me.Add(PrioritisationAnswerData.GetPrioritisationAnswerData(dtoAnswerData))
        Next

        IsReadOnly = True
        RaiseListChangedEvents = True

    End Sub

#End Region

End Class
