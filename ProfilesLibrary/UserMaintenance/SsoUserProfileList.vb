Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class SsoUserProfileList
    Inherits BusinessListBase(Of SsoUserProfileList, SsoUserProfile)


#Region " Business Methods "

    Public Function GetById(ByVal profileId As Guid) As SsoUserProfile

        For Each item As SsoUserProfile In Me
            If item.Id.Equals(profileId) Then
                Return item
            End If
        Next

        Return Nothing

    End Function

    Public Overloads Function AddNew(ByVal id As Guid) As SsoUserProfile

        If Me.GetById(id) Is Nothing Then
            Dim newSsoUserProfile As SsoUserProfile = SsoUserProfile.NewSsoUserProfile(id)
            Me.Add(newSsoUserProfile)
            Return newSsoUserProfile
        Else
            Return Nothing
        End If
        
    End Function

    Public Overloads Function Remove(ByVal id As Guid) As Boolean

        Dim profile As SsoUserProfile = Me.GetById(id)

        If profile IsNot Nothing Then
            Return MyBase.Remove(profile)
        Else
            Return False
        End If

    End Function

#End Region

#Region " Factory Methods "

    Friend Shared Function GetSsoUserProfileList(ByVal dtoSsoUserProfileList As List(Of DataContracts.SsoUserProfile)) As SsoUserProfileList
        Return New SsoUserProfileList(dtoSsoUserProfileList)
    End Function

    Private Sub New()
        'requires use of factory
    End Sub

    Private Sub New(ByVal dtoSsoUserProfileList As List(Of DataContracts.SsoUserProfile))
        Fetch(dtoSsoUserProfileList)
        MarkAsChild()
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal dtoSsoUserProfileList As List(Of DataContracts.SsoUserProfile))

        For Each dtoSsoUserProfile As DataContracts.SsoUserProfile In dtoSsoUserProfileList
            Dim currentSsoUserProfile As SsoUserProfile = SsoUserProfile.GetSsoUserProfile(dtoSsoUserProfile)
            Me.Add(currentSsoUserProfile)
        Next

    End Sub

    Friend Sub GetUpdate(ByVal dtoDeleteList As List(Of DataContracts.SsoUserProfileDelete), _
                         ByVal dtoInsertList As List(Of DataContracts.SsoUserProfileInsert), _
                         ByVal dtoUpdateList As List(Of DataContracts.SsoUserProfileUpdate))

        RaiseListChangedEvents = False

        For Each item As SsoUserProfile In DeletedList
            dtoDeleteList.Add(item.GetDelete())
        Next

        For Each item As SsoUserProfile In Me

            If item.IsDirty Then

                If item.IsNew Then
                    dtoInsertList.Add(item.GetInsert())
                Else
                    dtoUpdateList.Add(item.GetUpdate())
                End If

            End If

        Next

        RaiseListChangedEvents = True

    End Sub

    Friend Sub DoUpdate()

        RaiseListChangedEvents = False

        For Each item As SsoUserProfile In DeletedList
            item.DoDelete()
        Next
        DeletedList.Clear()

        For Each item As SsoUserProfile In Me
            If item.IsDirty Then
                item.DoInsertUpdate()
            End If
        Next

        RaiseListChangedEvents = True

    End Sub

#End Region

End Class
