Imports ProfilesLibrary
Imports TallComponents.PDF.Layout
Imports TallComponents.PDF.Layout.Paragraphs

''' <summary>
''' Abstract base class which can be used to create guidance reports.
''' </summary>
Public MustInherit Class GuidanceReportPdfBase
    Inherits PdfBase

#Region " Members "

    Protected mProfileSectionList As ProfileSectionMetadataList

    Protected mGreyPen As New Pens.Pen(New Colors.GrayColor(210))
    Protected mDarkBlackPen As New Pens.Pen(New Colors.GrayColor(255))
    Protected mInvisiblePen As New Pens.Pen(New Colors.GrayColor(255), 0)
    Protected mDarkPen As New Pens.Pen(New Colors.GrayColor(50))

#End Region

#Region " Constructors "

    Protected Sub New()
        mProfileSectionList = ProfileSectionMetadataList.GetProfileSectionMetadataList()
    End Sub

#End Region

#Region " Properties "

    ''' <summary>
    ''' Returns the section metadata for the given section number. An InvalidOperationException is thrown if it cannot be found.
    ''' </summary>
    ''' <param name="sectionNumber">Number of the section to find</param>
    Protected ReadOnly Property SectionMetadata(ByVal sectionNumber As Integer) As SectionMetadataBase
        Get
            Dim section As SectionMetadataBase = mProfileSectionList.SingleOrDefault(Function(x) x.SectionNumber = sectionNumber)

            If section Is Nothing Then
                Throw New InvalidOperationException( _
                    String.Format( _
                        "Could not find section with number '{0}'.", _
                        sectionNumber))
            End If

            Return section
        End Get
    End Property

    ''' <summary>
    ''' Returns the question data for the given section number and question number. An InvalidOperationException is thrown if it cannot be found.
    ''' </summary>
    ''' <param name="sectionNumber">Number of the section</param>
    ''' <param name="questionNumber">Number of the question</param>
    Protected ReadOnly Property ProfileQuestionData(ByVal sectionNumber As Integer, ByVal questionNumber As Integer) As ProfileQuestion
        Get
            Dim section As SectionMetadataBase = SectionMetadata(sectionNumber)

            Dim question As QuestionMetadataBase = section.QuestionMetadataList.SingleOrDefault(Function(x) x.QuestionNumber = questionNumber)

            If question Is Nothing Then
                Throw New InvalidOperationException( _
                    String.Format( _
                        "Could not find question with number '{0}' in section with number '{1}'.", _
                        questionNumber, _
                        sectionNumber))
            End If

            Dim profileQuestion As ProfileQuestion = profileQuestion.GetProfileQuestion(question.Id)

            If profileQuestion Is Nothing Then
                Throw New InvalidOperationException( _
                    String.Format( _
                        "Could not find profile question with ID '{0}'.", _
                        question.Id))
            End If

            Return profileQuestion
        End Get
    End Property

#End Region

#Region " Abstract Properties/Methods "

    ''' <summary>
    ''' Returns the title of the PDF.
    ''' </summary>    
    Protected MustOverride ReadOnly Property PdfTitle() As String

    ''' <summary>
    ''' A derived class must implement this method to add content to the PDF.
    ''' </summary>
    Protected MustOverride Sub BuildGuidanceBody()

#End Region

