Imports Csla
Imports Profiles.Contracts

<System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Naming", "CA1710:IdentifiersShouldHaveCorrectSuffix")> <Serializable()> _
Public Class SpeciesInfoList
    Inherits ReadOnlyListBase(Of SpeciesInfoList, SpeciesInfo)


#Region " Business Methods "

    Public Function FindSpeciesById(ByVal id As Guid) As SpeciesInfo
        For Each species As SpeciesInfo In Me
            If species.Id = id Then
                Return species
            End If
        Next
        Return Nothing
    End Function

    Public Function FindSpeciesByName(ByVal name As String) As SpeciesInfo
        For Each species As SpeciesInfo In Me
            If species.Description = name Then
                Return species
            End If
        Next
        Return Nothing
    End Function

#End Region

#Region " Authorization Rules "

    Public Shared Function CanGetList() As Boolean

        Return True 'anyone can view this list, even anonymous users
    End Function

#End Region

#Region " Factory Methods "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1024:UsePropertiesWhereAppropriate")> _
    Public Shared Function GetList() As SpeciesInfoList

        If Not CanGetList() Then
            Throw New System.Security.SecurityException("You do not have permission to view a list of species.")
        End If

        Return DataPortal.Fetch(Of SpeciesInfoList)(New Criteria())

    End Function

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Friend Shared Function NewList() As SpeciesInfoList

        Return New SpeciesInfoList

    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

#End Region

#Region " Data Access "

    <Serializable()> _
    Private Class Criteria

        Public Sub New()
        End Sub

    End Class

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA1801:ReviewUnusedParameters", MessageId:="criteria")> _
    Private Overloads Sub DataPortal_Fetch(ByVal criteria As Criteria)

        RaiseListChangedEvents = False
        IsReadOnly = False

        Dim speciesDictionary As New Generic.Dictionary(Of Guid, SpeciesInfo)

        Dim db As ServiceContracts.ISpeciesDataService = DataFactory.GetSpeciesDataService()
        Dim speciesList As List(Of DataContracts.SpeciesData) = db.GetAllSpecies()

        For Each currentSpeciesData As DataContracts.SpeciesData In speciesList
            Dim currentInfo As SpeciesInfo = SpeciesInfo.GetSpeciesInfo(currentSpeciesData)
            speciesDictionary.Add(currentInfo.Id, currentInfo)
        Next

        For Each currentSpeciesInfo As SpeciesInfo In speciesDictionary.Values
            If currentSpeciesInfo.ParentId.Equals(Guid.Empty) Then
                Add(currentSpeciesInfo)
            Else
                speciesDictionary(currentSpeciesInfo.ParentId).AddChild(currentSpeciesInfo)
            End If
        Next

        IsReadOnly = True
        RaiseListChangedEvents = True

    End Sub

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Friend Sub AddSpecies(ByVal child As SpeciesInfo)

        RaiseListChangedEvents = False
        IsReadOnly = False
        Add(child)
        IsReadOnly = True
        RaiseListChangedEvents = True

    End Sub

#End Region

End Class


