Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class ProfileVersionReportInfo
    Inherits ReadOnlyBase(Of ProfileVersionReportInfo)

#Region " Business Methods "

    Private mId As Guid
    Private mProfileVersionId As Guid
    Private mReportName As String = String.Empty
    Private mDisplayName As String = String.Empty
    Private mHasPdfData As Boolean
    Private mFileSize As Integer

    Public ReadOnly Property Id() As Guid
        Get
            Return mId
        End Get
    End Property

    Public ReadOnly Property ProfileVersionId() As Guid
        Get
            Return mProfileVersionId
        End Get
    End Property

    Public ReadOnly Property ReportName() As String
        Get
            Return mReportName
        End Get
    End Property

    Public ReadOnly Property DisplayName() As String
        Get
            Return mDisplayName
        End Get
    End Property

    Public ReadOnly Property HasPdfData() As Boolean
        Get
            Return mHasPdfData
        End Get
    End Property

    Public ReadOnly Property FileSize() As Integer
        Get
            Return mFileSize
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mId
    End Function

    Public Overrides Function ToString() As String
        Return mDisplayName
    End Function

    Public Sub CreateProfileReport()

        If Not ProfileVersionReportInfo.CanCreateProfileReport(mProfileVersionId) Then
            Throw New System.Security.SecurityException("You do not have permission to create a profile report.")
        End If

        CreateProfileReportCommand.CreateProfileReport(mProfileVersionId, mId, mReportName)

    End Sub

    Public Function GetProfileReport() As Byte()

        Return GetProfileReportCommand.GetProfileReport(Me)

    End Function

#End Region

#Region " Factory Methods "

    Public Shared Function CanCreateProfileReport(ByVal profileVersionId As Guid) As Boolean
        Return CreateProfileReportCommand.CanCreateProfileReport(profileVersionId)
    End Function

    Public Shared Function CanGetProfileReport(ByVal profileVersionId As Guid) As Boolean

        'you can only get a profile report for a profile version 
        'if it is published and either you are authenticated, 
        'or it is public and the report is DisplayPublic
        Dim profileVersion As ProfileVersionInfo = ProfileVersionInfo.GetProfileVersionInfo(profileVersionId)

        If profileVersion.Status = ProfileVersionStatus.Published Then
            Return profileVersion.IsPublic OrElse Csla.ApplicationContext.User.Identity.IsAuthenticated
        End If

        Return False

    End Function

    Friend Shared Function GetProfileVersionReportInfo( _
      ByVal report As DataContracts.ProfileVersionReport, ByVal profileVersionId As Guid) As ProfileVersionReportInfo

        Return New ProfileVersionReportInfo(report, profileVersionId)
    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

    Private Sub New(ByVal report As DataContracts.ProfileVersionReport, ByVal profileVersionId As Guid)
        Fetch(report, profileVersionId)
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal report As DataContracts.ProfileVersionReport, ByVal profileVersionId As Guid)

        mId = report.Id
        mReportName = report.ReportName
        mDisplayName = report.DisplayName
        mHasPdfData = report.HasPdfData
        mFileSize = report.FileSize
        mProfileVersionId = profileVersionId
    End Sub

#End Region

End Class


