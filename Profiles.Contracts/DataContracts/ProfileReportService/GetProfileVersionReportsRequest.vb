Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class GetProfileVersionReportsRequest

        Private mProfileVersionId As Guid
        Private mIsAuthenticated As Boolean

        <DataMember()> _
        Public Property ProfileVersionId() As Guid
            Get
                Return mProfileVersionId
            End Get
            Private Set(ByVal value As Guid)
                mProfileVersionId = value
            End Set
        End Property

        <DataMember()> _
        Public Property IsAuthenticated() As Boolean
            Get
                Return mIsAuthenticated
            End Get
            Private Set(ByVal value As Boolean)
                mIsAuthenticated = value
            End Set
        End Property

        Public Sub New(ByVal profileVersionId As Guid, ByVal isAuthenticated As Boolean)
            mProfileVersionId = profileVersionId
            mIsAuthenticated = isAuthenticated
        End Sub

    End Class

End Namespace
