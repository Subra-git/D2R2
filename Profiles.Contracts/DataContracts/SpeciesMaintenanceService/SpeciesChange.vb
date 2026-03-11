Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class SpeciesChange

        Private mId As Guid
        Private mUserId As Guid
        Private mAction As ChangeActionType
        Private mParentId As Guid = Guid.Empty
        Private mName As String = String.Empty
        Private mReasonForChange As String = String.Empty
        Private mLastUpdated As Byte()

        <DataMember()> _
        Public Property Id() As Guid
            Get
                Return mId
            End Get
            Set(ByVal value As Guid)
                mId = value
            End Set
        End Property

        Public Property UserId() As Guid
            Get
                Return mUserId
            End Get
            Set(ByVal value As Guid)
                mUserId = value
            End Set
        End Property

        <DataMember()> _
        Public Property Action() As ChangeActionType
            Get
                Return mAction
            End Get
            Set(ByVal value As ChangeActionType)
                mAction = value
            End Set
        End Property

        <DataMember()> _
        Public Property ParentId() As Guid
            Get
                Return mParentId
            End Get
            Set(ByVal value As Guid)
                mParentId = value
            End Set
        End Property

        <DataMember()> _
        Public Property Name() As String
            Get
                Return mName
            End Get
            Set(ByVal value As String)
                mName = value
            End Set
        End Property

        <DataMember()> _
        Public Property ReasonForChange() As String
            Get
                Return mReasonForChange
            End Get
            Set(ByVal value As String)
                mReasonForChange = value
            End Set
        End Property

        <DataMember()> _
            Public Property LastUpdated() As Byte()
            Get
                Return mLastUpdated
            End Get
            Set(ByVal value As Byte())
                mLastUpdated = value
            End Set
        End Property

    End Class

End Namespace


