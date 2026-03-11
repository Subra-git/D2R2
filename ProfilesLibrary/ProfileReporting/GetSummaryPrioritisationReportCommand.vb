Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Friend Class GetSummaryPrioritisationReportCommand
    Inherits CommandBase

#Region " Client-side Code "

    Private mReportData As Byte()
    Private mProfileVersionId As Guid

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

#End Region

#Region " Factory Methods "


    Friend Shared Function GetSummaryPrioritisationReport(ByVal profileVersionId As Guid) As Byte()

        Dim cmd As New GetSummaryPrioritisationReportCommand
        cmd.ProfileVersionId = profileVersionId
        cmd = DataPortal.Execute(Of GetSummaryPrioritisationReportCommand)(cmd)

        Return cmd.Result

    End Function


#End Region

#Region " Server-side Code "

    Protected Overrides Sub DataPortal_Execute()

        Dim db As ServiceContracts.IProfileReportService = DataFactory.GetProfileReportService()
        mReportData = db.GetSummaryPrioritisationReport( _
                                New DataContracts.GetSummaryPrioritisationReportRequest(mProfileVersionId)).PdfData

    End Sub

#End Region

End Class

