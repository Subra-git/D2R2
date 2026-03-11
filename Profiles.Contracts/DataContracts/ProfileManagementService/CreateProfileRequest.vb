Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class CreateProfileRequest

        Private mId As Guid
        Private mCloneProfileVersionId As Guid
        Private mTitle As String = String.Empty
        Private mScenarioTitle As String = String.Empty
        Private mCurrentDraftProfileVersionId As Guid
        Private mParentId As Guid = Guid.Empty
        Private mParentTitle As String = String.Empty
        Private mProfileStatusId As Guid = Guid.Empty
        Private mAffectedSpeciesInsertList As New List(Of AffectedSpeciesInsert)

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
        Public Property CloneProfileVersionId() As Guid
            Get
                Return mCloneProfileVersionId
            End Get
            Set(ByVal value As Guid)
                mCloneProfileVersionId = value
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
        Public Property ProfileStatusId() As Guid
            Get
                Return mProfileStatusId
            End Get
            Set(ByVal value As Guid)
                mProfileStatusId = value
            End Set
        End Property

        <DataMember()> _
        Public Property CurrentDraftProfileVersionId() As Guid
            Get
                Return mCurrentDraftProfileVersionId
            End Get
            Set(ByVal value As Guid)
                mCurrentDraftProfileVersionId = value
            End Set
        End Property

        <DataMember()> _
        Public Property ParentId() As Guid
            Get
                Return mParentId
            End Get
            Set(ByVal value As Guid)
                mParentId = value
            End Set
        End Property

        <DataMember()> _
        Public Property ParentTitle() As String
            Get
                Return mParentTitle
            End Get
            Set(ByVal value As String)
                mParentTitle = value
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

    End Class

End Namespace








