Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class SsoProfile

        Private mId As Guid
        Private mTitle As String

        <DataMember()> _
        Public Property Id() As Guid
            Get
                Return mId
            End Get
            Set(ByVal value As Guid)
                mId = value
            End Set
        End Property

        <DataMember()> _
        Public Property Title() As String
            Get
                Return mTitle
            End Get
            Set(ByVal value As String)
                mTitle = value
            End Set
        End Property

        Public Sub New()
            '
        End Sub

    End Class

End Namespace