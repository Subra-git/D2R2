Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class ProfileSearchProfileVersionInfo

        Private mId As Guid
        Private mProfileId As Guid
        Private mParentProfileId As Guid
        Private mTitle As String = String.Empty
        Private mScenarioTitle As String = String.Empty
        Private mProfiledSpecies As String = String.Empty
        Private mProfiledSpeciesCount As Integer
        Private mOtherAffectedSpecies As String = String.Empty
        Private mOtherAffectedSpeciesCount As Integer
        Private mVersionMajor As Byte
        Private mVersionMinor As Byte
        Private mIsPublished As Boolean
        Private mEffectiveDateFrom As Date
		Private mEffectiveDateTo As Date
		Private mLastContributionDate As DateTime
		Private mIsLatestVersion As Boolean
		Private mIsPublic As Boolean
		Private mHasRelevantPublicScenarios As Boolean
		Private mProfileStatusId As Guid
		Private mProfileStatusName As String

		<DataMember()>
		Public Property Id() As Guid
			Get
				Return mId
			End Get
			Set(ByVal value As Guid)
				mId = value
			End Set
		End Property

		<DataMember()>
		Public Property ProfileId() As Guid
			Get
				Return mProfileId
			End Get
			Set(ByVal value As Guid)
				mProfileId = value
			End Set
		End Property

		<DataMember()>
		Public Property ParentProfileId() As Guid
			Get
				Return mParentProfileId
			End Get
			Set(ByVal value As Guid)
				mParentProfileId = value
			End Set
		End Property

		<DataMember()>
		Public Property Title() As String
			Get
				Return mTitle
			End Get
			Set(ByVal value As String)
				mTitle = value
			End Set
		End Property

		<DataMember()>
		Public Property ScenarioTitle() As String
			Get
				Return mScenarioTitle
			End Get
			Set(ByVal value As String)
				mScenarioTitle = value
			End Set
		End Property

		<DataMember()>
		Public Property ProfiledSpecies() As String
			Get
				Return mProfiledSpecies
			End Get
			Set(ByVal value As String)
				mProfiledSpecies = value
			End Set
		End Property

		<DataMember()>
		Public Property ProfiledSpeciesCount() As Integer
			Get
				Return mProfiledSpeciesCount
			End Get
			Set(ByVal value As Integer)
				mProfiledSpeciesCount = value
			End Set
		End Property

		<DataMember()>
		Public Property OtherAffectedSpecies() As String
			Get
				Return mOtherAffectedSpecies
			End Get
			Set(ByVal value As String)
				mOtherAffectedSpecies = value
			End Set
		End Property

		<DataMember()>
		Public Property OtherAffectedSpeciesCount() As Integer
			Get
				Return mOtherAffectedSpeciesCount
			End Get
			Set(ByVal value As Integer)
				mOtherAffectedSpeciesCount = value
			End Set
		End Property

		<DataMember()>
		Public Property VersionMajor() As Byte
			Get
				Return mVersionMajor
			End Get
			Set(ByVal value As Byte)
				mVersionMajor = value
			End Set
		End Property

		<DataMember()>
		Public Property VersionMinor() As Byte
			Get
				Return mVersionMinor
			End Get
			Set(ByVal value As Byte)
				mVersionMinor = value
			End Set
		End Property

		<DataMember()>
		Public Property IsPublished() As Boolean
			Get
				Return mIsPublished
			End Get
			Set(ByVal value As Boolean)
				mIsPublished = value
			End Set
		End Property

		<DataMember()>
		Public Property EffectiveDateFrom() As Date
			Get
				Return mEffectiveDateFrom
			End Get
			Set(ByVal value As Date)
				mEffectiveDateFrom = value
			End Set
		End Property

		<DataMember()>
		Public Property EffectiveDateTo() As Date
			Get
				Return mEffectiveDateTo
			End Get
			Set(ByVal value As Date)
				mEffectiveDateTo = value
			End Set
		End Property

		<DataMember()>
		Public Property LastContributionDate() As DateTime
			Get
				Return mLastContributionDate
			End Get
			Set(ByVal value As DateTime)
				mLastContributionDate = value
			End Set
		End Property

		<DataMember()>
		Public Property IsLatestVersion() As Boolean
            Get
                Return mIsLatestVersion
            End Get
            Set(ByVal value As Boolean)
                mIsLatestVersion = value
            End Set
        End Property

        <DataMember()> _
        Public Property IsPublic() As Boolean
            Get
                Return mIsPublic
            End Get
            Set(ByVal value As Boolean)
                mIsPublic = value
            End Set
        End Property

        <DataMember()> _
        Public Property HasRelevantPublicScenarios() As Boolean
            Get
                Return mHasRelevantPublicScenarios
            End Get
            Set(ByVal value As Boolean)
                mHasRelevantPublicScenarios = value
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
        Public Property ProfileStatusName() As String
            Get
                Return mProfileStatusName
            End Get
            Set(ByVal value As String)
                mProfileStatusName = value
            End Set
        End Property

        Public Sub New()
            '
        End Sub

    End Class

End Namespace
