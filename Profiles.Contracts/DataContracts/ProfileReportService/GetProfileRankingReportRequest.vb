Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class GetProfileRankingReportRequest

        Public Enum RankingReportType As Integer
            All
            Fish
            Terrestrial
        End Enum

        Public mReportFilterType As String
        Private mReportType As RankingReportType

        <DataMember()> _
        Public Property ReportType() As RankingReportType
            Get
                Return mReportType
            End Get
            Set(ByVal value As RankingReportType)
                mReportType = value
            End Set
        End Property

        <DataMember()> _
            Public Property NameOfFilter() As String
            Get
                Return mReportFilterType
            End Get
            Set(ByVal value As String)
                mReportFilterType = value
            End Set
        End Property

        Public Sub New()
            ReportType = RankingReportType.All
        End Sub

        Public Sub New(ByVal type As RankingReportType, ByVal ReportFilterType As String)
            ReportType = type
            mReportFilterType = ReportFilterType
        End Sub

    End Class
End Namespace
