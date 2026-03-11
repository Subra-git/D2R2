Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class SsoUserProfileUpdate

        Private mProfileId As Guid
        Private mRoleId As Guid
        Private mReviewEmail As Boolean
        Private mSectionAddList As List(Of Guid)
        Private mSectionRemoveList As List(Of Guid)

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
        Public Property RoleId() As Guid
            Get
                Return mRoleId
            End Get
            Set(ByVal value As Guid)
                mRoleId = value
            End Set
        End Property

        <DataMember()> _
         Public Property SectionAddList() As List(Of Guid)
            Get
                Return mSectionAddList
            End Get
            Set(ByVal value As List(Of Guid))
                mSectionAddList = value
            End Set
        End Property

        <DataMember()> _
            Public Property SectionRemoveList() As List(Of Guid)
            Get
                Return mSectionRemoveList
            End Get
            Set(ByVal value As List(Of Guid))
                mSectionRemoveList = value
            End Set
        End Property

        <DataMember()> _
        Public Property ReviewEmail() As Boolean
            Get
                Return mReviewEmail
            End Get
            Set(ByVal value As Boolean)
                mReviewEmail = value
            End Set
        End Property

        Public Sub New()
            mSectionRemoveList = New List(Of Guid)
            mSectionAddList = New List(Of Guid)
        End Sub

    End Class

End Namespace