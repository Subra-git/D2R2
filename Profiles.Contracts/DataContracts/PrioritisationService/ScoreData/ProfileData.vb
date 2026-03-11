Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class ProfileData

        Private mId As Guid
        Private mTitle As String
        Private mStatusId As Guid
        Private mStatusName As String
        Private mProfileVersionDataList As List(Of ProfileVersionData)

        <DataMember()> _
       Public Property Id() As Guid
            Get
                Return mId
            End Get
            Set(ByVal value As Guid)
                mId = value
            End Set
        End Property

        <DataMember()> _
        Public Property Title() As String
            Get
                Return mTitle
            End Get
            Set(ByVal value As String)
                mTitle = value
            End Set
        End Property

        <DataMember()> _
        Public Property StatusId() As Guid
            Get
                Return mStatusId
            End Get
            Set(ByVal value As Guid)
                mStatusId = value
            End Set
        End Property

        <DataMember()> _
        Public Property StatusName() As String
            Get
                Return mStatusName
            End Get
            Set(ByVal value As String)
                mStatusName = value
            End Set
        End Property

        <DataMember()> _
       Public Property ProfileVersionDataList() As List(Of ProfileVersionData)
            Get
                Return mProfileVersionDataList
            End Get
            Set(ByVal value As List(Of ProfileVersionData))
                mProfileVersionDataList = value
            End Set
        End Property

        Public Sub New()
            mProfileVersionDataList = New List(Of ProfileVersionData)
        End Sub

    End Class


End Namespace

