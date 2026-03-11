Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class ErrorLogEntry

        Private mId As Guid
        Private mErrorType As String
        Private mException As String
        Private mStackTrace As String
        Private mApplicationName As String
        Private mVersionName As String
        Private mRequest As String
        Private mUsername As String

        Public Property Id() As Guid
            Get
                Return mId
            End Get
            Set(ByVal value As Guid)
                mId = value
            End Set
        End Property

        <DataMember()> _
        Public Property ErrorType() As String
            Get
                Return mErrorType
            End Get
            Private Set(ByVal value As String)
                mErrorType = value
            End Set
        End Property

        <DataMember()> _
        Public Property Exception() As String
            Get
                Return mException
            End Get
            Private Set(ByVal value As String)
                mException = value
            End Set
        End Property

        <DataMember()> _
        Public Property StackTrace() As String
            Get
                Return mStackTrace
            End Get
            Private Set(ByVal value As String)
                mStackTrace = value
            End Set
        End Property

        <DataMember()> _
        Public Property ApplicationName() As String
            Get
                Return mApplicationName
            End Get
            Private Set(ByVal value As String)
                mApplicationName = value
            End Set
        End Property

        <DataMember()> _
        Public Property VersionName() As String
            Get
                Return mVersionName
            End Get
            Private Set(ByVal value As String)
                mVersionName = value
            End Set
        End Property

        <DataMember()> _
        Public Property Request() As String
            Get
                Return mRequest
            End Get
            Private Set(ByVal value As String)
                mRequest = value
            End Set
        End Property

        Public Property Username() As String
            Get
                Return mUsername
            End Get
            Set(ByVal value As String)
                mUsername = value
            End Set
        End Property

        Public Sub New(ByVal errorType As String, _
                       ByVal exception As String, _
                       ByVal stackTrace As String, _
                       ByVal applicationName As String, _
                       ByVal versionName As String, _
                       ByVal request As String)

            mErrorType = errorType
            mException = exception
            mStackTrace = stackTrace
            mApplicationName = applicationName
            mVersionName = versionName
            mRequest = request

        End Sub

    End Class

End Namespace
