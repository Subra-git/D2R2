Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class PrioritisationAnswerData

        Private mId As Guid        
        Private mProfileVersionId As Guid
        Private mSpeciesId As Guid
        Private mAnswer As String
        Private mScore As Integer
        Private mWeighting As Integer

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
        Public Property ProfileVersionId() As Guid
            Get
                Return mProfileVersionId
            End Get
            Set(ByVal value As Guid)
                mProfileVersionId = value
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
        Public Property Answer() As String
            Get
                Return mAnswer
            End Get
            Set(ByVal value As String)
                mAnswer = value
            End Set
        End Property

        <DataMember()> _
        Public Property Score() As Integer
            Get
                Return mScore
            End Get
            Set(ByVal value As Integer)
                mScore = value
            End Set
        End Property

        <DataMember()> _
        Public Property Weighting() As Integer
            Get
                Return mWeighting
            End Get
            Set(ByVal value As Integer)
                mWeighting = value
            End Set
        End Property

        Public Sub New()
            '
        End Sub


    End Class

End Namespace



