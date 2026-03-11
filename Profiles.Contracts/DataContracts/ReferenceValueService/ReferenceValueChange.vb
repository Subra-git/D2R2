Imports System.Runtime.Serialization

Namespace DataContracts

    Public Enum ChangeActionType
        Add
        Edit
        Inactivate
        Delete
    End Enum

    <DataContract()> _
Public Class ReferenceValueChange

        Private mId As Guid
        Private mReferenceTableId As Guid
        Private mUserId As Guid
        Private mAction As ChangeActionType
        Private mOldValue As String = String.Empty
        Private mNewValue As String = String.Empty
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

        <DataMember()> _
        Public Property ReferenceTableId() As Guid
            Get
                Return mReferenceTableId
            End Get
            Set(ByVal value As Guid)
                mReferenceTableId = value
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
        Public Property OldValue() As String
            Get
                Return mOldValue
            End Get
            Set(ByVal value As String)
                mOldValue = value
            End Set
        End Property

        <DataMember()> _
        Public Property NewValue() As String
            Get
                Return mNewValue
            End Get
            Set(ByVal value As String)
                mNewValue = value
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

