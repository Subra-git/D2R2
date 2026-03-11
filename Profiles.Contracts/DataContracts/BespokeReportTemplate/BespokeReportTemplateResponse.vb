Imports System.Runtime.Serialization

Namespace DataContracts
	<DataContract()>
	<Serializable()>
	Public Class BespokeReportTemplateResponse
		Private mId As Guid

		<DataMember()>
		Public Property Id() As Guid
			Get
				Return mId
			End Get
			Set(ByVal value As Guid)
				mId = value
			End Set
		End Property

		<DataMember()>
		Public Property Title() As String
			Get
				Return mTitle
			End Get
			Set(ByVal value As String)
				mTitle = value
			End Set
		End Property

		Public mTitle As String

		<DataMember()>
		Public CheckedList As IEnumerable(Of String)
	End Class

End Namespace

