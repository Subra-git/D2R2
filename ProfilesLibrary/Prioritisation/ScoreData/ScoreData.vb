Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class ScoreData
    Inherits ReadOnlyBase(Of ScoreData)

    Private mPrioritisationCategoryDataList As PrioritisationCategoryDataList
    Private mCommonQuestionDataList As CommonQuestionDataList
    Private mProfileDataList As ProfileDataList

#Region " Business Methods "

    Public ReadOnly Property PrioritisationCategoryDataList() As PrioritisationCategoryDataList
        Get
            Return mPrioritisationCategoryDataList
        End Get
    End Property

    Public ReadOnly Property CommonQuestionDataList() As CommonQuestionDataList
        Get
            Return mCommonQuestionDataList
        End Get
    End Property

    Public ReadOnly Property ProfileDataList() As ProfileDataList
        Get
            Return mProfileDataList
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return "Score Data Object"
    End Function

#End Region

#Region " Authorization Rules "

    Public Shared Function CanGetScoreData() As Boolean

        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return identity.IsProfileEditor

    End Function

#End Region

#Region " Factory Methods "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1024:UsePropertiesWhereAppropriate")> _
    Public Shared Function GetScoreData() As ScoreData

        If Not CanGetScoreData() Then
            Throw New System.Security.SecurityException("You do not have permission to get the Score Data.")
        End If
        Return DataPortal.Fetch(Of ScoreData)(New Criteria())

    End Function

    Private Sub New()
        'requires use of factory.
    End Sub

#End Region

#Region " Data Access "

    <Serializable()> _
    Private Class Criteria

        Public Sub New()
            '
        End Sub

    End Class

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA1801:ReviewUnusedParameters", MessageId:="criteria")> <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Private Overloads Sub DataPortal_Fetch(ByVal criteria As Criteria)

        Dim db As ServiceContracts.IPrioritisationService = DataFactory.GetPrioritisationService()
        Dim dtoScoreData As DataContracts.ScoreData = db.GetScoreData()

        mCommonQuestionDataList = CommonQuestionDataList.GetCommonQuestionDataList(dtoScoreData.CommonQuestionDataList)
        mPrioritisationCategoryDataList = PrioritisationCategoryDataList.GetPrioritisationCategoryDataList(dtoScoreData.PrioritisationCategoryDataList)
        mProfileDataList = ProfileDataList.GetProfileDataList(dtoScoreData.ProfileDataList)

    End Sub

#End Region


End Class
