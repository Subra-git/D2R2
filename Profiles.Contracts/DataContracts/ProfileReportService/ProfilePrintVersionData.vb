Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class ProfilePrintVersionData

        Private mPdfData As Byte()

        <DataMember()> _
        Public Property PdfData() As Byte()
            Get
                Return mPdfData
            End Get
            Private Set(ByVal value As Byte())
                mPdfData = value
            End Set
        End Property

        Public Sub New(ByVal pdfData As Byte())
            mPdfData = pdfData
        End Sub

    End Class

End Namespace

