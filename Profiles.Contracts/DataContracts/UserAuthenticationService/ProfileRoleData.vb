Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class ProfileRoleData

        Private mProfileId As Guid
        Private mRole As String
        Private mSections As List(Of Guid)

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
        Public Property Role() As String
            Get
                Return mRole
            End Get
            Set(ByVal value As String)
                mRole = value
            End Set
        End Property

        <DataMember()> _
        Public Property Sections() As List(Of Guid)
            Get
                Return mSections
            End Get
            Set(ByVal value As List(Of Guid))
                mSections = value
            End Set
        End Property

        Public Sub New()
            '
        End Sub

    End Class

End Namespace
