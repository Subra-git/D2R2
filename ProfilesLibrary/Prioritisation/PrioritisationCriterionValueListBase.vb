Imports Csla
Imports Profiles.Contracts

<System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Naming", "CA1710:IdentifiersShouldHaveCorrectSuffix")> <Serializable()> _
Public MustInherit Class PrioritisationCriterionValueListBase
    Inherits BusinessListBase(Of PrioritisationCriterionValueListBase, PrioritisationCriterionValueBase)

#Region " Business Methdods "

    Public Function GetById(ByVal criterionValueId As Guid) As PrioritisationCriterionValueBase

        For Each currentValue As PrioritisationCriterionValueBase In Me
            If currentValue.Id = criterionValueId Then
                Return currentValue
            End If
        Next

        Return Nothing

    End Function

#End Region

#Region " Factory Methods "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Protected MustOverride Sub Fetch(ByVal dtoPrioritisationCriterionValueList As List(Of DataContracts.PrioritisationCriterionValue))

#End Region

#Region " Data Access "

    Friend Sub Update()

        RaiseListChangedEvents = False

        For Each item As PrioritisationCriterionValueBase In Me
            If Not item.IsNew Then
                item.Update()
            End If
        Next
        RaiseListChangedEvents = True

    End Sub

    Friend Sub GetUpdate(ByVal changeset As DataContracts.PrioritisationChangeSet)

        For Each item As PrioritisationCriterionValueBase In Me
            If Not item.IsNew Then
                item.GetUpdate(changeset)
            End If
        Next

    End Sub

#End Region

End Class
