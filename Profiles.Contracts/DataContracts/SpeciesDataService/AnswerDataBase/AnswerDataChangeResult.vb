Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    <KnownType(GetType(ProfileAnswerDataChangeResult))> _
    <KnownType(GetType(SpeciesAnswerDataChangeResult))> _
    Public MustInherit Class AnswerDataChangeResult

        Private mLastUpdated(7) As Byte

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
            '
        End Sub

    End Class

End Namespace
