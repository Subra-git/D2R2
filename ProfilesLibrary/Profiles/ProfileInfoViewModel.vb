

Public Class ProfileInfoViewModel
	Public _profileInfo As ProfileInfo
	Public _scenarios As ProfileScenarioInfoList

	Public Property ProfileInfo() As ProfileInfo
		Get
			Return _profileInfo
		End Get
		Set(ByVal value As ProfileInfo)
			_profileInfo = value
		End Set
	End Property

	Public Property Scenarios() As ProfileScenarioInfoList
		Get
			Return ProfileInfo.GetScenarios()
		End Get
		Set(ByVal value As ProfileScenarioInfoList)
			_scenarios = value
		End Set
	End Property
End Class

