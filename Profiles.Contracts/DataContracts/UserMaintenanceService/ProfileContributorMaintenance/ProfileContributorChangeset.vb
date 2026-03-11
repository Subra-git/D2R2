Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
        Public Class ProfileContributorChangeset

        Private mProfileId As Guid
        Private mDeleteList As List(Of ProfileContributorDelete)
        Private mInsertList As List(Of ProfileContributorInsert)

        <DataMember()> _
       Public Property ProfileId() As Guid
            Get
                Return mProfileId
            End Get
            Private Set(ByVal value As Guid)
                mProfileId = value
            End Set
        End Property

        <DataMember()> _
        Public Property DeleteList() As List(Of ProfileContributorDelete)
            Get
                Return mDeleteList
            End Get
            Set(ByVal value As List(Of ProfileContributorDelete))
                mDeleteList = value
            End Set
        End Property

        <DataMember()> _
        Public Property InsertList() As List(Of ProfileContributorInsert)
            Get
                Return mInsertList
            End Get
            Set(ByVal value As List(Of ProfileContributorInsert))
                mInsertList = value
            End Set
        End Property

        Public Sub New(ByVal profileId As Guid)
            mProfileId = profileId
            mDeleteList = New List(Of ProfileContributorDelete)
            mInsertList = New List(Of ProfileContributorInsert)
        End Sub

    End Class

End Namespace


