Imports Profiles.Contracts

<Serializable()> _
Public Class SpeciesPrioritisationCategory
    Inherits PrioritisationCategoryBase

#Region " Factory Methods "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Friend Shared Function GetPrioritisationCategory(ByVal dtoPrioritisationCategory As DataContracts.SpeciesPrioritisationCategory) As SpeciesPrioritisationCategory
        Return New SpeciesPrioritisationCategory(dtoPrioritisationCategory)
    End Function

    Private Sub New()
        ' requires use of factory methods
    End Sub

    Private Sub New(ByVal dtoPrioritisationCategory As DataContracts.SpeciesPrioritisationCategory)
        Fetch(dtoPrioritisationCategory)
        MarkAsChild()
    End Sub

#End Region

#Region " Data Access "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Protected Overloads Sub Fetch(ByVal dtoPrioritisationCategory As DataContracts.SpeciesPrioritisationCategory)

        MyBase.Fetch(dtoPrioritisationCategory)
        mPrioritisationCriteria = SpeciesPrioritisationCriterionList.GetPrioritisationCriterionList(dtoPrioritisationCategory.PrioritisationCriterionList)

    End Sub

#End Region

End Class
