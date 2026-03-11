Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Friend Class GetProfilePrintVersionCommand
    Inherits CommandBase

#Region " Client-side Code "

    Private mReportData As Byte()
    Private mProfileVersionId As Guid
    Private mProfileSectionId As Guid

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

    Friend Property ProfileSectionId() As Guid
        Get
            Return mProfileSectionId
        End Get
        Set(ByVal value As Guid)
            mProfileSectionId = value
        End Set
    End Property

#End Region

#Region " Factory Methods "

    Friend Shared Function GetPrintVersion(ByVal profileVersionId As Guid, ByVal profileSectionId As Guid) As Byte()

        Dim cmd As New GetProfilePrintVersionCommand
        cmd.ProfileVersionId = profileVersionId
        cmd.ProfileSectionId = profileSectionId
        cmd = DataPortal.Execute(Of GetProfilePrintVersionCommand)(cmd)

        Return cmd.Result

    End Function


#End Region

#Region " Server-side Code "

    Protected Overrides Sub DataPortal_Execute()

        Dim db As ServiceContracts.IProfileReportService = DataFactory.GetProfileReportService()
        mReportData = db.GetProfilePrintVersion( _
            New DataContracts.GetProfilePrintVersionRequest(mProfileVersionId, mProfileSectionId) _
            ).PdfData

    End Sub

#End Region

End Class


