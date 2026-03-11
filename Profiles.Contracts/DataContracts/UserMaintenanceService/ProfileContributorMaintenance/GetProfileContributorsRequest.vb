Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class GetProfileContributorsRequest

        Private mProfileId As Guid

        <DataMember()> _
        Public Property ProfileId() As Guid
            Get
                Return mProfileId
            End Get
            Private Set(ByVal value As Guid)
                mProfileId = value
            End Set
        End Property

        Public Sub New(ByVal profileId As Guid)
            mProfileId = profileId
        End Sub

    End Class

End Namespace


