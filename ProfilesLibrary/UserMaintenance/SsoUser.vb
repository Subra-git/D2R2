Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class SsoUser
    Inherits BusinessBase(Of SsoUser)

    Private mId As Guid
    Private mUserName As String
    Private mFullName As String
    Private mEmailAddress As String
    Private mOrganisation As String
    Private mSubscribedToEmails As Boolean
    Private mSsoUserId As Guid
    Private mProfileInfoList As SsoProfileInfoList
    Private mSsoUserProfileList As SsoUserProfileList
    Private mLastUpdated(7) As Byte

#Region " Business Methods "

    Public ReadOnly Property Id() As Guid
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            Return mId
        End Get
    End Property

    Public ReadOnly Property UserName() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            Return mUserName
        End Get
    End Property

    Public ReadOnly Property FullName() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            Return mFullName
        End Get
    End Property

    Public ReadOnly Property Email() As String
            <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            Return mEmailAddress
        End Get
    End Property

    Public ReadOnly Property Organisation() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            Return mOrganisation
        End Get
    End Property

    Public Property SubscribedToEmails() As Boolean
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            Return mSubscribedToEmails
        End Get
        Set(value As Boolean)
            mSubscribedToEmails = value
            MarkDirty()
        End Set
    End Property

    Public ReadOnly Property SsoUserProfileList() As SsoUserProfileList
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            Return mSsoUserProfileList
        End Get
    End Property

    Public ReadOnly Property AvailableProfiles() As List(Of SsoProfileInfo)
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            Dim profiles As New List(Of SsoProfileInfo)
            For Each systemProfile As SsoProfileInfo In mProfileInfoList
                If mSsoUserProfileList.GetById(systemProfile.Id) Is Nothing Then
                    profiles.Add(systemProfile)
                End If
            Next
            Return profiles
        End Get
    End Property

    Public Overrides ReadOnly Property IsDirty() As Boolean
        Get
            Return MyBase.IsDirty OrElse mSsoUserProfileList.IsDirty
        End Get
    End Property

    Public Overrides ReadOnly Property IsValid() As Boolean
        Get
            Return MyBase.IsValid AndAlso mSsoUserProfileList.IsValid
        End Get
    End Property

    Public Property SsoUserId As Guid
        Get
            Return mSsoUserId
        End Get
        Set(value As Guid)
            mSsoUserId = value
        End Set
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mId.ToString()
    End Function

#End Region

#Region " Factory Methods "

    Friend Shared Function GetSsoUser(ByVal dtoSsoUser As DataContracts.SsoUser, _
                                      ByVal profileList As SsoProfileInfoList) As SsoUser
        Return New SsoUser(dtoSsoUser, profileList)
    End Function

    Private Sub New()
        'requires use of factory
    End Sub

    Private Sub New(ByVal dtoSsoUser As DataContracts.SsoUser, ByVal profileList As SsoProfileInfoList)
        Fetch(dtoSsoUser, profileList)
        MarkAsChild()
        MarkOld()
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal dtoSsoUser As DataContracts.SsoUser, ByVal profileList As SsoProfileInfoList)
        mId = dtoSsoUser.Id
        mUserName = dtoSsoUser.UserName
        mFullName = dtoSsoUser.FullName
        mEmailAddress = dtoSsoUser.EmailAddress
        mOrganisation = dtoSsoUser.Organisation
        mSubscribedToEmails = dtoSsoUser.SubscribedToEmails
        mSsoUserId = dtoSsoUser.SsoUserId
        mLastUpdated = dtoSsoUser.LastUpdated
        mSsoUserProfileList = SsoUserProfileList.GetSsoUserProfileList(dtoSsoUser.SsoUserProfileList)
        mProfileInfoList = profileList
    End Sub

    Friend Function GetUpdate() As DataContracts.SsoUserUpdate

        Dim dtoSsoUserUpdate As New DataContracts.SsoUserUpdate()
        With dtoSsoUserUpdate
            .Id = mId
            .LastUpdated = mLastUpdated
            .FullName = mFullName
        End With

        mSsoUserProfileList.GetUpdate(dtoSsoUserUpdate.SsoUserProfileDeleteList, _
                                      dtoSsoUserUpdate.SsoUserProfileInsertList, _
                                      dtoSsoUserUpdate.SsoUserProfileUpdateList)

        Return dtoSsoUserUpdate

    End Function

    Friend Sub DoInsertUpdate(ByVal newLastUpdated As Byte())
        mLastUpdated = newLastUpdated
        mSsoUserProfileList.DoUpdate()
        MarkOld()
    End Sub

#End Region

End Class
