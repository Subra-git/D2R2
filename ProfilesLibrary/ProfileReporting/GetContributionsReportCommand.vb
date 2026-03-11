Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Friend Class GetContributionsReportCommand
    Inherits CommandBase

#Region " Authorization Rules "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Friend Shared Function CanGetReport() As Boolean

        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return (identity.IsProfileEditor OrElse identity.IsPolicyProfileUser) AndAlso Not identity.IsUserManagementSystem

    End Function

#End Region

#Region " Client-side Code "

    Private mReportData As Byte()
    Private mProfileId As Guid

    Friend ReadOnly Property Result() As Byte()
        Get
            Return mReportData
        End Get
    End Property

    Friend Property ProfileId() As Guid
        Get
            Return mProfileId
        End Get
        Set(ByVal value As Guid)
            mProfileId = value
        End Set
    End Property

#End Region

#Region " Factory Methods "


    Friend Shared Function GetContributionsReport(ByVal profileId As Guid) As Byte()

        If Not CanGetReport() Then
            Throw New System.Security.SecurityException("You do not have permission to get a pdf of the contribution report")
        End If

        Dim cmd As New GetContributionsReportCommand
        cmd.ProfileId = profileId
        cmd = DataPortal.Execute(Of GetContributionsReportCommand)(cmd)

        Return cmd.Result

    End Function


#End Region

#Region " Server-side Code "

    Protected Overrides Sub DataPortal_Execute()

        Dim db As ServiceContracts.IProfileReportService = DataFactory.GetProfileReportService()
        mReportData = db.GetContributionsReport(New DataContracts.GetContributionsReportRequest(mProfileId)).PdfData

    End Sub

#End Region

End Class

