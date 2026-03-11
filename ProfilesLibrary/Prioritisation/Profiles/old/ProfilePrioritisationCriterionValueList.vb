Imports Csla
Imports Csla.Data
Imports System.Data.SqlClient

<System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Naming", "CA1710:IdentifiersShouldHaveCorrectSuffix")> <Serializable()> _
Public Class PrioritisationCriterionValueList
    Inherits BusinessListBase(Of PrioritisationCriterionValueList, PrioritisationCriterionValue)


    Public Function GetById(ByVal criterionValueId As Guid) As PrioritisationCriterionValue

        For Each currentValue As PrioritisationCriterionValue In Me
            If currentValue.Id = criterionValueId Then
                Return currentValue
            End If
        Next

        Return Nothing

    End Function


#Region " Factory Methods "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Friend Shared Function NewPrioritisationCriterionValueList() As PrioritisationCriterionValueList
        Return New PrioritisationCriterionValueList
    End Function


    Private Sub New()
        AllowNew = False
        AllowRemove = False
        MarkAsChild()
    End Sub


    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Friend Sub FetchPrioritisationCriterionValue(ByVal reader As SafeDataReader)
        Fetch(reader)
    End Sub

#End Region



#Region " Data Access "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Private Sub Fetch(ByVal reader As SafeDataReader)

        RaiseListChangedEvents = False
        Add(PrioritisationCriterionValue.GetPrioritisationCriterionValue(reader))
        RaiseListChangedEvents = True

    End Sub

    Friend Sub Update(ByVal connection As SqlConnection)

        RaiseListChangedEvents = False

        For Each item As PrioritisationCriterionValue In Me
            If Not item.IsNew Then
                item.Update(connection)
            End If
        Next
        RaiseListChangedEvents = True

    End Sub

#End Region

End Class

