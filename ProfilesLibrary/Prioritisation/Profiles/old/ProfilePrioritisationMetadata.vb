Imports Csla
Imports Csla.Data
Imports System.Data.SqlClient

<Serializable()> _
Public Class PrioritisationMetadata
    Inherits BusinessBase(Of PrioritisationMetadata)

#Region " Business Methods "

    Private mId As Guid
    Private mRankingRangeUpperBound As Integer
    Private mRankingRangeLowerBound As Integer
    Private mLastUpdated(7) As Byte
    Private mPrioritisationCategories As PrioritisationCategoryList = PrioritisationCategoryList.NewPrioritisationCategoryList()


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

    Public ReadOnly Property Categories() As PrioritisationCategoryList
        Get
            Return mPrioritisationCategories
        End Get
    End Property

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


    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Globalization", "CA1303:DoNotPassLiteralsAsLocalizedParameters", MessageId:="System.Security.SecurityException.#ctor(System.String)")> _
    Public Overrides Function Save() As PrioritisationMetadata
        If Not CanEditObject() Then
            Throw New System.Security.SecurityException("You do not have permission to edit prioritisation variables.")
        End If

        Return MyBase.Save()
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

        Dim metadata As PrioritisationMetadata = DirectCast(target, PrioritisationMetadata)
        If metadata.mRankingRangeUpperBound < metadata.mRankingRangeLowerBound Then
            e.Description = "Ranking range upper bound must be greater than the lower bound"
            Return False
        End If
        Return True
    End Function

#End Region

#Region " Authorization Rules "


    Public Shared Function CanGetObject() As Boolean
        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return identity.IsProfileEditor        
    End Function

    Public Shared Function CanEditObject() As Boolean
        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return identity.IsProfileEditor
    End Function



#End Region

#Region " Factory Methods "


    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1024:UsePropertiesWhereAppropriate")> _
    Public Shared Function GetPrioritisationMetadata() As PrioritisationMetadata
        If Not CanGetObject() Then
            Throw New System.Security.SecurityException("You do not have permission to view prioritisation variables.")
        End If
        Return DataPortal.Fetch(Of PrioritisationMetadata)(New Criteria())
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

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand

                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgaPrioritisationVariables"

                Using reader As New SafeDataReader(getCommand.ExecuteReader)
                    While reader.Read()
                        mId = reader.GetGuid(0)
                        mRankingRangeLowerBound = reader.GetInt32(1)
                        mRankingRangeUpperBound = reader.GetInt32(2)
                        reader.GetBytes("LastUpdated", 0, mLastUpdated, 0, 8)
                    End While


                    'move to category recordset if exists
                    If reader.NextResult() Then

                        mPrioritisationCategories = PrioritisationCategoryList.GetPrioritisationCategoryList(reader)

                        'add categories to dictionary
                        Dim categoryDictionary As Dictionary(Of Guid, PrioritisationCategory) = New Dictionary(Of Guid, PrioritisationCategory)
                        For Each category As PrioritisationCategory In mPrioritisationCategories
                            categoryDictionary.Add(category.Id, category)
                        Next

                        'do any categories exist
                        If categoryDictionary.Count > 0 Then

                            'move to criterion recordset if exists
                            If reader.NextResult() Then

                                While reader.Read()
                                    Dim categoryId As Guid = reader.GetGuid(1)
                                    categoryDictionary(categoryId).FetchPrioritisationCriterion(reader)
                                End While

                                'add criterion objects from each category object to criterion dictionary
                                Dim criterionDictionary As Dictionary(Of Guid, PrioritisationCriterion) = New Dictionary(Of Guid, PrioritisationCriterion)

                                For Each category As PrioritisationCategory In mPrioritisationCategories

                                    For Each criterion As PrioritisationCriterion In categoryDictionary(category.Id).Criterion
                                        criterionDictionary.Add(criterion.Id, criterion)
                                    Next

                                Next

                                'do any criterion exist in any category
                                If criterionDictionary.Count > 0 Then

                                    'move to criterion value recordset if exists
                                    If reader.NextResult() Then

                                        While reader.Read()
                                            Dim criterionId As Guid = reader.GetGuid(1)
                                            criterionDictionary(criterionId).FetchPrioritisationCriterionValue(reader)
                                        End While
                                    End If

                                End If

                            End If
                        End If
                    End If

                End Using
            End Using
        End Using

    End Sub


    <Transactional(TransactionalTypes.TransactionScope)> _
    Protected Overrides Sub DataPortal_Update()
        ' update values
        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using updateCommand As SqlCommand = connection.CreateCommand
                updateCommand.CommandType = CommandType.StoredProcedure
                updateCommand.CommandText = "spuPrioritisationRankingRange"
                updateCommand.Parameters.AddWithValue("@UpperBound", mRankingRangeUpperBound)
                updateCommand.Parameters.AddWithValue("@LowerBound", mRankingRangeLowerBound)
                updateCommand.Parameters.AddWithValue("@LastUpdated", mLastUpdated)
                Dim output As New SqlParameter("@NewLastUpdated", SqlDbType.Timestamp)
                output.Direction = ParameterDirection.Output
                updateCommand.Parameters.Add(output)
                updateCommand.ExecuteNonQuery()
                mLastUpdated = CType(updateCommand.Parameters("@NewLastUpdated").Value, Byte())
            End Using

            mPrioritisationCategories.Update(connection)

            Using calculateCommand As SqlCommand = connection.CreateCommand
                calculateCommand.CommandType = CommandType.StoredProcedure
                calculateCommand.CommandText = "sppPrioritisationScore"
                calculateCommand.ExecuteNonQuery()
            End Using

        End Using


        MarkOld()
    End Sub




#End Region

End Class
