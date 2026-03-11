Imports Csla
Imports Profiles.Contracts

Public Class ProfilePrioritisationCriterionValue
    Inherits PrioritisationCriterionValueBase

#Region " Validation Rules "

    Protected Overrides Sub AddBusinessRules()
        ValidationRules.AddRule(AddressOf Validation.CommonRules.IntegerMinValue, New Validation.CommonRules.IntegerMinValueRuleArgs("Score", 0))
        ValidationRules.AddRule(AddressOf Validation.CommonRules.IntegerMaxValue, New Validation.CommonRules.IntegerMaxValueRuleArgs("Score", 999))
    End Sub

#End Region

#Region " Factory Methods "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Friend Shared Function GetPrioritisationCriterionValue(ByVal dtoPrioritisationCriterionValue As DataContracts.ProfilePrioritisationCriterionValue) As ProfilePrioritisationCriterionValue
        Return New ProfilePrioritisationCriterionValue(dtoPrioritisationCriterionValue)
    End Function

    Private Sub New()
        ' requires use of factory methods
    End Sub

    Private Sub New(ByVal dtoPrioritisationCriterionValue As DataContracts.ProfilePrioritisationCriterionValue)
        Fetch(dtoPrioritisationCriterionValue)
        MarkAsChild()
    End Sub

#End Region

#Region " Data Access "

    Protected Overloads Sub Fetch(ByVal dtoPrioritisationCriterionValue As DataContracts.ProfilePrioritisationCriterionValue)
        MyBase.Fetch(dtoPrioritisationCriterionValue)
    End Sub

#End Region

End Class
