Imports Profiles.Contracts
Imports Csla
Imports Profiles.Infrastructure

<Serializable()> _
Public Class ErrorLogEntry
    Inherits BusinessBase(Of ErrorLogEntry)

#Region " Business Methods "

    Private mId As Guid = Guid.NewGuid
    Private mErrorType As String = String.Empty
    Private mExceptionDetail As Exception
    Private mException As String = String.Empty
    Private mStackTrace As String = String.Empty
    Private mOriginalApplicationName As String
    Private mOriginalVersionName As String
    Private mApplicationName As String
    Private mVersionName As String
    Private mRequest As String = String.Empty

    Public ReadOnly Property Id() As Guid
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mId
        End Get
    End Property

    Public Property ErrorType() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mErrorType
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As String)
            CanWriteProperty(True)
            If mErrorType <> value Then
                mErrorType = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public Property Exception() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mException
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As String)
            CanWriteProperty(True)
            If mException <> value Then
                mException = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public Property StackTrace() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mStackTrace
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As String)
            CanWriteProperty(True)
            If mStackTrace <> value Then
                mStackTrace = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public Property OriginalApplicationName() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mOriginalApplicationName
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As String)
            CanWriteProperty(True)
            If mOriginalApplicationName <> value Then
                mOriginalApplicationName = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public Property OriginalVersionName() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mOriginalVersionName
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As String)
            CanWriteProperty(True)
            If mOriginalVersionName <> value Then
                mOriginalVersionName = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public ReadOnly Property ApplicationName() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mApplicationName
        End Get
    End Property

    Public ReadOnly Property VersionName() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mVersionName
        End Get
    End Property

    Public Property Request() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mRequest
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As String)
            CanWriteProperty(True)
            If mRequest <> value Then
                mRequest = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mId
    End Function

#End Region

#Region " Factory Methods "

    Public Shared Function NewErrorLogEntry() As ErrorLogEntry
        Return New ErrorLogEntry
    End Function

    Public Shared Function NewErrorLogEntry(ByVal ex As Exception) As ErrorLogEntry
        Return New ErrorLogEntry(ex)
    End Function

    Private Sub New()

        mApplicationName = GlobalSettings.ApplicationName
        mVersionName = GlobalSettings.VersionName

        mOriginalApplicationName = mApplicationName
        mOriginalVersionName = mVersionName

    End Sub

    Private Sub New(ByVal ex As Exception)

        Me.New()

        mExceptionDetail = ex
        mException = ex.Message
        mStackTrace = ex.StackTrace
        mErrorType = ex.GetType.FullName

    End Sub

    Public Overrides Function Save() As ErrorLogEntry

        Dim result As ErrorLogEntry = Nothing


        Try
            result = MyBase.Save()
        Catch ex As Exception
            'write the original error to the event log
            WriteToEventLog(mOriginalApplicationName, mOriginalVersionName, mErrorType, mException & mStackTrace)
            'then write the error that we raised trying to log the original error
            WriteToEventLog(mApplicationName, mVersionName, ex.GetType.FullName, "While trying to log the original error: " & ex.Message & ex.StackTrace)
        End Try

        Return result

    End Function

    Private Sub WriteToEventLog(ByVal applicationName As String, ByVal versionName As String, ByVal errorType As String, ByVal message As String)

        Dim identity As ProfilesIdentity = TryCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)

        Dim username As String = "Anonymous user"
        If identity IsNot Nothing Then
            username = identity.DisplayName
        End If

        Dim errorMessage As String = String.Format("{0} ({1}): A {2} was thrown by user '{3}' with the following error details: {4}", _
                    applicationName, _
                    versionName, _
                    errorType, _
                    username, _
                    message)

        Dim eventLog As New System.Diagnostics.EventLog()
        eventLog.Source = GlobalSettings.EventLogSource
        eventLog.WriteEntry(LogHelper.ExceptionWithStackTrace(mExceptionDetail), System.Diagnostics.EventLogEntryType.Error)

    End Sub

#End Region

#Region " Data Access "

    Protected Overrides Sub DataPortal_Insert()

        Dim identity As ProfilesIdentity = TryCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)

        Dim db As ServiceContracts.IErrorLogService = DataFactory.GetErrorLogService()
        Dim entry As New DataContracts.ErrorLogEntry(mErrorType, mException, mStackTrace, mOriginalApplicationName, mOriginalVersionName, mRequest)
        entry.Id = mId
        entry.Username = "Anonymous user"
        If identity IsNot Nothing Then
            entry.Username = identity.DisplayName
        End If

        db.CreateErrorLogEntry(entry)

        MarkOld()

    End Sub


#End Region

End Class
