Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class QuestionReference

        Private mProfileSectionId As Guid
        Private mProfileQuestionId As Guid

        <DataMember()> _
        Public Property ProfileSectionId() As Guid
            Get
                Return mProfileSectionId
            End Get
            Set(ByVal value As Guid)
                mProfileSectionId = value
            End Set
        End Property

        <DataMember()> _
        Public Property ProfileQuestionId() As Guid
            Get
                Return mProfileQuestionId
            End Get
            Set(ByVal value As Guid)
                mProfileQuestionId = value
            End Set
        End Property

        Public Sub New(ByVal sectionId As Guid, ByVal questionId As Guid)
            mProfileSectionId = sectionId
            mProfileQuestionId = questionId
        End Sub

    End Class

End Namespace

