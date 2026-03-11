Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class PrioritiseProfilesRequest

        Private mPublishedProfiles As Boolean

        <DataMember()> _
        Public Property PublishedProfiles() As Boolean
            Get
                Return mPublishedProfiles
            End Get
            Set(ByVal value As Boolean)
                mPublishedProfiles = value
            End Set
        End Property

        Public Sub New(ByVal publishedProfiles As Boolean)
            mPublishedProfiles = publishedProfiles
        End Sub

    End Class
End Namespace
