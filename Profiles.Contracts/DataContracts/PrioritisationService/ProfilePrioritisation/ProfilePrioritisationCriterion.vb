Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class ProfilePrioritisationCriterion
        Inherits PrioritisationCriterion

        Private mCode As String
        Private mWeight As Integer

        <DataMember()> _
        Public Property Code() As String
            Get
                Return mCode
            End Get
            Set(ByVal value As String)
                mCode = value
            End Set
        End Property

        <DataMember()> _
        Public Property Weight() As Integer
            Get
                Return mWeight
            End Get
            Set(ByVal value As Integer)
                mWeight = value
            End Set
        End Property

        Public Sub New()
            MyBase.New()
        End Sub

    End Class
End Namespace

