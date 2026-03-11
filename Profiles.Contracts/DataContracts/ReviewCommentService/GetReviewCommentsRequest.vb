Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class GetReviewCommentsRequest

        Private mProfileVersionId As Guid
        Private mProfileSectionId As Guid

        <DataMember()> _
        Public Property ProfileVersionId() As Guid
            Get
                Return mProfileVersionId
            End Get
            Set(ByVal value As Guid)
                mProfileVersionId = value
            End Set
        End Property

        <DataMember()> _
        Public Property ProfileSectionId() As Guid
            Get
                Return mProfileSectionId
            End Get
            Set(ByVal value As Guid)
                mProfileSectionId = value
            End Set
        End Property

        Public Sub New(ByVal profileVersionId As Guid, ByVal profileSectionId As Guid)
            mProfileVersionId = profileVersionId
            mProfileSectionId = profileSectionId
        End Sub

    End Class

End Namespace
