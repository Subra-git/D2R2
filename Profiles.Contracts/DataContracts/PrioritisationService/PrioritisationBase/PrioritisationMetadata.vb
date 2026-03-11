Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    <KnownType(GetType(ProfilePrioritisationCategory))> _
    <KnownType(GetType(SpeciesPrioritisationCategory))> _
    Public MustInherit Class PrioritisationMetadata

        Private mLastUpdated(7) As Byte
        Private mPrioritisationCategoryList As List(Of PrioritisationCategory)

        <DataMember()> _
        Public Property LastUpdated() As Byte()
            Get
                Return mLastUpdated
            End Get
            Set(ByVal value As Byte())
                mLastUpdated = value
            End Set
        End Property

        <DataMember()> _
        Public Property PrioritisationCategoryList() As List(Of PrioritisationCategory)
            Get
                Return mPrioritisationCategoryList
            End Get
            Set(ByVal value As List(Of PrioritisationCategory))
                mPrioritisationCategoryList = value
            End Set
        End Property

        Public Sub New()
            mPrioritisationCategoryList = New List(Of PrioritisationCategory)
        End Sub

    End Class

End Namespace
