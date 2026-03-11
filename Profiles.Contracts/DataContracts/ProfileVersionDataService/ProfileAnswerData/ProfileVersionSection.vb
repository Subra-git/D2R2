Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class ProfileVersionSection

        Private mSectionId As Guid
        Private mProfileVersionId As Guid
        Private mFieldValueList As List(Of ProfileFieldValue)
        Private mQuestionNameList As List(Of QuestionName)
        Private mQuestionRowList As List(Of QuestionRow)
        Private mRevisionDates As RevisionDates
        Private mLastUpdated(7) As Byte
        Private mParentId As Guid

        <DataMember()> _
        Public Property SectionId() As Guid
            Get
                Return mSectionId
            End Get
            Set(ByVal value As Guid)
                mSectionId = value
            End Set
        End Property

        <DataMember()> _
        Public Property ProfileVersionId() As Guid
            Get
                Return mProfileVersionId
            End Get
            Set(ByVal value As Guid)
                mProfileVersionId = value
            End Set
        End Property

        <DataMember()> _
        Public Property FieldValueList() As List(Of ProfileFieldValue)
            Get
                Return mFieldValueList
            End Get
            Set(ByVal value As List(Of ProfileFieldValue))
                mFieldValueList = value
            End Set
        End Property

        <DataMember()> _
        Public Property QuestionNameList() As List(Of QuestionName)
            Get
                Return mQuestionNameList
            End Get
            Set(ByVal value As List(Of QuestionName))
                mQuestionNameList = value
            End Set
        End Property

        <DataMember()> _
        Public Property QuestionRowList() As List(Of QuestionRow)
            Get
                Return mQuestionRowList
            End Get
            Set(ByVal value As List(Of QuestionRow))
                mQuestionRowList = value
            End Set
        End Property

        <DataMember()> _
        Public Property RevisionDates() As RevisionDates
            Get
                Return mRevisionDates
            End Get
            Set(ByVal value As RevisionDates)
                mRevisionDates = value
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

        <DataMember()> _
        Public Property ParentId() As Guid
            Get
                Return mParentId
            End Get
            Set(ByVal value As Guid)
                mParentId = value
            End Set
        End Property

    End Class

End Namespace

