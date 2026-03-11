Imports ProfilesLibrary
Imports TallComponents.PDF.Layout
Imports TallComponents.PDF.Layout.Paragraphs
Imports TallComponents.PDF.Layout.Colors
Imports TallComponents.PDF.Layout.Navigation

Public Class ProfileVersionComparisonReportPdf
    Inherits PdfBase

    Private mProfileSectionList As ProfileSectionMetadataList
    Private mProfileVersionLeftId As Guid
    Private mProfileVersionRightId As Guid
    Private mPdfTitleLeft As String
    Private mPdfTitleRight As String

    Protected ReadOnly Property PdfTitleLeft() As String
        Get
            Return mPdfTitleLeft
        End Get
    End Property

    Protected ReadOnly Property PdfTitleRight() As String
        Get
            Return mPdfTitleRight
        End Get
    End Property

    Public Sub New(ByVal profileVersionLeftId As Guid, ByVal profileVersionRightId As Guid)

        mProfileSectionList = ProfileSectionMetadataList.GetProfileSectionMetadataList()
        mProfileVersionLeftId = profileVersionLeftId
        mProfileVersionRightId = profileVersionRightId

        mPdfTitleLeft = ProfileVersionInfo.GetProfileVersionInfo(mProfileVersionLeftId).ToString()
        mPdfTitleRight = ProfileVersionInfo.GetProfileVersionInfo(mProfileVersionRightId).ToString()

    End Sub

    Protected Function BuildQuestionTable(ByVal questionLeft As QuestionBase, ByVal questionRight As QuestionBase, ByVal sectionNumber As Integer) As Table

        Dim titleRow As Row = New QuestionHeadingRow(questionLeft, sectionNumber, 1)
        Dim answersTable As Table = AnswerComparisonTable.GetAnswerTable(questionLeft, questionRight, 2, Me)
        Return New QuestionTable(titleRow, String.Empty, answersTable, 750)

    End Function

    Protected Function BuildQuestionDifferenceTable(ByVal questionLeft As QuestionBase, ByVal questionRight As QuestionBase, ByVal sectionNumber As Integer) As Table

        Dim titleRow As Row = New QuestionHeadingRow(questionLeft, sectionNumber, 1)
        Dim answersTable As Table = AnswerComparisonDifferenceTable.GetAnswerTable(questionLeft, questionRight, 2, Me)
        Return New QuestionTable(titleRow, String.Empty, answersTable, 750)

    End Function

    Protected Overrides Sub BuildDocumentBody()

        For Each section As ProfileSectionMetadata In mProfileSectionList

            Dim profileVersionSectionLeft As ProfileVersionSection = ProfileVersionSection.GetProfileVersionSection(mProfileVersionLeftId, section.Id)
            Dim profileVersionSectionRight As ProfileVersionSection = ProfileVersionSection.GetProfileVersionSection(mProfileVersionRightId, section.Id)

            PdfSection.Paragraphs.Add(BuildDocumentSectionHeader( _
                String.Format("{0}. {1}", section.SectionNumber.ToString(), section.Name), _
                String.Format("{0}. {1}", section.SectionNumber.ToString(), section.FormattedShortName)))

            If profileVersionSectionLeft.ValuesEqual(profileVersionSectionRight) Then
                Dim emptyRow As New Row
                Dim emptyCell As New Cell
                Dim emptyPar As New TextParagraph
                emptyPar.HorizontalAlignment = TallComponents.PDF.Layout.HorizontalAlignment.Center
                Dim emptyFrag As New Fragment(" - Sections are identical - ")
                emptyFrag.Italic = True
                emptyPar.Fragments.Add(emptyFrag)
                PdfSection.Paragraphs.Add(emptyPar)
            Else
                For Each question As QuestionBase In profileVersionSectionLeft.Questions

                    If question.ValuesEqual(profileVersionSectionRight.Questions.GetById(question.Id)) Then
                        ' do nothing
                    Else

                        Dim questionDifferenceBox As Table = BuildQuestionDifferenceTable(question, profileVersionSectionRight.Questions.GetById(question.Id), section.SectionNumber)

                        PdfSection.Paragraphs.Add(questionDifferenceBox)
                    End If
                Next
            End If
        Next

    End Sub

    Protected Overrides Function CreateSectionHeader() As TallComponents.PDF.Layout.Paragraphs.Paragraph

        Dim headerParagraph As New XhtmlParagraph()
        With headerParagraph
            .HorizontalAlignment = HorizontalAlignment.Center
            .Margin.Top = New Unit(0.5, UnitType.Inch)
            .Text = String.Format(
                "<html style='font-family:Arial,Helvetica'><table><tr><td width='50%'><center>{0}</center></td><td><center>{1}</center></td></tr></table></html>",
                PdfTitleLeft.StripPTags.SanitizeHtml,
                PdfTitleRight.StripPTags.SanitizeHtml)
            .Border = New Border()
            .Border.Bottom = DefaultPen
        End With

        Return headerParagraph

    End Function

    Protected Overrides Function CreateSectionFooter() As TallComponents.PDF.Layout.Paragraphs.Paragraph

        Dim pageNumberParagraph As New TextParagraph()
        pageNumberParagraph.HorizontalAlignment = HorizontalAlignment.Center
        Dim pageNumberFragment As New Fragment()
        pageNumberFragment.HasContextFields = True
        pageNumberFragment.Text = "Page #p of #P"
        pageNumberParagraph.Fragments.Add(pageNumberFragment)

        Return pageNumberParagraph

    End Function

    Protected Overrides Sub AddPdfSection()
        MyBase.AddPdfSection(SectionOrientation.Landscape)
    End Sub

End Class
