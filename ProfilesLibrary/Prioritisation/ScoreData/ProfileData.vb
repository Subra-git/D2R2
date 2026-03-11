Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class ProfileData
    Inherits ReadOnlyBase(Of ProfileData)

    Private mId As Guid
    Private mTitle As String
    Private mStatusName As String
    Private mStatusId As Guid
    Private mProfileVersionDataList As ProfileVersionDataList

#Region " Business Methods "

    Public ReadOnly Property Id() As Guid
        Get
            Return mId
        End Get
    End Property

    Public ReadOnly Property Title() As String
        Get
            Return mTitle
        End Get
    End Property

    Public ReadOnly Property StatusName() As String
        Get
            Return mStatusName
        End Get
    End Property

    Public ReadOnly Property StatusId() As Guid
        Get
            Return mStatusId
        End Get
    End Property

    Public ReadOnly Property ProfileVersionDataList() As ProfileVersionDataList
        Get
            Return mProfileVersionDataList
        End Get
    End Property

    Public Function GetProfileSpeciesList() As List(Of Guid)

        Dim speciesList As New Dictionary(Of Guid, Guid)

        For Each version As ProfileVersionData In mProfileVersionDataList

            For Each species As ProfiledSpeciesData In version.ProfiledSpeciesDataList

                If Not speciesList.ContainsKey(species.Id) Then
                    speciesList.Add(species.Id, species.Id)
                End If

            Next

        Next

        Return speciesList.Values.ToList()

    End Function

    Public Function GetProfileVersionListBySpeciesId(ByVal speciesId As Guid) As List(Of ProfileVersionData)

        Dim versionList As New List(Of ProfileVersionData)

        For Each version As ProfileVersionData In mProfileVersionDataList

            For Each species As ProfiledSpeciesData In version.ProfiledSpeciesDataList

                If species.Id = speciesId Then
                    versionList.Add(version)
                End If

            Next
        Next

        Return versionList
    End Function

    Protected Overrides Function GetIdValue() As Object
        Return mTitle.ToString()
    End Function

#End Region

#Region " Factory Methods "

    Friend Shared Function GetProfileData(ByVal dtoProfileData As DataContracts.ProfileData) As ProfileData
        Return New ProfileData(dtoProfileData)
    End Function

    Private Sub New()
        'requires use of factory 
    End Sub

    Private Sub New(ByVal dtoProfileData As DataContracts.ProfileData)
        Fetch(dtoProfileData)
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal dtoProfileData As DataContracts.ProfileData)
        mId = dtoProfileData.Id
        mTitle = dtoProfileData.Title
        mStatusId = dtoProfileData.StatusId
        mStatusName = dtoProfileData.StatusName
        mProfileVersionDataList = ProfileVersionDataList.GetProfileVersionDataList(dtoProfileData.ProfileVersionDataList)
    End Sub

#End Region

End Class
