Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class CommonAnswerDataList
    Inherits ReadOnlyListBase(Of CommonAnswerDataList, CommonAnswerData)

#Region " Business Methods "

    Public Function GetById(ByVal questionId As Guid) As CommonAnswerData

        For Each item As CommonAnswerData In Me
            If item.Id = questionId Then
                Return item
            End If
        Next
        Return Nothing
    End Function

#End Region

#Region " Factory Methods "

    Friend Shared Function GetCommonAnswerDataList(ByVal dtoCommonAnswerDataList As List(Of DataContracts.CommonAnswerData)) As CommonAnswerDataList
        Return New CommonAnswerDataList(dtoCommonAnswerDataList)
    End Function

    Private Sub New()
        'requires use of factory
    End Sub

    Private Sub New(ByVal dtoCommonAnswerDataList As List(Of DataContracts.CommonAnswerData))
        Fetch(dtoCommonAnswerDataList)
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal dtoCommonAnswerDataList As List(Of DataContracts.CommonAnswerData))

        RaiseListChangedEvents = False
        IsReadOnly = False

        For Each dtoCommonAnswerData As DataContracts.CommonAnswerData In dtoCommonAnswerDataList
            Me.Add(CommonAnswerData.GetCommonAnswerData(dtoCommonAnswerData))
        Next

        IsReadOnly = True
        RaiseListChangedEvents = True

    End Sub

#End Region

End Class
