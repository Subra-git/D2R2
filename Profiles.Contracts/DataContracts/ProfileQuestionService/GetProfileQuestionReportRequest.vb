Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class GetProfileQuestionReportRequest

        Private mReportType As ProfileGuidanceReportType

        <DataMember()> _
        Public Property ReportType() As ProfileGuidanceReportType
            Get
                Return mReportType
            End Get
            Set(ByVal value As ProfileGuidanceReportType)
                mReportType = value
            End Set
        End Property

        Public Sub New(ByVal reportType As ProfileGuidanceReportType)
            mReportType = reportType
        End Sub

    End Class

End Namespace
