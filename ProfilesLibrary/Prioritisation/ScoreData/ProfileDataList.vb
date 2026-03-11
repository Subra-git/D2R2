Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class ProfileDataList
    Inherits ReadOnlyListBase(Of ProfileDataList, ProfileData)


#Region " Factory Methods "

    Friend Shared Function GetProfileDataList(ByVal dtoProfileDataList As List(Of DataContracts.ProfileData)) As ProfileDataList
        Return New ProfileDataList(dtoProfileDataList)
    End Function

    Private Sub New()
        'requires use of factory
    End Sub

    Private Sub New(ByVal dtoProfileDataList As List(Of DataContracts.ProfileData))
        Fetch(dtoProfileDataList)
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal dtoProfileDataList As List(Of DataContracts.ProfileData))

        RaiseListChangedEvents = False
        IsReadOnly = False

        For Each dtoProfileData As DataContracts.ProfileData In dtoProfileDataList
            Me.Add(ProfileData.GetProfileData(dtoProfileData))
        Next

        IsReadOnly = True
        RaiseListChangedEvents = True

    End Sub


#End Region


End Class
