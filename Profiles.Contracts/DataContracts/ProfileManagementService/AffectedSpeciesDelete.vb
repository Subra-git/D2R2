Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class AffectedSpeciesDelete

        Private mProfileVersionId As Guid
        Private mSpeciesId As Guid

        <DataMember()> _
        Public Property ProfileVersionId() As Guid
            Get
                Return mProfileVersionId
            End Get
            Set(ByVal value As Guid)
                mProfileVersionId = value
            End Set
        End Property

        <DataMember()> _
        Public Property SpeciesId() As Guid
            Get
                Return mSpeciesId
            End Get
            Set(ByVal value As Guid)
                mSpeciesId = value
            End Set
        End Property

    End Class

End Namespace




