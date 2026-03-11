Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class PrioritisationCriterionScore

        Private mPrioritisationCategoryId As Guid
        Private mPrioritisationCategoryName As String
        Private mPrioritisationCategoryDisplayName As String
        Private mPrioritisationCriterionId As Guid
        Private mPrioritisationCriterionCode As String
        Private mPrioritisationCriterionName As String
        Private mSpeciesId As Guid
        Private mSpeciesName As String
        Private mDataIncomplete As Boolean
        Private mIrrelevantCategory As Boolean
        Private mCriterionValue As String
        Private mScore As Integer

        Public Property PrioritisationCategoryId() As Guid
            Get
                Return mPrioritisationCategoryId
            End Get
            Set(ByVal value As Guid)
                mPrioritisationCategoryId = value
            End Set
        End Property

        Public Property PrioritisationCategoryName() As String
            Get
                Return mPrioritisationCategoryName
            End Get
            Set(ByVal value As String)
                mPrioritisationCategoryName = value
            End Set
        End Property

        Public Property PrioritisationCategoryDisplayName() As String
            Get
                Return mPrioritisationCategoryDisplayName
            End Get
            Set(ByVal value As String)
                mPrioritisationCategoryDisplayName = value
            End Set
        End Property

        Public Property PrioritisationCriterionId() As Guid
            Get
                Return mPrioritisationCriterionId
            End Get
            Set(ByVal value As Guid)
                mPrioritisationCriterionId = value
            End Set
        End Property

        Public Property PrioritisationCriterionCode() As String
            Get
                Return mPrioritisationCriterionCode
            End Get
            Set(ByVal value As String)
                mPrioritisationCriterionCode = value
            End Set
        End Property

        Public Property PrioritisationCriterionName() As String
            Get
                Return mPrioritisationCriterionName
            End Get
            Set(ByVal value As String)
                mPrioritisationCriterionName = value
            End Set
        End Property

        Public Property SpeciesId() As Guid
            Get
                Return mSpeciesId
            End Get
            Set(ByVal value As Guid)
                mSpeciesId = value
            End Set
        End Property

        Public Property SpeciesName() As String
            Get
                Return mSpeciesName
            End Get
            Set(ByVal value As String)
                mSpeciesName = value
            End Set
        End Property

        Public Property DataIncomplete() As Boolean
            Get
                Return mDataIncomplete
            End Get
            Set(ByVal value As Boolean)
                mDataIncomplete = value
            End Set
        End Property

        Public Property IrrelevantCategory() As Boolean
            Get
                Return mIrrelevantCategory
            End Get
            Set(ByVal value As Boolean)
                mIrrelevantCategory = value
            End Set
        End Property

        Public Property CriterionValue() As String
            Get
                Return mCriterionValue
            End Get
            Set(ByVal value As String)
                mCriterionValue = value
            End Set
        End Property

        Public Property Score() As Integer
            Get
                Return mScore
            End Get
            Set(ByVal value As Integer)
                mScore = value
            End Set
        End Property

        Public Sub New()
            '
        End Sub

    End Class

End Namespace
