Imports Profiles.Contracts

<System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Naming", "CA1710:IdentifiersShouldHaveCorrectSuffix")> <Serializable()> _
Public Class SpeciesPrioritisationCriterionValueList
    Inherits PrioritisationCriterionValueListBase

#Region " Factory Methods "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Friend Shared Function GetPrioritisationCriterionValueList(ByVal dtoPrioritisationCriterionValueList As List(Of DataContracts.PrioritisationCriterionValue)) As SpeciesPrioritisationCriterionValueList

        Return New SpeciesPrioritisationCriterionValueList(dtoPrioritisationCriterionValueList)

    End Function

    Private Sub New()
        ' requires use of factory methods
    End Sub

    Private Sub New(ByVal dtoPrioritisationCriterionValueList As List(Of DataContracts.PrioritisationCriterionValue))

        Fetch(dtoPrioritisationCriterionValueList)
        MarkAsChild()
        AllowNew = False
        AllowRemove = False

    End Sub

#End Region

#Region " Data Access "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Protected Overrides Sub Fetch(ByVal dtoPrioritisationCriterionValueList As List(Of DataContracts.PrioritisationCriterionValue))

        RaiseListChangedEvents = False

        For Each dtoPrioritisationCriterionValue As DataContracts.SpeciesPrioritisationCriterionValue In dtoPrioritisationCriterionValueList
            Add(SpeciesPrioritisationCriterionValue.GetPrioritisationCriterionValue(dtoPrioritisationCriterionValue))
        Next

        RaiseListChangedEvents = True

    End Sub

#End Region

End Class
