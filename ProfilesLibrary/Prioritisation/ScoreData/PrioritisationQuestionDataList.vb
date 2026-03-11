Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class PrioritisationQuestionDataList
    Inherits ReadOnlyListBase(Of PrioritisationQuestionDataList, PrioritisationQuestionData)

#Region " Factory Methods "

    Friend Shared Function GetPrioritisationQuestionDataList(ByVal dtoQuestionDataList As List(Of DataContracts.PrioritisationQuestionData)) As PrioritisationQuestionDataList
        Return New PrioritisationQuestionDataList(dtoQuestionDataList)
    End Function

    Private Sub New()
        'requires use of factory
    End Sub

    Private Sub New(ByVal dtoQuestionDataList As List(Of DataContracts.PrioritisationQuestionData))
        Fetch(dtoQuestionDataList)
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal dtoQuestionDataList As List(Of DataContracts.PrioritisationQuestionData))

        RaiseListChangedEvents = False
        IsReadOnly = False

        For Each dtoQuestionData As DataContracts.PrioritisationQuestionData In dtoQuestionDataList
            Me.Add(PrioritisationQuestionData.GetPrioritisationQuestionData(dtoQuestionData))
        Next

        IsReadOnly = True
        RaiseListChangedEvents = True

    End Sub

#End Region


End Class
