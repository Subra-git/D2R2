Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class UserVerification

        Private mUserId As Guid
        Private mFullName As String
        Private mOrganisation As String
        Private mIsSsoUser As Boolean
        Private mIsUserManagementSystem As Boolean

        <DataMember()> _
        Public Property UserId() As Guid
            Get
                Return mUserId
            End Get
            Set(ByVal value As Guid)
                mUserId = value
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
        Public Property Organisation() As String
            Get
                Return mOrganisation
            End Get
            Set(ByVal value As String)
                mOrganisation = value
            End Set
        End Property

        <DataMember()> _
        Public Property IsSsoUser() As Boolean
            Get
                Return mIsSsoUser
            End Get
            Set(ByVal value As Boolean)
                mIsSsoUser = value
            End Set
        End Property

        <DataMember()> _
        Public Property IsUserManagementSystem() As Boolean
            Get
                Return mIsUserManagementSystem
            End Get
            Set(ByVal value As Boolean)
                mIsUserManagementSystem = value
            End Set
        End Property

    End Class

End Namespace



