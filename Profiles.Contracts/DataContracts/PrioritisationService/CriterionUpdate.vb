Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class CriterionUpdate

        Private mCriterionId As Guid
        Private mWeight As Integer
        Private mName As String

        Public Property CriterionId() As Guid
            Get
                Return mCriterionId
            End Get
            Set(ByVal value As Guid)
                mCriterionId = value
            End Set
        End Property

        Public Property Weight() As Integer
            Get
                Return mWeight
            End Get
            Set(ByVal value As Integer)
                mWeight = value
            End Set
        End Property

        Public Property Name() As String
            Get
                Return mName
            End Get
            Set(ByVal value As String)
                mName = value
            End Set
        End Property

        Public Sub New()
            '
        End Sub

    End Class
End Namespace
