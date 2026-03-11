Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class GetSummaryPrioritisationReportRequest

        Private mProfileVersionId As Guid

        <DataMember()> _
        Public Property ProfileVersionId() As Guid
            Get
                Return mProfileVersionId
            End Get
            Private Set(ByVal value As Guid)
                mProfileVersionId = value
            End Set
        End Property

        Public Sub New(ByVal profileVersionId As Guid)
            mProfileVersionId = profileVersionId
        End Sub

    End Class

End Namespace


