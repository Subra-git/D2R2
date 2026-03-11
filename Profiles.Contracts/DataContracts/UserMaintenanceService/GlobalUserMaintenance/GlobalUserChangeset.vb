Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
        Public Class GlobalUserChangeset

        Private mInsertList As List(Of GlobalUserInsert)
        Private mUpdateList As List(Of GlobalUserUpdate)

        <DataMember()> _
        Public Property InsertList() As List(Of GlobalUserInsert)
            Get
                Return mInsertList
            End Get
            Set(ByVal value As List(Of GlobalUserInsert))
                mInsertList = value
            End Set
        End Property

        <DataMember()> _
        Public Property UpdateList() As List(Of GlobalUserUpdate)
            Get
                Return mUpdateList
            End Get
            Set(ByVal value As List(Of GlobalUserUpdate))
                mUpdateList = value
            End Set
        End Property

        Public Sub New()
            mInsertList = New List(Of GlobalUserInsert)
            mUpdateList = New List(Of GlobalUserUpdate)
        End Sub

    End Class

End Namespace



