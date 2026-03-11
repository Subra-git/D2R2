Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class CommonQuestionData

        Private mId As Guid
        Private mSectionNumber As Integer
        Private mQuestionNumber As Integer
        Private mName As String

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
       Public Property SectionNumber() As Integer
            Get
                Return mSectionNumber
            End Get
            Set(ByVal value As Integer)
                mSectionNumber = value
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
       Public Property Name() As String
            Get
                Return mName
            End Get
            Set(ByVal value As String)
                mName = value
            End Set
        End Property

        Public Sub New()
            '
        End Sub

    End Class


End Namespace
