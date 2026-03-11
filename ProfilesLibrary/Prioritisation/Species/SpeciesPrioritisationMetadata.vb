Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class SpeciesPrioritisationMetadata
    Inherits PrioritisationMetadataBase

#Region " Business Methods "

    Private mPrioritisationCategories As SpeciesPrioritisationCategoryList

    Public Overrides ReadOnly Property IsValid() As Boolean
        Get
            Return MyBase.IsValid AndAlso mPrioritisationCategories.IsValid
        End Get
    End Property

    Public Overrides ReadOnly Property IsDirty() As Boolean
        Get
            Return MyBase.IsDirty OrElse mPrioritisationCategories.IsDirty
        End Get
    End Property

    Public ReadOnly Property Categories() As SpeciesPrioritisationCategoryList
        Get
            Return mPrioritisationCategories
        End Get
    End Property

#End Region

#Region " Factory Methods "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1024:UsePropertiesWhereAppropriate")> _
    Public Shared Function GetPrioritisationMetadata() As SpeciesPrioritisationMetadata
        If Not CanGetObject() Then
            Throw New System.Security.SecurityException("You do not have permission to view cross-cutting issue scores.")
        End If
        Return DataPortal.Fetch(Of SpeciesPrioritisationMetadata)(New Criteria())
    End Function


    Private Sub New()
        ' require use of factory methods
    End Sub

#End Region


#Region " Data Access "

    <Serializable()> _
    Private Class Criteria

        Public Sub New()
        End Sub

    End Class

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA1801:ReviewUnusedParameters", MessageId:="criteria")> <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Private Overloads Sub DataPortal_Fetch(ByVal criteria As Criteria)

        Dim db As ServiceContracts.IPrioritisationService = DataFactory.GetPrioritisationService()
        Dim dtoPrioritisationMetadata As DataContracts.SpeciesPrioritisationMetadata = db.GetSpeciesPrioritisationMetadata()

        mLastUpdated = dtoPrioritisationMetadata.LastUpdated
        mPrioritisationCategories = SpeciesPrioritisationCategoryList.GetPrioritisationCategoryList(dtoPrioritisationMetadata.PrioritisationCategoryList)

    End Sub

    Protected Overrides Sub DataPortal_Update()

        Dim db As ServiceContracts.IPrioritisationService = DataFactory.GetPrioritisationService()
        Dim changeset As New DataContracts.PrioritisationChangeSet()

        With changeset
            .LastUpdated = mLastUpdated
        End With

        mPrioritisationCategories.GetUpdate(changeset)

        Dim result As DataContracts.PrioritisationChangeResult = db.UpdateSpeciesPrioritisationMetadata(changeset)

        mLastUpdated = result.LastUpdated

        mPrioritisationCategories.Update()

        MarkOld()

    End Sub

#End Region

End Class
