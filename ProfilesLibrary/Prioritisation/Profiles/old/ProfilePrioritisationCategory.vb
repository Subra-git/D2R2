Imports Csla
Imports Csla.Data
Imports System.Data.SqlClient

<Serializable()> _
Public Class PrioritisationCategory
    Inherits BusinessBase(Of PrioritisationCategory)

#Region " Business Methods "

    Private mId As Guid
    Private mName As String
    Private mPrioritisationCriteria As PrioritisationCriterionList = PrioritisationCriterionList.NewPrioritisationCriterionList()

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

    Public ReadOnly Property Criterion() As PrioritisationCriterionList
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



#Region " Factory Methods "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Friend Shared Function GetPrioritisationCategory(ByVal reader As SafeDataReader) As PrioritisationCategory
        Return New PrioritisationCategory(reader)
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
    Friend Sub FetchPrioritisationCriterion(ByVal reader As SafeDataReader)
        mPrioritisationCriteria.FetchPrioritisationCriterion(reader)
    End Sub

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Private Sub Fetch(ByVal reader As SafeDataReader)

        mId = reader.GetGuid(0)
        mName = reader.GetString(1)

        MarkOld()
    End Sub


    Friend Sub Update(ByVal connection As SqlConnection)

        mPrioritisationCriteria.Update(connection)

        MarkOld()

    End Sub


#End Region

End Class

