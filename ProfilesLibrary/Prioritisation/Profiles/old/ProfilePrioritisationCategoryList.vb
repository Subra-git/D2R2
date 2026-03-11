Imports Csla
Imports Csla.Data
Imports System.Data.SqlClient

<System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Naming", "CA1710:IdentifiersShouldHaveCorrectSuffix")> <Serializable()> _
Public Class PrioritisationCategoryList
    Inherits BusinessListBase(Of PrioritisationCategoryList, PrioritisationCategory)

#Region " Factory Methods "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Friend Shared Function NewPrioritisationCategoryList() As PrioritisationCategoryList
        Return New PrioritisationCategoryList
    End Function

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Friend Shared Function GetPrioritisationCategoryList(ByVal reader As SafeDataReader) As PrioritisationCategoryList
        Return New PrioritisationCategoryList(reader)
    End Function

    Private Sub New()
        AllowNew = False
        AllowRemove = False
        MarkAsChild()
    End Sub

    Private Sub New(ByVal reader As SafeDataReader)
        AllowNew = False
        AllowRemove = False
        MarkAsChild()
        Fetch(reader)
    End Sub

    Public Function GetById(ByVal categoryId As Guid) As PrioritisationCategory

        For Each currentCategory As PrioritisationCategory In Me
            If currentCategory.Id = categoryId Then
                Return currentCategory
            End If
        Next

        Return Nothing

    End Function


#End Region

#Region " Data Access "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Private Sub Fetch(ByVal reader As SafeDataReader)

        RaiseListChangedEvents = False
        While reader.Read
            Add(PrioritisationCategory.GetPrioritisationCategory(reader))
        End While
        RaiseListChangedEvents = True

    End Sub

    Friend Sub Update(ByVal connection As SqlConnection)

        RaiseListChangedEvents = False

        For Each item As PrioritisationCategory In Me
            If Not item.IsNew Then
                item.Update(connection)
            End If
        Next

        RaiseListChangedEvents = True

    End Sub

#End Region

End Class

