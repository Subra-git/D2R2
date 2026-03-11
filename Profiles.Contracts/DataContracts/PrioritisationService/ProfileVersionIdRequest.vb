Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class ProfileVersionIdRequest

        Private mProfileVersionId As Guid

        <DataMember()> _
        Public Property ProfileVersionId() As Guid
            Get
                Return mProfileVersionId
            End Get
            Set(ByVal value As Guid)
                mProfileVersionId = value
            End Set
        End Property

        Public Sub New(ByVal versionId As Guid)
            mProfileVersionId = versionId
        End Sub

    End Class
End Namespace
