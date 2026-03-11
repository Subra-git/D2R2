Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class ProfileVersionDataList
    Inherits ReadOnlyListBase(Of ProfileVersionDataList, ProfileVersionData)

#Region " Factory Methods "

    Friend Shared Function GetProfileVersionDataList(ByVal dtoProfileVersionDataList As List(Of DataContracts.ProfileVersionData)) As ProfileVersionDataList
        Return New ProfileVersionDataList(dtoProfileVersionDataList)
    End Function

    Private Sub New()
        'requires use of factory
    End Sub

    Private Sub New(ByVal dtoProfileVersionDataList As List(Of DataContracts.ProfileVersionData))
        Fetch(dtoProfileVersionDataList)
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal dtoProfileVersionDataList As List(Of DataContracts.ProfileVersionData))

        RaiseListChangedEvents = False
        IsReadOnly = False

        For Each dtoProfileVersionData As DataContracts.ProfileVersionData In dtoProfileVersionDataList
            Me.Add(ProfileVersionData.GetProfileVersionData(dtoProfileVersionData))
        Next

        IsReadOnly = True
        RaiseListChangedEvents = True

    End Sub

#End Region

End Class
