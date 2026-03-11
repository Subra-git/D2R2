Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
        Public Class CreateProfileResponse

        Private mNewProfileId As Guid
        Private mNewLastUpdated(7) As Byte

        <DataMember()> _
        Public Property NewProfileId() As Guid
            Get
                Return mNewProfileId
            End Get
            Set(ByVal value As Guid)
                mNewProfileId = value
            End Set
        End Property

        <DataMember()> _
        Public Property NewLastUpdated() As Byte()
            Get
                Return mNewLastUpdated
            End Get
            Set(ByVal value As Byte())
                mNewLastUpdated = value
            End Set
        End Property

    End Class

End Namespace



