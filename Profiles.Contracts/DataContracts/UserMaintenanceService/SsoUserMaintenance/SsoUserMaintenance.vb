Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class SsoUserMaintenance

        Private mSsoProfileList As List(Of SsoProfile)
        Private mSsoUserList As List(Of SsoUser)

        <DataMember()> _
        Public Property SsoProfileList() As List(Of SsoProfile)
            Get
                Return mSsoProfileList
            End Get
            Set(ByVal value As List(Of SsoProfile))
                mSsoProfileList = value
            End Set
        End Property

        <DataMember()> _
        Public Property SsoUserList() As List(Of SsoUser)
            Get
                Return mSsoUserList
            End Get
            Set(ByVal value As List(Of SsoUser))
                mSsoUserList = value
            End Set
        End Property

        Public Sub New()
            mSsoProfileList = New List(Of SsoProfile)
            mSsoUserList = New List(Of SsoUser)
        End Sub

    End Class


End Namespace
