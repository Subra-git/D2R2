Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class UploadStaticReportCommand
    Inherits CommandBase

#Region " Authorization Rules "

    Public Shared Function CanUploadStaticReport() As Boolean

        'you can only upload a static report if you are a profile editor
        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)

        If identity.IsUserManagementSystem Then
            Return False
        End If

        Return identity.IsProfileEditor

    End Function

#End Region

#Region " Client-side Code "

    Private mTitle As String
    Private mPdfData As Byte()
    Private mIsUserManual As Boolean
    Private mIsPublic As Boolean

    Protected Friend Property Title() As String
        Get
            Return mTitle
        End Get
        Set(ByVal value As String)
            mTitle = value
        End Set
    End Property

    Protected Friend Property PdfData() As Byte()
        Get
            Return mPdfData
        End Get
        Set(ByVal value As Byte())
            mPdfData = value
        End Set
    End Property

    Protected Friend Property IsUserManual() As Boolean
        Get
            Return mIsUserManual
        End Get
        Set(ByVal value As Boolean)
            mIsUserManual = value
        End Set
    End Property

    Protected Friend Property IsPublic() As Boolean
        Get
            Return mIsPublic
        End Get
        Set(ByVal value As Boolean)
            mIsPublic = value
        End Set
    End Property

#End Region

#Region " Factory Methods "

    Public Shared Sub UploadStaticReport(ByVal title As String, ByVal pdfData As Byte(), ByVal isUserManual As Boolean)
        'By default, IsPublic=False
        UploadStaticReport(title, pdfData, isUserManual, False)
    End Sub

    Public Shared Sub UploadStaticReport(ByVal title As String, ByVal pdfData As Byte(), ByVal isUserManual As Boolean, ByVal isPublic As Boolean)
        If Not CanUploadStaticReport() Then
            Throw New System.Security.SecurityException("You do not have permission to upload a static report.")
        End If

        Dim cmd As New UploadStaticReportCommand
        cmd.Title = title
        cmd.PdfData = pdfData
        cmd.IsUserManual = isUserManual
        cmd.IsPublic = isPublic

        cmd = DataPortal.Execute(Of UploadStaticReportCommand)(cmd)
    End Sub

#End Region

#Region " Server-side Code "

    Protected Overrides Sub DataPortal_Execute()

        If mPdfData.Length = 0 Then
            Throw New Csla.DataPortalException("The file data is zero-length or the selected file is too large to upload", Me)
        End If

        If mIsPublic AndAlso mIsUserManual Then
            Throw New Csla.DataPortalException("User manuals cannot be made public", Me)
        End If

        Dim db As ServiceContracts.IStaticReportService = DataFactory.GetStaticReportService()
        db.UploadStaticReport(New DataContracts.UploadStaticReportRequest With { _
                              .Title = mTitle, _
                              .PdfData = mPdfData, _
                              .IsUserManual = mIsUserManual, _
                              .IsPublic = mIsPublic _
            })

    End Sub

#End Region

End Class

