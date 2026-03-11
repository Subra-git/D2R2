Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class AffectedSpecies

        Private mSpeciesId As Guid
        Private mName As String = String.Empty
        Private mType As String = String.Empty
        Private mIsActive As Boolean

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
        Public Property Name() As String
            Get
                Return mName
            End Get
            Set(ByVal value As String)
                mName = value
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

        <DataMember()> _
        Public Property IsActive() As Boolean
            Get
                Return mIsActive
            End Get
            Set(ByVal value As Boolean)
                mIsActive = value
            End Set
        End Property

    End Class

End Namespace


