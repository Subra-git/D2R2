Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public MustInherit Class PrioritisationCriterionValueBase
    Inherits BusinessBase(Of PrioritisationCriterionValueBase)

#Region " Business Methods "

    Protected mId As Guid
    Protected mCriterionId As Guid
    Protected mValue As String
    Protected mScore As Integer

    Public ReadOnly Property Id() As Guid
        Get
            Return mId
        End Get
    End Property

    Public ReadOnly Property CriterionId() As Guid
        Get
            Return mCriterionId
        End Get
    End Property

    Public ReadOnly Property Value() As String
        Get
            Return mValue
        End Get
    End Property

    Public Property Score() As Integer
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mScore
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As Integer)
            CanWriteProperty(True)
            If mScore <> value Then
                mScore = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mId
    End Function

    Public Overrides ReadOnly Property IsValid() As Boolean
        Get
            Return MyBase.IsValid
        End Get
    End Property

    Public Overrides ReadOnly Property IsDirty() As Boolean
        Get
            Return MyBase.IsDirty
        End Get
    End Property

#End Region

#Region " Data Access "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Protected Overridable Sub Fetch(ByVal dtoPrioritisationCriterionValue As DataContracts.PrioritisationCriterionValue)
        mId = dtoPrioritisationCriterionValue.Id
        mCriterionId = dtoPrioritisationCriterionValue.CriterionId
        mValue = dtoPrioritisationCriterionValue.Value
        mScore = dtoPrioritisationCriterionValue.Score

        MarkOld()
    End Sub

    Friend Sub Update()

        MarkOld()

    End Sub

    Friend Sub GetUpdate(ByVal changeset As DataContracts.PrioritisationChangeSet)

        changeset.CriterionValueUpdateList.Add(New DataContracts.CriterionValueUpdate() With {.Id = mId, .Score = mScore})

    End Sub

#End Region

End Class
