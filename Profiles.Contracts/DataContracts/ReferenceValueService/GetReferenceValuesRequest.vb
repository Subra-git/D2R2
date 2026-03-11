Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class GetReferenceValuesRequest

        Private mReferenceTableId As Guid

        <DataMember()> _
        Public Property ReferenceTableId() As Guid
            Get
                Return mReferenceTableId
            End Get
            Set(ByVal value As Guid)
                mReferenceTableId = value
            End Set
        End Property

        Public Sub New(ByVal referenceTableId As Guid)
            mReferenceTableId = referenceTableId
        End Sub

    End Class

End Namespace
