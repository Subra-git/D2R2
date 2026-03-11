Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class GetStaticReportPublicHistoryRequest

        Private mStaticReportId As Guid

        <DataMember()> _
        Public Property StaticReportId() As Guid
            Get
                Return mStaticReportId
            End Get
            Private Set(ByVal value As Guid)
                mStaticReportId = value
            End Set
        End Property

        Public Sub New(ByVal staticReportId As Guid)
            mStaticReportId = staticReportId
        End Sub

    End Class

End Namespace


