Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class GetProfileReportDataRequest

        Private mProfileReportId As Guid
        Private mProfileVersionId As Guid

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
        Public Property ProfileVersionId() As Guid
            Get
                Return mProfileVersionId
            End Get
            Private Set(ByVal value As Guid)
                mProfileVersionId = value
            End Set
        End Property

        Public Sub New(ByVal profileReportId As Guid, ByVal profileVersionId As Guid)
            mProfileReportId = profileReportId
            mProfileVersionId = profileVersionId
        End Sub

    End Class

End Namespace



