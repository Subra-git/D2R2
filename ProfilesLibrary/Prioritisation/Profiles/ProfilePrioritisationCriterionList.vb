Imports Profiles.Contracts

<Serializable()> _
Public Class ProfilePrioritisationCriterionList
    Inherits PrioritisationCriterionListBase

#Region " Factory Methods "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Friend Shared Function GetPrioritisationCriterionList(ByVal dtoPrioritisationCriterionList As List(Of DataContracts.PrioritisationCriterion)) As ProfilePrioritisationCriterionList
        Return New ProfilePrioritisationCriterionList(dtoPrioritisationCriterionList)
    End Function

    Private Sub New()
        ' requires use of factory
    End Sub

    Private Sub New(ByVal dtoPrioritisationCriterionList As List(Of DataContracts.PrioritisationCriterion))
        Fetch(dtoPrioritisationCriterionList)
        MarkAsChild()
        AllowNew = False
        AllowRemove = False
    End Sub

#End Region

#Region " Data Access "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Protected Overrides Sub Fetch(ByVal dtoPrioritisationCriterionList As List(Of DataContracts.PrioritisationCriterion))

        RaiseListChangedEvents = False

        For Each dtoPrioritisationCriterion As DataContracts.ProfilePrioritisationCriterion In dtoPrioritisationCriterionList
            Add(ProfilePrioritisationCriterion.GetPrioritisationCriterion(dtoPrioritisationCriterion))
        Next

        RaiseListChangedEvents = True

    End Sub

#End Region

End Class
