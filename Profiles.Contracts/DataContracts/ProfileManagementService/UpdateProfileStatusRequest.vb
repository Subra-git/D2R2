Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class UpdateProfileStatusRequest

        Private mProfileId As Guid
        Private mProfileStatusId As Guid
        
        <DataMember()> _
       Public Property ProfileId() As Guid
            Get
                Return mProfileId
            End Get
            Set(ByVal value As Guid)
                mProfileId = value
            End Set
        End Property

        <DataMember()> _
       Public Property ProfileStatusId() As Guid
            Get
                Return mProfileStatusId
            End Get
            Set(ByVal value As Guid)
                mProfileStatusId = value
            End Set
        End Property

        Public Sub New(ByVal profileId As Guid, ByVal profileStatusId As Guid)
            mProfileId = profileId
            mProfileStatusId = profileStatusId
        End Sub

    End Class

End Namespace
