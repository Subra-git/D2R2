Imports System.Runtime.Serialization

Namespace DataContracts

	<DataContract()>
	Public Class ProfileSearchProfileVersionSummaryInfo

		Private mId As Guid
		Private mScenarioId As Guid
		Private mProfileId As Guid
		Private mVersionMajor As Byte
		Private mVersionMinor As Byte
		Private mIsPublished As Boolean
		Private mIsPublic As Boolean
		Private mEffectiveDateFrom As Date
		Private mEffectiveDateTo As Date
		Private mLastContributionDate As DateTime
		Private mAffectedSpecies As List(Of ProfileSearchProfileAffectedSpecies)
		Private mAnswers As List(Of ProfileSearchProfileAnswer)
		Private mNotes As List(Of ProfileSearchProfileNote)

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
		Public Property ScenarioId() As Guid
			Get
				Return mScenarioId
			End Get
			Set(ByVal value As Guid)
				mScenarioId = value
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
		Public Property IsPublic() As Boolean
			Get
				Return mIsPublic
			End Get
			Set(ByVal value As Boolean)
				mIsPublic = value
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
		Public Property EffectiveDateFrom() As Date
			Get
				Return mEffectiveDateFrom
			End Get
			Set(ByVal value As Date)
				mEffectiveDateFrom = value
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
		Public Property AffectedSpecies() As List(Of ProfileSearchProfileAffectedSpecies)
			Get
				Return mAffectedSpecies
			End Get
			Set(ByVal value As List(Of ProfileSearchProfileAffectedSpecies))
				mAffectedSpecies = value
			End Set
		End Property

		<DataMember()>
		Public Property Answers() As List(Of ProfileSearchProfileAnswer)
			Get
				Return mAnswers
			End Get
			Set(ByVal value As List(Of ProfileSearchProfileAnswer))
				mAnswers = value
			End Set
		End Property

		<DataMember()>
		Public Property Notes() As List(Of ProfileSearchProfileNote)
			Get
				Return mNotes
			End Get
			Set(ByVal value As List(Of ProfileSearchProfileNote))
				mNotes = value
			End Set
		End Property

		Public Sub New(ByVal id As Guid,
					   ByVal scenarioId As Guid,
					   ByVal profileId As Guid,
					   ByVal versionMajor As Byte,
					   ByVal versionMinor As Byte,
					   ByVal isPublished As Boolean,
					   ByVal isPublic As Boolean,
					   ByVal effectiveDateFrom As Date,
					   ByVal effectiveDateTo As Date,
					   ByVal affectedSpecies As List(Of ProfileSearchProfileAffectedSpecies),
					   ByVal answers As List(Of ProfileSearchProfileAnswer),
					   ByVal notes As List(Of ProfileSearchProfileNote))
			mId = id
			mScenarioId = scenarioId
			mProfileId = profileId
			mVersionMajor = versionMajor
			mVersionMinor = versionMinor
			mIsPublished = isPublished
			mIsPublic = isPublic
			mEffectiveDateFrom = effectiveDateFrom
			mEffectiveDateTo = effectiveDateTo
			mAffectedSpecies = affectedSpecies
			mAnswers = answers
			mNotes = notes
		End Sub

		Public Sub New()
			'
		End Sub

	End Class

End Namespace
