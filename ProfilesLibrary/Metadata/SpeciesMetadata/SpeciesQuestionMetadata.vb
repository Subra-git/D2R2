Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class SpeciesQuestionMetadata
    Inherits QuestionMetadataBase

    Private mName As String

#Region " Business Methods "

    Public ReadOnly Property Name() As String
        Get
            Return mName
        End Get
    End Property

    Public ReadOnly Property NonTechnicalName() As String
        Get
            Return mName
        End Get
    End Property

    Public Overrides ReadOnly Property ShortName() As String
        Get
            Return mShortName
        End Get
    End Property

#End Region

#Region " Factory Methods "

    Friend Shared Function GetSpeciesQuestionMetadata(ByVal dtoSpeciesQuestionMetadata As DataContracts.SpeciesQuestionMetadata) As SpeciesQuestionMetadata
        Return New SpeciesQuestionMetadata(dtoSpeciesQuestionMetadata)
    End Function

    Private Sub New(ByVal dtoSpeciesQuestionMetadata As DataContracts.SpeciesQuestionMetadata)
        Fetch(dtoSpeciesQuestionMetadata)
    End Sub

#End Region

#Region " Data Access "

    Protected Overloads Sub Fetch(ByVal dtoSpeciesQuestionMetadata As DataContracts.SpeciesQuestionMetadata)
        MyBase.Fetch(dtoSpeciesQuestionMetadata)
        mName = dtoSpeciesQuestionMetadata.Name
        mShortName = dtoSpeciesQuestionMetadata.ShortName
        mFieldMetadataList = SpeciesFieldMetadataList.GetSpeciesFieldMetadataList(dtoSpeciesQuestionMetadata.FieldMetadataList)
    End Sub

#End Region

End Class

