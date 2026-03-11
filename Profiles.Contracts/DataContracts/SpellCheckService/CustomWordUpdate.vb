Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
        Public Class CustomWordUpdate

        Private mId As Guid
        Private mWord As String
        Private mLastUpdated(7) As Byte

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
        Public Property Word() As String
            Get
                Return mWord
            End Get
            Set(ByVal value As String)
                mWord = value
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

    End Class

End Namespace



