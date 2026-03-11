Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class PrioritisationGuidanceData
    Inherits ReadOnlyBase(Of PrioritisationGuidanceData)

    Private mPrioritisationCategoryDataList As PrioritisationCategoryDataList
    

#Region " Business Methods "

    Public ReadOnly Property PrioritisationCategoryDataList() As PrioritisationCategoryDataList
        Get
            Return mPrioritisationCategoryDataList
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return "Guidance Data Object"
    End Function

#End Region

#Region " Authorization Rules "

    Public Shared Function CanGetPrioritisationGuidanceData() As Boolean

        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return identity.IsProfileEditor

    End Function

#End Region

#Region " Factory Methods "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1024:UsePropertiesWhereAppropriate")> _
    Public Shared Function GetPrioritisationGuidanceData() As PrioritisationGuidanceData

        If Not CanGetPrioritisationGuidanceData() Then
            Throw New System.Security.SecurityException("You do not have permission to get the Guidance Data.")
        End If
        Return DataPortal.Fetch(Of PrioritisationGuidanceData)(New Criteria())

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
        Dim dtoPrioritisationGuidanceData As DataContracts.PrioritisationGuidanceData = db.GetPrioritisationGuidanceData()

        mPrioritisationCategoryDataList = PrioritisationCategoryDataList.GetPrioritisationCategoryDataList(dtoPrioritisationGuidanceData.PrioritisationCategoryDataList)

    End Sub

#End Region


End Class

