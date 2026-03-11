Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class SsoUserList
    Inherits BusinessListBase(Of SsoUserList, SsoUser)

    Private mDictionary As Dictionary(Of Guid, SsoUser)

#Region " Business Methods "

    Public Function GetById(ByVal id As Guid) As SsoUser

        If mDictionary.ContainsKey(id) Then
            Return mDictionary(id)
        End If

        Return Nothing
    End Function

#End Region

#Region " Factory Methods "

    Friend Shared Function GetSsoUserList(ByVal dtoSsoUserList As List(Of DataContracts.SsoUser), _
                                          ByVal profileList As SsoProfileInfoList) As SsoUserList

        Return New SsoUserList(dtoSsoUserList, profileList)
    End Function

    Private Sub New()
        'requires use of factory
    End Sub

    Private Sub New(ByVal dtoSsoUserList As List(Of DataContracts.SsoUser), _
                    ByVal profileList As SsoProfileInfoList)
        Fetch(dtoSsoUserList, profileList)
        MarkAsChild()
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal dtoSsoUserList As List(Of DataContracts.SsoUser), _
                      ByVal profileList As SsoProfileInfoList)

        mDictionary = New Dictionary(Of Guid, SsoUser)

        For Each dtoSsoUser As DataContracts.SsoUser In dtoSsoUserList

            Dim currentSsoUser As SsoUser = SsoUser.GetSsoUser(dtoSsoUser, profileList)
            mDictionary.Add(currentSsoUser.Id, currentSsoUser)
            Me.Add(currentSsoUser)

        Next

    End Sub

    Friend Sub GetUpdate(ByVal dtoSsoUserUpdateList As List(Of DataContracts.SsoUserUpdate))

        RaiseListChangedEvents = False

        For Each item As SsoUser In Me

            If item.IsDirty AndAlso Not item.IsNew Then
                dtoSsoUserUpdateList.Add(item.GetUpdate())
            End If

        Next

        RaiseListChangedEvents = True

    End Sub

    Friend Sub DoUpdate(ByVal result As DataContracts.ChangeResult)

        RaiseListChangedEvents = False

        Dim updateIndex As Integer = 0

        For Each user As SsoUser In Me

            If user.IsDirty AndAlso Not user.IsNew Then

                For Each prof As SsoUserProfile In user.SsoUserProfileList

                    If prof.IsDirty Then
                        user.DoInsertUpdate(result.LastUpdatedUpdateList(updateIndex))
                        updateIndex += 1
                    End If

                Next
            End If

        Next

        RaiseListChangedEvents = True

    End Sub

#End Region

End Class
