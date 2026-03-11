Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class GetCurrentPublicWhatIfScenarioRequest

        Private mParentProfileId As Guid

        <DataMember()> _
        Public Property ParentProfileId() As Guid
            Get
                Return mParentProfileId
            End Get
            Set(ByVal value As Guid)
                mParentProfileId = value
            End Set
        End Property

        Public Sub New(ByVal parentProfileId As Guid)
            mParentProfileId = parentProfileId
        End Sub

        Public Sub New()
            '
        End Sub

    End Class

End Namespace

