Imports Csla

<Serializable()> _
Public Class ProfileInfoList
    Inherits ReadOnlyListBase(Of ProfileInfoList, ProfileInfo)

#Region " Business Methods "

    Public Function GetById(ByVal profileId As Guid) As ProfileInfo

        For Each currentProfileInfo As ProfileInfo In Me
            If currentProfileInfo.ProfileVersionId.Equals(profileId) Then
                Return currentProfileInfo
            End If
        Next

        Return Nothing

    End Function

#End Region

#Region " Factory Methods "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Friend Shared Function NewProfileInfoList() As ProfileInfoList

        Return New ProfileInfoList()

    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

#End Region

#Region " Data Access "

    Friend Function AddProfileInfo(ByVal profileInfo As ProfileInfo) As ProfileInfo

        RaiseListChangedEvents = False
        IsReadOnly = False
        Add(profileInfo)
        IsReadOnly = True
        RaiseListChangedEvents = True

        Return profileInfo

    End Function

#End Region

End Class


