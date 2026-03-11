Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class GetProfileContributorRequest

        Private mUserId As Guid
        Private mProfileId As Guid

        <DataMember()> _
        Public Property UserId() As Guid
            Get
                Return mUserId
            End Get
            Private Set(ByVal value As Guid)
                mUserId = value
            End Set
        End Property

        <DataMember()> _
        Public Property ProfileId() As Guid
            Get
                Return mProfileId
            End Get
            Private Set(ByVal value As Guid)
                mProfileId = value
            End Set
        End Property

        Public Sub New(ByVal userId As Guid, ByVal profileId As Guid)
            mUserId = userId
            mProfileId = profileId
        End Sub

    End Class

End Namespace



