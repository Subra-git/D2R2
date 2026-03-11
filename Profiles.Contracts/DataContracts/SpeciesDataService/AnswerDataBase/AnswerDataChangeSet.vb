Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    <KnownType(GetType(ProfileAnswerDataChangeSet))> _
    <KnownType(GetType(SpeciesAnswerDataChangeSet))> _
    Public MustInherit Class AnswerDataChangeSet

        Private mFieldValueUpdateList As List(Of FieldValueUpdate)
        Private mLastUpdated(7) As Byte

        <DataMember()> _
        Public Property FieldValueUpdateList() As List(Of FieldValueUpdate)
            Get
                Return mFieldValueUpdateList
            End Get
            Set(ByVal value As List(Of FieldValueUpdate))
                mFieldValueUpdateList = value
            End Set
        End Property

        <DataMember()> _
           Public Property LastUpdated() As Byte()
            Get
                Return mLastUpdated
            End Get
            Set(ByVal value As Byte())
                mLastUpdated = value
            End Set
        End Property

        Public Sub New()
            mFieldValueUpdateList = New List(Of FieldValueUpdate)
        End Sub

    End Class

End Namespace
