Imports Profiles.Contracts

<Serializable()> _
Public Class ProfilePrioritisationCategory
    Inherits PrioritisationCategoryBase

#Region " Factory Methods "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Friend Shared Function GetPrioritisationCategory(ByVal dtoPrioritisationCategory As DataContracts.ProfilePrioritisationCategory) As ProfilePrioritisationCategory
        Return New ProfilePrioritisationCategory(dtoPrioritisationCategory)
    End Function

    Private Sub New()
        MarkAsChild()
    End Sub

    Private Sub New(ByVal dtoPrioritisationCategory As DataContracts.ProfilePrioritisationCategory)
        MarkAsChild()
        Fetch(dtoPrioritisationCategory)
    End Sub

#End Region

#Region " Data Access "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Protected Overloads Sub Fetch(ByVal dtoPrioritisationCategory As DataContracts.ProfilePrioritisationCategory)

        MyBase.Fetch(dtoPrioritisationCategory)
        mPrioritisationCriteria = ProfilePrioritisationCriterionList.GetPrioritisationCriterionList(dtoPrioritisationCategory.PrioritisationCriterionList)

    End Sub

#End Region

End Class
