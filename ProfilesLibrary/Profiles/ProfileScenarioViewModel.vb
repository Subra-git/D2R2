Public Class ProfileScenarioViewModel
	Public _scenario As ProfileScenarioInfo
	Public _draftVersion As ProfileVersionSummaryInfo
	Public _publishedVersion As ProfileVersionSummaryInfo
	Public _displayDraftVersions As Boolean
	Public _displayPublishedVersions As Boolean

	Public Property Scenario() As ProfileScenarioInfo
		Get
			Return _scenario
		End Get
		Set(ByVal value As ProfileScenarioInfo)
			_scenario = value
		End Set
	End Property

	Public Property DraftVersion() As ProfileVersionSummaryInfo
		Get
			Return Scenario().GetDraftVersions.SingleOrDefault(Function(x) x.IsCurrent)
		End Get
		Set(ByVal value As ProfileVersionSummaryInfo)
			_draftVersion = value
		End Set
	End Property

	Public Property PublishedVersion() As ProfileVersionSummaryInfo
		Get
			Return Scenario().GetPublishedVersions.SingleOrDefault(Function(x) x.IsCurrent)
		End Get
		Set(ByVal value As ProfileVersionSummaryInfo)
			_publishedVersion = value
		End Set
	End Property

	Public ReadOnly Property HasSearchResults() As Boolean
		Get
			If Not String.IsNullOrEmpty(Scenario().SearchResultsString) Then
				Return True
			End If
			Return False
		End Get
	End Property

	Public ReadOnly Property SearchResultsString() As String
		Get
			Return Scenario().SearchResultsString
		End Get
	End Property

	Public ReadOnly Property DraftVersionSearchResults() As String
		Get
			Return Scenario().GetDraftVersions.SingleOrDefault(Function(x) x.IsCurrent).SearchResults
		End Get
	End Property

	Public Readonly Property PublishedDates() As String
		Get
			Dim version As ProfileVersionSummaryInfo = PublishedVersion()
			Return If(version Is Nothing, "", version.EffectiveDates)
		End Get
	End Property

	Public Readonly Property DraftDates() As String
		Get
			Dim version As ProfileVersionSummaryInfo = DraftVersion()
			Return If(version Is Nothing, "", version.EffectiveDates)
		End Get
	End Property

	Public Readonly Property PublishedVersionNumber() As String
		Get
			Dim version As ProfileVersionSummaryInfo = PublishedVersion()
			Return If(version Is Nothing, "(No current published version)", version.Version)
		End Get
	End Property

	Public Readonly Property DraftVersionNumber() As String
		Get
			Dim version As ProfileVersionSummaryInfo = DraftVersion()
			Return If(version Is Nothing, "(No current draft version)", version.Version)
		End Get
	End Property

	Public Readonly Property ScenarioProfileStatus() As String
		Get
			If String.IsNullOrEmpty(Scenario.ProfileStatus) Then
				Return "None"
			Else
				Return Scenario.ProfileStatus
			End If
		End Get
	End Property

	Public Readonly Property ProfileStatus() As String
		Get
			If PublishedVersion IsNot Nothing Then
				Return PublishedVersion.Status.ToString()
			End If
			Return ""
		End Get
	End Property

	Public Readonly Property ProfileReviewStatus() As String
		Get
			If Scenario.NextReviewDate.IsEmpty Then
				If Scenario.ReviewIncomplete Then
					Return "Review incomplete"
				Else
					Return "Review complete"
				End If
			Else
				If Scenario.NextReviewDate < DateTime.Now() Then
					Return "Review overdue: " & Scenario.NextReviewDate.ToString()
				Else
					Return "Next review: " & Scenario.NextReviewDate.ToString()
				End If
			End If
		End Get
	End Property
End Class