#Region " Instance Methods "

    Protected NotOverridable Overrides Sub BuildDocumentBody()

        'Document Logo
        Dim firstPageArea As New Area( _
            PdfSection.Margin.Left, _
            PdfSection.PageSize.Height, _
            PdfSection.PageSize.Width - PdfSection.Margin.Left - PdfSection.Margin.Right, _
            500)
        PdfSection.ForegroundAreas.Add(firstPageArea)
        firstPageArea.Middle = False
        firstPageArea.Last = False
        firstPageArea.Paragraphs.Add(New LogoHeaderTable(Me, PdfSection.PageSize.Width, Me.PdfTitle))

        ' Build the body of the PDF
        BuildGuidanceBody()

    End Sub

    Protected Overrides Function CreateSectionFooter() As Paragraph

        ' Table width needs to take into account the margins of the section, else the table will be too wide for the page
        Dim tableWidth As Double = PdfSection.PageSize.Width - (PdfSection.Margin.Left + PdfSection.Margin.Right)

        ' Create table of required width and set a black top border
        Dim footerTable As Table = New Table
        footerTable.PreferredWidth = tableWidth
        footerTable.ForceWidth = True
        footerTable.Padding.Top = 3
        footerTable.Border = New Border(Colors.GrayColor.Black, 1)
        footerTable.Border.Left = mInvisiblePen
        footerTable.Border.Bottom = mInvisiblePen
        footerTable.Border.Right = mInvisiblePen

        Dim footerRow As Row = footerTable.Rows.Add

        '' Add 3 footer cells: title, page number, and date

        Dim thinCellWidth As Double = tableWidth / 8
        Dim MediumCellWidth As Double = tableWidth / 5.3
        Dim wideCellWidth As Double = 2 * (tableWidth / 6)


        AddFooterCell(PdfTitle + ".", footerRow, MediumCellWidth, False)
        AddFooterCell("Page #p of #P", footerRow, thinCellWidth, True, HorizontalAlignment.Center)
        AddFooterCell(DateTime.Today.ToString("dd MMM yyyy"), footerRow, thinCellWidth, False, HorizontalAlignment.Right)

        ''Add new row to footer for QS PDF text
        Dim footerRow1 As Row = footerTable.Rows.Add
        AddFooterCell(GlobalSettings.PDFQualityStatementText, footerRow1, MediumCellWidth, True, HorizontalAlignment.Left, 3)

        Return footerTable

    End Function

    ''' <summary>
    ''' Creates a guidance table, with a header row including 3 columns (question number, question name and user guidance)
    ''' such that subsequent calls to AddGuidanceTableRow can be used.
    ''' </summary>
    Protected Overridable Function AddGuidanceTable() As Table

        ' Create table
        Dim guidanceTable As Table = New Table
        guidanceTable.PreferredWidth = PdfSection.PageSize.Width
        guidanceTable.ForceWidth = True
        guidanceTable.ColumnDefinitions.Add(New TableColumnDefinition(30, False, True))
        guidanceTable.ColumnDefinitions.Add(New TableColumnDefinition(85, False, True))
        guidanceTable.Padding.Bottom = 6

        'Guidance Header row
        Dim guidanceHeaderRow As Row = guidanceTable.Rows.Add
        guidanceHeaderRow.Border = New Border()
        guidanceHeaderRow.Border.Top = mGreyPen
        guidanceHeaderRow.Border.Left = mGreyPen
        guidanceHeaderRow.Border.Bottom = mGreyPen

        ' Add header cells
        AddNewCell("No.", guidanceHeaderRow, True)
        AddNewCell("Question Name", guidanceHeaderRow, True)
        AddNewCell("User Guidance", guidanceHeaderRow, True)

        PdfSection.Paragraphs.Add(guidanceTable)

        Return guidanceTable

    End Function

    ''' <summary>
    ''' Creates a new row within a guidance table.
    ''' </summary>
    ''' <param name="guidanceTable">The table to add the row to</param>
    ''' <param name="profileQuestion">Question to include guidance for</param>
    ''' <param name="questionNumber">Number to display in the table if it should be different to the actual question number.</param>
    Protected Overridable Sub AddGuidanceTableRow(ByVal guidanceTable As Table, ByVal profileQuestion As ProfileQuestion, Optional ByVal questionNumber As String = Nothing)

        Dim guidanceDataRow As Row = guidanceTable.Rows.Add
        guidanceDataRow.Border = New Border()
        guidanceDataRow.Border.Left = mGreyPen
        guidanceDataRow.Border.Top = mInvisiblePen

        If questionNumber Is Nothing Then
            questionNumber = profileQuestion.QuestionNumber.ToString()
        End If

        AddNewCell(questionNumber, guidanceDataRow, False)
        AddNewCell(profileQuestion.Name, guidanceDataRow, False)
        AddNewCell(profileQuestion.UserGuidance, guidanceDataRow, False)

        Dim guidanceDataRowEmpty As Row = guidanceTable.Rows.Add
        guidanceDataRowEmpty.Border = New Border()
        guidanceDataRowEmpty.Border.Left = mInvisiblePen
        guidanceDataRowEmpty.Border.Top = mGreyPen

    End Sub

    ''' <summary>
    ''' Adds a new cell to a table row with the correct border.
    ''' </summary>
    ''' <param name="text">Text of the cell</param>
    ''' <param name="row">Row to which the cell should be added</param>
    ''' <param name="isHeader">Whether the cell should be a header cell</param>
    Protected Sub AddNewCell(ByVal text As String, ByRef row As Row, ByVal isHeader As Boolean)

        Dim cell As Cell = row.Cells.Add
        cell.Border = New Border()
        cell.Border.Right = mGreyPen
        cell.Padding.Top = 5

        If isHeader Then
            cell.Paragraphs.Add(GetHeaderParagraph(text))
        Else
            cell.Paragraphs.Add(GetTextDataParagraph(text))
        End If

    End Sub

    ''' <summary>
    ''' Returns a paragraph which can be used as a header in a table.
    ''' </summary>
    Private Function GetHeaderParagraph(ByVal text As String) As TextParagraph

        Dim para As New TextParagraph()
        Dim frag As New Fragment
        frag.Text = text.StripHtmlTags
        frag.Bold = True
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

    ''' <summary>
    ''' Creates a cell that can be used in the footer table. This code is to be used so that an n-column layout can be created.
    ''' </summary>
    ''' <param name="text">Text to be placed in the cell</param>
    ''' <param name="row">Row that the cell should be created in</param>
    ''' <param name="width">Width of the cell</param>
    ''' <param name="hasContextFields">Whether the text contains context fields (e.g. page numbers)</param>
    ''' <param name="alignment">Alignment of the text</param>
    Private Sub AddFooterCell(ByVal text As String, ByVal row As Row, ByVal width As Double, ByVal hasContextFields As Boolean, Optional ByVal alignment As HorizontalAlignment = HorizontalAlignment.Left, Optional colspan As Integer = 0)

        Dim footerFragment As New Fragment
        footerFragment.Text = text.StripHtmlTags
        footerFragment.HasContextFields = hasContextFields
        footerFragment.FontSize -= 2

        Dim footerParagraph As New TextParagraph()
        footerParagraph.Fragments.Add(footerFragment)
        footerParagraph.HorizontalAlignment = alignment

        Dim footerCell As Cell = row.Cells.Add()
        footerCell.PreferredWidth = width
        footerCell.Fixed = True
        If colspan > 0 Then
            footerCell.ColSpan = colspan
        End If
        footerCell.Paragraphs.Add(footerParagraph)

    End Sub
    'Add new function for QA Guidance report table row
    Protected Overridable Sub AddQAGuidanceTableRow(ByVal guidanceTable As Table, ByVal profileQuestion As ProfileQuestion, Optional ByVal questionNumber As String = Nothing)

        Dim guidanceDataRow As Row = guidanceTable.Rows.Add
        guidanceDataRow.Border = New Border()
        guidanceDataRow.Border.Left = mGreyPen
        guidanceDataRow.Border.Bottom = mInvisiblePen
        If questionNumber = "9" Then
            AddNewCell(questionNumber, guidanceDataRow, False)
            AddNewCell(profileQuestion.NonTechnicalName, guidanceDataRow, False)
            'AddNewCell(GetQuestion(questionNumber), guidanceDataRow, False)
            AddNewCell(" ", guidanceDataRow, False)
        Else
            AddNewCell(questionNumber, guidanceDataRow, False)
            AddNewCell(profileQuestion.NonTechnicalName, guidanceDataRow, False)
            'AddNewCell(GetQuestion(questionNumber), guidanceDataRow, False)
            AddNewCell(profileQuestion.UserGuidance, guidanceDataRow, False)
        End If
        Dim guidanceDataRowEmpty As Row = guidanceTable.Rows.Add
        guidanceDataRowEmpty.Border = New Border()
        guidanceDataRowEmpty.Border.Top = mGreyPen
    End Sub
    'Add new function for QA Guidance report Questions
    'Fetch/Set Question as per question no.
    Private Function GetQuestion(ByVal text As String) As String

        Dim para As String = String.Empty

        If text = "1" Then
            para = "Summary Description"
        ElseIf text = "2" Then
            para = "Why is it important?"
        ElseIf text = "3" Then
            para = "Does it affect people?"
        ElseIf text = "4" Then
            para = "What are the effects on people?"
        ElseIf text = "5" Then
            para = "How is it transmitted to people?"
        ElseIf text = "6" Then
            para = "Is it transmitted between people?"
        ElseIf text = "7" Then
            para = "How is the disease spread between animals?"
        ElseIf text = "8" Then
            para = "How is the disease spread between premises?"
        ElseIf text = "9" Then
            para = "What animals are affected?"
        ElseIf text = "9a" Then
            para = "What animals have been profiled?"
        ElseIf text = "9b" Then
            para = "Other affected species"
        ElseIf text = "10" Then
            para = "What are the effects on live animals?"
        ElseIf text = "11" Then
            para = "What are the featured observed on dead animals?"
        ElseIf text = "12" Then
            para = "Is there a vaccine for animals?"
        ElseIf text = "13" Then
            para = "How can animals be treated?"
        ElseIf text = "14" Then
            para = "Is it a notifiable disease?"
        ElseIf text = "15" Then
            para = "Is it a reportable disease?"
        ElseIf text = "16" Then
            para = "Is this disease currently present in Great Britain?"
        ElseIf text = "16 1a" Then
            para = "How common is it in Great Britain?"
        ElseIf text = "16 1b" Then
            para = "Potential for risk change in GB"
        ElseIf text = "16 2a" Then
            para = "When did the disease last occur in Great Britain?"
        ElseIf text = "16 2b" Then
            para = "What is the risk of introduction into Great Britain?"
        ElseIf text = "17" Then
            para = "Where does the disease occur abroad?"
        ElseIf text = "18" Then
            para = "Risk summary"
        ElseIf text = "19" Then
            para = "Current surveillance activities"
        ElseIf text = "20" Then
            para = "What is currently being done to control this disease or issue in Great Britain?"
        ElseIf text = "21" Then
            para = "What else could be done to control the disease or issue in Great Britain?"
        ElseIf text = "22" Then
            para = "What is the impact of the disease on animal welfare?"
        ElseIf text = "23" Then
            para = "What is the impact of the disease on international trade?"
        End If

        Return para

    End Function
#End Region

End Class