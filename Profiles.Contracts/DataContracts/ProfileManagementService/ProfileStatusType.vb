Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class ProfileStatusType

        Private mId As Guid
        Private mName As String
        Private mIsValidationComplete As Boolean

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
        Public Property Name() As String
            Get
                Return mName
            End Get
            Set(ByVal value As String)
                mName = value
            End Set
        End Property

        <DataMember()> _
        Public Property IsValidationComplete() As Boolean
            Get
                Return mIsValidationComplete
            End Get
            Set(ByVal value As Boolean)
                mIsValidationComplete = value
            End Set
        End Property

        Public Sub New()
            '
        End Sub

    End Class


End Namespace
