Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class GetNewProfileDefaultsRequest

        Private mCloneProfileVersionId As Guid
        Private mIsWhatIfScenario As Boolean

        <DataMember()> _
        Public Property IsWhatIfScenario() As Boolean
            Get
                Return mIsWhatIfScenario
            End Get
            Private Set(ByVal value As Boolean)
                mIsWhatIfScenario = value
            End Set
        End Property

        <DataMember()> _
        Public Property CloneProfileVersionId() As Guid
            Get
                Return mCloneProfileVersionId
            End Get
            Private Set(ByVal value As Guid)
                mCloneProfileVersionId = value
            End Set
        End Property

        Public Sub New(ByVal cloneProfileVersionId As Guid, ByVal isWhatIfScenario As Boolean)
            mCloneProfileVersionId = cloneProfileVersionId
            mIsWhatIfScenario = isWhatIfScenario
        End Sub

    End Class

End Namespace







