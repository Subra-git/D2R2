Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class SectionReviewFrequency

        Private mId As Guid
        Private mLookupValue As String

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
        Public Property LookupValue() As String
            Get
                Return mLookupValue
            End Get
            Set(ByVal value As String)
                mLookupValue = value
            End Set
        End Property

        Public Sub New()
            '
        End Sub

    End Class

End Namespace