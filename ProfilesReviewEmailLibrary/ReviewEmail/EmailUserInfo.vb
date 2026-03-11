Imports Csla
Imports Csla.Data
Imports System.Data.SqlClient
<Serializable()> _
Public Class EmailUserInfo
    Inherits ReadOnlyBase(Of EmailUserInfo)

    Private mUserId As Guid
    Private mUserName As String = String.Empty
    Private mFullName As String = String.Empty
    Private mEmail As String = String.Empty
    Private mProfileInfoList As ProfileInfoList

#Region " Business Methods "

    Public ReadOnly Property UserId() As Guid
        Get
            Return mUserId
        End Get
    End Property

    Public ReadOnly Property UserName() As String
        Get
            Return mUserName
        End Get
    End Property

    Public ReadOnly Property FullName() As String
        Get
            Return mFullName
        End Get
    End Property

    Public ReadOnly Property Email() As String
        Get
            Return mEmail
        End Get
    End Property

    Public ReadOnly Property ProfileInfoList() As ProfileInfoList
        Get
            Return mProfileInfoList
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mUserId.ToString()
    End Function

    Public Overrides Function ToString() As String
        Return mEmail
    End Function

#End Region

#Region " Factory Methods "

    Private Sub New(ByVal reader As SafeDataReader)
        Fetch(reader)
    End Sub

    Friend Shared Function GetEmailInfo(ByVal reader As SafeDataReader)
        Return New EmailUserInfo(reader)
    End Function

    Private Sub New()
        'requires use of factory methods
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal reader As SafeDataReader)
        mUserId = reader.GetGuid(0)
        mUserName = reader.GetString(1)
        mEmail = reader.GetString(2)
        mFullName = reader.GetString(3)
        mProfileInfoList = ProfileInfoList.NewProfileInfoList()
    End Sub

#End Region

End Class
