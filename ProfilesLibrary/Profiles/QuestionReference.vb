Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class QuestionReference
    Inherits BusinessBase(Of QuestionReference)

    Private mProfileSectionId As Guid
    Private mProfileQuestionId As Guid

#Region " Business Methods "

    Public ReadOnly Property ProfileSectionId() As Guid
        Get
            Return mProfileSectionId
        End Get
    End Property

    Public ReadOnly Property ProfileQuestionId() As Guid
        Get
            Return mProfileQuestionId
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object

        Return mProfileSectionId.ToString & "_" & mProfileQuestionId.ToString()

    End Function

#End Region

#Region " Factory Methods "

    Friend Shared Function GetQuestionReference(ByVal ref As DataContracts.QuestionReference) As QuestionReference

        Return New QuestionReference(ref)

    End Function

    Friend Shared Function NewQuestionReference(ByVal profileSectionId As Guid, ByVal profileQuestionId As Guid) As QuestionReference

        Return New QuestionReference(profileSectionId, profileQuestionId)

    End Function

    Private Sub New(ByVal ref As DataContracts.QuestionReference)
        Fetch(ref.ProfileSectionId, ref.ProfileQuestionId)
        MarkOld()
    End Sub

    Private Sub New(ByVal profileSectionId As Guid, ByVal profileQuestionId As Guid)
        Fetch(profileSectionId, profileQuestionId)
        MarkNew()
    End Sub

    Private Sub New()
        'requires use of factory methods
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal profileSectionId As Guid, ByVal profileQuestionId As Guid)
        mProfileSectionId = profileSectionId
        mProfileQuestionId = profileQuestionId
        MarkAsChild()
    End Sub

    Friend Function GetInsert() As DataContracts.QuestionReference

        Return New DataContracts.QuestionReference(mProfileSectionId, mProfileQuestionId)

    End Function

#End Region

End Class


