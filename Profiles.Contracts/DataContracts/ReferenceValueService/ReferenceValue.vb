Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class ReferenceValue

        Private mId As Guid
        Private mValue As String = String.Empty
        Private mEffectiveDateTo As Date
        Private mEffectiveDateFrom As Date
        Private mIsInUse As Boolean
        Private mIsActive As Boolean

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
        Public Property Value() As String
            Get
                Return mValue
            End Get
            Set(ByVal value As String)
                mValue = value
            End Set
        End Property

        <DataMember()> _
        Public Property EffectiveDateFrom() As Date
            Get
                Return mEffectiveDateFrom
            End Get
            Set(ByVal value As Date)
                mEffectiveDateFrom = value
            End Set
        End Property

        <DataMember()> _
        Public Property EffectiveDateTo() As Date
            Get
                Return mEffectiveDateTo
            End Get
            Set(ByVal value As Date)
                mEffectiveDateTo = value
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

        Public Sub New()
            '
        End Sub


    End Class

End Namespace
