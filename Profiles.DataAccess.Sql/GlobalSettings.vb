Imports System.Configuration.ConfigurationManager

Public Module GlobalSettings

    Public ReadOnly Property ProfilesDatabase() As String
        Get
            Dim connString As String = ConnectionStrings("ProfilesDatabase")?.ConnectionString

            If String.IsNullOrEmpty(connString) Then
                Throw New Exception("'ProfilesDatabase' connection string was not found in the application configuration file. 
                                    This may be because the feature you have requested is not available in this implementation. 
                                    If you believe this to be incorrect, please contact your administrator.")
            End If

            Return connString
        End Get
    End Property

End Module
