Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class ProfileNoteType

        Private mId As Guid
        Private mName As String
        Private mPluralName As String

        <DataMember()> _
        Public Property Id() As Guid
            Get
                Return mId
            End Get
            Set(ByVal value As Guid)
                mId = value
            End Set
        End Property

        <DataMember()> _
        Public Property Name() As String
            Get
                Return mName
            End Get
            Private Set(ByVal value As String)
                mName = value
            End Set
        End Property

        <DataMember()> _
        Public Property PluralName() As String
            Get
                Return mPluralName
            End Get
            Private Set(ByVal value As String)
                mPluralName = value
            End Set
        End Property

        Public Sub New(ByVal id As Guid, _
                       ByVal name As String, _
                       ByVal pluralName As String)

            mId = id
            mName = name
            mPluralName = pluralName

        End Sub

    End Class

End Namespace
