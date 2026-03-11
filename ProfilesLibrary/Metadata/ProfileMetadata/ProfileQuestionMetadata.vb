Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class ProfileQuestionMetadata
    Inherits QuestionMetadataBase

    Private mIsPerSpecies As Boolean
    Private mIsRepeating As Boolean
    Private mIrrelevanceFieldId As Guid
    Private mIrrelevanceValueId As Guid
    Private mIrrelevanceFlag As Boolean

#Region " Business Methods "

    Public Overrides ReadOnly Property ShortName() As String
        Get
            Return mShortName
        End Get
    End Property

    Public Overrides ReadOnly Property IsPerSpecies() As Boolean
        Get
            Return mIsPerSpecies
        End Get
    End Property

    Public Overrides ReadOnly Property IsRepeating() As Boolean
        Get
            Return mIsRepeating
        End Get
    End Property

    Public Overrides ReadOnly Property IrrelevanceFieldId() As Guid
        Get
            Return mIrrelevanceFieldId
        End Get
    End Property

    Public Overrides ReadOnly Property IrrelevanceValueId() As Guid
        Get
            Return mIrrelevanceValueId
        End Get
    End Property

    Public Overrides ReadOnly Property IrrelevanceFlag() As Boolean
        Get
            Return mIrrelevanceFlag
        End Get
    End Property

#End Region

#Region " Factory Methods "

    Friend Shared Function GetProfileQuestionMetadata(ByVal dtoProfileQuestionMetadata As DataContracts.ProfileQuestionMetadata) As ProfileQuestionMetadata
        Return New ProfileQuestionMetadata(dtoProfileQuestionMetadata)
    End Function

    Private Sub New(ByVal dtoProfileQuestionMetadata As DataContracts.ProfileQuestionMetadata)
        Fetch(dtoProfileQuestionMetadata)
    End Sub

    Protected Sub New()
        '
    End Sub

#End Region

#Region " Data Access "

    Protected Overloads Sub Fetch(ByVal dtoProfileQuestionMetadata As DataContracts.ProfileQuestionMetadata)
        MyBase.Fetch(dtoProfileQuestionMetadata)
        mShortName = dtoProfileQuestionMetadata.ShortName
        mIsPerSpecies = dtoProfileQuestionMetadata.IsPerSpecies
        mIsRepeating = dtoProfileQuestionMetadata.IsRepeating
        mIrrelevanceFieldId = dtoProfileQuestionMetadata.IrrelevanceFieldId
        mIrrelevanceValueId = dtoProfileQuestionMetadata.IrrelevanceValueId
        mIrrelevanceFlag = dtoProfileQuestionMetadata.IrrelevanceFlag
        mFieldMetadataList = ProfileFieldMetadataList.GetProfileFieldMetadataList(dtoProfileQuestionMetadata.FieldMetadataList)
    End Sub

#End Region

End Class

