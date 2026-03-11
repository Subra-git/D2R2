Imports Profiles.Contracts.DataContracts
Imports Profiles.Contracts.ServiceContracts

Public Class ReviewEmailService
    Implements IReviewEmailService

    Public Function UsersDueReviewEmail(request As UsersDueReviewEmailRequest) As IEnumerable(Of UserDueReviewEmailResponse) Implements IReviewEmailService.UsersDueReviewEmail
        Throw New InvalidOperationException("You cannot get users due a review email via the WCF service")
    End Function
End Class
