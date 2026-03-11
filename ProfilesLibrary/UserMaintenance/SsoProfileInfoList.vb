Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class SsoProfileInfoList
    Inherits ReadOnlyListBase(Of SsoProfileInfoList, SsoProfileInfo)

    Private mDictionary As Dictionary(Of Guid, SsoProfileInfo)

#Region " Busines Methods "

    Public Function GetById(ByVal id As Guid) As SsoProfileInfo

        If mDictionary.ContainsKey(id) Then
            Return mDictionary(id)
        Else
            Return Nothing
        End If

    End Function

#End Region

#Region " Factory Methods "

    Friend Shared Function GetSsoProfileInfoList(ByVal dtoSsoProfileList As List(Of DataContracts.SsoProfile)) As SsoProfileInfoList
        Return New SsoProfileInfoList(dtoSsoProfileList)
    End Function

    Private Sub New()
        'require use of factory methods
    End Sub

    Private Sub New(ByVal dtoSsoProfileList As List(Of DataContracts.SsoProfile))
        Fetch(dtoSsoProfileList)
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal dtoSsoProfileList As List(Of DataContracts.SsoProfile))

        RaiseListChangedEvents = False
        IsReadOnly = False

        mDictionary = New Dictionary(Of Guid, SsoProfileInfo)

        For Each dtoSsoProfile As DataContracts.SsoProfile In dtoSsoProfileList
            Dim currentSsoProfileInfo As SsoProfileInfo = SsoProfileInfo.GetSsoProfileInfo(dtoSsoProfile)
            mDictionary.Add(currentSsoProfileInfo.Id, currentSsoProfileInfo)
            Me.Add(currentSsoProfileInfo)
        Next

        IsReadOnly = True
        RaiseListChangedEvents = True

    End Sub

#End Region

End Class
