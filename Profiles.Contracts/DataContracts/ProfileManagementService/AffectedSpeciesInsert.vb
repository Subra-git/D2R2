Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class AffectedSpeciesInsert

        Private mProfileVersionId As Guid
        Private mCloneProfileVersionId As Guid
        Private mSpeciesId As Guid
        Private mType As String = String.Empty

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
        Public Property CloneProfileVersionId() As Guid
            Get
                Return mCloneProfileVersionId
            End Get
            Set(ByVal value As Guid)
                mCloneProfileVersionId = value
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

        <DataMember()> _
        Public Property Type() As String
            Get
                Return mType
            End Get
            Set(ByVal value As String)
                mType = value
            End Set
        End Property

    End Class

End Namespace



