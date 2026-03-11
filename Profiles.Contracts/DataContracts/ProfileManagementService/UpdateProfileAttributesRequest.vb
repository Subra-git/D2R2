Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class UpdateProfileAttributesRequest

        Private mId As Guid
        Private mTitle As String = String.Empty
        Private mScenarioTitle As String = String.Empty
        Private mAffectedSpeciesDeleteList As New List(Of AffectedSpeciesDelete)
        Private mAffectedSpeciesInsertList As New List(Of AffectedSpeciesInsert)
        Private mLastUpdated(7) As Byte

        <DataMember()> _
        Public Property Id() As Guid
            Get
                Return mId
            End Get
            Set(ByVal value As Guid)
                mId = value
            End Set
        End Property

        <DataMember()> _
        Public Property Title() As String
            Get
                Return mTitle
            End Get
            Set(ByVal value As String)
                mTitle = value
            End Set
        End Property

        <DataMember()> _
        Public Property ScenarioTitle() As String
            Get
                Return mScenarioTitle
            End Get
            Set(ByVal value As String)
                mScenarioTitle = value
            End Set
        End Property

        <DataMember()> _
           Public Property AffectedSpeciesDeleteList() As List(Of AffectedSpeciesDelete)
            Get
                Return mAffectedSpeciesDeleteList
            End Get
            Set(ByVal value As List(Of AffectedSpeciesDelete))
                mAffectedSpeciesDeleteList = value
            End Set
        End Property

        <DataMember()> _
            Public Property AffectedSpeciesInsertList() As List(Of AffectedSpeciesInsert)
            Get
                Return mAffectedSpeciesInsertList
            End Get
            Set(ByVal value As List(Of AffectedSpeciesInsert))
                mAffectedSpeciesInsertList = value
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

    End Class

End Namespace









