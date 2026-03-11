Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class GetProfileVersionComparisonReportRequest

        Private mProfileVersionLeftId As Guid
        Private mProfileVersionRightId As Guid

        <DataMember()> _
        Public Property ProfileVersionLeftId() As Guid
            Get
                Return mProfileVersionLeftId
            End Get
            Private Set(ByVal value As Guid)
                mProfileVersionLeftId = value
            End Set
        End Property

        <DataMember()> _
        Public Property ProfileVersionRightId() As Guid
            Get
                Return mProfileVersionRightId
            End Get
            Private Set(ByVal value As Guid)
                mProfileVersionRightId = value
            End Set
        End Property

        Public Sub New(ByVal profileVersionLeftId As Guid, ByVal profileVersionRightId As Guid)
            mProfileVersionLeftId = profileVersionLeftId
            mProfileVersionRightId = profileVersionRightId
        End Sub

    End Class

End Namespace


