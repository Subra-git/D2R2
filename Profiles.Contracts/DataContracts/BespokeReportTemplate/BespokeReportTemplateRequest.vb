Imports System.Runtime.Serialization

Namespace DataContracts
	<DataContract()>
	Public Class BespokeReportTemplateRequest
		Public Id As Guid
		Public Title As String
		Public CheckedList As List(Of String)
	End Class

End Namespace

