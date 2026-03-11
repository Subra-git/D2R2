Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class ProfileFieldValueUpdate
        Inherits FieldValueUpdate

        Private mProfileVersionQuestionRowId As Guid = Guid.Empty
        Private mDecimalValue As Decimal
        Private mDateValue As Date
        Private mSpeciesId As Guid
        Private mFieldGroupId As Guid

        <DataMember()> _
        Public Property ProfileVersionQuestionRowId() As Guid
            Get
                Return mProfileVersionQuestionRowId
            End Get
            Set(ByVal value As Guid)
                mProfileVersionQuestionRowId = value
            End Set
        End Property

        <DataMember()> _
       Public Property DecimalValue() As Decimal
            Get
                Return mDecimalValue
            End Get
            Set(ByVal value As Decimal)
                mDecimalValue = value
            End Set
        End Property

        <DataMember()> _
        Public Property DateValue() As Date
            Get
                Return mDateValue
            End Get
            Set(ByVal value As Date)
                mDateValue = value
            End Set
        End Property

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
       Public Property FieldGroupId() As Guid
            Get
                Return mFieldGroupId
            End Get
            Set(ByVal value As Guid)
                mFieldGroupId = value
            End Set
        End Property

        Public Sub New()
            MyBase.New()
        End Sub

    End Class

End Namespace
