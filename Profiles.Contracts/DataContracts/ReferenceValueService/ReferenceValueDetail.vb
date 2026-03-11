Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
Public Class ReferenceValueDetail

        Private mValue As String = String.Empty
        Private mEffectiveDateTo As Date
        Private mEffectiveDateFrom As Date
        Private mIsInUse As Boolean
        Private mLastUpdated(7) As Byte

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
        Public Property IsInUse() As Boolean
            Get
                Return mIsInUse
            End Get
            Set(ByVal value As Boolean)
                mIsInUse = value
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

