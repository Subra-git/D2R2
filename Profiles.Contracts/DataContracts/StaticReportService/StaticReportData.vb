Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class StaticReportData

        Private mPdfData As Byte()
        Private mIsPublic As Boolean
        Private mTitle As String

        <DataMember()> _
        Public Property PdfData() As Byte()
            Get
                Return mPdfData
            End Get
            Private Set(ByVal value As Byte())
                mPdfData = value
            End Set
        End Property

        <DataMember()> _
        Public Property IsPublic() As Boolean
            Get
                Return mIsPublic
            End Get
            Private Set(ByVal value As Boolean)
                mIsPublic = value
            End Set
        End Property

        <DataMember()> _
        Public Property Title() As String
            Get
                Return mTitle
            End Get
            Private Set(ByVal value As String)
                mTitle = value
            End Set
        End Property

        Public Sub New(ByVal pdfData As Byte(), ByVal isPublic As Boolean, ByVal title As String)
            mPdfData = pdfData
            mIsPublic = isPublic
            mTitle = title
        End Sub

    End Class

End Namespace

