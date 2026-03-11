Imports Csla
Imports Profiles.Contracts

<System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Naming", "CA1710:IdentifiersShouldHaveCorrectSuffix")> <Serializable()> _
Public MustInherit Class PrioritisationCriterionListBase
    Inherits BusinessListBase(Of PrioritisationCriterionListBase, PrioritisationCriterionBase)

#Region " Factory Methods "

    Public Function GetById(ByVal criterionId As Guid) As PrioritisationCriterionBase

        For Each currentCriterion As PrioritisationCriterionBase In Me
            If currentCriterion.Id = criterionId Then
                Return currentCriterion
            End If
        Next

        Return Nothing

    End Function

#End Region

#Region " Data Access "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Protected MustOverride Sub Fetch(ByVal dtoPrioritisationCriterionList As List(Of DataContracts.PrioritisationCriterion))

    Friend Sub Update()

        RaiseListChangedEvents = False

        For Each item As PrioritisationCriterionBase In Me
            If Not item.IsNew Then
                item.Update()
            End If
        Next
        RaiseListChangedEvents = True

    End Sub

    Friend Sub GetUpdate(ByVal changeset As DataContracts.PrioritisationChangeSet)

        For Each item As PrioritisationCriterionBase In Me
            If Not item.IsNew Then
                item.GetUpdate(changeset)
            End If
        Next

    End Sub

#End Region

End Class
