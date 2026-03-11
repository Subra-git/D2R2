Imports ProfilesLibrary
Imports TallComponents.PDF.Layout
Imports TallComponents.PDF.Layout.Paragraphs
Imports TallComponents.PDF.Layout.Colors
Imports TallComponents.PDF.Layout.Navigation

''' <summary>
''' Class used to produce a report on the user guidance for questions which appear within the summary profile.
''' </summary>
Public Class SummaryProfileGuidanceReportPdf
    Inherits GuidanceReportPdfBase

    Protected Overrides ReadOnly Property PdfTitle() As String
        Get
            Return "Summary profile guidance report"
        End Get
    End Property

    Protected Overrides Sub BuildGuidanceBody()

        ' PLEASE NOTE
        ' This list of mapped questions is hard coded in this report. Should this mapping change, it is very 
        ' likely that the question mapping in SummaryProfilePdf.vb will need to change too. SummaryProfilePdf
        ' is the main summary profile report that is generated for a profile.

        ' Add main content
        Dim guidanceTable As Table

        PdfSection.Paragraphs.Add(BuildDocumentSectionHeader(SummaryProfileReportHeadings.Section1Heading))
        guidanceTable = AddGuidanceTable()
        AddGuidanceTableRow(guidanceTable, ProfileQuestionData(1, 1), "1.1")
        AddGuidanceTableRow(guidanceTable, ProfileQuestionData(1, 3), "1.2")

        PdfSection.Paragraphs.Add(BuildDocumentSectionHeader(SummaryProfileReportHeadings.Section2Heading))
        guidanceTable = AddGuidanceTable()
        AddGuidanceTableRow(guidanceTable, ProfileQuestionData(6, 14), "2.1")
        AddGuidanceTableRow(guidanceTable, ProfileQuestionData(5, 9), "2.2")
        AddGuidanceTableRow(guidanceTable, ProfileQuestionData(7, 7), "2.3")
        AddGuidanceTableRow(guidanceTable, ProfileQuestionData(13, 11), "2.4")

        PdfSection.Paragraphs.Add(BuildDocumentSectionHeader(SummaryProfileReportHeadings.Section3Heading))
        guidanceTable = AddGuidanceTable()
        AddGuidanceTableRow(guidanceTable, ProfileQuestionData(8, 4), "3.1")

        PdfSection.Paragraphs.Add(BuildDocumentSectionHeader(SummaryProfileReportHeadings.Section4Heading))
        guidanceTable = AddGuidanceTable()
        AddGuidanceTableRow(guidanceTable, ProfileQuestionData(2, 1), "4.1")
        AddGuidanceTableRow(guidanceTable, ProfileQuestionData(2, 7), "4.2")

        PdfSection.Paragraphs.Add(BuildDocumentSectionHeader(SummaryProfileReportHeadings.Section5Heading))
        guidanceTable = AddGuidanceTable()
        ' These two questions are conditional in the summary profile, so we need to display both in the guidance,
        ' as we don't know which one is applicable as we are not in the context of a specific profile version
        AddExplanatoryTextTableRow(guidanceTable)
        AddGuidanceTableRow(guidanceTable, ProfileQuestionData(2, 2), "5.1 (1)")
        AddGuidanceTableRow(guidanceTable, ProfileQuestionData(2, 4), "5.1 (2)")

        PdfSection.Paragraphs.Add(BuildDocumentSectionHeader(SummaryProfileReportHeadings.Section6Heading))
        guidanceTable = AddGuidanceTable()
        AddGuidanceTableRow(guidanceTable, ProfileQuestionData(6, 1), "6.1")
        AddGuidanceTableRow(guidanceTable, ProfileQuestionData(6, 5), "6.2")
        AddGuidanceTableRow(guidanceTable, ProfileQuestionData(6, 3), "6.3")

        PdfSection.Paragraphs.Add(BuildDocumentSectionHeader(SummaryProfileReportHeadings.Section7Heading))
        guidanceTable = AddGuidanceTable()
        AddGuidanceTableRow(guidanceTable, ProfileQuestionData(9, 1), "7.1")

        PdfSection.Paragraphs.Add(BuildDocumentSectionHeader(SummaryProfileReportHeadings.Section8Heading))
        guidanceTable = AddGuidanceTable()
        AddGuidanceTableRow(guidanceTable, ProfileQuestionData(12, 2), "8.1")

        PdfSection.Paragraphs.Add(BuildDocumentSectionHeader(SummaryProfileReportHeadings.Section9Heading))
        guidanceTable = AddGuidanceTable()
        AddGuidanceTableRow(guidanceTable, ProfileQuestionData(7, 6), "9.1")
        AddGuidanceTableRow(guidanceTable, ProfileQuestionData(7, 8), "9.2")

        PdfSection.Paragraphs.Add(BuildDocumentSectionHeader(SummaryProfileReportHeadings.Section10Heading))
        guidanceTable = AddGuidanceTable()
        AddGuidanceTableRow(guidanceTable, ProfileQuestionData(9, 11), "10.1")

    End Sub

#Region "Explanatory Text"

    Private Sub AddExplanatoryTextTableRow(ByVal guidanceTable As Table)
        Dim guidanceDataRow As Row = guidanceTable.Rows.Add
        guidanceDataRow.Border = New Border()
        guidanceDataRow.Border.Left = mGreyPen
        guidanceDataRow.Border.Bottom = mGreyPen

        Dim text As String = "The first question in this section is dependent on if a disease is endemic or exotic to Great Britain. The guidance to be followed if answering for an endemic disease is given first."

        AddNewExplanatoryTextCell(" ", guidanceDataRow)
        AddNewExplanatoryTextCell(" ", guidanceDataRow)
        AddNewExplanatoryTextCell(text, guidanceDataRow)

    End Sub

    Protected Sub AddNewExplanatoryTextCell(ByVal text As String, ByRef row As Row)

        Dim cell As Cell = row.Cells.Add
        cell.Border = New Border()
        cell.Border.Right = mGreyPen

        cell.Paragraphs.Add(GetTextDataParagraph(text))

    End Sub

    Private Function GetTextDataParagraph(ByVal text As String) As TextDataParagraph

        Dim para As New TextDataParagraph(text)
        para.Border = New Border()
        para.Border.Left = mInvisiblePen
        para.Border.Right = mInvisiblePen
        para.Border.Bottom = mInvisiblePen
        para.Border.Top = mInvisiblePen
        para.Padding.Left = 5
        Return para

    End Function
#End Region

End Class
