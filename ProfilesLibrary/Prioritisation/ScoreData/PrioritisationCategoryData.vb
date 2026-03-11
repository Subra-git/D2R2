Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class PrioritisationCategoryData
    Inherits ReadOnlyBase(Of PrioritisationCategoryData)

    Private mId As Guid
    Private mDisplayName As String
    Private mCategoryName As String
    Private mPrioritisationQuestionDataList As PrioritisationQuestionDataList


#Region " Business Methods "

    Public ReadOnly Property Id() As Guid
        Get
            Return mId
        End Get
    End Property

    Public ReadOnly Property DisplayName() As String
        Get
            Return mDisplayName
        End Get
    End Property

    Public ReadOnly Property CategoryName() As String
        Get
            Return mCategoryName
        End Get
    End Property

    Public ReadOnly Property PrioritisationQuestionDataList() As PrioritisationQuestionDataList
        Get
            Return mPrioritisationQuestionDataList
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mId.ToString()
    End Function

#End Region

#Region " Factory Methods "

    Friend Shared Function GetPrioritisationCategoryData(ByVal dtoCategoryData As DataContracts.PrioritisationCategoryData) As PrioritisationCategoryData
        Return New PrioritisationCategoryData(dtoCategoryData)
    End Function

    Private Sub New()
        'requires use of factory 
    End Sub

    Private Sub New(ByVal dtoCategoryData As DataContracts.PrioritisationCategoryData)
        Fetch(dtoCategoryData)
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal dtoCategoryData As DataContracts.PrioritisationCategoryData)
        mId = dtoCategoryData.Id
        mDisplayName = dtoCategoryData.DisplayName
        mCategoryName = dtoCategoryData.CategoryName
        mPrioritisationQuestionDataList = PrioritisationQuestionDataList.GetPrioritisationQuestionDataList(dtoCategoryData.PrioritisationQuestionDataList)
    End Sub

#End Region

End Class
