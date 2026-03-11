Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class SpeciesDetail

        Private mName As String
        Private mParentId As Guid
        Private mParentName As String
        Private mIsActive As Boolean
        Private mIsInUse As Boolean
        Private mChildCount As Integer
        Private mActiveChildCount As Integer
        Private mLastUpdated(7) As Byte

        <DataMember()>
        Public Property Name() As String
            Get
                Return mName
            End Get
            Set(ByVal value As String)
                mName = value
            End Set
        End Property

        <DataMember()>
        Public Property ParentId() As Guid
            Get
                Return mParentId
            End Get
            Set(ByVal value As Guid)
                mParentId = value
            End Set
        End Property

        <DataMember()>
        Public Property ParentName() As String
            Get
                Return mParentName
            End Get
            Set(value As String)
                mParentName = value
            End Set
        End Property


        <DataMember()>
        Public Property IsActive() As Boolean
            Get
                Return mIsActive
            End Get
            Set(ByVal value As Boolean)
                mIsActive = value
            End Set
        End Property

        <DataMember()> _
        Public Property IsInUse() As Boolean
            Get
                Return mIsInUse
            End Get
            Set(ByVal value As Boolean)
                mIsInUse = value
            End Set
        End Property

        <DataMember()> _
         Public Property ChildCount() As Integer
            Get
                Return mChildCount
            End Get
            Set(ByVal value As Integer)
                mChildCount = value
            End Set
        End Property

        <DataMember()> _
        Public Property ActiveChildCount() As Integer
            Get
                Return mActiveChildCount
            End Get
            Set(ByVal value As Integer)
                mActiveChildCount = value
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