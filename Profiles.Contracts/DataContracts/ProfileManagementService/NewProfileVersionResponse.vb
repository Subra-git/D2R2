Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class NewProfileVersionResponse

        Private mNewProfileVersionId As Guid

        <DataMember()> _
        Public Property NewProfileVersionId() As Guid
            Get
                Return mNewProfileVersionId
            End Get
            Private Set(ByVal value As Guid)
                mNewProfileVersionId = value
            End Set
        End Property

        Public Sub New(ByVal newProfileVersionId As Guid)
            mNewProfileVersionId = newProfileVersionId
        End Sub

    End Class

End Namespace






