Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class ProfileQuestionData

        Private mId As Guid
        Private mName As String = String.Empty
        Private mShortName As String = String.Empty
        Private mNonTechnicalName As String = String.Empty
        Private mQuestionNumber As Integer
        Private mUserGuidance As String = String.Empty
        Private mLastUpdated(7) As Byte

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
        Public Property ShortName() As String
            Get
                Return mShortName
            End Get
            Set(ByVal value As String)
                mShortName = value
            End Set
        End Property

        <DataMember()> _
        Public Property NonTechnicalName() As String
            Get
                Return mNonTechnicalName
            End Get
            Set(ByVal value As String)
                mNonTechnicalName = value
            End Set
        End Property

        <DataMember()> _
        Public Property QuestionNumber() As Integer
            Get
                Return mQuestionNumber
            End Get
            Set(ByVal value As Integer)
                mQuestionNumber = value
            End Set
        End Property

        <DataMember()> _
        Public Property UserGuidance() As String
            Get
                Return mUserGuidance
            End Get
            Set(ByVal value As String)
                mUserGuidance = value
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

        Public Sub New()
            '
        End Sub

    End Class

End Namespace