Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    <KnownType(GetType(ProfilePrioritisationCriterionValue))> _
    <KnownType(GetType(SpeciesPrioritisationCriterionValue))> _
    Public MustInherit Class PrioritisationCriterionValue

        Private mId As Guid
        Private mCriterionId As Guid
        Private mValue As String
        Private mScore As Integer

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
        Public Property CriterionId() As Guid
            Get
                Return mCriterionId
            End Get
            Set(ByVal value As Guid)
                mCriterionId = value
            End Set
        End Property

        <DataMember()> _
        Public Property Value() As String
            Get
                Return mValue
            End Get
            Set(ByVal value As String)
                mValue = value
            End Set
        End Property

        <DataMember()> _
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
