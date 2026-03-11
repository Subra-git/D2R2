Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class SsoUserUpdate

        Private mId As Guid
        Private mFullName As String
        Private mSsoUserProfileDeleteList As List(Of SsoUserProfileDelete)
        Private mSsoUserProfileInsertList As List(Of SsoUserProfileInsert)
        Private mSsoUserProfileUpdateList As List(Of SsoUserProfileUpdate)
        Private mLastUpdated(7) As Byte

        <DataMember()> _
        Public Property Id() As Guid
            Get
                Return mId
            End Get
            Set(ByVal value As Guid)
                mId = value
            End Set
        End Property

        <DataMember()> _
      Public Property FullName() As String
            Get
                Return mFullName
            End Get
            Set(ByVal value As String)
                mFullName = value
            End Set
        End Property

        <DataMember()> _
         Public Property SsoUserProfileDeleteList() As List(Of SsoUserProfileDelete)
            Get
                Return mSsoUserProfileDeleteList
            End Get
            Set(ByVal value As List(Of SsoUserProfileDelete))
                mSsoUserProfileDeleteList = value
            End Set
        End Property

        <DataMember()> _
         Public Property SsoUserProfileInsertList() As List(Of SsoUserProfileInsert)
            Get
                Return mSsoUserProfileInsertList
            End Get
            Set(ByVal value As List(Of SsoUserProfileInsert))
                mSsoUserProfileInsertList = value
            End Set
        End Property

        <DataMember()> _
         Public Property SsoUserProfileUpdateList() As List(Of SsoUserProfileUpdate)
            Get
                Return mSsoUserProfileUpdateList
            End Get
            Set(ByVal value As List(Of SsoUserProfileUpdate))
                mSsoUserProfileUpdateList = value
            End Set
        End Property

        <DataMember()> _
          Public Property LastUpdated() As Byte()
            Get
                Return mLastUpdated
            End Get
            Set(ByVal value As Byte())
                mLastUpdated = value
            End Set
        End Property

        Public Sub New()
            mSsoUserProfileDeleteList = New List(Of SsoUserProfileDelete)
            mSsoUserProfileInsertList = New List(Of SsoUserProfileInsert)
            mSsoUserProfileUpdateList = New List(Of SsoUserProfileUpdate)
        End Sub

    End Class

End Namespace