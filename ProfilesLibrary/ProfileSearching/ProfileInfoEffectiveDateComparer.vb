Public Class ProfileInfoEffectiveDateComparer
    Implements IComparer(Of ProfileInfo)

    Private ReadOnly ascendingOrder As Boolean

    Public Sub New(ascendingOrder As Boolean)
        Me.ascendingOrder = ascendingOrder
    End Sub

    Public Function Compare(x As ProfileInfo, y As ProfileInfo) As Integer Implements IComparer(Of ProfileInfo).Compare
		Dim xRecentDate As DateTime = GetMaxLastContributionDate(x)
		Dim yRecentDate As DateTime = GetMaxLastContributionDate(y)

		If ascendingOrder Then
			Return xRecentDate.CompareTo(yRecentDate)
		Else
			Return yRecentDate.CompareTo(xRecentDate)
		End If
    End Function

	Private Function GetMaxLastContributionDate(profile As ProfileInfo) As DateTime
		Dim recentDate As DateTime = profile.GetScenarios() _
								.SelectMany(Function(x) x.GetAllVersions()) _
								.Select(Function(versionInfo) If(versionInfo.LastContributionDate = DateTime.MinValue, versionInfo.EffectiveDateFrom, versionInfo.LastContributionDate)) _
								.Max()
		Return recentDate
	End Function
End Class