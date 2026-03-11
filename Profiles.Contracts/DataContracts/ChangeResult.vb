Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
        Public Class ChangeResult

        Private mIdInsertList As List(Of Guid)
        Private mLastUpdatedInsertList As List(Of Byte())
        Private mLastUpdatedUpdateList As List(Of Byte())

        <DataMember()> _
        Public Property IdInsertList() As List(Of Guid)
            Get
                Return mIdInsertList
            End Get
            Set(ByVal value As List(Of Guid))
                mIdInsertList = value
            End Set
        End Property

        <DataMember()> _
        Public Property LastUpdatedInsertList() As List(Of Byte())
            Get
                Return mLastUpdatedInsertList
            End Get
            Set(ByVal value As List(Of Byte()))
                mLastUpdatedInsertList = value
            End Set
        End Property

        <DataMember()> _
        Public Property LastUpdatedUpdateList() As List(Of Byte())
            Get
                Return mLastUpdatedUpdateList
            End Get
            Set(ByVal value As List(Of Byte()))
                mLastUpdatedUpdateList = value
            End Set
        End Property

        Public Sub New()
            mIdInsertList = New List(Of Guid)
            mLastUpdatedInsertList = New List(Of Byte())
            mLastUpdatedUpdateList = New List(Of Byte())
        End Sub

    End Class

End Namespace


