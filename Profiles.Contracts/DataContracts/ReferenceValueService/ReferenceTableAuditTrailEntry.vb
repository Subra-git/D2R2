Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class ReferenceTableAuditTrailEntry

        Private mId As Guid
        Private mOldValue As String
        Private mNewValue As String
        Private mUser As String
        Private mDateOfChange As Date
        Private mEffectiveDate As Date
        Private mReasonForChange As String

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
        Public Property User() As String
            Get
                Return mUser
            End Get
            Set(ByVal value As String)
                mUser = value
            End Set
        End Property

        <DataMember()> _
        Public Property DateOfChange() As Date
            Get
                Return mDateOfChange
            End Get
            Set(ByVal value As Date)
                mDateOfChange = value
            End Set
        End Property

        <DataMember()> _
        Public Property EffectiveDate() As Date
            Get
                Return mEffectiveDate
            End Get
            Set(ByVal value As Date)
                mEffectiveDate = value
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

    End Class

End Namespace

