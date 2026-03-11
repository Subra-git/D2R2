Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class PrioritisationChangeResult

        Private mLastUpdated(7) As Byte

        Public Property LastUpdated() As Byte()
            Get
                Return mLastUpdated
            End Get
            Set(ByVal value As Byte())
                mLastUpdated = value
            End Set
        End Property

        Public Sub New()
            '
        End Sub

    End Class

End Namespace
