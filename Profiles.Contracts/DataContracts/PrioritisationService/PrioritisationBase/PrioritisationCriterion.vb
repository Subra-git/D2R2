Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    <KnownType(GetType(ProfilePrioritisationCriterion))> _
    <KnownType(GetType(SpeciesPrioritisationCriterion))> _
    Public MustInherit Class PrioritisationCriterion

        Private mId As Guid
        Private mName As String
        Private mCategoryId As Guid
        Private mPrioritisationCriterionValueList As List(Of PrioritisationCriterionValue)

        <DataMember()> _
        Public Property Id() As Guid
            Get
                Return mId
            End Get
            Set(ByVal value As Guid)
                mId = value
            End Set
        End Property

        <DataMember()> _
        Public Property Name() As String
            Get
                Return mName.StripPTags().SanitizeHtml()
            End Get
            Set(ByVal value As String)
                mName = value
            End Set
        End Property

        <DataMember()> _
        Public Property CategoryId() As Guid
            Get
                Return mCategoryId
            End Get
            Set(ByVal value As Guid)
                mCategoryId = value
            End Set
        End Property

        <DataMember()> _
        Public Property PrioritisationCriterionValueList() As List(Of PrioritisationCriterionValue)
            Get
                Return mPrioritisationCriterionValueList
            End Get
            Set(ByVal value As List(Of PrioritisationCriterionValue))
                mPrioritisationCriterionValueList = value
            End Set
        End Property

        Public Sub New()
            mPrioritisationCriterionValueList = New List(Of PrioritisationCriterionValue)
        End Sub

    End Class

End Namespace
