Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class GetSpeciesAnswerDataRequest

        Private mSpeciesId As Guid

        <DataMember()> _
        Public Property SpeciesId() As Guid
            Get
                Return mSpeciesId
            End Get
            Private Set(ByVal value As Guid)
                mSpeciesId = value
            End Set
        End Property

        Public Sub New(ByVal speciesId As Guid)
            mSpeciesId = speciesId
        End Sub

        Public Sub New()
            '
        End Sub

    End Class

End Namespace