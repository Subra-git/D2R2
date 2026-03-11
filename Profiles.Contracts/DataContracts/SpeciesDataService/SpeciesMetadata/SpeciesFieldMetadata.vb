Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class SpeciesFieldMetadata
        Inherits FieldMetadata

        Private mName

        <DataMember()> _
       Public Property Name() As String
            Get
                Return mName
            End Get
            Set(ByVal value As String)
                mName = value
            End Set
        End Property

        Public Sub New()
            MyBase.New()
        End Sub

    End Class

End Namespace

