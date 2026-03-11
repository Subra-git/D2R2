Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class GetProfileQuestionInfoListRequest

        Private mProfileSectionId As Guid

        <DataMember()> _
        Public Property ProfileSectionId() As Guid
            Get
                Return mProfileSectionId
            End Get
            Set(ByVal value As Guid)
                mProfileSectionId = value
            End Set
        End Property

        Public Sub New(ByVal id As Guid)
            mProfileSectionId = id
        End Sub

    End Class

End Namespace
