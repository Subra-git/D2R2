Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class SpeciesFieldMetadata
    Inherits FieldMetadataBase

#Region " Business Methods "

    Private mName As String = String.Empty

    Public ReadOnly Property Name() As String
        Get
            Return mName
        End Get
    End Property

#End Region

#Region " Factory Methods "

    Friend Shared Function GetSpeciesFieldMetadata(ByVal dtoSpeciesFieldMetadata As DataContracts.SpeciesFieldMetadata) As SpeciesFieldMetadata
        Return New SpeciesFieldMetadata(dtoSpeciesFieldMetadata)
    End Function

    Private Sub New(ByVal dtoSpeciesFieldMetadata As DataContracts.SpeciesFieldMetadata)
        Fetch(dtoSpeciesFieldMetadata)
    End Sub

    Private Sub New()
        'requires use of factory methods
    End Sub

#End Region

#Region " Data Access "

    Protected Overloads Sub Fetch(ByVal dtoSpeciesFieldMetadata As DataContracts.SpeciesFieldMetadata)
        mName = dtoSpeciesFieldMetadata.Name
        MyBase.Fetch(dtoSpeciesFieldMetadata)
    End Sub

#End Region


End Class

