Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class ProfileUserRole

        Private mId As Guid
        Private mRoleName As String
        Private mIsContributor As Boolean

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
        Public Property RoleName() As String
            Get
                Return mRoleName
            End Get
            Set(ByVal value As String)
                mRoleName = value
            End Set
        End Property

        <DataMember()> _
        Public Property IsContributor() As Boolean
            Get
                Return mIsContributor
            End Get
            Set(ByVal value As Boolean)
                mIsContributor = value
            End Set
        End Property

    End Class

End Namespace
