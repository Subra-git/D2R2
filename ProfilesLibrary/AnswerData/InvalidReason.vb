Imports System.Text

<Serializable()> _
Public Class InvalidReason
    Private mSectionNumber As Integer
    Private mQuestionNumber As Integer
    Private mSpeciesName As String = String.Empty
    Private mFieldName As String = String.Empty
    Private mReasonDescription As String = String.Empty
    Private mQuestionShortName As String = String.Empty
    Private mReason As ReasonType
    Private mQuestionFullname As String = String.Empty
    Private mRowNumber As Integer

    Public Enum ReasonType
        Mandatory
        ReferenceInactive
        Irrelevant
        Custom
        SpeciesInactive
    End Enum

    Public Sub New(ByVal invalidReason As InvalidReason.ReasonType, ByVal invalidField As String, ByVal invalidSectionNumber As Integer)
        Reason = invalidReason
        FieldName = invalidField
        SectionNumber = invalidSectionNumber
    End Sub

    Public Sub New()
    End Sub

    Public Property Reason() As ReasonType
        Get
            Return mReason
        End Get
        Set(ByVal value As ReasonType)
            Select Case value
                Case ReasonType.Irrelevant
                    mReasonDescription = "is not relevant due to a previous selection"
                Case ReasonType.Mandatory
                    mReasonDescription = "is required"
                Case ReasonType.ReferenceInactive
                    mReasonDescription = "uses inactive reference data entry/entries"
                Case ReasonType.SpeciesInactive
                    mReasonDescription = "species is inactive"
                Case ReasonType.Custom
            End Select
            mReason = value
        End Set
    End Property
    Public Property SectionNumber() As Integer
        Get
            Return mSectionNumber
        End Get
        Set(ByVal value As Integer)
            mSectionNumber = value
        End Set
    End Property

    Public Property QuestionNumber() As Integer
        Get
            Return mQuestionNumber
        End Get
        Set(ByVal value As Integer)
            mQuestionNumber = value
        End Set
    End Property

    Public Property SpeciesName() As String
        Get
            Return mSpeciesName
        End Get
        Set(ByVal value As String)
            mSpeciesName = value
        End Set
    End Property

    Public Property FieldName() As String
        Get
            Return mFieldName
        End Get
        Set(ByVal value As String)
            mFieldName = value
        End Set
    End Property



    Public Property ReasonDescription() As String
        Get
            Return mReasonDescription
        End Get
        Set(ByVal value As String)
            mReasonDescription = value
        End Set
    End Property

    Public Property QuestionShortName() As String
        Get
            Return mQuestionShortName
        End Get
        Set(ByVal value As String)
            mQuestionShortName = value
        End Set
    End Property

    Public Property QuestionFullName() As String
        Get
            Return mQuestionFullname
        End Get
        Set(ByVal value As String)
            mQuestionFullname = value
        End Set
    End Property

    Public Property RowNumber() As Integer
        Get
            Return mRowNumber
        End Get
        Set(ByVal value As Integer)
            mRowNumber = value
        End Set
    End Property

    'Gets the desciption in the format:
    '[Species] [Row number], "[Question Name]" - [reason description]
    Public ReadOnly Property Description() As String
        Get
            Dim output As New StringBuilder
            If mSpeciesName.Length > 0 Then
                output.Append(mSpeciesName)
            End If
            If mRowNumber > 0 Then
                If output.Length > 0 Then
                    output.Append(" ")
                End If
                output.Append("Row ").Append(mRowNumber.ToString())
            End If
            If output.Length > 0 Then
                output.Append(", ")
            End If
            output.Append("""").Append(mQuestionFullname)
            If mFieldName.Length > 0 AndAlso mQuestionFullname.Length > 0 Then
                output.Append(" - ")
            End If
            output.Append(mFieldName).Append(""" ")
            output.Append(mReasonDescription)

            Return output.ToString()
        End Get
    End Property

    Public Overrides Function ToString() As String

        Return "Question " & SectionNumber & "." & QuestionNumber & " - " & Description

    End Function


End Class
