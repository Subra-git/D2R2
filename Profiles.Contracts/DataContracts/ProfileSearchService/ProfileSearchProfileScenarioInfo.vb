Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class ProfileSearchProfileScenarioInfo

        Private mId As Guid
        Private mProfileId As Guid
        Private mScenarioTitle As String = String.Empty
        Private mUserRole As String = String.Empty
        Private mProfileVersions As List(Of ProfileSearchProfileVersionSummaryInfo)
        Private mProfileStatus As String
        Private mNextReviewDate As DateTime? = Nothing
        Private mReviewIncomplete As Boolean = False

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
        Public Property ProfileId() As Guid
            Get
                Return mProfileId
            End Get
            Set(ByVal value As Guid)
                mProfileId = value
            End Set
        End Property

        <DataMember()> _
        Public Property ProfileStatus() As String
            Get
                Return mProfileStatus
            End Get
            Set(ByVal value As String)
                mProfileStatus = value
            End Set
        End Property

        <DataMember()> _
        Public Property NextReviewDate() As DateTime?
            Get
                Return mNextReviewDate
            End Get
            Set(ByVal value As DateTime?)
                mNextReviewDate = value
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
        Public Property UserRole() As String
            Get
                Return mUserRole
            End Get
            Set(ByVal value As String)
                mUserRole = value
            End Set
        End Property

        <DataMember()> _
        Public Property ReviewIncomplete() As Boolean
            Get
                Return mReviewIncomplete
            End Get
            Set(ByVal value As Boolean)
                mReviewIncomplete = value
            End Set
        End Property

        <DataMember()> _
        Public Property ProfileVersions() As List(Of ProfileSearchProfileVersionSummaryInfo)
            Get
                Return mProfileVersions
            End Get
            Set(ByVal value As List(Of ProfileSearchProfileVersionSummaryInfo))
                mProfileVersions = value
            End Set
        End Property

        Public Sub New()
            '
        End Sub

    End Class

End Namespace