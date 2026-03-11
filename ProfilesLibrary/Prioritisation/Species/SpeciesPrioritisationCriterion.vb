Imports Profiles.Contracts

<Serializable()> _
Public Class SpeciesPrioritisationCriterion
    Inherits PrioritisationCriterionBase

#Region " Business Methods "

    Public ReadOnly Property Name() As String
        Get
            Return mName
        End Get
    End Property

#End Region

#Region " Factory Methods "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Friend Shared Function GetPrioritisationCriterion(ByVal dtoPrioritisationCriterion As DataContracts.SpeciesPrioritisationCriterion) As SpeciesPrioritisationCriterion
        Return New SpeciesPrioritisationCriterion(dtoPrioritisationCriterion)
    End Function

    Private Sub New()
        ' requires use of factory methods
    End Sub

    Private Sub New(ByVal dtoPrioritisationCriterion As DataContracts.SpeciesPrioritisationCriterion)

        Fetch(dtoPrioritisationCriterion)
        MarkAsChild()

    End Sub

#End Region

#Region " Data Access "

    Protected Overloads Sub Fetch(ByVal dtoPrioritisationCriterion As DataContracts.SpeciesPrioritisationCriterion)

        MyBase.Fetch(dtoPrioritisationCriterion)
        mPrioritisationCriterionValues = SpeciesPrioritisationCriterionValueList.GetPrioritisationCriterionValueList(dtoPrioritisationCriterion.PrioritisationCriterionValueList)

    End Sub

#End Region

End Class
