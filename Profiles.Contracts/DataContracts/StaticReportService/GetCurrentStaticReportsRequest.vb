Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class GetCurrentStaticReportsRequest

        Private mIsUserManual As Boolean

        <DataMember()> _
        Public Property IsUserManual() As Boolean
            Get
                Return mIsUserManual
            End Get
            Private Set(ByVal value As Boolean)
                mIsUserManual = value
            End Set
        End Property

        Public Sub New(ByVal isUserManual As Boolean)
            mIsUserManual = IsUserManual
        End Sub

    End Class

End Namespace