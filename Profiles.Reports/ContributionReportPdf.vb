Imports ProfilesLibrary
Imports TallComponents.PDF.Layout
Imports TallComponents.PDF.Layout.Paragraphs
Imports TallComponents.PDF.Layout.Colors
Imports TallComponents.PDF.Layout.Navigation

Public Class ContributionReportPdf
    Inherits PdfBase

    Private mProfileVersionList As ProfileVersionInfoList
    Private mProfileSectionList As ProfileSectionMetadataList
    Private mProfileTitle As String = String.Empty

    Private ReadOnly Property PdfTitle() As String
        Get
            Return "Contributions report"
        End Get
    End Property

    Private ReadOnly Property ProfileTitle() As String
        Get
            Return mProfileTitle
        End Get
    End Property

    Public Sub New(ByVal profileId As Guid)

        mProfileVersionList = ProfileVersionInfoList.GetDraftHistory(profileId)
        mProfileSectionList = ProfileSectionMetadataList.GetProfileSectionMetadataList()
        mProfileTitle = mProfileVersionList(0).FullTitle

    End Sub

    Protected Overrides Sub BuildDocumentBody()

        For Each profileVersion As ProfileVersionInfo In mProfileVersionList

            PdfSection.Paragraphs.Add(BuildDocumentSectionHeader(profileVersion.ToString(), "v" & profileVersion.Version))

            For Each profileSection As ProfileSectionMetadata In mProfileSectionList

                Dim sectionHeading As New Heading(1)

                PdfSection.Paragraphs.Add(sectionHeading)
                sectionHeading.Border = New Border()
                sectionHeading.Border.Bottom = DefaultPen
                sectionHeading.SpacingBefore = 10
                sectionHeading.SpacingAfter = 5

                sectionHeading.Caption = String.Format("{0}. {1}", profileSection.SectionNumber.ToString(), profileSection.Name)
                Dim headingFragment As New Fragment(sectionHeading.Caption)
                sectionHeading.Fragments.Add(headingFragment)
                sectionHeading.Bookmark = String.Format("{0}. {1}", profileSection.SectionNumber.ToString(), profileSection.FormattedShortName)

                Dim profileContributionList As ProfileContributionInfoList = ProfileContributionInfoList.GetProfileContributionInfoList(profileVersion.Id, profileSection.Id)

                Dim currentTable As Table = New ContributionsTable(profileContributionList)
                currentTable.SpacingAfter = 5

                PdfSection.Paragraphs.Add(currentTable)

            Next
        Next

    End Sub

    Protected Overrides Function CreateSectionHeader() As Paragraph

        Dim headerParagraph As New XhtmlParagraph()
        With headerParagraph
            .HorizontalAlignment = HorizontalAlignment.Center
            .Margin.Top = New Unit(0.5, UnitType.Inch)
            .Text = String.Format(
                "<html style='font-family:Arial,Helvetica'><center>{0} for:<br/>{1}</center></html>",
                PdfTitle.StripPTags.SanitizeHtml,
                mProfileTitle.StripPTags.SanitizeHtml)
            .Border = New Border()
            .Border.Bottom = DefaultPen
        End With

        Return headerParagraph

    End Function

    Protected Overrides Function CreateSectionFooter() As Paragraph

        Dim sectionTable As New Table
        sectionTable.ForceWidth = True

        sectionTable.PreferredWidth = PageSize.A4.Height
        sectionTable.PreferredWidth = PageSize.A4.Width

        Dim footerLinkRow As New Row
        Dim pageNumberRow As New Row

        Dim reportFooterTitleCell As New Cell
        Dim footerLinkCell As New Cell
        Dim pageNumberCell As New Cell

        footerLinkRow.Cells.Add(footerLinkCell)
        pageNumberRow.Cells.Add(pageNumberCell)

        sectionTable.Rows.Add(footerLinkRow)
        sectionTable.Rows.Add(pageNumberRow)

        Dim pageNumberParagraph As New TextParagraph()
        pageNumberParagraph.HorizontalAlignment = HorizontalAlignment.Center
        Dim pageNumberFragment As New Fragment()
        pageNumberFragment.HasContextFields = True
        pageNumberFragment.Text = "Page #p of #P"
        pageNumberParagraph.Fragments.Add(pageNumberFragment)
        pageNumberParagraph.SpacingAfter = 10

        Dim reportLinkParagraph3 As New TextParagraph
        reportLinkParagraph3.HorizontalAlignment = HorizontalAlignment.Center

        Dim externalLinkFragment3 As New Fragment
        externalLinkFragment3.FontSize -= 2
        externalLinkFragment3.Text = GlobalSettings.PDFQualityStatementText

        reportLinkParagraph3.Fragments.Add(externalLinkFragment3)

        footerLinkCell.Paragraphs.Add(pageNumberParagraph)
        footerLinkCell.Paragraphs.Add(reportLinkParagraph3)

        Return sectionTable

    End Function
End Class
