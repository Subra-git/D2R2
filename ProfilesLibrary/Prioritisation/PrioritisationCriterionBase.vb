Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public MustInherit Class PrioritisationCriterionBase
    Inherits BusinessBase(Of PrioritisationCriterionBase)

#Region " Business Methods "

    Protected mId As Guid
    Protected mCategoryId As Guid
    Protected mName As String
    Protected mPrioritisationCriterionValues As PrioritisationCriterionValueListBase

    Public ReadOnly Property Id() As Guid
        Get
            Return mId
        End Get
    End Property

    Public ReadOnly Property CategoryId() As Guid
        Get
            Return mCategoryId
        End Get
    End Property

    Public ReadOnly Property Values() As PrioritisationCriterionValueListBase
        Get
            Return mPrioritisationCriterionValues
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mId
    End Function

    Public Overrides ReadOnly Property IsValid() As Boolean
        Get
            Return MyBase.IsValid AndAlso mPrioritisationCriterionValues.IsValid
        End Get
    End Property

    Public Overrides ReadOnly Property IsDirty() As Boolean
        Get
            Return MyBase.IsDirty OrElse mPrioritisationCriterionValues.IsDirty
        End Get
    End Property

#End Region

#Region " Data Access "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Protected Overridable Sub Fetch(ByVal dtoPrioritisationCriterion As DataContracts.PrioritisationCriterion)

        mId = dtoPrioritisationCriterion.Id
        mCategoryId = dtoPrioritisationCriterion.CategoryId
        mName = dtoPrioritisationCriterion.Name

        MarkOld()

    End Sub

    Friend Sub Update()

        mPrioritisationCriterionValues.Update()
        MarkOld()

    End Sub

    Friend Overridable Sub GetUpdate(ByVal changeset As DataContracts.PrioritisationChangeSet)

        mPrioritisationCriterionValues.GetUpdate(changeset)

    End Sub

#End Region

End Class
