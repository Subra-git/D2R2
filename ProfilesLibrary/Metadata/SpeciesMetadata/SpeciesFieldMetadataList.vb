Imports Csla
Imports Profiles.Contracts
<Serializable()> _
Public Class SpeciesFieldMetadataList
    Inherits FieldMetadataListBase

#Region " Authorization Rules "

    Public Shared Function CanGetList() As Boolean
        Return True
    End Function

#End Region

#Region " Factory Methods "

    Public Shared Function GetSpeciesFieldMetadataList(ByVal dtoFieldMetadataList As List(Of DataContracts.FieldMetadata)) As SpeciesFieldMetadataList

        If Not CanGetList() Then
            Throw New System.Security.SecurityException("You do not have permission to get a list of species field metadata")
        End If

        Return New SpeciesFieldMetadataList(dtoFieldMetadataList)
    End Function

    Protected Sub New()
        ' requires use of factory methods
    End Sub

    Private Sub New(ByVal dtoFieldMetadataList As List(Of DataContracts.FieldMetadata))
        Fetch(dtoFieldMetadataList)
    End Sub

#End Region

#Region " Data Access "

    Protected Overloads Sub Fetch(ByVal dtoFieldMetadataList As List(Of DataContracts.FieldMetadata))

        RaiseListChangedEvents = False
        IsReadOnly = False

        For Each dtoSpeciesFieldMetadata As DataContracts.SpeciesFieldMetadata In dtoFieldMetadataList

            Dim currentFieldMetadata As SpeciesFieldMetadata = SpeciesFieldMetadata.GetSpeciesFieldMetadata(dtoSpeciesFieldMetadata)
            Me.Add(currentFieldMetadata)

        Next

        RaiseListChangedEvents = True
        IsReadOnly = True

    End Sub

#End Region


End Class


