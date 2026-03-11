Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class PrioritisationGuidanceData

        Private mPrioritisationCategoryDataList As List(Of PrioritisationCategoryData)

        <DataMember()> _
        Public Property PrioritisationCategoryDataList() As List(Of PrioritisationCategoryData)
            Get
                Return mPrioritisationCategoryDataList
            End Get
            Set(ByVal value As List(Of PrioritisationCategoryData))
                mPrioritisationCategoryDataList = value
            End Set
        End Property

        Public Sub New()
            mPrioritisationCategoryDataList = New List(Of PrioritisationCategoryData)
        End Sub

    End Class

End Namespace
