Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class ProfileAttributes

        Private mId As Guid
        Private mTitle As String = String.Empty
        Private mScenarioTitle As String = String.Empty
        Private mParentId As Guid = Guid.Empty
        Private mProfileStatusId As Guid = Guid.Empty
        Private mParentTitle As String = String.Empty
        Private mCurrentDraftProfileVersionId As Guid = Guid.Empty
        Private mCurrentPublishedProfileVersionId As Guid = Guid.Empty
        Private mCurrentPublicVersionId As Guid = Guid.Empty
        Private mHasPublicScenarios As Boolean
        Private mLastUpdated(7) As Byte
        Private mAffectedSpeciesList As New List(Of AffectedSpecies)

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
        Public Property CurrentPublishedProfileVersionId() As Guid
            Get
                Return mCurrentPublishedProfileVersionId
            End Get
            Set(ByVal value As Guid)
                mCurrentPublishedProfileVersionId = value
            End Set
        End Property

        <DataMember()> _
        Public Property CurrentPublicVersionId() As Guid
            Get
                Return mCurrentPublicVersionId
            End Get
            Set(ByVal value As Guid)
                mCurrentPublicVersionId = value
            End Set
        End Property

        <DataMember()> _
        Public Property HasPublicScenarios() As Boolean
            Get
                Return mHasPublicScenarios
            End Get
            Set(ByVal value As Boolean)
                mHasPublicScenarios = value
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
            Public Property AffectedSpeciesList() As List(Of AffectedSpecies)
            Get
                Return mAffectedSpeciesList
            End Get
            Set(ByVal value As List(Of AffectedSpecies))
                mAffectedSpeciesList = value
            End Set
        End Property

    End Class

End Namespace







