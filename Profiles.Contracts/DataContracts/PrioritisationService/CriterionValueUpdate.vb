Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class CriterionValueUpdate

        Private mId As Guid
        Private mScore As Integer

        Public Property Id() As Guid
            Get
                Return mId
            End Get
            Set(ByVal value As Guid)
                mId = value
            End Set
        End Property

        Public Property Score() As Integer
            Get
                Return mScore
            End Get
            Set(ByVal value As Integer)
                mScore = value
            End Set
        End Property

        Public Sub New()
            '
        End Sub

    End Class
End Namespace
