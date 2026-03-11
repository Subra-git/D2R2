Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class ProfileFieldGroupMetadata
        Inherits ProfileFieldMetadata

        Private mFieldMetadataList As List(Of FieldMetadata)

        <DataMember()> _
        Public Property FieldMetadataList() As List(Of FieldMetadata)
            Get
                Return mFieldMetadataList
            End Get
            Set(ByVal value As List(Of FieldMetadata))
                mFieldMetadataList = value
            End Set
        End Property

        Public Sub New()
            '
        End Sub

    End Class

End Namespace