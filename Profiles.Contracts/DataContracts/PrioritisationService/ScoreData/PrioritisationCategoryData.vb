Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class PrioritisationCategoryData

        Private mPrioritisationQuestionDataList As List(Of PrioritisationQuestionData)
        Private mId As Guid
        Private mDisplayName As String
        Private mCategoryName As String

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
        Public Property CategoryName() As String
            Get
                Return mCategoryName
            End Get
            Set(ByVal value As String)
                mCategoryName = value
            End Set
        End Property

        <DataMember()> _
        Public Property DisplayName() As String
            Get
                Return mDisplayName
            End Get
            Set(ByVal value As String)
                mDisplayName = value
            End Set
        End Property

        <DataMember()> _
        Public Property PrioritisationQuestionDataList() As List(Of PrioritisationQuestionData)
            Get
                Return mPrioritisationQuestionDataList
            End Get
            Set(ByVal value As List(Of PrioritisationQuestionData))
                mPrioritisationQuestionDataList = value
            End Set
        End Property

        Public Sub New()
            mPrioritisationQuestionDataList = New List(Of PrioritisationQuestionData)
        End Sub

    End Class

End Namespace