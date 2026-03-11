Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class DeleteProfileVersionResponse

        Private mNextLatestProfileVersionId As Guid
        Private mIsProfileDeleted As Boolean

        <DataMember()> _
        Public Property NextLatestProfileVersionId() As Guid
            Get
                Return mNextLatestProfileVersionId
            End Get
            Set(ByVal value As Guid)
                mNextLatestProfileVersionId = value
            End Set
        End Property

        <DataMember()> _
        Public Property IsProfileDeleted() As Boolean
            Get
                Return mIsProfileDeleted
            End Get
            Set(ByVal value As Boolean)
                mIsProfileDeleted = value
            End Set
        End Property

    End Class

End Namespace






