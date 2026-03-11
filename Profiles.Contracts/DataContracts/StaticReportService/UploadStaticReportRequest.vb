Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class UploadStaticReportRequest

        Private mTitle As String
        Private mPdfData As Byte()
        Private mIsUserManual As Boolean
        Private mIsPublic As Boolean

        <DataMember()> _
        Public Property Title() As String
            Get
                Return mTitle
            End Get
            Set(ByVal value As String)
                mTitle = value
            End Set
        End Property

        <DataMember()> _
        Public Property PdfData() As Byte()
            Get
                Return mPdfData
            End Get
            Set(ByVal value As Byte())
                mPdfData = value
            End Set
        End Property

        <DataMember()> _
        Public Property IsUserManual() As Boolean
            Get
                Return mIsUserManual
            End Get
            Set(ByVal value As Boolean)
                mIsUserManual = value
            End Set
        End Property

        <DataMember()> _
        Public Property IsPublic() As Boolean
            Get
                Return mIsPublic
            End Get
            Set(ByVal value As Boolean)
                mIsPublic = value
            End Set
        End Property

    End Class

End Namespace