Imports Csla
Imports Profiles.Contracts

Public MustInherit Class PrioritisationCategoryBase
    Inherits BusinessBase(Of PrioritisationCategoryBase)

#Region " Business Methods "

    Protected mId As Guid
    Protected mName As String
    Protected mPrioritisationCriteria As PrioritisationCriterionListBase

    Public ReadOnly Property Id() As Guid
        Get
            Return mId
        End Get
    End Property

    Public ReadOnly Property Name() As String
        Get
            Return mName
        End Get
    End Property

    Public ReadOnly Property Criterion() As PrioritisationCriterionListBase
        Get
            Return mPrioritisationCriteria
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mId
    End Function

    Public Overrides ReadOnly Property IsValid() As Boolean
        Get
            Return MyBase.IsValid AndAlso mPrioritisationCriteria.IsValid
        End Get
    End Property

    Public Overrides ReadOnly Property IsDirty() As Boolean
        Get
            Return MyBase.IsDirty OrElse mPrioritisationCriteria.IsDirty
        End Get
    End Property

#End Region

#Region " Data Access "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Protected Overridable Sub Fetch(ByVal dtoPrioritisationCategory As DataContracts.PrioritisationCategory)

        mId = dtoPrioritisationCategory.Id
        mName = dtoPrioritisationCategory.Name

        MarkOld()

    End Sub

    Friend Sub Update()

        mPrioritisationCriteria.Update()
        MarkOld()

    End Sub

    Friend Sub GetUpdate(ByVal changeset As DataContracts.PrioritisationChangeSet)

        mPrioritisationCriteria.GetUpdate(changeset)

    End Sub

#End Region

End Class
