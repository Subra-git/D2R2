Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class AffectedSpeciesList
    Inherits BusinessListBase(Of AffectedSpeciesList, AffectedSpecies)

    Public Overloads Sub Add(ByVal speciesId As Guid, ByVal profileVersionId As Guid, ByVal cloneProfileVersionId As Guid, ByVal type As AffectedSpeciesType)

        If Contains(speciesId) Then
            Throw New InvalidOperationException("The specified species is already in the list of affected species.")
        End If

        Dim species As AffectedSpecies = AffectedSpecies.NewAffectedSpecies(speciesId, profileVersionId, cloneProfileVersionId, type)
        Me.Add(species)

    End Sub

    Public Overloads Sub Remove(ByVal speciesId As Guid)

        For Each species As AffectedSpecies In Me
            If species.SpeciesId.Equals(speciesId) Then
                Remove(species)
                Exit For
            End If
        Next

    End Sub

    Public Overloads Function Contains(ByVal speciesId As Guid) As Boolean

        For Each species As AffectedSpecies In Me
            If species.SpeciesId.Equals(speciesId) Then
                Return True
            End If
        Next
        Return False

    End Function

    Public Function CountOfType(ByVal type As AffectedSpeciesType) As Integer

        Dim total As Integer

        For Each species As AffectedSpecies In Me
            If species.Type = type Then
                total += 1
            End If
        Next

        Return total

    End Function

#Region " Factory Methods "

    Friend Shared Function NewAffectedSpeciesList() As AffectedSpeciesList
        Return New AffectedSpeciesList
    End Function

    Friend Shared Function GetAffectedSpeciesList(ByVal speciesList As List(Of DataContracts.AffectedSpecies), ByVal profileVersionId As Guid) As AffectedSpeciesList
        Return New AffectedSpeciesList(speciesList, profileVersionId, Guid.Empty)
    End Function

    Friend Shared Function GetAffectedSpeciesList(ByVal speciesList As List(Of DataContracts.AffectedSpecies), ByVal profileVersionId As Guid, ByVal cloneProfileVersionId As Guid) As AffectedSpeciesList
        Return New AffectedSpeciesList(speciesList, profileVersionId, cloneProfileVersionId)
    End Function

    Private Sub New()
        MarkAsChild()
    End Sub

    Private Sub New(ByVal speciesList As List(Of DataContracts.AffectedSpecies), ByVal profileVersionId As Guid, ByVal cloneProfileVersionId As Guid)
        MarkAsChild()
        Fetch(speciesList, profileVersionId, cloneProfileVersionId)
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal speciesList As List(Of DataContracts.AffectedSpecies), ByVal profileVersionId As Guid, ByVal cloneProfileVersionId As Guid)

        RaiseListChangedEvents = False
        For Each species As DataContracts.AffectedSpecies In speciesList
            Add(AffectedSpecies.GetAffectedSpecies(species, profileVersionId, cloneProfileVersionId))
        Next
        RaiseListChangedEvents = True

    End Sub

    Friend Function GetInsertList() As List(Of DataContracts.AffectedSpeciesInsert)

        Dim result As New List(Of DataContracts.AffectedSpeciesInsert)

        For Each item As AffectedSpecies In Me
            If item.IsNew Then
                result.Add(item.GetInsert())
            End If
        Next

        Return result

    End Function

    Friend Function GetDeleteList() As List(Of DataContracts.AffectedSpeciesDelete)

        Dim result As New List(Of DataContracts.AffectedSpeciesDelete)

        For Each item As AffectedSpecies In DeletedList
            result.Add(item.GetDelete())
        Next
        Return result

    End Function

    Friend Sub Update()

        RaiseListChangedEvents = False
        For Each item As AffectedSpecies In DeletedList
            item.DeleteSelf()
        Next
        DeletedList.Clear()

        For Each item As AffectedSpecies In Me
            If item.IsNew Then
                item.Insert()
            End If
        Next
        RaiseListChangedEvents = True

    End Sub

#End Region

End Class
