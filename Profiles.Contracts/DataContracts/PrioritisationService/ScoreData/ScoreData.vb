Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class ScoreData

        Private mPrioritisationCategoryDataList As List(Of PrioritisationCategoryData)
        Private mCommonQuestionDataList As List(Of CommonQuestionData)
        Private mProfileDataList As List(Of ProfileData)

        <DataMember()> _
        Public Property PrioritisationCategoryDataList() As List(Of PrioritisationCategoryData)
            Get
                Return mPrioritisationCategoryDataList
            End Get
            Set(ByVal value As List(Of PrioritisationCategoryData))
                mPrioritisationCategoryDataList = value
            End Set
        End Property

        <DataMember()> _
        Public Property CommonQuestionDataList() As List(Of CommonQuestionData)
            Get
                Return mCommonQuestionDataList
            End Get
            Set(ByVal value As List(Of CommonQuestionData))
                mCommonQuestionDataList = value
            End Set
        End Property

        <DataMember()> _
        Public Property ProfileDataList() As List(Of ProfileData)
            Get
                Return mProfileDataList
            End Get
            Set(ByVal value As List(Of ProfileData))
                mProfileDataList = value
            End Set
        End Property

        Public Sub New()
            mPrioritisationCategoryDataList = New List(Of PrioritisationCategoryData)
            mCommonQuestionDataList = New List(Of CommonQuestionData)
            mProfileDataList = New List(Of ProfileData)
        End Sub

    End Class

End Namespace
