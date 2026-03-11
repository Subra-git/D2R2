Imports Csla
Imports Profiles.Contracts

<System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Naming", "CA1710:IdentifiersShouldHaveCorrectSuffix")> <Serializable()> _
Public MustInherit Class PrioritisationCategoryListBase
    Inherits BusinessListBase(Of PrioritisationCategoryListBase, PrioritisationCategoryBase)

#Region " Business Methods "

    Public Function GetById(ByVal categoryId As Guid) As PrioritisationCategoryBase

        For Each currentCategory As PrioritisationCategoryBase In Me
            If currentCategory.Id = categoryId Then
                Return currentCategory
            End If
        Next

        Return Nothing

    End Function

#End Region

#Region " Data Access "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Protected MustOverride Sub Fetch(ByVal dtoPrioritisationCategoryList As List(Of DataContracts.PrioritisationCategory))

    Friend Sub Update()

        RaiseListChangedEvents = False

        For Each item As PrioritisationCategoryBase In Me
            If Not item.IsNew Then
                item.Update()
            End If
        Next

        RaiseListChangedEvents = True

    End Sub

    Friend Sub GetUpdate(ByVal changeset As DataContracts.PrioritisationChangeSet)

        For Each item As PrioritisationCategoryBase In Me
            If Not item.IsNew Then
                item.GetUpdate(changeset)
            End If
        Next

    End Sub

#End Region

End Class
