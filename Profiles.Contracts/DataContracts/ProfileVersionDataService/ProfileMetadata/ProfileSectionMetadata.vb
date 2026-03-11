Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class ProfileSectionMetadata
        Inherits SectionMetadata

        Private mNote As String

        <DataMember()> _
        Public Property Note() As String
            Get
                Return mNote
            End Get
            Set(ByVal value As String)
                mNote = value
            End Set
        End Property

    End Class

End Namespace
