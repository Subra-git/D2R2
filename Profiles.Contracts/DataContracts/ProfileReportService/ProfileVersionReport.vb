Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class ProfileVersionReport

        Private mId As Guid
        Private mReportName As String
        Private mDisplayName As String
        Private mHasPdfData As Boolean
        Private mFileSize As Integer

        <DataMember()> _
        Public Property Id() As Guid
            Get
                Return mId
            End Get
            Private Set(ByVal value As Guid)
                mId = value
            End Set
        End Property

        <DataMember()> _
        Public Property ReportName() As String
            Get
                Return mReportName
            End Get
            Private Set(ByVal value As String)
                mReportName = value
            End Set
        End Property

        <DataMember()> _
        Public Property DisplayName() As String
            Get
                Return mDisplayName
            End Get
            Private Set(ByVal value As String)
                mDisplayName = value
            End Set
        End Property

        <DataMember()> _
        Public Property HasPdfData() As Boolean
            Get
                Return mHasPdfData
            End Get
            Private Set(ByVal value As Boolean)
                mHasPdfData = value
            End Set
        End Property

        <DataMember()> _
        Public Property FileSize() As Integer
            Get
                Return mFileSize
            End Get
            Private Set(ByVal value As Integer)
                mFileSize = value
            End Set
        End Property

        Public Sub New(ByVal id As Guid, _
                       ByVal reportName As String, _
                       ByVal displayName As String, _
                       ByVal hasPdfData As Boolean, _
                       ByVal fileSize As Integer)

            mId = id
            mReportName = reportName
            mDisplayName = displayName
            mHasPdfData = hasPdfData
            mFileSize = fileSize
        End Sub

    End Class

End Namespace


