Imports Csla

Public Class ProfileVersionSearchResult
    Inherits ReadOnlyBase(Of ProfileVersionSearchResult)

    Private mDisplayString As String
    Private mSection As Integer
    Private mQuestionNumber As Integer

    Private Sub New()
    End Sub

    Protected Overrides Function GetIdValue() As Object
        Return mDisplayString.ToString()
    End Function

    Public ReadOnly Property DisplayString() As String
        Get
            Return mDisplayString
        End Get
    End Property

    Public ReadOnly Property Section() As Integer
        Get
            Return mSection
        End Get
    End Property

    Public ReadOnly Property Question() As Integer
        Get
            Return mQuestionNumber
        End Get
    End Property

    Friend Shared Function GetSectionProfileVersionSearchResult(ByVal section As Integer, ByVal questionNumber As Integer, ByVal questionName As String, ByVal words As List(Of String), ByVal matchedInGuidance As Boolean) As ProfileVersionSearchResult
        Dim display As String = FormatResult($"S{section}.{questionNumber}{IIf(matchedInGuidance, " (guidance)", String.Empty)}", words)
        Return New ProfileVersionSearchResult(section, questionNumber, display)
    End Function

    Friend Shared Function GetNoteProfileVersionSearchResult(ByVal noteType As String, ByVal words As List(Of String)) As ProfileVersionSearchResult
        Dim display As String = FormatResult(noteType, words)
        Return New ProfileVersionSearchResult(Integer.MaxValue, Integer.MaxValue, display)
    End Function

    Private Sub New(ByVal section As Integer, ByVal question As Integer, ByVal display As String)
        Fetch(section, question, display)
    End Sub

    Private Sub Fetch(ByVal section As Integer, ByVal question As Integer, ByVal display As String)
        mSection = section
        mQuestionNumber = question
        mDisplayString = display
    End Sub

    Private Shared Function FormatResult(ByVal description As String, ByVal words As List(Of String)) As String
        Return $"<span class=""govuk-!-font-size-16"">{description} contains</span><span class=""govuk-!-font-size-16 fst-italic"">&nbsp{String.Join(", ", words.ToArray)}</span>"
    End Function
End Class
