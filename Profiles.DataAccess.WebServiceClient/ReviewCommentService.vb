Imports Profiles.Contracts.ServiceContracts
Imports Profiles.Contracts.DataContracts
Imports System.ServiceModel

Public Class ReviewCommentService
    Implements IReviewCommentService

    Public Function GetReviewComments(ByVal request As GetReviewCommentsRequest) As List(Of ReviewCommentData) Implements IReviewCommentService.GetReviewComments

        Dim proxy As IReviewCommentService = ProxyFactory.GetProxy(Of IReviewCommentService)("ReviewCommentService")
        Return ProxyFactory.CallProxyMethod(Of IReviewCommentService, GetReviewCommentsRequest, List(Of ReviewCommentData))(proxy, request, AddressOf proxy.GetReviewComments)

    End Function

    Public Function UpdateReviewComments(ByVal request As Contracts.DataContracts.ReviewCommentChangeset) As Contracts.DataContracts.ChangeResult Implements Contracts.ServiceContracts.IReviewCommentService.UpdateReviewComments

        Dim proxy As IReviewCommentService = ProxyFactory.GetProxy(Of IReviewCommentService)("ReviewCommentService")
        Return ProxyFactory.CallProxyMethod(Of IReviewCommentService, ReviewCommentChangeset, ChangeResult)(proxy, request, AddressOf proxy.UpdateReviewComments)

    End Function

    Public Sub DeleteAllReviewComments(ByVal request As Contracts.DataContracts.DeleteAllReviewCommentsRequest) Implements Contracts.ServiceContracts.IReviewCommentService.DeleteAllReviewComments
        Throw New System.Security.SecurityException("This method is not available via WCF")
    End Sub
End Class
