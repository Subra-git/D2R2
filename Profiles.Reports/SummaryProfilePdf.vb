Imports ProfilesLibrary
Imports TallComponents.PDF.Layout
Imports TallComponents.PDF.Layout.Paragraphs
Imports TallComponents.PDF.Layout.Colors
Imports TallComponents.PDF.Layout.Navigation

Public Class SummaryProfilePdf
    Inherits ProfileReportPdfBase

    Protected Overrides ReadOnly Property ProfilePdfTitle() As String
        Get
            Return "Summary profile"
        End Get
    End Property

    Public Sub New(ByVal profileVersionId As Guid)
        Me.New(ProfileVersionInfo.GetProfileVersionInfo(profileVersionId))
    End Sub

    Public Sub New(ByVal profileVersion As ProfileVersionInfo)
        MyBase.New(profileVersion)
    End Sub

    Protected Overrides Sub BuildDocumentBody()

        ' PLEASE NOTE
        ' This list of mapped questions is hard coded in this report. Should this mapping change, it is very 
        ' likely that the question mapping in SummaryProfileGuidanceReportPdf.vb will need to change too. 
        ' SummaryProfileGuidanceReportPdf is the user guidance report for questions that appear on this report.

        PdfSection.Paragraphs.Add(BuildDocumentSectionHeader(SummaryProfileReportHeadings.Section1Heading))
        PdfSection.Paragraphs.Add(BuildRenumberedQuestionTable(1, 1, "1.1"))
        PdfSection.Paragraphs.Add(BuildRenumberedQuestionTable(1, 3, "1.2"))

        PdfSection.Paragraphs.Add(BuildDocumentSectionHeader(SummaryProfileReportHeadings.Section2Heading))
        PdfSection.Paragraphs.Add(BuildRenumberedQuestionTable(6, 14, "2.1"))
        PdfSection.Paragraphs.Add(BuildRenumberedQuestionTable(5, 9, "2.2"))
        PdfSection.Paragraphs.Add(BuildRenumberedQuestionTable(7, 7, "2.3"))
        PdfSection.Paragraphs.Add(BuildRenumberedQuestionTable(13, 11, "2.4"))

        PdfSection.Paragraphs.Add(BuildDocumentSectionHeader(SummaryProfileReportHeadings.Section3Heading))
        PdfSection.Paragraphs.Add(BuildRenumberedQuestionTable(8, 4, "3.1"))

        PdfSection.Paragraphs.Add(BuildDocumentSectionHeader(SummaryProfileReportHeadings.Section4Heading))
        PdfSection.Paragraphs.Add(BuildRenumberedQuestionTable(2, 1, "4.1"))
        PdfSection.Paragraphs.Add(BuildRenumberedQuestionTable(2, 7, "4.2"))

        PdfSection.Paragraphs.Add(BuildDocumentSectionHeader(SummaryProfileReportHeadings.Section5Heading))
        PdfSection.Paragraphs.Add(BuildRenumberedControlledQuestionTable(2, 1, "yes", 2, 2, 2, 4, "5.1"))

        PdfSection.Paragraphs.Add(BuildDocumentSectionHeader(SummaryProfileReportHeadings.Section6Heading))
        PdfSection.Paragraphs.Add(BuildRenumberedQuestionTable(6, 1, "6.1"))
        PdfSection.Paragraphs.Add(BuildRenumberedQuestionTable(6, 5, "6.2"))
        PdfSection.Paragraphs.Add(BuildRenumberedQuestionTable(6, 3, "6.3"))

        PdfSection.Paragraphs.Add(BuildDocumentSectionHeader(SummaryProfileReportHeadings.Section7Heading))
        PdfSection.Paragraphs.Add(BuildRenumberedQuestionTable(9, 1, "7.1"))

        PdfSection.Paragraphs.Add(BuildDocumentSectionHeader(SummaryProfileReportHeadings.Section8Heading))
        PdfSection.Paragraphs.Add(BuildRenumberedQuestionTable(12, 2, "8.1"))

        PdfSection.Paragraphs.Add(BuildDocumentSectionHeader(SummaryProfileReportHeadings.Section9Heading))
        PdfSection.Paragraphs.Add(BuildRenumberedQuestionTable(7, 6, "9.1"))
        PdfSection.Paragraphs.Add(BuildRenumberedQuestionTable(7, 8, "9.2"))

        PdfSection.Paragraphs.Add(BuildDocumentSectionHeader(SummaryProfileReportHeadings.Section10Heading))
        PdfSection.Paragraphs.Add(BuildRenumberedQuestionTable(9, 11, "10.1"))

        BuildWarningTextSection()

    End Sub

    Protected Overrides Function BuildDocumentSectionHeader(ByVal caption As String, ByVal bookmark As String) As Heading

        Dim header As Heading = MyBase.BuildDocumentSectionHeader(caption, bookmark)
        header.StartOnNewPage = False
        header.SpacingBefore = 20
        Return header

    End Function

End Class
