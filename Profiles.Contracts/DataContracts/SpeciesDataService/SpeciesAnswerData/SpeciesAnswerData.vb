Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class SpeciesAnswerData

        Private mSpeciesSectionList As List(Of SpeciesSection)
        Private mLastUpdated(7) As Byte
        Private mSpeciesId As Guid
        Private mSpeciesName As String

        <DataMember()> _
        Public Property SpeciesSectionList() As List(Of SpeciesSection)
            Get
                Return mSpeciesSectionList
            End Get
            Set(ByVal value As List(Of SpeciesSection))
                mSpeciesSectionList = value
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
        Public Property LastUpdated() As Byte()
            Get
                Return mLastUpdated
            End Get
            Set(ByVal value As Byte())
                mLastUpdated = value
            End Set
        End Property

        <DataMember()> _
        Public Property SpeciesName() As String
            Get
                Return mSpeciesName
            End Get
            Set(ByVal value As String)
                mSpeciesName = value
            End Set
        End Property

    End Class
End Namespace
