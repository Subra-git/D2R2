Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class ProfileVersionData

        Private mId As Guid
        Private mProfileId As Guid
        Private mVersionMajor As Integer
        Private mVersionMinor As Integer
        Private mProfileVersionState As String
        Private mScenarioTitle As String
        Private mIsProfileScenario As Boolean
        Private mProfileStatusName As String
        Private mProfileStatusId As Guid
        Private mProfiledSpeciesDataList As List(Of ProfiledSpeciesData)
        Private mCommonAnswerDataList As List(Of CommonAnswerData)
        Private mPrioritisationScoreDataList As List(Of PrioritisationScoreData)
        Private mPrioritisationAnswerDataList As List(Of PrioritisationAnswerData)

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
        Public Property VersionMajor() As Integer
            Get
                Return mVersionMajor
            End Get
            Set(ByVal value As Integer)
                mVersionMajor = value
            End Set
        End Property

        <DataMember()> _
        Public Property VersionMinor() As Integer
            Get
                Return mVersionMinor
            End Get
            Set(ByVal value As Integer)
                mVersionMinor = value
            End Set
        End Property

        <DataMember()> _
        Public Property ProfileVersionState() As String
            Get
                Return mProfileVersionState
            End Get
            Set(ByVal value As String)
                mProfileVersionState = value
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
        Public Property IsProfileScenario() As Boolean
            Get
                Return mIsProfileScenario
            End Get
            Set(ByVal value As Boolean)
                mIsProfileScenario = value
            End Set
        End Property

        <DataMember()> _
        Public Property ProfileStatusName() As String
            Get
                Return mProfileStatusName
            End Get
            Set(ByVal value As String)
                mProfileStatusName = value
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
        Public Property ProfiledSpeciesDataList() As List(Of ProfiledSpeciesData)
            Get
                Return mProfiledSpeciesDataList
            End Get
            Set(ByVal value As List(Of ProfiledSpeciesData))
                mProfiledSpeciesDataList = value
            End Set
        End Property

        <DataMember()> _
        Public Property CommonAnswerDataList() As List(Of CommonAnswerData)
            Get
                Return mCommonAnswerDataList
            End Get
            Set(ByVal value As List(Of CommonAnswerData))
                mCommonAnswerDataList = value
            End Set
        End Property

        <DataMember()> _
        Public Property PrioritisationScoreDataList() As List(Of PrioritisationScoreData)
            Get
                Return mPrioritisationScoreDataList
            End Get
            Set(ByVal value As List(Of PrioritisationScoreData))
                mPrioritisationScoreDataList = value
            End Set
        End Property

        <DataMember()> _
        Public Property PrioritisationAnswerDataList() As List(Of PrioritisationAnswerData)
            Get
                Return mPrioritisationAnswerDataList
            End Get
            Set(ByVal value As List(Of PrioritisationAnswerData))
                mPrioritisationAnswerDataList = value
            End Set
        End Property

        Public Sub New()
            mProfiledSpeciesDataList = New List(Of ProfiledSpeciesData)
            mCommonAnswerDataList = New List(Of CommonAnswerData)
            mPrioritisationScoreDataList = New List(Of PrioritisationScoreData)
            mPrioritisationAnswerDataList = New List(Of PrioritisationAnswerData)
        End Sub

    End Class

End Namespace

