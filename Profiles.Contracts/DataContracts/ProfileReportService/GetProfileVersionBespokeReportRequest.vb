Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class GetProfileVersionBespokeReportRequest

		Private mProfileVersionId As Guid
		Private mProfileVersionSelectedSections As List(Of String)
        Private mProfileVersionSelectedQuestions As List(Of String)
        Private mProfileVersionSelectedGuidance As List(Of String)
		Private mTemplateTitle As String

		<DataMember()>
		Public Property ProfileVersionId() As Guid
			Get
				Return mProfileVersionId
			End Get
			Private Set(ByVal value As Guid)
				mProfileVersionId = value
			End Set
		End Property

		<DataMember()> _
        Public Property ProfileVersionSelectedSections As List(Of String)
            Get
                Return mProfileVersionSelectedSections
            End Get
            Private Set(ByVal value As List(Of String))
                mProfileVersionSelectedSections = value
            End Set
        End Property

        <DataMember()> _
        Public Property ProfileVersionSelectedQuestions As List(Of String)
            Get
                Return mProfileVersionSelectedQuestions
            End Get
            Private Set(ByVal value As List(Of String))
                mProfileVersionSelectedQuestions = value
            End Set
        End Property

        <DataMember()> _
        Public Property ProfileVersionSelectedGuidance As List(Of String)
            Get
                Return mProfileVersionSelectedGuidance
            End Get
            Private Set(ByVal value As List(Of String))
                mProfileVersionSelectedGuidance = value
            End Set
        End Property

		<DataMember()>
		Public Property TemplateTitle() As String
			Get
				Return mTemplateTitle
			End Get
			Private Set(ByVal value As String)
				mTemplateTitle = value
			End Set
		End Property

		Public Sub New(profileVersionId As Guid,
					   profileVersionSelectedSections As List(Of String),
					   profileVersionSelectedQuestions As List(Of String),
					   profileVersionsSelectedGuidance As List(Of String),
					   templateTitle As String)
			mProfileVersionId = profileVersionId
			mProfileVersionSelectedSections = profileVersionSelectedSections
			mProfileVersionSelectedQuestions = profileVersionSelectedQuestions
			mProfileVersionSelectedGuidance = profileVersionsSelectedGuidance
			mTemplateTitle = templateTitle
		End Sub

	End Class

End Namespace


