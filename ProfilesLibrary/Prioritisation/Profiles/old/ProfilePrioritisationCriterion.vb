Imports Csla
Imports Csla.Data
Imports System.Data.SqlClient

<Serializable()> _
Public Class PrioritisationCriterion
    Inherits BusinessBase(Of PrioritisationCriterion)

#Region " Business Methods "


    Private mId As Guid
    Private mCategoryId As Guid
    Private mCode As String
    Private mName As String
    Private mWeight As Integer
    Private mPrioritisationCriterionValues As PrioritisationCriterionValueList = PrioritisationCriterionValueList.NewPrioritisationCriterionValueList()

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

    Public ReadOnly Property Values() As PrioritisationCriterionValueList
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

#Region " Validation Rules "

    Protected Overrides Sub AddBusinessRules()
        ValidationRules.AddRule(AddressOf Validation.CommonRules.IntegerMinValue, New Validation.CommonRules.IntegerMinValueRuleArgs("Weight", 1))
        ValidationRules.AddRule(AddressOf Validation.CommonRules.IntegerMaxValue, New Validation.CommonRules.IntegerMaxValueRuleArgs("Weight", 999))
        ValidationRules.AddRule(AddressOf Validation.CommonRules.StringRequired, "Name")
        ValidationRules.AddRule(AddressOf Validation.CommonRules.StringMaxLength, New Validation.MaxLengthRuleArgs("Name", 255))
    End Sub

#End Region



#Region " Factory Methods "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> Friend Shared Function GetPrioritisationCriterion(ByVal reader As SafeDataReader) As PrioritisationCriterion
        Return New PrioritisationCriterion(reader)
    End Function

    Private Sub New()
        MarkAsChild()
    End Sub

    Private Sub New(ByVal reader As SafeDataReader)
        MarkAsChild()
        Fetch(reader)
    End Sub

#End Region

#Region " Data Access "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Friend Sub FetchPrioritisationCriterionValue(ByVal reader As SafeDataReader)
        mPrioritisationCriterionValues.FetchPrioritisationCriterionValue(reader)
    End Sub

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Private Sub Fetch(ByVal reader As SafeDataReader)
        mId = reader.GetGuid(0)
        mCategoryId = reader.GetGuid(1)
        mCode = reader.GetString(2)
        mName = reader.GetString(3)
        mWeight = reader.GetInt32(4)

        MarkOld()
    End Sub


    Friend Sub Update(ByVal connection As SqlConnection)

        Using updateCommand As SqlCommand = connection.CreateCommand
            updateCommand.CommandType = CommandType.StoredProcedure
            updateCommand.CommandText = "spuPrioritisationCriterion"
            updateCommand.Parameters.AddWithValue("@CriterionId", mId)
            updateCommand.Parameters.AddWithValue("@Weighting", mWeight)
            updateCommand.Parameters.AddWithValue("@Name", mName)


            updateCommand.ExecuteNonQuery()
        End Using

        mPrioritisationCriterionValues.Update(connection)


        MarkOld()
    End Sub


#End Region

End Class

