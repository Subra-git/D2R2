Imports ProfilesLibrary
Imports TallComponents.PDF.Layout
Imports TallComponents.PDF.Layout.Paragraphs
Imports Profiles.Reports.Extensions
Imports Profiles.Reports.Extensions.Formatting.Paragraph
Imports Profiles.Reports.Extensions.Formatting.Cell

Public Class DiseaseReviewsReportPdf
    Inherits PdfBase

    Public mReportFilterType As String
    Public mDescription As String = String.Empty
    Public mToDate As Date
    Public mFromdate As Date
    Private mAuthorName As String = String.Empty
    Private mAuthorId As Guid

    Public Property NameOfFilter() As String
        Get
            Return mReportFilterType
        End Get
        Set(ByVal value As String)
            mReportFilterType = value
        End Set
    End Property

    Public Property Description() As String
        Get
            Return mDescription
        End Get
        Set(ByVal value As String)
            mDescription = value
        End Set
    End Property

    Public Property ToDate() As Date
        Get
            Return mToDate
        End Get
        Set(ByVal value As Date)
            mToDate = value
        End Set
    End Property

    Public Property Fromdate() As Date
        Get
            Return mFromdate
        End Get
        Set(ByVal value As Date)
            mFromdate = value
        End Set
    End Property

    Public Property AuthorName() As String
        Get
            Return mAuthorName
        End Get
        Set(ByVal value As String)
            mAuthorName = value
        End Set
    End Property

    Public Property AuthorId() As Guid
        Get
            Return mAuthorId
        End Get
        Set(value As Guid)
            mAuthorId = value
        End Set
    End Property

    Protected Overrides Function CreateFrontPage() As Section

        Dim mDiseaseReviewsesList As DiseaseReviewsInfoList = DiseaseReviewsInfoList.GetDiseaseReviewsInfoListWithFilter(mDescription, mToDate, mFromdate, mAuthorId)

        Dim lineBuilder As PdfLineBuilder = New PdfLineBuilder()

        Dim section As New Section
        SetPdfSectionSize(section, SectionOrientation.Portrait)

        Dim firstPageArea As New Area(section.Margin.Left, section.PageSize.Height, section.PageSize.Width - section.Margin.Left - section.Margin.Right, section.PageSize.Height)

        Dim title As String = String.Empty
        firstPageArea.Paragraphs.Add(New DiseaseReviewsLogoHeaderTable(Me, section.PageSize.Width, title))
        section.ForegroundAreas.Add(firstPageArea)
        
        Dim descriptionParagraphBuilder As PdfParagraphBuilder = New PdfParagraphBuilder(New ParagraphFormatting(fontSize:=10), Description)
        section.Paragraphs.Add(descriptionParagraphBuilder.Generate())

        Dim dateRangeParagraphBuilder As PdfParagraphBuilder = New PdfParagraphBuilder(New ParagraphFormatting(fontSize:=10), AuthorName + " due between " + mFromdate.ToString("dd-MM-yyyy") + " and " + mToDate.ToString("dd-MM-yyyy"))
        section.Paragraphs.Add(dateRangeParagraphBuilder.Generate())

        section.Paragraphs.Add(lineBuilder.GenerateBlankLine())
        section.Paragraphs.Add(lineBuilder.GenerateBlankLine())
        section.Margin.Bottom = 50
        section.Paragraphs.Add(lineBuilder.GenerateHorizontalLine())
        section.Paragraphs.Add(lineBuilder.GenerateBlankLine())

        Dim dataByProfile As IEnumerable(Of IGrouping(Of Guid, DiseaseReviewsInfo)) = mDiseaseReviewsesList.GroupBy(Function(x) x.Id)

        For Each group As IGrouping(Of Guid, DiseaseReviewsInfo) In dataByProfile

            Dim rowBuilders As List(Of PdfRowBuilder) = New List(Of PdfRowBuilder)

            'Add profile title
            section.Paragraphs.Add(lineBuilder.GenerateBlankLine())
            Dim titleParagraph As PdfParagraphBuilder = New PdfParagraphBuilder(New ParagraphFormatting(fontSize:=10, textFormat:=TextFormat.Bold), group.First().ProfileName)
            section.Paragraphs.Add(titleParagraph.Generate())
            section.Paragraphs.Add(lineBuilder.GenerateBlankLine())
            section.Paragraphs.Add(lineBuilder.GenerateBlankLine())

            ' Add headings to the table in the first row
            Dim sectionHeading As PdfCellBuilder = New PdfCellBuilder(New CellFormatting(New ParagraphFormatting(textFormat:=TextFormat.Bold), fixedWidth:=260), "Section")
            Dim policyReviewDateHeader As PdfCellBuilder = New PdfCellBuilder(New CellFormatting(New ParagraphFormatting(textFormat:=TextFormat.Bold), fixedWidth:=90), "Policy Review Due Date")
            Dim authorReviewDateHeader As PdfCellBuilder = New PdfCellBuilder(New CellFormatting(New ParagraphFormatting(textFormat:=TextFormat.Bold), fixedWidth:=90), "Author Review Due Date")
            Dim technicalReviewDateHeader As PdfCellBuilder = New PdfCellBuilder(New CellFormatting(New ParagraphFormatting(textFormat:=TextFormat.Bold), fixedWidth:=90), "VA Review Due Date")

            rowBuilders.Add(New PdfRowBuilder(sectionHeading, policyReviewDateHeader, authorReviewDateHeader, technicalReviewDateHeader))

            For Each row As DiseaseReviewsInfo In group.OrderBy(Function(x) x.SectionNumber)

                Dim sectionValue As String = row.SectionNumber.ToString() + ": " + row.SectionName
                Dim policyDateValue As String = If(row.NextPolicyReview.HasValue, row.NextPolicyReview.Value.ToString("dd MMM yyyy"), String.Empty)
                Dim authorDateValue As String = If(row.NextAuthorReview.HasValue, row.NextAuthorReview.Value.ToString("dd MMM yyyy"), String.Empty)
                Dim technicalDateValue As String = If(row.NextTechnicalReview.HasValue, row.NextTechnicalReview.Value.ToString("dd MMM yyyy"), String.Empty)

                Dim sectionBuilder As PdfCellBuilder = New PdfCellBuilder(New CellFormatting(fixedWidth:=260), sectionValue)
                Dim policyDateBuilder As PdfCellBuilder = New PdfCellBuilder(New CellFormatting(fixedWidth:=90), policyDateValue)
                Dim authorDateBuilder As PdfCellBuilder = New PdfCellBuilder(New CellFormatting(fixedWidth:=90), authorDateValue)
                Dim technicalDateBuilder As PdfCellBuilder = New PdfCellBuilder(New CellFormatting(fixedWidth:=90), technicalDateValue)

                rowBuilders.Add(New PdfRowBuilder(sectionBuilder, policyDateBuilder, authorDateBuilder, technicalDateBuilder))

            Next

            Dim table As PdfTableBuilder = New PdfTableBuilder(group.First().ProfileName, rowBuilders, New Formatting.Table.TableFormatting(1000))

            section.Paragraphs.Add(table.Generate())
            section.Paragraphs.Add(lineBuilder.GenerateBlankLine())
            section.Paragraphs.Add(lineBuilder.GenerateBlankLine())
            section.Paragraphs.Add(lineBuilder.GenerateHorizontalLine())

        Next

        section.Footer = New Footer()
        Dim sectionFooter As Paragraph = CreateSectionFooter(SectionOrientation.Portrait, (AuthorName + " due " + mFromdate.ToString("dd-MM-YY") + "-" + mToDate.ToString("dd-MM-YY")))
        section.Footer.Paragraphs.Add(sectionFooter)

        section.Margin.Bottom = 35

        Return section

    End Function

    Protected Overrides Sub BuildDocumentBody()
    End Sub

    Protected Overloads Function CreateSectionFooter(ByVal orientation As SectionOrientation, ByVal AutherNameStr As String) As TallComponents.PDF.Layout.Paragraphs.Paragraph

        Dim sectionTable As New Table
        sectionTable.ForceWidth = True

        If orientation = SectionOrientation.Landscape Then
            sectionTable.PreferredWidth = PageSize.A4.Height
        Else
            sectionTable.PreferredWidth = PageSize.A4.Width
        End If

        Dim footerLinkRow As New Row
        Dim pageNumberRow As New Row

        Dim reportFooterTitleCell As New Cell
        Dim footerLinkCell As New Cell
        Dim pageNumberCell As New Cell

        footerLinkRow.Cells.Add(footerLinkCell)
        pageNumberRow.Cells.Add(pageNumberCell)

        sectionTable.Rows.Add(footerLinkRow)
        sectionTable.Rows.Add(pageNumberRow)

        Dim reportLinkParagraph As New TextParagraph
        reportLinkParagraph.HorizontalAlignment = HorizontalAlignment.Left

        Dim reportLinkFragment1 As New Fragment
        reportLinkFragment1.Text = AutherNameStr.StripHtmlTags
        reportLinkFragment1.FontSize = 7

        reportLinkParagraph.Fragments.Add(reportLinkFragment1)

        Dim pageNumberParagraph As New TextParagraph()
        pageNumberParagraph.HorizontalAlignment = HorizontalAlignment.Right
        Dim pageNumberFragment As New Fragment()
        pageNumberFragment.HasContextFields = True
        pageNumberFragment.Text &= String.Format("Produced: {0}", Date.Now.ToShortDateString())
        pageNumberFragment.Text &= ". "
        pageNumberFragment.Text &= "Page #p of #P"
        pageNumberFragment.FontSize = 7
        pageNumberParagraph.Fragments.Add(pageNumberFragment)

        footerLinkCell.Paragraphs.Add(reportLinkParagraph)
        pageNumberCell.Paragraphs.Add(pageNumberParagraph)

        Return sectionTable

    End Function

End Class
