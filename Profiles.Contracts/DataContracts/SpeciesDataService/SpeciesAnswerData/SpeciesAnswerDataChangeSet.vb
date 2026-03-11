Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class SpeciesAnswerDataChangeSet
        Inherits AnswerDataChangeSet

        Private mSpeciesId As Guid

        Public Property SpeciesId() As Guid
            Get
                Return mSpeciesId
            End Get
            Set(ByVal value As Guid)
                mSpeciesId = value
            End Set
        End Property

        Public Sub New()
            MyBase.New()
        End Sub

    End Class
End Namespace

