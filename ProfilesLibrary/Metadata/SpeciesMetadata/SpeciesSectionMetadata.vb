Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class SpeciesSectionMetadata
    Inherits SectionMetadataBase

#Region " Factory Methods "

    Friend Shared Function GetSpeciesSectionMetadata(ByVal dtoSpeciesSection As DataContracts.SpeciesSectionMetadata) As SpeciesSectionMetadata
        Return New SpeciesSectionMetadata(dtoSpeciesSection)
    End Function

    Private Sub New(ByVal dtoSpeciesSection As DataContracts.SpeciesSectionMetadata)
        Fetch(dtoSpeciesSection)
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal dtoSpeciesSection As DataContracts.SpeciesSectionMetadata)

        mId = dtoSpeciesSection.Id
        mName = dtoSpeciesSection.Name
        mShortName = dtoSpeciesSection.ShortName
        mSectionNumber = dtoSpeciesSection.SectionNumber
        mQuestionMetadataList = SpeciesQuestionMetadataList.GetSpeciesQuestionMetadataList(dtoSpeciesSection.QuestionMetadataList)

    End Sub

#End Region

End Class
