Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class PrioritisationCategoryDataList
    Inherits ReadOnlyListBase(Of PrioritisationCategoryDataList, PrioritisationCategoryData)


#Region " Business Methods "

    Public Function GetById(ByVal categoryId As Guid) As PrioritisationCategoryData
        For Each item As PrioritisationCategoryData In Me
            If item.Id = categoryId Then
                Return item
            End If
        Next
        Return Nothing
    End Function

#End Region

#Region " Factory Methods "

    Friend Shared Function GetPrioritisationCategoryDataList(ByVal dtoCategoryDataList As List(Of DataContracts.PrioritisationCategoryData)) As PrioritisationCategoryDataList
        Return New PrioritisationCategoryDataList(dtoCategoryDataList)
    End Function

    Private Sub New()
        'requires use of factory methods
    End Sub

    Private Sub New(ByVal dtoCategoryDataList As List(Of DataContracts.PrioritisationCategoryData))
        Fetch(dtoCategoryDataList)
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal dtoCategoryDataList As List(Of DataContracts.PrioritisationCategoryData))

        RaiseListChangedEvents = False
        IsReadOnly = False

        For Each dtoCategoryData As DataContracts.PrioritisationCategoryData In dtoCategoryDataList
            Me.Add(PrioritisationCategoryData.GetPrioritisationCategoryData(dtoCategoryData))
        Next

        IsReadOnly = True
        RaiseListChangedEvents = True

    End Sub

#End Region

End Class
