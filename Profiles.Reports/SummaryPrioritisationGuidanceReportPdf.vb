Imports ProfilesLibrary
Imports TallComponents.PDF.Layout
Imports TallComponents.PDF.Layout.Paragraphs
Imports TallComponents.PDF.Layout.Colors
Imports TallComponents.PDF.Layout.Navigation
Imports System.Text

''' <summary>
''' Class used to produce a report on the user guidance for questions which appear within the 
''' summary prioritisation report.
''' </summary>
Public Class SummaryPrioritisationGuidanceReportPdf
    Inherits GuidanceReportPdfBase

    Private mGreenColour As New Colors.RgbColor(0, 163, 59)

    Protected Overrides ReadOnly Property PdfTitle() As String
        Get
            Return "Guidance for questions in the summary prioritisation report (SPR)"
        End Get
    End Property

    Protected Overrides Sub BuildGuidanceBody()

        ' Add the initial standard text
        AddInitialStandardText()

        ' Note that there is only one question per heading
        ' Also note that the question numbers listed here should match those in the SummaryPrioritisationPdf class

        Dim guidanceTable As Table

        PdfSection.Paragraphs.Add(BuildDocumentSectionHeader(SummaryPrioritisationReportHeadings.Section1Heading))
        guidanceTable = AddGuidanceTable()
        AddGuidanceTableRow(guidanceTable, ProfileQuestionData(1, 1))

        PdfSection.Paragraphs.Add(BuildDocumentSectionHeader(SummaryPrioritisationReportHeadings.Section2Heading))
        guidanceTable = AddGuidanceTable()
        AddGuidanceTableRow(guidanceTable, ProfileQuestionData(6, 14))

        PdfSection.Paragraphs.Add(BuildDocumentSectionHeader(SummaryPrioritisationReportHeadings.Section3Heading))
        guidanceTable = AddGuidanceTable()
        AddGuidanceTableRow(guidanceTable, ProfileQuestionData(5, 9))

        PdfSection.Paragraphs.Add(BuildDocumentSectionHeader(SummaryPrioritisationReportHeadings.Section4Heading))
        guidanceTable = AddGuidanceTable()
        AddGuidanceTableRow(guidanceTable, ProfileQuestionData(7, 7))

        PdfSection.Paragraphs.Add(BuildDocumentSectionHeader(SummaryPrioritisationReportHeadings.Section5Heading))
        guidanceTable = AddGuidanceTable()
        AddGuidanceTableRow(guidanceTable, ProfileQuestionData(13, 11))

        PdfSection.Paragraphs.Add(BuildDocumentSectionHeader(SummaryPrioritisationReportHeadings.Section6Heading))
        guidanceTable = AddGuidanceTable()
        AddGuidanceTableRow(guidanceTable, ProfileQuestionData(3, 20))

        PdfSection.Paragraphs.Add(BuildDocumentSectionHeader(SummaryPrioritisationReportHeadings.Section7Heading))
        guidanceTable = AddGuidanceTable()
        AddGuidanceTableRow(guidanceTable, ProfileQuestionData(15, 1))

        PdfSection.Paragraphs.Add(BuildDocumentSectionHeader(SummaryPrioritisationReportHeadings.Section8Heading))
        guidanceTable = AddGuidanceTable()
        AddGuidanceTableRow(guidanceTable, ProfileQuestionData(7, 8))

        PdfSection.Paragraphs.Add(BuildDocumentSectionHeader(SummaryPrioritisationReportHeadings.Section9Heading))
        guidanceTable = AddGuidanceTable()
        AddGuidanceTableRow(guidanceTable, ProfileQuestionData(16, 1))

        PdfSection.Paragraphs.Add(BuildDocumentSectionHeader(SummaryPrioritisationReportHeadings.Section10Heading))
        guidanceTable = AddGuidanceTable()
        AddGuidanceTableRow(guidanceTable, ProfileQuestionData(8, 4))

        guidanceTable.Padding.Bottom = 20
        ' Add the Detailed Criteria Guidance

        ' Add Title
        PdfSection.Paragraphs.Add(BuildCriteriaTitleHeader("Detailed criteria scores"))

        ' Get the Data
        Dim PrioritisationCategoryData As PrioritisationGuidanceData = PrioritisationGuidanceData.GetPrioritisationGuidanceData

        For Each item As PrioritisationCategoryData In PrioritisationCategoryData.PrioritisationCategoryDataList

            PdfSection.Paragraphs.Add(BuildCriteriaSectionHeader(item.DisplayName))

            'Add note because question answered bepends on if the disease is endemic or exotic
            Dim explanatoryTextTable As Table = AddGuidanceTable()
            If (item.Id = New Guid("CC99BFDF-6621-4390-84D6-91218A40DF1D")) Then
                Dim Text As String = "The first question in this section is dependent on if a disease is endemic or exotic to Great Britain. The guidance to be followed if answering for an endemic disease is given first."

                AddCriteriaGuidanceTableRow(explanatoryTextTable, Text)
            End If

            For Each category As PrioritisationQuestionData In item.PrioritisationQuestionDataList

                PdfSection.Paragraphs.Add(AddCriteriaName(category.CriterionName, item.DisplayName))
                guidanceTable = AddGuidanceTable()

                AddCriteriaGuidanceTableRow(guidanceTable, ProfileQuestion.GetProfileQuestion(category.Id).UserGuidance)

                'Add exotic question because it is not added as the CriterionCodes are the same
                If (category.Id = New Guid("745A30C4-5098-4D02-91B2-55E75F54551F")) Then
                    AddCriteriaGuidanceTableRow(guidanceTable, ProfileQuestionData(2, 4).UserGuidance)
                End If

            Next

        Next

    End Sub

    ''' <summary>
    ''' Overriden implementation, as the guidance table here is slightly different to the base implementation.
    ''' The table here includes only one row and cell.
    ''' </summary>
    Protected Overrides Function AddGuidanceTable() As Table

        ' Create table
        Dim guidanceTable As Table = New Table
        guidanceTable.PreferredWidth = PdfSection.PageSize.Width
        guidanceTable.ForceWidth = True
        PdfSection.Paragraphs.Add(guidanceTable)

        Return guidanceTable

    End Function

    Private Function AddExampleTable() As Table
        ' Create table
        Dim exampleTable As Table = New Table
        exampleTable.PreferredWidth = PdfSection.PageSize.Width
        exampleTable.ForceWidth = True

        'Guidance Header row
        Dim guidanceHeaderRow As Row = exampleTable.Rows.Add
        guidanceHeaderRow.Border = New Border()
        guidanceHeaderRow.Border.Top = mGreyPen
        guidanceHeaderRow.Border.Left = mGreyPen
        guidanceHeaderRow.Border.Bottom = mDarkPen

        ' Add header cells
        AddNewExampleCell("Question / Criterion Title", guidanceHeaderRow, True)
        AddNewExampleCell("Scoring (Category) Options", guidanceHeaderRow, True)
        AddNewExampleCell("Lowest Possible Score", guidanceHeaderRow, True)
        AddNewExampleCell("Highest Possible Score", guidanceHeaderRow, True)
        AddNewExampleCell("Weighting", guidanceHeaderRow, True)
        AddNewExampleCell("Weighted Lowest Possible Score", guidanceHeaderRow, True)
        AddNewExampleCell("Weighted Highest Possible Score", guidanceHeaderRow, True)

        AddNewExampleDateRow(exampleTable, "Total unplanned cost to exchequer", "Negligible / Low / Medium / High / Very High", "0", "25", "10", "0", "250")
        AddNewExampleDateRow(exampleTable, "Impact on the global environment", "Negligible / Some", "0", "25", "1", "0", "25")
        AddNewExampleDateRow(exampleTable, "Impact on the local environment", "Negligible / Low / Medium", "0", "25", "9", "0", "225")
        AddNewExampleDateRow(exampleTable, "Impact on the sector that produces this species", "Negligible / Low / Medium / High / Very High", "0", "25", "5", "0", "125")
        AddNewExampleDateRow(exampleTable, "Impact on the wider rural community", "Negligible / Low / Medium / High / Very High", "0", "25", "10", "0", "250")

        PdfSection.Paragraphs.Add(exampleTable)

        Return exampleTable
    End Function

    Private Function AddNewExampleDateRow(ByRef table As Table, ByVal cell1 As String, ByVal cell2 As String, ByVal cell3 As String, ByVal cell4 As String, ByVal cell5 As String, ByVal cell6 As String, ByVal cell7 As String) As Row

        Dim contectRow As Row = table.Rows.Add
        contectRow.Border = New Border()
        contectRow.Border.Top = mGreyPen
        contectRow.Border.Left = mGreyPen

        AddNewExampleCell(cell1, contectRow, False)
        AddNewExampleCell(cell2, contectRow, False)
        AddNewExampleCell(cell3, contectRow, False)
        AddNewExampleCell(cell4, contectRow, False)
        AddNewExampleCell(cell5, contectRow, False)
        AddNewExampleCell(cell6, contectRow, False)
        AddNewExampleCell(cell7, contectRow, False)

        Return contectRow

    End Function

    Private Sub AddExampleTotalRow(ByRef table As Table)

        Dim totalRow As Row = table.Rows.Add
        totalRow.Border = New Border()
        totalRow.Border.Top = mDarkPen
        totalRow.Border.Left = mGreyPen
        totalRow.Border.Bottom = mInvisiblePen

        Dim totalWidth As Double = (PdfSection.PageSize.Width / 7) - 12
        Dim infoWidth As Double = PdfSection.PageSize.Width - totalWidth
        Dim s As New StringBuilder
        s.Append("Overall maximum score for this reason for Government intervention (RFI) =")
        s.AppendLine()
        Dim totalText As String = s.ToString()

        AddNewExampleTotalCell(totalText, totalRow, infoWidth)
        AddNewExampleTotalCell("875", totalRow, totalWidth)


        Dim totalspacerRow As Row = table.Rows.Add
        totalspacerRow.Border = New Border()
        totalspacerRow.Border.Top = mInvisiblePen
        totalspacerRow.Border.Left = mGreyPen
        totalspacerRow.Border.Bottom = mInvisiblePen

        AddNewExampleTotalCell(" ", totalspacerRow, infoWidth)
        AddNewExampleTotalCell(" ", totalspacerRow, totalWidth)


        Dim totalinfoRow As Row = table.Rows.Add
        totalinfoRow.Border = New Border()
        totalinfoRow.Border.Top = mInvisiblePen
        totalinfoRow.Border.Left = mGreyPen
        totalinfoRow.Border.Bottom = mDarkPen

        Dim sb As New StringBuilder
        sb.Append("This total is then used as a denominator so that the scores generated by the ")
        sb.Append("categories selected for each disease for Wider society are divided by 875 and ")
        sb.Append("multiplied by 100 to give an overall score out of 100. Other RFIs have different ")
        sb.Append("numbers of criteria and different weights, but all report a percentage score.")

        Dim infoText As String = sb.ToString()

        AddNewExampleTotalCell(infoText, totalinfoRow, infoWidth)
        AddNewExampleTotalCell(" ", totalinfoRow, totalWidth)


    End Sub
    ''' <summary>
    ''' Adds a new cell to a table row with the correct border.
    ''' </summary>
    ''' <param name="text">Text of the cell</param>
    ''' <param name="row">Row to which the cell should be added</param>
    ''' <param name="isHeader">Whether the cell should be a header cell</param>
    Protected Sub AddNewExampleCell(ByVal text As String, ByRef row As Row, ByVal isHeader As Boolean)

        Dim cell As Cell = row.Cells.Add
        cell.Border = New Border()
        cell.Border.Right = mGreyPen
        cell.Border.Bottom = mGreyPen
        cell.Padding.Top = 5
        cell.Padding.Bottom = 5

        If isHeader Then
            cell.Paragraphs.Add(GetExampleHeaderParagraph(text))
        Else
            cell.Paragraphs.Add(GetExampleTextDataParagraph(text))
        End If

    End Sub

    Private Function AddExampleTotalTable() As Table
        ' Create table
        Dim exampleTable As Table = New Table
        exampleTable.PreferredWidth = PdfSection.PageSize.Width
        exampleTable.ForceWidth = True

        AddExampleTotalRow(exampleTable)

        PdfSection.Paragraphs.Add(exampleTable)

        Return exampleTable
    End Function

    Protected Sub AddNewExampleTotalCell(ByVal text As String, ByRef row As Row, ByVal width As Double)

        Dim cell As Cell = row.Cells.Add
        cell.Border = New Border()
        cell.Border.Right = mGreyPen
        cell.PreferredWidth = width
        cell.Padding.Top = 5
        cell.Padding.Bottom = 5

        cell.Paragraphs.Add(GetExampleTextDataParagraph(text))

    End Sub

    ''' <summary>
    ''' Returns a paragraph which can be used as a header in a table.
    ''' </summary>
    Private Function GetExampleHeaderParagraph(ByVal text As String) As TextParagraph

        Dim para As New TextParagraph()
        Dim frag As New Fragment
        frag.Text = text.StripHtmlTags
        frag.Bold = True
        frag.FontSize = 10
        para.Fragments.Add(frag)
        para.Border = New Border()
        para.Border.Left = mInvisiblePen
        para.Border.Right = mInvisiblePen
        para.Border.Bottom = mInvisiblePen
        para.Border.Top = mInvisiblePen
        para.Padding.Left = 5
        Return para

    End Function

    ''' <summary>
    ''' Returns a paragraph which can be used as a normal paragraph within a cell in a table.
    ''' </summary>
    Private Function GetExampleTextDataParagraph(ByVal text As String) As TextParagraph

        Dim para As New TextParagraph()
        Dim frag As New Fragment
        frag.Text = text.StripHtmlTags
        frag.Bold = False
        frag.FontSize = 10
        para.Fragments.Add(frag)
        para.Border = New Border()
        para.Border.Left = mInvisiblePen
        para.Border.Right = mInvisiblePen
        para.Border.Bottom = mInvisiblePen
        para.Border.Top = mInvisiblePen
        para.Padding.Left = 5
        Return para

    End Function

    ''' <summary>
    ''' Overriden implementation as the table only has one cell per row.
    ''' </summary>
    ''' <param name="guidanceTable">The table to add the row to</param>
    ''' <param name="profileQuestion">Question to include guidance for</param>
    ''' <param name="questionNumber">Not used.</param>
    Protected Overrides Sub AddGuidanceTableRow(ByVal guidanceTable As Table, ByVal profileQuestion As ProfileQuestion, Optional ByVal questionNumber As String = Nothing)

        ' Here we only add one cell to the table
        Dim guidanceDataRow As Row = guidanceTable.Rows.Add
        guidanceDataRow.Border = New Border()
        guidanceDataRow.Border.Left = DefaultPen
        guidanceDataRow.Border.Bottom = DefaultPen
        guidanceDataRow.Border.Right = DefaultPen

        Dim cell As Cell = guidanceDataRow.Cells.Add
        cell.Border = New Border()
        cell.Border.Right = mGreyPen

        Dim para As New TextDataSmallParagraph(profileQuestion.UserGuidance)
        para.Border = New Border()
        para.Border.Left = mInvisiblePen
        para.Border.Right = mInvisiblePen
        para.Border.Bottom = mInvisiblePen
        para.Border.Top = mInvisiblePen
        para.Padding.Left = 5

        cell.Paragraphs.Add(para)

    End Sub

    ''' <summary>
    ''' Overriden implementation of BuildDocumentSectionHeader.
    ''' </summary>
    Protected Overrides Function BuildDocumentSectionHeader(ByVal caption As String, ByVal bookmark As String) As Heading

        ' Create the level-0 heading 
        Dim sectionHeading As New Heading(0)

        ' Ensure new headings don't start on a new page, as we only have one question per heading
        sectionHeading.StartOnNewPage = False

        ' Set the border to match that of the table and set the background to match the prioritisation report headings
        sectionHeading.Border = New Border()
        sectionHeading.Border.Top = DefaultPen
        sectionHeading.Border.Bottom = DefaultPen
        sectionHeading.Border.Left = DefaultPen
        sectionHeading.Border.Right = DefaultPen
        sectionHeading.Border.Background = New Brushes.SolidBrush(mGreenColour)

        ' Add some padding and layout spacing
        sectionHeading.Padding = New Spacing(4)
        sectionHeading.SpacingBefore = 12

        ' Set caption of heading and bookmark text
        sectionHeading.Caption = caption
        sectionHeading.Bookmark = bookmark.StripHtmlTags

        ' Ensure the heading is always above the table on the same page
        sectionHeading.KeepWithNext = True

        ' We need to create and add a fragment to the heading in order to show the heading text
        Dim headingFragment As New Fragment(caption)
        headingFragment.FontSize += 2
        headingFragment.Bold = True
        headingFragment.TextColor = Colors.GrayColor.White
        sectionHeading.Fragments.Add(headingFragment)

        Return sectionHeading

    End Function


    Private Sub AddCriteriaTableRow(ByVal criteriaTable As Table, ByVal text As String, ByVal sectionName As String)

        Dim guidanceDataRow As Row = criteriaTable.Rows.Add

        guidanceDataRow.Border = New Border()
        guidanceDataRow.Border.Left = DefaultPen
        guidanceDataRow.Border.Right = DefaultPen
        guidanceDataRow.Border.Bottom = DefaultPen
        guidanceDataRow.Border.Top = DefaultPen
        guidanceDataRow.Border.Background = New Brushes.SolidBrush(GetCategoryBackColor(sectionName))
        guidanceDataRow.Padding = 5

        Dim cell As New Paragraphs.Cell
        Dim para As New TextDataParagraph(text)
        para.Border.Top = mInvisiblePen
        para.Border.Bottom = mInvisiblePen
        para.Border.Left = mInvisiblePen
        para.Border.Right = mInvisiblePen

        cell.Paragraphs.Add(para)
        guidanceDataRow.Cells.Add(cell)

    End Sub

    Private Sub AddCriteriaGuidanceTableRow(ByVal criteriaTable As Table, ByVal text As String)

        Dim guidanceDataRow As Row = criteriaTable.Rows.Add
        Dim guidanceDataRowEmpty As Row = criteriaTable.Rows.Add

        guidanceDataRowEmpty.Border = New Border()
        guidanceDataRowEmpty.Border.Left = mInvisiblePen
        guidanceDataRowEmpty.Border.Top = DefaultPen

        guidanceDataRow.Border = New Border()
        guidanceDataRow.Border.Left = DefaultPen
        guidanceDataRow.Border.Right = DefaultPen
        guidanceDataRow.Border.Bottom = mInvisiblePen

        Dim cell As New Paragraphs.Cell

        Dim para As New TextDataSmallParagraph(text)
        cell.Paragraphs.Add(para)
        cell.Padding = 5
        guidanceDataRow.Cells.Add(cell)

    End Sub

    ' Detailed criteria scores section title to match Summary Prioritisation Report style
    Private Function BuildCriteriaTitleHeader(ByVal caption As String) As Heading

        ' Create the level-0 heading 
        Dim sectionHeading As New Heading(0)

        ' Ensure new headings don't start on a new page, as we only have one question per heading
        sectionHeading.StartOnNewPage = False

        ' Set the border to match that of the table and set the background to match the prioritisation report headings
        sectionHeading.Border = New Border()
        sectionHeading.Border.Bottom = DefaultPen
        sectionHeading.Border.Top = DefaultPen
        sectionHeading.Border.Background = New Brushes.SolidBrush(Colors.GrayColor.White)

        ' Add some padding and layout spacing
        sectionHeading.Padding.Top = 10
        sectionHeading.Padding.Bottom = 10
        sectionHeading.SpacingBefore = 50

        ' Set caption of heading and bookmark text
        sectionHeading.Caption = caption
        sectionHeading.Bookmark = caption.StripHtmlTags

        ' Ensure the heading is always above the table on the same page
        sectionHeading.KeepWithNext = True

        ' We need to create and add a fragment to the heading in order to show the heading text
        Dim headingFragment As New Fragment(caption)
        headingFragment.FontSize += 2
        headingFragment.Bold = False
        headingFragment.TextColor = Colors.GrayColor.Black
        sectionHeading.Fragments.Add(headingFragment)

        Return sectionHeading

    End Function

    ' Detailed criteria scores section headers to match Summary Prioritisation Report style
    Private Function BuildCriteriaSectionHeader(ByVal caption As String) As Heading

        ' Create the level-0 heading 
        Dim sectionHeading As New Heading(0)

        ' Ensure new headings don't start on a new page, as we only have one question per heading
        sectionHeading.StartOnNewPage = False

        ' Set the border to match that of the table and set the background to match the prioritisation report headings
        sectionHeading.Border = New Border()
        sectionHeading.Border.Bottom = DefaultPen
        sectionHeading.Border.Top = DefaultPen
        sectionHeading.Border.Right = DefaultPen
        sectionHeading.Border.Left = DefaultPen
        sectionHeading.Border.Background = New Brushes.SolidBrush(GetCategoryBackColor(caption))

        ' Add some padding and layout spacing
        sectionHeading.Padding = New Spacing(5)
        sectionHeading.SpacingBefore = 20

        ' Set caption of heading and bookmark text
        sectionHeading.Caption = caption
        sectionHeading.Bookmark = caption.StripHtmlTags

        ' Ensure the heading is always above the table on the same page
        sectionHeading.KeepWithNext = True

        ' We need to create and add a fragment to the heading in order to show the heading text
        Dim headingFragment As New Fragment(caption)
        headingFragment.FontSize += 2
        headingFragment.Bold = False
        headingFragment.TextColor = GetCategoryForeColor(caption)
        sectionHeading.Fragments.Add(headingFragment)

        Return sectionHeading

    End Function

    Private Function AddCriteriaName(ByVal caption As String, ByVal sectionName As String) As Paragraph

        Dim para As New TextParagraph

        para.Border = New Border()
        para.Border.Top = DefaultPen
        para.Border.Right = DefaultPen
        para.Border.Left = DefaultPen
        para.Border.Bottom = DefaultPen
        para.Border.Background = New Brushes.SolidBrush(GetCategoryBackColor(sectionName))

        para.Padding = New Spacing(5)
        para.SpacingBefore = 20

        para.KeepWithNext = True

        Dim frag As New Fragment(caption.StripHtmlTags)
        'frag.FontSize += 2
        frag.Bold = False
        frag.TextColor = GetCategoryForeColor(sectionName.StripHtmlTags)
        para.Fragments.Add(frag)

        Return para

    End Function

    Private Function GetCategoryBackColor(ByVal categoryName As String) As Colors.Color

        Select Case categoryName.ToLower()
            Case "international trade"
                Return New Colors.RgbColor(255, 255, 189)
            Case "wider society"
                Return New Colors.RgbColor(153, 204, 255)
            Case "welfare"
                Return New Colors.RgbColor(193, 255, 193)
            Case "public health"
                Return New Colors.RgbColor(255, 153, 204)
            Case "post mitigation risk"
                Return New Colors.RgbColor(0, 0, 0)
            Case Else
                Return New Colors.RgbColor(0, 163, 59)
        End Select

    End Function

    Private Function GetCategoryForeColor(ByVal categoryName As String) As Colors.Color

        If categoryName.ToLower() = "post mitigation risk" Then
            Return New Colors.GrayColor(255)
        Else
            Return New Colors.GrayColor(0)
        End If

    End Function

#Region "Initial Standard Text"

    Private Sub AddInitialStandardText()

        PdfSection.Paragraphs.Add(StandardTextTitle("D2R2 Scoring: Overall Approach"))
        PdfSection.Paragraphs.Add(StandardTextParagraph(Me.StandardTextPara01_1))
        PdfSection.Paragraphs.Add(BulletTextParagraph(Me.StandardTextPara01_2))
        PdfSection.Paragraphs.Add(BulletTextParagraph(Me.StandardTextPara01_3))
        PdfSection.Paragraphs.Add(BulletTextParagraph(Me.StandardTextPara01_4))
        PdfSection.Paragraphs.Add(BulletTextParagraph(Me.StandardTextPara01_5))
        PdfSection.Paragraphs.Add(StandardTextParagraph(Me.StandardTextPara01_6))

        PdfSection.Paragraphs.Add(StandardTextTitle("How A D2R2 Score Is Generated"))
        PdfSection.Paragraphs.Add(StandardTextParagraph(Me.StandardTextPara02))

        PdfSection.Paragraphs.Add(StandardTextTitle("How The D2R2 Scoring Criteria Are Weighted And Normalised"))
        PdfSection.Paragraphs.Add(StandardTextParagraph(Me.StandardTextPara03))

        PdfSection.Paragraphs.Add(StandardTextTitle("Example of the D2R2 Approach to Scoring and Weighting"))
        PdfSection.Paragraphs.Add(StandardTextParagraph(Me.StandardTextPara04_1))
        AddExampleTable()
        AddExampleTotalTable()
        PdfSection.Paragraphs.Add(StandardTextParagraph(Me.StandardTextPara04_2))
        PdfSection.Paragraphs.Add(StandardTextParagraph(Me.StandardTextPara04_3))
        PdfSection.Paragraphs.Add(BulletTextParagraph(Me.BulletTextPara04_1))
        PdfSection.Paragraphs.Add(BulletTextParagraph(Me.BulletTextPara04_2))
        PdfSection.Paragraphs.Add(BulletTextParagraph(Me.BulletTextPara04_3))
        PdfSection.Paragraphs.Add(BulletTextParagraph(Me.BulletTextPara04_4))

        PdfSection.Paragraphs.Add(StandardTextTitle("Why D2R2 Disease Scores Are Used To Create Rankings And How To Interpret The Rankings"))
        PdfSection.Paragraphs.Add(StandardTextParagraph(Me.StandardTextPara05))

        PdfSection.Paragraphs.Add(StandardTextTitle("What Do D2R2 Scores Represent / Why Don't All Scores Appear Intuitive?"))
        PdfSection.Paragraphs.Add(StandardTextParagraph(Me.StandardTextPara06))

    End Sub

    Private Function StandardTextTitle(ByVal caption As String) As Paragraph

        Dim para As TextParagraph = New TextParagraph
        Dim frag As Fragment = New Fragment

        frag.Text = caption.StripHtmlTags
        frag.FontSize = 12
        frag.Bold = False
        frag.Underline = False
        para.Fragments.Add(frag)
        para.Padding.Bottom = 2
        para.Padding.Top = 7

        Return para

    End Function

    Private Function StandardTextParagraph(ByVal caption As String) As Paragraph

        Dim para As TextParagraph = New TextParagraph
        Dim frag As Fragment = New Fragment

        frag.Text = caption.StripHtmlTags
        frag.FontSize = 10
        frag.Bold = False
        frag.Underline = False
        para.Fragments.Add(frag)
        para.Padding.Bottom = 8
        para.Padding.Top = 7

        Return para

    End Function

    Private Function BulletTextParagraph(ByVal caption As String) As Paragraph

        Dim para As TextParagraph = New TextParagraph
        Dim frag As Fragment = New Fragment

        frag.Text = caption.StripHtmlTags
        frag.FontSize = 10
        frag.Bold = False
        frag.Underline = False
        para.Fragments.Add(frag)
        para.Padding.Bottom = 5
        para.Padding.Left = 15

        Return para

    End Function

    Private Function StandardTextPara01_1() As String

        Dim sb As New StringBuilder

        sb.Append("D2R2 is a simple categorical model. Therefore the numeric and ranked outputs derived from the data held in D2R2 should only be used")
        sb.Append(" to support decision making (i.e. D2R2 is a decision support tool, not a decision making ‘black box’). ")
        sb.Append("Scoring within D2R2 is additive for each of five separate areas of interest. The relative priority of animal diseases ")
        sb.Append("is assessed in the context of the four ‘reasons for government intervention’ (RFI) defined by the GB Animal Health and Welfare Strategy ")
        sb.Append("(AHWS, published in 2004). These are:")

        Return (sb.ToString())

    End Function

    Private Function StandardTextPara01_2() As String

        Dim s As String
        s = "    " + ChrW(8226) + "  'to protect public health' (colour-coded pink on D2R2 outputs)"
        Return s

    End Function

    Private Function StandardTextPara01_3() As String

        Dim s As String
        s = "    " + ChrW(8226) + "  'to protect and promote the welfare of animals' (colour-coded green on D2R2 outputs)"
        Return s

    End Function

    Private Function StandardTextPara01_4() As String

        Dim s As String
        s = "    " + ChrW(8226) + " 'to protect the interests of the wider economy, environment and society' (colour-coded blue on D2R2 outputs)"
        Return s

    End Function

    Private Function StandardTextPara01_5() As String

        Dim s As String
        s = "    " + ChrW(8226) + "  'to protect international trade' (this D2R2 score represents potential impact of the disease on the export trade in animals and animal derived products at a national level)(colour-coded yellow on D2R2 outputs)"
        Return s

    End Function

    Private Function StandardTextPara01_6() As String

        Dim sb As New StringBuilder

        sb.Append("The fifth area for which a score is ")
        sb.Append("generated is termed the post-mitigation risk (PMR). This relates to how well current control measures (both controls arising from legal ")
        sb.Append("requirement and those generally undertaken by animal keepers as part of effective management) can mitigate the impact of the specific disease. ")
        sb.Append("It is colour-coded black on D2R2 outputs.  ")
        sb.Append("For exotic diseases all scores, including that for post-mitigation risk, consider the most likely disease incursion and the control measures ")
        sb.Append("it is anticipated will be pursued. ")

        Return (sb.ToString())

    End Function

    Private Function StandardTextPara02() As String

        Dim sb As New StringBuilder

        sb.Append("Each of these five areas of interest includes a number of scoring criteria. Each of these can have up to seven categorical options ")
        sb.Append("(the specific categories used for each scoring question ('criterion') are described below), ")
        sb.Append("wherever possible underpinned by quantitative ranges. Each option is clearly set out in the guidance on that question provided to the ")
        sb.Append("authors and also available later in this report. Each of the categorical options available for each scoring question ('criterion') in D2R2 are described ")
        sb.Append("to the authors in text, e.g. ‘low’, but each scoring option is assigned a numerical value between 0 or 1 and 25 by the analytical module. ")

        Return (sb.ToString())

    End Function

    Private Function StandardTextPara03() As String

        Dim sb As New StringBuilder

        sb.Append("Each criterion is then weighted to reflect its overall importance to the relevant policy team (zoonoses, welfare, international trade etc.). ")
        sb.Append("D2R2 calculates a score for each criterion, derived from the score for the categorical option chosen, multiplied by the weighting for that criterion. ")
        sb.Append("The values for each criterion within each section are summed to give an initial overall summary score that describes that disease’s impact on the ")
        sb.Append("specific RFI or in terms of the post-mitigation risk. D2R2 transforms each of the five overall scores generated for each disease into a percentage ")
        sb.Append("derived from a scale  generated by allocating ‘0’ for the value generated by summing the lowest value possible for each criterion, and ‘100’ for that ")
        sb.Append("derived by summing the highest possible values. These are the numeric values provided in the summary prioritisation report.")

        Return (sb.ToString())

    End Function

    Private Function StandardTextPara04_1() As String

        Dim s As String
        s = "(using the Wider society reason for Government intervention with possible weighting to demonstrate the approach used)"
        Return s

    End Function

    Private Function StandardTextPara04_2() As String

        Dim sb As New StringBuilder

        sb.Append("This additive approach means the greater the weight attributed to a specific criterion the more likely a change ")
        sb.Append("in the category selected for that criterion will change the disease’s overall score and therefore its relative ranking. ")

        Return (sb.ToString())

    End Function

    Private Function StandardTextPara04_3() As String

        Dim sb As New StringBuilder

        sb.Append("The result of using the weightings included in the example table above on the overall  ")
        sb.Append("Wider society score is that the final score (which is out of 100) describes:")

        Return (sb.ToString())

    End Function

    Private Function BulletTextPara04_1() As String

        Dim s As String
        s = "    " + ChrW(8226) + "  Risk of unexpected government costs 29%"
        Return s

    End Function

    Private Function BulletTextPara04_2() As String

        Dim s As String
        s = "    " + ChrW(8226) + "  Wider community social and economic impact 29%"
        Return s

    End Function

    Private Function BulletTextPara04_3() As String

        Dim s As String
        s = "    " + ChrW(8226) + "  Environmental impact 29%"
        Return s

    End Function

    Private Function BulletTextPara04_4() As String

        Dim s As String
        s = "    " + ChrW(8226) + "  Producer economic impact 14%"
        Return s

    End Function

    Private Function StandardTextPara05() As String

        Dim sb As New StringBuilder

        sb.Append("D2R2 calculates scores for each section separately and makes no assumption about the relative importance of the five substantive sections. ")
        sb.Append("However as the highest ranked diseases for the four different reasons for Government intervention have numerically different scores that have ")
        sb.Append("no intrinsic meaning, comparative outputs from D2R2 are presented as ranked positions, to avoid implying that one RFI is more important than another. ")
        sb.Append("For the post-mitigation risk score a low figure represents a well-controlled disease, a high number a poorly-controlled disease. For a disease ")
        sb.Append("with a numerically large score that therefore appears high in the rankings table for one or more of the reasons for Government intervention the ")
        sb.Append("PMR score should be considered. For example BSE has a high public health score which reflects its serious zoonotic potential. However the extensive ")
        sb.Append("controls that have been implemented mean its post-mitigation risk score is low, indicating there is little likelihood of its onward transmission to ")
        sb.Append("either other animals or people. ")

        Return (sb.ToString())

    End Function

    Private Function StandardTextPara06() As String

        Dim sb As New StringBuilder

        sb.Append("Scores are selected on the basis of the current GB approach. Therefore some serious diseases such as BSE and TB do not have especially high welfare scores. ")
        sb.Append("Although these infections can ultimately lead to profound clinical changes and consequentially significant welfare impacts, the national ")
        sb.Append("surveillance undertaken means infected animals are identified at a relatively early stage (generally before the more profound suffering that ")
        sb.Append("can occur has been caused by these infections). Once an animal has been identified via the relevant surveillance as being suspected of being ")
        sb.Append("infected it will be culled (as required in the relevant statutory disease control plans). Culling not only controls the potential for onward ")
        sb.Append("transmission of disease but also prevents deterioration of the individual animal as disease cannot progress any further, and shortens what otherwise ")
        sb.Append("could have become a long-term duration of suffering.")

        Return (sb.ToString())

    End Function

#End Region
End Class