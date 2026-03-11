Imports ProfilesLibrary
Imports TallComponents.PDF.Layout
Imports TallComponents.PDF.Layout.Paragraphs
Imports TallComponents.PDF.Layout.Colors
Imports TallComponents.PDF.Layout.Navigation

''' <summary>
''' Class used to produce a report on the user guidance for questions which appear within a profile.
''' </summary>
Public Class ProfileGuidanceReportPdf
    Inherits GuidanceReportPdfBase

    Protected Overrides ReadOnly Property PdfTitle() As String
        Get
            Return "Full profile guidance report"
        End Get
    End Property

    Protected Overrides Sub BuildGuidanceBody()

        ' Sections
        For Each section As ProfileSectionMetadata In mProfileSectionList

            ' Add header
            PdfSection.Paragraphs.Add(BuildDocumentSectionHeader(String.Format("{0} - {1}", section.SectionNumber.ToString(), section.Name)))

            ' Create guidance table
            Dim guidanceTable As Table = AddGuidanceTable()

            ' Add guidance data rows
            For Each question As QuestionMetadataBase In section.QuestionMetadataList

                Dim que As ProfileQuestion = ProfileQuestion.GetProfileQuestion(question.Id)
                AddGuidanceTableRow(guidanceTable, que)

            Next
        Next

    End Sub

End Class