Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class GetSpeciesValidParentsRequest

        Private mSpeciesId As Guid

        <DataMember()> _
        Public Property SpeciesId() As Guid
            Get
                Return mSpeciesId
            End Get
            Set(ByVal value As Guid)
                mSpeciesId = value
            End Set
        End Property

        Public Sub New(ByVal speciesId As Guid)
            mSpeciesId = speciesId
        End Sub

    End Class

End Namespace

