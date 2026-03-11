Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class CreateProfileReportRequest

        Private mProfileVersionId As Guid
        Private mProfileReportId As Guid
        Private mReportName As String

        <DataMember()> _
        Public Property ProfileVersionId() As Guid
            Get
                Return mProfileVersionId
            End Get
            Private Set(ByVal value As Guid)
                mProfileVersionId = value
            End Set
        End Property

        <DataMember()> _
        Public Property ProfileReportId() As Guid
            Get
                Return mProfileReportId
            End Get
            Private Set(ByVal value As Guid)
                mProfileReportId = value
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

        Public Sub New(ByVal profileVersionId As Guid, ByVal profileReportId As Guid, ByVal reportName As String)

            mProfileVersionId = profileVersionId
            mProfileReportId = profileReportId
            mReportName = reportName

        End Sub

    End Class

End Namespace
