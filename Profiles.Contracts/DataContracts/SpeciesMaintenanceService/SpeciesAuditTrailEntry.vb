Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class SpeciesAuditTrailEntry

        Private mId As Guid
        Private mOldName As String
        Private mNewName As String
        Private mOldParent As String
        Private mNewParent As String
        Private mUser As String
        Private mLogDate As Date
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
        Public Property OldName() As String
            Get
                Return mOldName
            End Get
            Set(ByVal value As String)
                mOldName = value
            End Set
        End Property

        <DataMember()> _
        Public Property NewName() As String
            Get
                Return mNewName
            End Get
            Set(ByVal value As String)
                mNewName = value
            End Set
        End Property

        <DataMember()> _
        Public Property OldParent() As String
            Get
                Return mOldParent
            End Get
            Set(ByVal value As String)
                mOldParent = value
            End Set
        End Property

        <DataMember()> _
        Public Property NewParent() As String
            Get
                Return mNewParent
            End Get
            Set(ByVal value As String)
                mNewParent = value
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
        Public Property LogDate() As Date
            Get
                Return mLogDate
            End Get
            Set(ByVal value As Date)
                mLogDate = value
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


