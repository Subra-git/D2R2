Imports Profiles.Contracts

<Serializable()> _
Public Class ProfilePrioritisationCriterion
    Inherits PrioritisationCriterionBase

#Region " Business Methods "

    Private mCode As String
    Private mWeight As Integer

    Public Property Name() As String
        Get
            Return mName
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As String)
            CanWriteProperty(True)
            If mName <> value Then
                mName = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public ReadOnly Property CodeAndName() As String
        Get
            Return mCode & " - " & mName
        End Get
    End Property

    Public ReadOnly Property Code() As String
        Get
            Return mCode
        End Get
    End Property

    Public Property Weight() As Integer
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mWeight
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As Integer)
            CanWriteProperty(True)
            If mWeight <> value Then
                mWeight = value
                PropertyHasChanged()
            End If
        End Set
    End Property

#End Region

#Region " Factory Methods "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Friend Shared Function GetPrioritisationCriterion(ByVal dtoPrioritisationCriterion As DataContracts.ProfilePrioritisationCriterion) As ProfilePrioritisationCriterion
        Return New ProfilePrioritisationCriterion(dtoPrioritisationCriterion)
    End Function

    Private Sub New()
        MarkAsChild()
    End Sub

    Private Sub New(ByVal dtoPrioritisationCriterion As DataContracts.ProfilePrioritisationCriterion)
        Fetch(dtoPrioritisationCriterion)
        MarkAsChild()
    End Sub

#End Region

#Region " Data Access "

    Protected Overloads Sub Fetch(ByVal dtoPrioritisationCriterion As DataContracts.ProfilePrioritisationCriterion)

        MyBase.Fetch(dtoPrioritisationCriterion)
        mCode = dtoPrioritisationCriterion.Code
        mWeight = dtoPrioritisationCriterion.Weight
        mPrioritisationCriterionValues = ProfilePrioritisationCriterionValueList.GetPrioritisationCriterionValueList(dtoPrioritisationCriterion.PrioritisationCriterionValueList)

    End Sub

    Friend Overrides Sub GetUpdate(ByVal changeset As Profiles.Contracts.DataContracts.PrioritisationChangeSet)

        changeset.CriterionUpdateList.Add(New DataContracts.CriterionUpdate() With { _
                                          .CriterionId = mId, .Name = mName, .Weight = mWeight})
        MyBase.GetUpdate(changeset)

    End Sub


#End Region

End Class
