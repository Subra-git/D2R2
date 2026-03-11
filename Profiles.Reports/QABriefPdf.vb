Imports ProfilesLibrary
Imports TallComponents.PDF.Layout
Imports TallComponents.PDF.Layout.Paragraphs
Imports TallComponents.PDF.Layout.Colors
Imports TallComponents.PDF.Layout.Navigation

Public Class QABriefPdf
    Inherits ProfileReportPdfBase

    Protected Overrides ReadOnly Property ProfilePdfTitle() As String
        Get
            Return "Question and answer brief"
        End Get
    End Property

    Public Sub New(ByVal profileVersionId As Guid)
        Me.New(ProfileVersionInfo.GetProfileVersionInfo(profileVersionId))
    End Sub

    Public Sub New(ByVal profileVersion As ProfileVersionInfo)
        MyBase.New(profileVersion)
    End Sub

    Protected Overrides Sub BuildDocumentBody()

        PdfSection.Paragraphs.Add(BuildNonTechnicalTitledQuestionTable(1, 1, "1", 0))
        PdfSection.Paragraphs.Add(BuildNonTechnicalTitledQuestionTable(6, 14, "2", 0))
        PdfSection.Paragraphs.Add(BuildNonTechnicalTitledQuestionTable(6, 1, "3", 0))
        PdfSection.Paragraphs.Add(BuildNonTechnicalTitledQuestionTable(6, 5, "4", 0))
        PdfSection.Paragraphs.Add(BuildNonTechnicalTitledQuestionTable(6, 3, "5", 0))
        PdfSection.Paragraphs.Add(BuildNonTechnicalTitledQuestionTable(6, 6, "6", 0))
        PdfSection.Paragraphs.Add(BuildNonTechnicalTitledQuestionTable(3, 13, "7", 0))
        PdfSection.Paragraphs.Add(BuildNonTechnicalTitledQuestionTable(3, 17, "8", 0))

        BuildQuestion9() 'affected species

        PdfSection.Paragraphs.Add(BuildNonTechnicalTitledQuestionTable(3, 7, "10", 0))
        PdfSection.Paragraphs.Add(BuildNonTechnicalTitledQuestionTable(3, 8, "11", 0))
        PdfSection.Paragraphs.Add(BuildNonTechnicalTitledQuestionTable(9, 8, "12", 0))
        PdfSection.Paragraphs.Add(BuildNonTechnicalTitledQuestionTable(3, 15, "13", 0))
        PdfSection.Paragraphs.Add(BuildNonTechnicalTitledQuestionTable(8, 1, "14", 0))
        PdfSection.Paragraphs.Add(BuildNonTechnicalTitledQuestionTable(8, 2, "15", 0))

        BuildQuestion16() 'disease present in GB

        PdfSection.Paragraphs.Add(BuildNonTechnicalTitledQuestionTable(2, 7, "17", 0))
        PdfSection.Paragraphs.Add(BuildNonTechnicalTitledQuestionTable(10, 6, "18", 0))
        PdfSection.Paragraphs.Add(BuildNonTechnicalTitledQuestionTable(12, 1, "19", 0))
        PdfSection.Paragraphs.Add(BuildNonTechnicalTitledQuestionTable(9, 1, "20", 0))
        PdfSection.Paragraphs.Add(BuildNonTechnicalTitledQuestionTable(9, 2, "21", 0))
        PdfSection.Paragraphs.Add(BuildNonTechnicalTitledQuestionTable(5, 9, "22", 0))
        PdfSection.Paragraphs.Add(BuildNonTechnicalTitledQuestionTable(13, 11, "23", 0))

        BuildWarningTextSection()

    End Sub

    Private Sub BuildQuestion9()

        Dim question9Table As Table = New Table
        question9Table.HorizontalAlignment = HorizontalAlignment.Center
        question9Table.PreferredWidth = 550
        question9Table.ForceWidth = True
        question9Table.SpacingBefore = 5
        question9Table.HorizontalAlignment = HorizontalAlignment.Center
        question9Table.Rows.Add(New QuestionHeadingRow("9 What animals are affected?", "9 What animals are affected?", 0))
        PdfSection.Paragraphs.Add(question9Table)
        PdfSection.Paragraphs.Add(BuildNonTechnicalTitledQuestionTable(1, 3, "9a", 1, String.Empty))
        PdfSection.Paragraphs.Add(BuildNonTechnicalTitledQuestionTable(1, 4, "9b", 1, String.Empty))

    End Sub

    Private Sub BuildQuestion16()

        PdfSection.Paragraphs.Add(BuildNonTechnicalTitledQuestionTable(2, 1, "16", 0))
        Dim q21 As StandardQuestion = DirectCast(ProfileVersionQuestionData(2, 1), StandardQuestion)
        Dim q21Answer As FieldValueBase = q21.FieldValues(0)

        Dim isPresent As Boolean
        If q21Answer IsNot Nothing AndAlso q21Answer.ToString <> "No" Then
            isPresent = True
        Else
            isPresent = False
        End If
        If isPresent Then
            PdfSection.Paragraphs.Add(BuildNonTechnicalTitledQuestionTable(5, 8, "16.1a", 1))
        End If
        If isPresent Then
            PdfSection.Paragraphs.Add(BuildNonTechnicalTitledQuestionTable(2, 6, "16.1b", 1))
        End If
        If Not isPresent Then
            PdfSection.Paragraphs.Add(BuildNonTechnicalTitledQuestionTable(2, 3, "16.2a", 1))
        End If
        If Not isPresent Then
            PdfSection.Paragraphs.Add(BuildNonTechnicalTitledQuestionTable(2, 4, "16.2b", 1))
        End If

    End Sub

End Class

