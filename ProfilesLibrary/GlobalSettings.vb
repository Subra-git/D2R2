Imports System.Configuration.ConfigurationManager

Public Module GlobalSettings

    Public ReadOnly Property ProfilesDatabase() As String
        Get
            Return ConnectionStrings("ProfilesDatabase").ConnectionString
        End Get
    End Property

    Public ReadOnly Property ApplicationName() As String
        Get
            Return AppSettings("ApplicationName").ToString()
        End Get
    End Property

    Public ReadOnly Property VersionName() As String
        Get
            Return AppSettings("VersionName").ToString()
        End Get
    End Property

    Public ReadOnly Property EventLogSource() As String
        Get
            Return AppSettings("EventLogSource").ToString()
        End Get
    End Property

    Public ReadOnly Property ShowReviewEmailPage() As Boolean
        Get
            Return CBool(AppSettings("ShowReviewEmailPage"))
        End Get
    End Property

    Public ReadOnly Property InternalHomePageUrlForReports() As String
        Get
            Dim url As String = AppSettings("InternalHomePageUrlForReports")
            If String.IsNullOrEmpty(url) Then
                url = "http://apha-007.cvlnt.vla.gov.uk/surveillanceprofiles/Home.aspx"
            End If
            Return url
        End Get
    End Property

    Public ReadOnly Property PDFQualityStatementText() As String
        Get
            Dim text As String = AppSettings("PDFQualityStatementText")
            If String.IsNullOrEmpty(text) Then
                text = "The D2R2 Quality Statement can be found in the footer on every page when browsing in the application or in the Help Using D2R2 section"
            End If
            Return text
        End Get
    End Property

    Public ReadOnly Property SearchUseTextSearch As Boolean
        Get
            Dim useTextSearch As String = AppSettings("SearchUseTextSearch")
            If String.IsNullOrEmpty(useTextSearch) Then
                Return False
            End If
            Return CBool(useTextSearch)
        End Get
    End Property

    Public ReadOnly Property SearchUseExactWordMatch As Boolean
        Get
            Dim useExactWordSearch As String = AppSettings("SearchUseExactWordMatch")
            If String.IsNullOrEmpty(useExactWordSearch) Then
                Return True
            End If
            Return CBool(useExactWordSearch)
        End Get
    End Property
End Module

