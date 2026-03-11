Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class SsoUserChangeset

        Private mSsoUserUpdateList As List(Of SsoUserUpdate)

        <DataMember()> _
       Public Property SsoUserUpdateList() As List(Of SsoUserUpdate)
            Get
                Return mSsoUserUpdateList
            End Get
            Set(ByVal value As List(Of SsoUserUpdate))
                mSsoUserUpdateList = value
            End Set
        End Property

        Public Sub New()
            mSsoUserUpdateList = New List(Of SsoUserUpdate)
        End Sub

    End Class


End Namespace
