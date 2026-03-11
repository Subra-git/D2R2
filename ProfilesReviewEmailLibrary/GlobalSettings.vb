Imports System.Configuration.ConfigurationManager

Public Module GlobalSettings

    Public ReadOnly Property ProfilesDatabase() As String
        Get
            Return ConnectionStrings("ProfilesDatabase").ConnectionString
        End Get
    End Property

    Public ReadOnly Property ExternalWebsiteURL() As String
        Get
            Return AppSettings("ExternalWebsiteURL")
        End Get
    End Property

    Public ReadOnly Property InternalWebsiteURL() As String
        Get
            Return AppSettings("InternalWebsiteURL")
        End Get
    End Property

    Public ReadOnly Property SmtpServer() As String
        Get
            Return AppSettings("SmtpServer")
        End Get
    End Property

    Public ReadOnly Property SmtpPort() As String
        Get
            Return AppSettings("SmtpPort")
        End Get
    End Property

    Public ReadOnly Property EmailFromAddress() As String
        Get
            Return AppSettings("EmailFromAddress")
        End Get
    End Property

    Public ReadOnly Property EmailFromDisplayName() As String
        Get
            Return AppSettings("EmailFromDisplayName")
        End Get
    End Property

    Public ReadOnly Property EmailSubjectLine() As String
        Get
            Return AppSettings("EmailSubjectLine")
        End Get
    End Property

End Module
