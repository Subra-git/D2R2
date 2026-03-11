Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    <KnownType(GetType(ProfilePrioritisationCategory))> _
    <KnownType(GetType(SpeciesPrioritisationCategory))> _
    Public MustInherit Class PrioritisationCategory

        Private mPrioritisationCriterionList As List(Of PrioritisationCriterion)
        Private mId As Guid
        Private mName As String

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
                Return mName
            End Get
            Set(ByVal value As String)
                mName = value
            End Set
        End Property

        <DataMember()> _
        Public Property PrioritisationCriterionList() As List(Of PrioritisationCriterion)
            Get
                Return mPrioritisationCriterionList
            End Get
            Set(ByVal value As List(Of PrioritisationCriterion))
                mPrioritisationCriterionList = value
            End Set
        End Property

        Public Sub New()
            mPrioritisationCriterionList = New List(Of PrioritisationCriterion)
        End Sub

    End Class

End Namespace
