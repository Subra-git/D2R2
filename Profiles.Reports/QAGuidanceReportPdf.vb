Imports ProfilesLibrary
Imports TallComponents.PDF.Layout
Imports TallComponents.PDF.Layout.Paragraphs
Imports TallComponents.PDF.Layout.Colors
Imports TallComponents.PDF.Layout.Navigation

''' <summary>
''' Class used to produce a report on the user guidance for questions which appear within the summary profile.
''' </summary>
Public Class QAGuidanceReportPdf
    Inherits GuidanceReportPdfBase

    Protected Overrides ReadOnly Property PdfTitle() As String
        Get
            Return "Q&A sheet guidance report"
        End Get
    End Property

    Protected Overrides Sub BuildGuidanceBody()

        ' PLEASE NOTE
        ' This list of mapped questions is hard coded in this report. Should this mapping change, it is very 
        ' likely that the question mapping in SummaryProfilePdf.vb will need to change too. SummaryProfilePdf
        ' is the main summary profile report that is generated for a profile.

        ' Add main content
        Dim guidanceTable As Table

        guidanceTable = AddGuidanceTable()
        AddQAGuidanceTableRow(guidanceTable, ProfileQuestionData(1, 1), "1")

        AddQAGuidanceTableRow(guidanceTable, ProfileQuestionData(6, 14), "2")
        AddQAGuidanceTableRow(guidanceTable, ProfileQuestionData(6, 1), "3")

        ' Add extra text after Question 3
        AddExplanatoryTextTableRow(guidanceTable, "3")

        AddQAGuidanceTableRow(guidanceTable, ProfileQuestionData(6, 5), "4")
        AddQAGuidanceTableRow(guidanceTable, ProfileQuestionData(6, 3), "5")
        AddQAGuidanceTableRow(guidanceTable, ProfileQuestionData(6, 6), "6")
        AddQAGuidanceTableRow(guidanceTable, ProfileQuestionData(3, 13), "7")
        AddQAGuidanceTableRow(guidanceTable, ProfileQuestionData(3, 17), "8")
        AddQAGuidanceTableRow(guidanceTable, ProfileQuestionData(1, 1), "9")
        AddQAGuidanceTableRow(guidanceTable, ProfileQuestionData(1, 3), "9a")
        AddQAGuidanceTableRow(guidanceTable, ProfileQuestionData(1, 4), "9b")
        AddQAGuidanceTableRow(guidanceTable, ProfileQuestionData(3, 7), "10")
        AddQAGuidanceTableRow(guidanceTable, ProfileQuestionData(3, 8), "11")

        AddQAGuidanceTableRow(guidanceTable, ProfileQuestionData(9, 8), "12")
        AddQAGuidanceTableRow(guidanceTable, ProfileQuestionData(3, 15), "13")
        AddQAGuidanceTableRow(guidanceTable, ProfileQuestionData(8, 1), "14")
        AddQAGuidanceTableRow(guidanceTable, ProfileQuestionData(8, 2), "15")
        AddQAGuidanceTableRow(guidanceTable, ProfileQuestionData(2, 1), "16")

        ' Add extra text after Question 16
        AddExplanatoryTextTableRow(guidanceTable, "16")

        AddQAGuidanceTableRow(guidanceTable, ProfileQuestionData(5, 8), "16 1a")
        AddQAGuidanceTableRow(guidanceTable, ProfileQuestionData(2, 6), "16 1b")
        AddQAGuidanceTableRow(guidanceTable, ProfileQuestionData(2, 3), "16 2a")
        AddQAGuidanceTableRow(guidanceTable, ProfileQuestionData(2, 4), "16 2b")
        AddQAGuidanceTableRow(guidanceTable, ProfileQuestionData(2, 7), "17")
        AddQAGuidanceTableRow(guidanceTable, ProfileQuestionData(10, 6), "18")

        ' Add extra text after Question 19
        AddExplanatoryTextTableRow(guidanceTable, "19")

        AddQAGuidanceTableRow(guidanceTable, ProfileQuestionData(12, 1), "19")
        AddQAGuidanceTableRow(guidanceTable, ProfileQuestionData(9, 1), "20")
        AddQAGuidanceTableRow(guidanceTable, ProfileQuestionData(9, 2), "21")
        AddQAGuidanceTableRow(guidanceTable, ProfileQuestionData(5, 9), "22")
        AddQAGuidanceTableRow(guidanceTable, ProfileQuestionData(13, 11), "23")

        

    End Sub

#Region "Explanatory Text"

    Private Sub AddExplanatoryTextTableRow(ByVal guidanceTable As Table, ByVal QuestionNo As String)
        Dim guidanceDataRow As Row = guidanceTable.Rows.Add
        guidanceDataRow.Border = New Border()
        guidanceDataRow.Border.Left = mGreyPen
        guidanceDataRow.Border.Bottom = mGreyPen
        If QuestionNo = "3" Then
            Dim text1 As String = "For a disease or issue that does not affect people questions 4, 5 and 6 will not have an answer provided in the Q&A sheet. Under each of these questions the statement ‘This question is not relevant’ will appear."
            AddNewExplanatoryTextCell(" ", guidanceDataRow)
            AddNewExplanatoryTextCell(" ", guidanceDataRow)
            AddNewExplanatoryTextCell(text1, guidanceDataRow)
        ElseIf QuestionNo = "16" Then
            Dim text2 As String = "Depending on the answer selected for question 16, two alternate pairs of additional sub-questions appear in the Q&A sheet. The guidance for these is provided, firstly for the two questions that apply if a disease is endemic and then for the pair of questions that will be included if the disease is exotic to Great Britain."
            AddNewExplanatoryTextCell(" ", guidanceDataRow)
            AddNewExplanatoryTextCell(" ", guidanceDataRow)
            AddNewExplanatoryTextCell(text2, guidanceDataRow)
        ElseIf QuestionNo = "19" Then
            Dim text3 As String = "Regarding question 19 (Current surveillance activities). The Q&A sheet provides detailed information about all surveillance pertinent to the profiled disease or issue. If preferred a short summary can be found in the Summary profile."
            AddNewExplanatoryTextCell(" ", guidanceDataRow)
            AddNewExplanatoryTextCell(" ", guidanceDataRow)
            AddNewExplanatoryTextCell(text3, guidanceDataRow)
        End If

        

    End Sub

    Protected Sub AddNewExplanatoryTextCell(ByVal text As String, ByRef row As Row)

        Dim cell As Cell = row.Cells.Add
        cell.Border = New Border()
        cell.Border.Right = mGreyPen

        cell.Paragraphs.Add(GetTextDataParagraph(text))

    End Sub

    Private Function GetTextDataParagraph(ByVal text As String) As XhtmlParagraph

        Dim strText As String = String.Format("<span style='color: red'>{0}</span>", text.SanitizeHtml)
        Dim para As New FormattedXhtmlParagraph(strText)

        para.Border = New Border()
        para.Border.Left = mInvisiblePen
        para.Border.Right = mInvisiblePen
        para.Border.Bottom = mInvisiblePen
        para.Border.Top = mInvisiblePen
        para.Padding.Left = 5
        para.Text = strText

        Return para

    End Function
#End Region

End Class
