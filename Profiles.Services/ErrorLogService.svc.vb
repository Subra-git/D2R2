Imports Profiles.Contracts
Imports Profiles.Contracts.ServiceContracts
Imports ProfilesLibrary

<ServiceBehavior(InstanceContextMode:=InstanceContextMode.PerCall)> _
<ErrorHandlerBehavior()> _
Public Class ErrorLogService
    Implements IErrorLogService

    Public Sub CreateErrorLogEntry(ByVal entry As DataContracts.ErrorLogEntry) Implements IErrorLogService.CreateErrorLogEntry

        Dim logEntry As ProfilesLibrary.ErrorLogEntry = ProfilesLibrary.ErrorLogEntry.NewErrorLogEntry()
        With logEntry
            .ErrorType = entry.ErrorType
            .Exception = entry.Exception
            .StackTrace = entry.StackTrace
            .OriginalApplicationName = entry.ApplicationName
            .OriginalVersionName = entry.VersionName
            .Request = entry.Request

            .Save()
        End With

    End Sub

End Class
