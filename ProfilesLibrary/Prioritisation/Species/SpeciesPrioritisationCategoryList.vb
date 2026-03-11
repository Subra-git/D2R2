Imports Profiles.Contracts

<System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Naming", "CA1710:IdentifiersShouldHaveCorrectSuffix")> <Serializable()> _
Public Class SpeciesPrioritisationCategoryList
    Inherits PrioritisationCategoryListBase

#Region " Factory Methods "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Friend Shared Function GetPrioritisationCategoryList(ByVal dtoPrioritisationCategoryList As List(Of DataContracts.PrioritisationCategory)) As SpeciesPrioritisationCategoryList
        Return New SpeciesPrioritisationCategoryList(dtoPrioritisationCategoryList)
    End Function

    Private Sub New()
        ' requires use of factory methods
    End Sub

    Private Sub New(ByVal dtoPrioritisationCategoryList As List(Of DataContracts.PrioritisationCategory))

        Fetch(dtoPrioritisationCategoryList)
        MarkAsChild()
        AllowNew = False
        AllowRemove = False

    End Sub

#End Region

#Region " Data Access "

    Protected Overrides Sub Fetch(ByVal dtoPrioritisationCategoryList As List(Of DataContracts.PrioritisationCategory))

        RaiseListChangedEvents = False

        For Each dtoPrioritisationCategory As DataContracts.SpeciesPrioritisationCategory In dtoPrioritisationCategoryList

            Add(SpeciesPrioritisationCategory.GetPrioritisationCategory(dtoPrioritisationCategory))

        Next

        RaiseListChangedEvents = True

    End Sub

#End Region

End Class
