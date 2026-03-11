Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class ProfileSectionMetadata
    Inherits SectionMetadataBase

#Region " Factory Methods "

    Friend Shared Function GetProfileSectionMetadata(ByVal dtoProfileSectionMetadata As DataContracts.ProfileSectionMetadata) As ProfileSectionMetadata
        Return New ProfileSectionMetadata(dtoProfileSectionMetadata)
    End Function

    Private Sub New()
        'requires use of factory methods
    End Sub

    Private Sub New(ByVal dtoProfileSectionMetadata As DataContracts.ProfileSectionMetadata)
        Fetch(dtoProfileSectionMetadata)
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal dtoProfileSectionMetadata As DataContracts.ProfileSectionMetadata)

        mId = dtoProfileSectionMetadata.Id
        mName = dtoProfileSectionMetadata.Name
        mShortName = dtoProfileSectionMetadata.ShortName
        mSectionNumber = dtoProfileSectionMetadata.SectionNumber
        mNote = dtoProfileSectionMetadata.Note
        mQuestionMetadataList = ProfileQuestionMetadataList.GetProfileQuestionMetadataList(dtoProfileSectionMetadata.QuestionMetadataList)

    End Sub

#End Region
End Class
