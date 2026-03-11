Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class GetDraftProfileHistoryRequest

        Private mProfileId As Guid

        Public Property ProfileId() As Guid
            Get
                Return mProfileId
            End Get
            Set(ByVal value As Guid)
                mProfileId = value
            End Set
        End Property

        Public Sub New(ByVal profileId As Guid)
            mProfileId = profileId
        End Sub

        Public Sub New()
            '
        End Sub

    End Class

End Namespace

