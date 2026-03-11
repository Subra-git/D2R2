Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class ProfilePrioritisationMetadata
    Inherits PrioritisationMetadataBase

#Region " Business Methods "

    Private mId As Guid
    Private mRankingRangeUpperBound As Integer
    Private mRankingRangeLowerBound As Integer
    Private mPrioritisationCategories As ProfilePrioritisationCategoryList

    Public Property RankingRangeUpperBound() As Integer
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mRankingRangeUpperBound
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As Integer)
            CanWriteProperty(True)
            If mRankingRangeUpperBound <> value Then
                mRankingRangeUpperBound = value
                ValidationRules.CheckRules("RankingRangeLowerBound")
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public Property RankingRangeLowerBound() As Integer
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mRankingRangeLowerBound
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As Integer)
            CanWriteProperty(True)
            If mRankingRangeLowerBound <> value Then
                mRankingRangeLowerBound = value
                ValidationRules.CheckRules("RankingRangeUpperBound")
                PropertyHasChanged()
            End If
        End Set
    End Property


    Protected Overrides Function GetIdValue() As Object
        Return mId
    End Function

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

    Public ReadOnly Property Categories() As ProfilePrioritisationCategoryList
        Get
            Return mPrioritisationCategories
        End Get
    End Property

    Public Overrides Function Save() As PrioritisationMetadataBase
        If NotAllScoresAreEqual() Then
            Return MyBase.Save()
        Else
            Throw New Validation.ValidationException("Not all criterion value scores can be equal within a category.  Changes made have been lost.")
        End If

    End Function

#End Region

#Region " Validation Rules "

    Protected Overrides Sub AddBusinessRules()

        ValidationRules.AddRule(AddressOf Validation.CommonRules.IntegerMinValue, New Validation.CommonRules.IntegerMinValueRuleArgs("RankingRangeLowerBound", 0))
        ValidationRules.AddRule(AddressOf Validation.CommonRules.IntegerMaxValue, New Validation.CommonRules.IntegerMaxValueRuleArgs("RankingRangeLowerBound", 998))
        ValidationRules.AddRule(AddressOf Validation.CommonRules.IntegerMinValue, New Validation.CommonRules.IntegerMinValueRuleArgs("RankingRangeUpperBound", 1))
        ValidationRules.AddRule(AddressOf Validation.CommonRules.IntegerMaxValue, New Validation.CommonRules.IntegerMaxValueRuleArgs("RankingRangeUpperBound", 999))
        ValidationRules.AddRule(AddressOf UpperRangeGTLowerRange, "RankingRangeLowerBound")
        ValidationRules.AddRule(AddressOf UpperRangeGTLowerRange, "RankingRangeUpperBound")

    End Sub

    Private Shared Function UpperRangeGTLowerRange(ByVal target As Object, ByVal e As Validation.RuleArgs) As Boolean

        Dim metadata As ProfilePrioritisationMetadata = DirectCast(target, ProfilePrioritisationMetadata)
        If metadata.mRankingRangeUpperBound < metadata.mRankingRangeLowerBound Then
            e.Description = "Ranking range upper bound must be greater than the lower bound"
            Return False
        End If
        Return True
    End Function

    Private Function NotAllScoresAreEqual() As Boolean
        For Each cat As ProfilePrioritisationCategory In mPrioritisationCategories
            Dim lastScore As Integer?
            Dim critValid As Boolean = False
            For Each crit As ProfilePrioritisationCriterion In cat.Criterion
                If critValid Then
                    Exit For
                End If
                For Each critValue As ProfilePrioritisationCriterionValue In crit.Values
                    If lastScore.HasValue AndAlso critValue.Score <> lastScore.Value Then
                        critValid = True
                        Exit For
                    End If
                    lastScore = critValue.Score
                Next
            Next
            If Not critValid Then
                Return False
            End If
        Next
        Return True
    End Function

#End Region

#Region " Factory Methods "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1024:UsePropertiesWhereAppropriate")> _
    Public Shared Function GetPrioritisationMetadata() As ProfilePrioritisationMetadata
        If Not CanGetObject() Then
            Throw New System.Security.SecurityException("You do not have permission to view prioritisation variables.")
        End If
        Return DataPortal.Fetch(Of ProfilePrioritisationMetadata)(New Criteria())
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
        Dim dtoPrioritisationMetadata As DataContracts.ProfilePrioritisationMetadata = db.GetProfilePrioritisationMetadata()

        mId = dtoPrioritisationMetadata.Id
        mRankingRangeLowerBound = dtoPrioritisationMetadata.RankingRangeLowerBound
        mRankingRangeUpperBound = dtoPrioritisationMetadata.RankingRangeUpperBound
        mLastUpdated = dtoPrioritisationMetadata.LastUpdated

        mPrioritisationCategories = ProfilePrioritisationCategoryList.GetPrioritisationCategoryList(dtoPrioritisationMetadata.PrioritisationCategoryList)

    End Sub

    Protected Overrides Sub DataPortal_Update()

        Dim db As ServiceContracts.IPrioritisationService = DataFactory.GetPrioritisationService()
        Dim changeset As New DataContracts.PrioritisationChangeSet()

        With changeset
            .RankingRangeLowerBound = mRankingRangeLowerBound
            .RankingRangeUpperBound = mRankingRangeUpperBound
            .LastUpdated = mLastUpdated
        End With

        mPrioritisationCategories.GetUpdate(changeset)

        Dim result As DataContracts.PrioritisationChangeResult = db.UpdateProfilePrioritisationMetadata(changeset)

        mLastUpdated = result.LastUpdated

        mPrioritisationCategories.Update()

        MarkOld()

    End Sub


#End Region


End Class
