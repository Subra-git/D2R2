Imports ProfilesLibrary
Imports TallComponents.PDF.Layout
Imports TallComponents.PDF.Layout.Paragraphs

Public Class ProfileVersionBespokeReportPdf
	Inherits ProfileReportPdfBase

	Private mProfileSectionId As Guid
	Private mProfileVersionId As Guid
	Private mSections As List(Of String)
	Private mQuestions As List(Of String)
	Private mGuidance As List(Of String)
	Protected mGreyPen As New Pens.Pen(New Colors.GrayColor(210))
	Protected mInvisiblePen As New Pens.Pen(New Colors.GrayColor(255), 0)
	Private mTemplateTitle As String

	Protected Overrides ReadOnly Property ProfilePdfTitle() As String
		Get
			Return If(mTemplateTitle Is Nothing, "Bespoke Profile Report", mTemplateTitle)
		End Get
	End Property

	Public Sub New(ByVal profileVersionId As Guid)
		Me.New(ProfileVersionInfo.GetProfileVersionInfo(profileVersionId), Guid.Empty)
	End Sub

	Public Sub New(ByVal profileVersion As ProfileVersionInfo)
		Me.New(profileVersion, Guid.Empty)
	End Sub

	Public Sub New(ByVal profileVersionId As Guid, ByVal profileSectionId As Guid)
		Me.New(ProfileVersionInfo.GetProfileVersionInfo(profileVersionId), profileSectionId)
	End Sub

	Public Sub New(profileVersionId As Guid,
					selectedProfilesVersionSections As List(Of String),
					selectedProfilesVersionQuestions As List(Of String),
					selectedProfilesVersionGuidance As List(Of String),
					templateTitle As String)

		Me.New(ProfileVersionInfo.GetProfileVersionInfo(profileVersionId))
		mSections = selectedProfilesVersionSections
		mQuestions = selectedProfilesVersionQuestions
		mGuidance = selectedProfilesVersionGuidance
		mTemplateTitle = templateTitle
	End Sub

	Public Sub New(ByVal profileVersion As ProfileVersionInfo, ByVal profileSectionId As Guid)
		MyBase.New(profileVersion)
		mProfileSectionId = profileSectionId
	End Sub

	Protected Overrides Function CreateFrontPage() As Section
        If mProfileSectionId.Equals(Guid.Empty) Then
            Return MyBase.CreateFrontPage()
        End If
        Return Nothing
    End Function

    Protected Overrides Sub BuildDocumentBody()

        Dim sectionCount As Integer

        For Each profileSection As ProfileSectionMetadata In SectionList
            If mProfileSectionId.Equals(Guid.Empty) OrElse mProfileSectionId.Equals(profileSection.Id) Then

                If mSections.Contains(profileSection.Id.ToString) Then
                    sectionCount += 1
                    BuildSection(profileSection)
                End If
            End If
        Next

        BuildWarningTextSection()

        'If we are producing a PDF for all sections, add a References section at the end
        'If mProfileSectionId.Equals(Guid.Empty) Then
        'BuildReferencesSection(sectionCount + 1)
        'End If

    End Sub

    Private Sub BuildSection(ByVal profileSection As ProfileSectionMetadata)

        PdfSection.Paragraphs.Add(BuildDocumentSectionHeader( _
                String.Format("{0}. {1}", profileSection.SectionNumber.ToString(), profileSection.Name), _
                String.Format("{0}. {1}", profileSection.SectionNumber.ToString(), profileSection.FormattedShortName)))

        If profileSection.Note.Length > 0 Then
            PdfSection.Paragraphs.Add(BuildDocumentSectionNote(profileSection.Note))
        End If

        For Each currentProfileQuestion As QuestionBase In ProfileVersionSectionData(profileSection.Id).Questions

            If mQuestions.Contains(currentProfileQuestion.Id.ToString) Then
                Dim questionBox As Table = BuildQuestionTable(currentProfileQuestion, profileSection.SectionNumber)
                PdfSection.Paragraphs.Add(questionBox)
            End If

            If mGuidance.Contains(currentProfileQuestion.Id.ToString) Then

                Dim profileQuestionId As New Guid(currentProfileQuestion.Id.ToString)
                Dim question As ProfileQuestion = ProfileQuestion.GetProfileQuestion(profileQuestionId)
                Dim guidanceHeader As String = String.Format("{0}.{1} : {2} (Guidance)", profileSection.SectionNumber.ToString, question.QuestionNumber, question.Name.StripPTags)
                Dim guidanceBox As Table = BuildGuidanceTable(question.UserGuidance, guidanceHeader)
                PdfSection.Paragraphs.Add(guidanceBox)
            End If

        Next

        'only add references to the end of the section if we are producing a PDF just for one section
        If Not mProfileSectionId.Equals(Guid.Empty) Then
            AddPdfSection(SectionOrientation.Landscape)
            BuildNoteTablesForSection(profileSection.Id, 1)
        End If

    End Sub

    Private Function BuildDocumentSectionNote(ByVal note As String) As Paragraph

        Dim strNote As String = String.Format("<strong><em>{0}</em></strong>", note)
        Dim noteParagraph As New FormattedXhtmlParagraph(strNote)
        noteParagraph.SpacingAfter = 10
        Return noteParagraph

    End Function

    Private Sub BuildReferencesSection(ByVal sectionNumber As Integer)

        AddPdfSection(SectionOrientation.Landscape)

        PdfSection.Paragraphs.Add(BuildDocumentSectionHeader( _
                String.Format("{0}. {1}", sectionNumber, "Sources of further information and references"), _
                String.Format("{0}. {1}", sectionNumber, "References")))

        For Each profileSection As ProfileSectionMetadata In SectionList

            Dim sectionHeading As New Heading(1)
            PdfSection.Paragraphs.Add(sectionHeading)
            sectionHeading.Border = New Border()
            sectionHeading.Border.Bottom = DefaultPen
            sectionHeading.SpacingAfter = 5
            sectionHeading.Caption = String.Format("{0}. {1}", profileSection.SectionNumber.ToString(), profileSection.Name)
            Dim headingFragment As New Fragment(sectionHeading.Caption)
            sectionHeading.Fragments.Add(headingFragment)
            sectionHeading.Bookmark = String.Format("{0}.{1}", profileSection.SectionNumber.ToString(), profileSection.FormattedShortName)

            BuildNoteTablesForSection(profileSection.Id, 2)

        Next

    End Sub

    Private Sub BuildNoteTablesForSection(ByVal profileSectionId As Guid, ByVal level As Integer)

        Dim scientificReferenceList As Csla.SortedBindingList(Of ProfilesLibrary.Note) = GetSortedNoteList(profileSectionId, NoteType.ScientificPaperReference)
        PdfSection.Paragraphs.Add(BuildNoteTable(scientificReferenceList, "Scientific paper reference", level))

        Dim legislativeReferenceList As Csla.SortedBindingList(Of ProfilesLibrary.Note) = GetSortedNoteList(profileSectionId, NoteType.LegislativeReference)
        PdfSection.Paragraphs.Add(BuildNoteTable(legislativeReferenceList, "Legislative reference", level))

        Dim furtherInfoList As Csla.SortedBindingList(Of ProfilesLibrary.Note) = GetSortedNoteList(profileSectionId, NoteType.SourceOfFurtherInformation)
        PdfSection.Paragraphs.Add(BuildNoteTable(furtherInfoList, "Source of further information", level))

    End Sub

    Private Function GetSortedNoteList(ByVal profileSectionId As Guid, ByVal noteType As NoteType) As Csla.SortedBindingList(Of ProfilesLibrary.Note)

        Dim noteList As NoteList = noteList.GetNoteListBySection(ProfileInfo.Id, profileSectionId, noteType)
        Dim sortedNoteList As New Csla.SortedBindingList(Of ProfilesLibrary.Note)(noteList)
        sortedNoteList.ApplySort("NoteText", ComponentModel.ListSortDirection.Ascending)
        Return sortedNoteList

    End Function

    Private Function BuildNoteTable(ByVal noteList As Csla.SortedBindingList(Of ProfilesLibrary.Note), ByVal noteTitle As String, ByVal level As Integer) As Table

        Dim noteTable As New Table
        noteTable.PreferredWidth = 800
        noteTable.ForceWidth = True
        noteTable.SpacingBefore = 10
        noteTable.ColumnDefinitions.Add(New TableColumnDefinition(40, False, True)) 'fix the first column width
        noteTable.RepeatFirstRow = True
        Dim titleRow As Row = noteTable.Rows.Add()
        titleRow.Margin.Bottom = 5
        titleRow.Border = New Border()
        titleRow.Border.Background = New Brushes.SolidBrush(New Colors.RgbColor(0, 163, 59))


        Dim qrefCell As Cell = titleRow.Cells.Add()
        Dim qrefParagraph As New TextParagraph()
        qrefCell.Paragraphs.Add(qrefParagraph)
        Dim qrefFragment As New Fragment()
        qrefFragment.Text = "Question"
        qrefFragment.TextColor = New Colors.RgbColor(255, 255, 255)
        qrefParagraph.Fragments.Add(qrefFragment)

        Dim titleCell As Cell = titleRow.Cells.Add()
        Dim titleLabel As New Heading(level)
        titleLabel.Caption = noteTitle
        titleLabel.Padding.Left = 5
        titleLabel.Padding.Right = 5
        Dim titleFragment As New Fragment()
        titleFragment.Text = "#c"
        titleFragment.TextColor = New Colors.RgbColor(255, 255, 255)
        titleLabel.Fragments.Add(titleFragment)
        If noteTitle.StartsWith("Source") Then
            titleLabel.Bookmark = noteTitle.Replace("Source", "Sources")
        Else
            titleLabel.Bookmark = noteTitle & "s"
        End If

        titleCell.Paragraphs.Add(titleLabel)

        If noteList.Count = 0 Then
            Dim noteRow As Row = noteTable.Rows.Add()
            noteRow.Padding.Bottom = 5
            Dim noteCell As Cell = noteRow.Cells.Add()
            noteCell = noteRow.Cells.Add()
            Dim noteParagraph As New TextParagraph()
            noteCell.Paragraphs.Add(noteParagraph)
            Dim noteFragment As New Fragment()
            noteFragment.Italic = True
            noteFragment.Text = "- No " & titleLabel.Bookmark.ToLower() & " supplied -"
            noteParagraph.Fragments.Add(noteFragment)
        Else
            For Each currentNote As ProfilesLibrary.Note In noteList
                Dim noteRow As Row = noteTable.Rows.Add()
                noteRow.Padding.Bottom = 5
                Dim qrefNoteCell As Cell = noteRow.Cells.Add()
                Dim strQrefNoteFragment As String = New FormattedHtmlFragment(currentNote.ReferenceList.QuestionReferenceListText).Text
                Dim qrefNoteParagraph As New FormattedXhtmlParagraph(strQrefNoteFragment)
                qrefNoteCell.Paragraphs.Add(qrefNoteParagraph)

                Dim refCell As Cell = noteRow.Cells.Add()
                Dim strRefCurrentNote As String = New FormattedHtmlFragment(currentNote.NoteText).Text
                Dim refParagraph As New FormattedXhtmlParagraph(strRefCurrentNote)
                refCell.Paragraphs.Add(refParagraph)
            Next
        End If

        Return noteTable

    End Function

    Private Function BuildReviewFrequencyTable(ByVal section As ProfileVersionSection) As Table

        Dim reviewTable As New Table
        reviewTable.PreferredWidth = 550
        reviewTable.ForceWidth = True
        reviewTable.SpacingBefore = 5
        reviewTable.HorizontalAlignment = HorizontalAlignment.Center

        Dim titleRow As Row = reviewTable.Rows.Add()
        Dim titleCell As Cell = titleRow.Cells.Add()
        titleCell.Border = New Border()
        titleCell.Border.Background = New Brushes.SolidBrush(New Colors.RgbColor(0, 163, 59))
        Dim titleLabel As New Heading(1)
        titleLabel.Caption = "Review frequencies"
        titleLabel.Padding.Left = 5
        titleLabel.Padding.Right = 5
        Dim titleFragment As New Fragment()
        titleFragment.Text = "#c"
        titleFragment.TextColor = New Colors.RgbColor(255, 255, 255)
        titleLabel.Fragments.Add(titleFragment)
        titleLabel.Bookmark = "#c"
        titleCell.Paragraphs.Add(titleLabel)

        Dim spacerRow As Row = reviewTable.Rows.Add()
        spacerRow.MinHeight = 5

        reviewTable.Rows.Add(BuildReviewFrequencyRow("VA", section.VAReviewFrequency))
        reviewTable.Rows.Add(BuildReviewFrequencyRow("Policy", section.PolicyReviewFrequency))
        reviewTable.Rows.Add(BuildReviewFrequencyRow("Author", section.AuthorReviewFrequency))

        Return reviewTable

    End Function

    Private Function BuildReviewFrequencyRow(ByVal name As String, ByVal frequency As Guid) As Row

        Dim contentRow As Row = New Row
        Dim contentCell As Cell = contentRow.Cells.Add()
        Dim labelParagraph As New TextParagraph
        labelParagraph.Fragments.Add(New Fragment(name.StripHtmlTags & " review frequency"))
        contentCell.Paragraphs.Add(labelParagraph)
        labelParagraph.Padding.Top = 5
        labelParagraph.Padding.Bottom = 5
        labelParagraph.KeepWithNext = True

        Dim valueParagraph As New TextParagraph
        valueParagraph.Border = New Border()
        valueParagraph.Border.Bottom = DefaultPen
        valueParagraph.Border.Top = DefaultPen
        valueParagraph.Border.Left = DefaultPen
        valueParagraph.Border.Right = DefaultPen
        If Not frequency.Equals(Guid.Empty) Then
            Dim listSectionReviewFrequency As SectionReviewFrequencyList = SectionReviewFrequencyList.GetList()

            For Each reviewFrequencyItem As SectionReviewFrequencyList.NameValuePair In listSectionReviewFrequency
                If reviewFrequencyItem.Key = frequency Then
                    valueParagraph.Fragments.Add(New Fragment(reviewFrequencyItem.Value.StripHtmlTags))
                    Exit For
                End If
            Next

        Else
            Dim textFragment As New Fragment("- No data has been entered - ")
            textFragment.TextColor = New Colors.GrayColor(200)
            textFragment.Italic = True
            valueParagraph.Fragments.Add(textFragment)
        End If

        contentCell.Paragraphs.Add(valueParagraph)
        valueParagraph.Padding.Top = 5
        valueParagraph.Padding.Bottom = 5
        valueParagraph.Padding.Left = 5
        valueParagraph.Padding.Right = 5

        Return contentRow

    End Function

    Private Function BuildGuidanceTable(questionGuidance As String, guidanceHeader As String) As Table
        'GS: problem with BR tags and TallPDF, have to remove these.
        questionGuidance = questionGuidance.StripBreakTags

        ' Create table
        Dim guidanceTable As Table = New Table
        guidanceTable.PreferredWidth = PdfSection.PageSize.Width
        guidanceTable.ForceWidth = True
        guidanceTable.ColumnDefinitions.Add(New TableColumnDefinition(30, False, True))
        guidanceTable.ColumnDefinitions.Add(New TableColumnDefinition(85, False, True))
        guidanceTable.Padding.Bottom = 1
        guidanceTable.Padding.Top = 10

        'Guidance Header row
        Dim guidanceHeaderRow As Row = guidanceTable.Rows.Add
        guidanceHeaderRow.Border = New Border()
        guidanceHeaderRow.Border.Top = mGreyPen
        guidanceHeaderRow.Border.Left = mGreyPen
        guidanceHeaderRow.Border.Bottom = mGreyPen
        guidanceHeaderRow.Border.Background = New Brushes.SolidBrush(New Colors.RgbColor(224, 224, 224))

        Dim guidanceRow As Row = guidanceTable.Rows.Add
        guidanceRow.Border = New Border()
        guidanceRow.Border.Top = mGreyPen
        guidanceRow.Border.Left = mGreyPen
        guidanceRow.Border.Bottom = mGreyPen

        'Add header cells
        AddNewCell(guidanceHeader, guidanceHeaderRow, True)
        AddNewCell(questionGuidance, guidanceRow, False)

        PdfSection.Paragraphs.Add(guidanceTable)

        Return guidanceTable
    End Function

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
    Private Function GetHeaderParagraph(ByVal text As String) As XhtmlParagraph

        Dim para As New FormattedXhtmlParagraph(text)
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
    Private Function GetTextDataParagraph(ByVal text As String) As XhtmlParagraph

        Dim para As New FormattedXhtmlParagraph(text.SanitizeHtml)
        para.Border = New Border()
        para.Border.Left = mInvisiblePen
        para.Border.Right = mInvisiblePen
        para.Border.Bottom = mInvisiblePen
        para.Border.Top = mInvisiblePen
        para.Padding.Left = 5
        para.Border.Background = New Brushes.SolidBrush(New Colors.RgbColor(224, 224, 224))
        Return para

    End Function

End Class

