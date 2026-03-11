Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class DeleteStaticReportVersionRequest

        Private mStaticReportVersionId As Guid

        <DataMember()> _
        Public Property StaticReportVersionId() As Guid
            Get
                Return mStaticReportVersionId
            End Get
            Private Set(ByVal value As Guid)
                mStaticReportVersionId = value
            End Set
        End Property

        Public Sub New(ByVal staticReportVersionId As Guid)
            mStaticReportVersionId = staticReportVersionId
        End Sub

    End Class

End Namespace
