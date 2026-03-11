Imports Csla
Imports Csla.Data
Imports System.Data.SqlClient

<Serializable()> _
Public Class PrioritisationCriterionValue
    Inherits BusinessBase(Of PrioritisationCriterionValue)

#Region " Business Methods "

    Private mId As Guid
    Private mCriterionId As Guid
    Private mValue As String
    Private mScore As Integer


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

#Region " Validation Rules "

    Protected Overrides Sub AddBusinessRules()        
        ValidationRules.AddRule(AddressOf Validation.CommonRules.IntegerMinValue, New Validation.CommonRules.IntegerMinValueRuleArgs("Score", 0))
        ValidationRules.AddRule(AddressOf Validation.CommonRules.IntegerMaxValue, New Validation.CommonRules.IntegerMaxValueRuleArgs("Score", 999))
    End Sub

#End Region



#Region " Factory Methods "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Friend Shared Function GetPrioritisationCriterionValue(ByVal reader As SafeDataReader) As PrioritisationCriterionValue
        Return New PrioritisationCriterionValue(reader)
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
    Private Sub Fetch(ByVal reader As SafeDataReader)

        mId = reader.GetGuid(0)
        mCriterionId = reader.GetGuid(1)
        mValue = reader.GetString(2)
        mScore = reader.GetInt32(3)

        MarkOld()
    End Sub


    Friend Sub Update(ByVal connection As SqlConnection)

        Using updateCommand As SqlCommand = connection.CreateCommand
            updateCommand.CommandType = CommandType.StoredProcedure
            updateCommand.CommandText = "spuPrioritisationCriterionValue"
            updateCommand.Parameters.AddWithValue("@CriterionValueId", mId)
            updateCommand.Parameters.AddWithValue("@Score", mScore)
            updateCommand.ExecuteNonQuery()
        End Using

        MarkOld()
    End Sub


#End Region

End Class

