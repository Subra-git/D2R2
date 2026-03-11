Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class NewProfileVersionRequest

        Private mProfileVersionId As Guid
        Private mIsPublished As Boolean
        Private mIsPublic As Boolean

        <DataMember()> _
        Public Property ProfileVersionId() As Guid
            Get
                Return mProfileVersionId
            End Get
            Private Set(ByVal value As Guid)
                mProfileVersionId = value
            End Set
        End Property

        <DataMember()> _
        Public Property IsPublished() As Boolean
            Get
                Return mIsPublished
            End Get
            Private Set(ByVal value As Boolean)
                mIsPublished = value
            End Set
        End Property

        <DataMember()> _
                Public Property IsPublic() As Boolean
            Get
                Return mIsPublic
            End Get
            Private Set(ByVal value As Boolean)
                mIsPublic = value
            End Set
        End Property

        Public Sub New(ByVal profileVersionId As Guid, ByVal isPublished As Boolean, ByVal isPublic As Boolean)
            mProfileVersionId = profileVersionId
            mIsPublished = isPublished
            mIsPublic = isPublic
        End Sub

    End Class

End Namespace






