Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class SpeciesSection

        Private mSectionId As Guid
        Private mFieldValueList As List(Of SpeciesFieldValue)

        <DataMember()> _
        Public Property SectionId() As Guid
            Get
                Return mSectionId
            End Get
            Set(ByVal value As Guid)
                mSectionId = value
            End Set
        End Property

        <DataMember()> _
        Public Property FieldValueList() As List(Of SpeciesFieldValue)
            Get
                Return mFieldValueList
            End Get
            Set(ByVal value As List(Of SpeciesFieldValue))
                mFieldValueList = value
            End Set
        End Property

        Public Sub New()
            '
        End Sub

    End Class

End Namespace

