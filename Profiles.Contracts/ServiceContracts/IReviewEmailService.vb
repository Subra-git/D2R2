Imports System.ServiceModel
Imports Profiles.Contracts.DataContracts

Namespace ServiceContracts

	<ServiceContract()> _
	Public Interface IReviewEmailService

		<OperationContract()> _
		Function UsersDueReviewEmail(ByVal request As UsersDueReviewEmailRequest) As IEnumerable(Of UserDueReviewEmailResponse)

	End Interface

End Namespace

