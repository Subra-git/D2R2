Imports Profiles.Contracts
Imports Csla

<Serializable()> _
Public Class StaticReportData
    Inherits ReadOnlyBase(Of StaticReportData)

#Region " Business Methods "

    Private mId As Guid
    Private mTitle As String
    Private mIsPublic As Boolean
    Private mPdfData As Byte()

    Public ReadOnly Property Id() As Guid
        Get
            Return mId
        End Get
    End Property

    Public ReadOnly Property Title() As String
        Get
            Return mTitle
        End Get
    End Property

    Public ReadOnly Property IsPublic() As Boolean
        Get
            Return mIsPublic
        End Get
    End Property

    Public ReadOnly Property PdfData() As Byte()
        Get
            Return mPdfData
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mId
    End Function

#End Region

#Region " Authorization Rules "

    Private Shared Function CanGetStaticReportData(ByVal isPublic As Boolean) As Boolean

        Return isPublic OrElse Csla.ApplicationContext.User.Identity.IsAuthenticated
    End Function

#End Region

#Region " Factory Methods "

    Public Shared Function GetStaticReportData(ByVal staticReportVersionId As Guid) As StaticReportData

        Dim result As StaticReportData = DataPortal.Fetch(Of StaticReportData)(New Criteria(staticReportVersionId))

        If Not CanGetStaticReportData(result.IsPublic) Then
            Throw New System.Security.SecurityException("You do not have permission to view the PDF data for this static report version")
        End If

        Return result

    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

#End Region

#Region " Data Access "

    <Serializable()> _
    Private Class Criteria
        Private mId As Guid
        Public ReadOnly Property Id() As Guid
            Get
                Return mId
            End Get
        End Property
        Public Sub New(ByVal id As Guid)
            mId = id
        End Sub
    End Class

    Private Overloads Sub DataPortal_Fetch(ByVal criteria As Criteria)

        Dim db As ServiceContracts.IStaticReportService = DataFactory.GetStaticReportService()
        Dim result As DataContracts.StaticReportData = db.GetStaticReportData(New DataContracts.GetStaticReportDataRequest(criteria.Id))
        mPdfData = result.PdfData
        mIsPublic = result.IsPublic
        mTitle = result.Title

    End Sub

#End Region

End Class

