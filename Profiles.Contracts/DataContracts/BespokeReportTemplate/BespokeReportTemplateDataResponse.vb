Imports System.Runtime.Serialization

Namespace DataContracts
	<DataContract()>
	Public Class BespokeReportTemplateDataResponse
		Public Id As Guid
		Public Title As String
		Public CheckedList As IEnumerable(Of String)
	End Class

End Namespace

