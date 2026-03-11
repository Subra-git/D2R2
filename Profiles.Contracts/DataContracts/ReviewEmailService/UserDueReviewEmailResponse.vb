Imports System.Runtime.Serialization

Namespace DataContracts

	<DataContract()>
	Public Class UserDueReviewEmailResponse

		Private mId As Guid
		Private mUserName As String
		Private mEmailAddress As String
		Private mFullName As String
		Private mProfileVersions As List(Of ProfileVersionResponse)

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
		Public Property UserName() As String
			Get
				Return mUserName
			End Get
			Set(ByVal value As String)
				mUserName = value
			End Set
		End Property

		<DataMember()>
		Public Property EmailAddress() As String
			Get
				Return mEmailAddress
			End Get
			Set(ByVal value As String)
				mEmailAddress = value
			End Set
		End Property

		<DataMember()>
		Public Property FullName() As String
			Get
				Return mFullName
			End Get
			Set(ByVal value As String)
				mFullName = value
			End Set
		End Property

		<DataMember()>
		Public Property ProfileVersions As List(Of ProfileVersionResponse)
			Get
				Return mProfileVersions
			End Get
			Set(value As List(Of ProfileVersionResponse))
				mProfileVersions = value
			End Set
		End Property

	End Class

End Namespace

