Imports System.IO
Imports System.Configuration.ConfigurationManager
Imports ProfilesLibrary
Imports Csla


Module Main

    Sub Main()

        Dim isNew As Boolean = False
        Dim mutex As System.Threading.Mutex = New System.Threading.Mutex(True, "ReportRelocator", isNew)
        Dim sourceDirectory As String = AppSettings("ReportSourceDirectory")
        Dim destinationDirectory As String = AppSettings("ReportDestinationDirectory")      
        Dim isValidUser As Boolean = False

        'connect to the profile database to determine whether the environment user is a valid profiles user
        Try
            isValidUser = ProfilesPrincipal.Login(Environment.UserDomainName & "\" & Environment.UserName)
            If Not isValidUser Then
                HandleError(New Exception("User " & Environment.UserDomainName & "\" & Environment.UserName & " is not authorized to use this application."))
            End If
        Catch ex As Exception
            HandleError(New Exception("Unable to determine whether user " & Environment.UserDomainName & "\" & Environment.UserName & " is a valid profile user", ex))
            Exit Sub
        End Try

      
        'only run the exe if there is not a current instance running
        If (isNew) Then

            If Not Directory.Exists(sourceDirectory) Then
                HandleError(New Exception("Cannot locate source directory: " & sourceDirectory))                
            ElseIf Not Directory.Exists(destinationDirectory) Then
                HandleError(New Exception("Cannot locate destination directory: " & destinationDirectory))                
            Else

                For Each report As String In Directory.GetFiles(sourceDirectory)

                    Try
                        'only process PDF files - record in event log if find unexpected file
                        If Path.GetExtension(report).ToLower() = ".pdf" Then
                            Dim existingDestFilePath As String = report.Replace(sourceDirectory, destinationDirectory)
                            If File.Exists(existingDestFilePath) Then
                                ArchiveReport(destinationDirectory, existingDestFilePath)
                            End If
                            File.Move(report, existingDestFilePath)
                        Else
                            HandleError(New Exception("Invalid file in report directory: " & report))
                        End If
                    Catch ex As Exception
                        HandleError(ex)
                    End Try

                Next
            End If

        Else
            HandleError(New Exception("StaticReportLocator already running"))            
        End If        

    End Sub


    ''' <summary>
    ''' Move the report to a folder named by the report filename and rename the report file with an appropriate version number
    ''' </summary>
    ''' <param name="archiveDirectory">The location into which the archive folders are to be created</param>
    ''' <param name="filePath">The filepath of the report file that is to be archived</param>    
    Private Sub ArchiveReport(ByVal archiveDirectory As String, ByVal filePath As String)

        Dim fileSourcePath As String = filePath
        Dim folderDestinationPath As String = archiveDirectory & "\" & Path.GetFileNameWithoutExtension(filePath)

        Dim fileDestinationPath As String
        Dim reportVersion As Integer = 1

        Try

            'check whether archive folder exists, if not create
            If Not Directory.Exists(folderDestinationPath) Then
                Directory.CreateDirectory(folderDestinationPath)
            Else
                reportVersion = Directory.GetFiles(folderDestinationPath).Length + 1
            End If

            fileDestinationPath = folderDestinationPath & "\v" & reportVersion & ".pdf"

            File.Move(fileSourcePath, fileDestinationPath)

        Catch ex As Exception
            Throw New Exception("Unable to archive report " & filePath & vbCrLf & ex.Message)
        End Try

    End Sub

    Public Sub HandleError(ByVal handledError As Exception)


        Try
            ' Try to log detail of error into SQL

            Dim errorLog As ProfilesLibrary.ErrorLogEntry = ProfilesLibrary.ErrorLogEntry.NewErrorLogEntry()

            If Not handledError Is Nothing Then
                errorLog.ErrorException = handledError.Message

                If Not handledError.InnerException Is Nothing Then
                    errorLog.ErrorInnerException = handledError.InnerException.ToString()
                End If

                errorLog.Location = String.Format("Static Report Relocator")
                errorLog.ErrorStackTrace = handledError.StackTrace
                errorLog.ErrorType = handledError.GetType.FullName
            End If

            errorLog.Save()

        Catch ex As Exception
            'If can't log details in SQL then write to local log file.
            Try

                Dim errorMessage As String = String.Format("The following error could not be logged to the profiles database: {0}. Additional error information: {1} {2}", _
                    handledError.Message, _
                    IIf(handledError.InnerException IsNot Nothing, handledError.InnerException, String.Empty), _
                    IIf(handledError.StackTrace IsNot Nothing, handledError.StackTrace, String.Empty))

                Dim eventLog As New System.Diagnostics.EventLog()
                eventLog.Source = "Surveillance Profiles Static Report Relocator"
                eventLog.WriteEntry(errorMessage, System.Diagnostics.EventLogEntryType.Error)

            Catch
            End Try

        End Try


    End Sub

End Module
