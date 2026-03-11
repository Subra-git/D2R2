Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class ProfileVersionSummaryInfoList
    Inherits ReadOnlyListBase(Of ProfileVersionSummaryInfoList, ProfileVersionSummaryInfo)

    Private mCurrentVersion As ProfileVersionSummaryInfo

    Public ReadOnly Property CurrentVersion() As ProfileVersionSummaryInfo
        Get
            Return mCurrentVersion
        End Get
    End Property

#Region " Factory Methods "

    Friend Shared Function NewProfileVersionSummaryInfoList() As ProfileVersionSummaryInfoList
        Return New ProfileVersionSummaryInfoList
    End Function

    Private Sub New()
        '
    End Sub

#End Region

#Region " Data Access "

    Friend Function FetchProfileVersion(ByVal profileVersionInfo As DataContracts.ProfileSearchProfileVersionSummaryInfo) As ProfileVersionSummaryInfo

        RaiseListChangedEvents = False
        IsReadOnly = False
        Dim version As ProfileVersionSummaryInfo = ProfileVersionSummaryInfo.GetProfileVersionSummaryInfo(profileVersionInfo)
        Add(version)
        If version.IsCurrent Then
            mCurrentVersion = version
        End If
        IsReadOnly = True
        RaiseListChangedEvents = True

        Return version

    End Function

    Friend Function AddProfileVersion(ByVal summaryInfo As ProfileVersionSummaryInfo) As ProfileVersionSummaryInfo

        RaiseListChangedEvents = False
        IsReadOnly = False
        Add(summaryInfo)
        IsReadOnly = True
        RaiseListChangedEvents = True

        Return summaryInfo

    End Function


#End Region

End Class



