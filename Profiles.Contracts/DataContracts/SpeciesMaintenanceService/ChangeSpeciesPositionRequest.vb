Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class ChangeSpeciesPositionRequest

        Private mSpeciesId As Guid
        Private mIsMovingUp As Boolean

        <DataMember()> _
        Public Property SpeciesId() As Guid
            Get
                Return mSpeciesId
            End Get
            Set(ByVal value As Guid)
                mSpeciesId = value
            End Set
        End Property

        <DataMember()> _
        Public Property IsMovingUp() As Boolean
            Get
                Return mIsMovingUp
            End Get
            Set(ByVal value As Boolean)
                mIsMovingUp = value
            End Set
        End Property

        Public Sub New(ByVal speciesId As Guid, ByVal isMovingUp As Boolean)
            mSpeciesId = speciesId
            mIsMovingUp = isMovingUp
        End Sub

    End Class

End Namespace


