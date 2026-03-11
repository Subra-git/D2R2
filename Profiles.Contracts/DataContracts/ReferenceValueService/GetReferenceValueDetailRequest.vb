Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class GetReferenceValueDetailRequest

        Private mReferenceValueId As Guid

        <DataMember()> _
        Public Property ReferenceValueId() As Guid
            Get
                Return mReferenceValueId
            End Get
            Set(ByVal value As Guid)
                mReferenceValueId = value
            End Set
        End Property

        Public Sub New(ByVal referenceValueId As Guid)
            mReferenceValueId = referenceValueId
        End Sub

    End Class

End Namespace
