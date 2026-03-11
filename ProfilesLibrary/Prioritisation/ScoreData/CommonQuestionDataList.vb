Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class CommonQuestionDataList
    Inherits ReadOnlyListBase(Of CommonQuestionDataList, CommonQuestionData)

#Region " Factory Methods "

    Friend Shared Function GetCommonQuestionDataList(ByVal dtoCommonQuestionDataList As List(Of DataContracts.CommonQuestionData)) As CommonQuestionDataList
        Return New CommonQuestionDataList(dtoCommonQuestionDataList)
    End Function

    Private Sub New()
        ' requires use of factory
    End Sub

    Private Sub New(ByVal dtoCommonQuestionDataList As List(Of DataContracts.CommonQuestionData))
        Fetch(dtoCommonQuestionDataList)
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal dtoCommonQuestionDataList As List(Of DataContracts.CommonQuestionData))

        RaiseListChangedEvents = False
        IsReadOnly = False

        For Each dtoCommonQuestionData As DataContracts.CommonQuestionData In dtoCommonQuestionDataList
            Me.Add(CommonQuestionData.GetCommonQuestionData(dtoCommonQuestionData))
        Next

        IsReadOnly = True
        RaiseListChangedEvents = True

    End Sub

#End Region

End Class
