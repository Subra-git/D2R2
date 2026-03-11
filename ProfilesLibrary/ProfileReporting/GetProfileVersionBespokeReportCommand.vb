Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class GetProfileVersionBespokeReportCommand
    Inherits CommandBase

#Region " Authorization Rules "

	<System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")>
	Public Shared Function CanGetReport() As Boolean
		Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
		Return (identity.IsProfileEditor Or identity.IsPolicyProfileUser) AndAlso Not identity.IsUserManagementSystem
	End Function

#End Region

#Region " Client-side Code "

	Private mReportData As Byte()
    Private mProfileVersionId As Guid
    Private mProfileVersionSelectedSections As List(Of String)
    Private mProfileVersionSelectedQuestions As List(Of String)
	Private mProfileVersionSelectedGuidance As List(Of String)
	Private mTemplateTitle As String

	Friend ReadOnly Property Result() As Byte()
        Get
            Return mReportData
        End Get
    End Property

    Friend Property ProfileVersionId() As Guid
        Get
            Return mProfileVersionId
        End Get
        Set(ByVal value As Guid)
            mProfileVersionId = value
        End Set
    End Property

    Friend Property ProfileVersionSelectedSections() As List(Of String)
        Get
            Return mProfileVersionSelectedSections
        End Get
        Set(ByVal value As List(Of String))
            mProfileVersionSelectedSections = value
        End Set
    End Property

    Friend Property ProfileVersionSelectedQuestions() As List(Of String)
        Get
            Return mProfileVersionSelectedQuestions
        End Get
        Set(ByVal value As List(Of String))
            mProfileVersionSelectedQuestions = value
        End Set
    End Property

	Friend Property ProfileVersionSelectedGuidance() As List(Of String)
		Get
			Return mProfileVersionSelectedGuidance
		End Get
		Set(ByVal value As List(Of String))
			mProfileVersionSelectedGuidance = value
		End Set
	End Property

	Friend Property TemplateTitle() As String
		Get
			Return mTemplateTitle
		End Get
		Set(value As String)
			mTemplateTitle = value
		End Set
	End Property

#End Region

#Region " Factory Methods "

	Public Shared Function GetProfileVersionBespokeReport(profileVersionId As Guid,
														  profileVersionSelectedSections As List(Of String),
														  profileVersionSelectedQuestions As List(Of String),
														  profileVersionSelectedGuidance As List(Of String),
														  templateTitle As String) As Byte()

		If Not CanGetReport() Then
			Throw New System.Security.SecurityException("You do not have permission to get a pdf of the profile version bespoke report")
		End If

		Dim cmd As New GetProfileVersionBespokeReportCommand
		cmd.ProfileVersionId = profileVersionId
		cmd.ProfileVersionSelectedSections = profileVersionSelectedSections
		cmd.ProfileVersionSelectedQuestions = profileVersionSelectedQuestions
		cmd.ProfileVersionSelectedGuidance = profileVersionSelectedGuidance
		cmd.TemplateTitle = templateTitle
		cmd = DataPortal.Execute(Of GetProfileVersionBespokeReportCommand)(cmd)

		Return cmd.Result

	End Function


#End Region

#Region " Server-side Code "

	Protected Overrides Sub DataPortal_Execute()

        Dim db As ServiceContracts.IProfileReportService = DataFactory.GetProfileReportService()

		mReportData = db.GetProfileVersionBespokeReport(
								New DataContracts.GetProfileVersionBespokeReportRequest(
								mProfileVersionId,
								mProfileVersionSelectedSections,
								mProfileVersionSelectedQuestions,
								mProfileVersionSelectedGuidance,
								mTemplateTitle
								)).PdfData

	End Sub

#End Region

End Class


