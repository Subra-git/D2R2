Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class SpeciesData

        Private mId As Guid
        Private mParentId As Guid
        Private mDescription As String = String.Empty
        Private mIsActive As Boolean
        Private mIsInUse As Boolean
        Private mDiseaseName As String = String.Empty
        Private mDisease1 As Integer
        Private mDisease2 As Integer
        Private mDisease3 As Integer
        Private mDisease4 As Integer
        Private mDisease5 As String = String.Empty
        Private mFilterNumber As Int64

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
        Public Property ParentId() As Guid
            Get
                Return mParentId
            End Get
            Set(ByVal value As Guid)
                mParentId = value
            End Set
        End Property

        <DataMember()> _
        Public Property Description() As String
            Get
                Return mDescription
            End Get
            Set(ByVal value As String)
                mDescription = value
            End Set
        End Property

        <DataMember()> _
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
        Public Property DiseaseName() As String
            Get
                Return mDiseaseName
            End Get
            Set(ByVal value As String)
                mDiseaseName = value
            End Set
        End Property

        <DataMember()> _
        Public Property Disease1() As Integer
            Get
                Return mDisease1
            End Get
            Set(ByVal value As Integer)
                mDisease1 = value
            End Set
        End Property

        <DataMember()> _
        Public Property Disease2() As Integer
            Get
                Return mDisease2
            End Get
            Set(ByVal value As Integer)
                mDisease2 = value
            End Set
        End Property

        <DataMember()> _
        Public Property Disease3() As Integer
            Get
                Return mDisease3
            End Get
            Set(ByVal value As Integer)
                mDisease3 = value
            End Set
        End Property

        <DataMember()> _
        Public Property Disease4() As Integer
            Get
                Return mDisease4
            End Get
            Set(ByVal value As Integer)
                mDisease4 = value
            End Set
        End Property

        <DataMember()> _
        Public Property Disease5() As String
            Get
                Return mDisease5
            End Get
            Set(ByVal value As String)
                mDisease5 = value
            End Set
        End Property

        <DataMember()> _
        Public Property FilterNumber() As Long
            Get
                Return mFilterNumber
            End Get
            Set(ByVal value As Long)
                mFilterNumber = value
            End Set
        End Property

        Public Sub New()
            '
        End Sub

    End Class

End Namespace