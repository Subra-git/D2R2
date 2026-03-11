Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class SsoUserProfileDelete

        Private mProfileId As Guid

        <DataMember()> _
        Public Property ProfileId() As Guid
            Get
                Return mProfileId
            End Get
            Set(ByVal value As Guid)
                mProfileId = value
            End Set
        End Property

        Public Sub New()
            '
        End Sub

    End Class

End Namespace