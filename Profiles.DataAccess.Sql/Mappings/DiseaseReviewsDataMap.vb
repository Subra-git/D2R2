Imports Profiles.Contracts.DataContracts
Imports Profiles.DataModels.StoredProcedures
Imports Profiles.Infrastructure.Mapping

Public Class DiseaseReviewsDataMap
    Implements ISingleSourceMap(Of ReviewTimingsReport, DiseaseReviewsData)
    Public Function Map(source As ReviewTimingsReport) As DiseaseReviewsData Implements ISingleSourceMap(Of ReviewTimingsReport, DiseaseReviewsData).Map
        Return New DiseaseReviewsData() With {
            .ProfileVersionId = source.ProfileVersionId,
            .Title = source.Title,
            .VersionMajor = source.VersionMajor,
            .VersionMinor = source.VersionMinor,
            .SectionNumber = source.SectionNumber,
            .SectionName = source.SectionName,
            .NextPolicyReview = source.NextPolicyReview,
            .NextAuthorReview = source.NextAuthorReview,
            .NextTechnicalReview = source.NextTechnicalReview
        }
    End Function
End Class
