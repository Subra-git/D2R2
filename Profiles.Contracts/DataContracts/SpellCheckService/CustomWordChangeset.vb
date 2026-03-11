Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
        Public Class CustomWordChangeset

        Private mDeleteList As List(Of CustomWordDelete)
        Private mInsertList As List(Of CustomWordInsert)
        Private mUpdateList As List(Of CustomWordUpdate)

        <DataMember()> _
        Public Property DeleteList() As List(Of CustomWordDelete)
            Get
                Return mDeleteList
            End Get
            Set(ByVal value As List(Of CustomWordDelete))
                mDeleteList = value
            End Set
        End Property

        <DataMember()> _
        Public Property InsertList() As List(Of CustomWordInsert)
            Get
                Return mInsertList
            End Get
            Set(ByVal value As List(Of CustomWordInsert))
                mInsertList = value
            End Set
        End Property

        <DataMember()> _
        Public Property UpdateList() As List(Of CustomWordUpdate)
            Get
                Return mUpdateList
            End Get
            Set(ByVal value As List(Of CustomWordUpdate))
                mUpdateList = value
            End Set
        End Property

        Public Sub New()
            mDeleteList = New List(Of CustomWordDelete)
            mInsertList = New List(Of CustomWordInsert)
            mUpdateList = New List(Of CustomWordUpdate)
        End Sub

    End Class

End Namespace



