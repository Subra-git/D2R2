Imports Profiles.Contracts.DataContracts
Imports System.ServiceModel

Namespace ServiceContracts

    <ServiceContract()> _
    Public Interface IReviewCommentService

        <OperationContract()> _
        Function GetReviewComments(ByVal request As GetReviewCommentsRequest) As List(Of ReviewCommentData)

        <OperationContract()> _
        Function UpdateReviewComments(ByVal request As ReviewCommentChangeset) As ChangeResult

        <OperationContract()> _
        Sub DeleteAllReviewComments(ByVal request As DeleteAllReviewCommentsRequest)

    End Interface

End Namespace
