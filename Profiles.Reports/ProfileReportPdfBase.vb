Imports ProfilesLibrary
Imports TallComponents.PDF.Layout
Imports TallComponents.PDF.Layout.Paragraphs

Public MustInherit Class ProfileReportPdfBase
    Inherits PdfBase

    Private mProfileVersionInfo As ProfileVersionInfo
    Private mSectionList As ProfileSectionMetadataList
    Private mProfileVersionSectionList As ProfileVersionSectionList

    Protected ReadOnly Property SectionList() As ProfileSectionMetadataList
        Get
            If mSectionList Is Nothing Then
                mSectionList = ProfileSectionMetadataList.GetProfileSectionMetadataList()
            End If
            Return mSectionList
        End Get
    End Property

    Protected ReadOnly Property ProfileVersionSectionData(ByVal sectionId As Guid) As ProfileVersionSection
        Get
            If mProfileVersionSectionList Is Nothing Then
                mProfileVersionSectionList = ProfileVersionSectionList.GetProfileVersionSectionList(mProfileVersionInfo.Id)
            End If
            Return DirectCast(mProfileVersionSectionList.GetById(sectionId), ProfileVersionSection)
        End Get
    End Property

    Protected ReadOnly Property ProfileVersionSectionData(ByVal sectionNumber As Integer) As ProfileVersionSection
        Get
            Dim sectionId As Guid = SectionList(sectionNumber - 1).Id
            Return ProfileVersionSectionData(sectionId)
        End Get
    End Property

    Protected ReadOnly Property ProfileVersionQuestionData(ByVal sectionNumber As Integer, ByVal questionNumber As Integer) As QuestionBase
        Get
            Dim sectionData As ProfileVersionSection = ProfileVersionSectionData(sectionNumber)
            Return sectionData.Questions.FirstOrDefault(Function(q) q.QuestionNumber = questionNumber)
        End Get
    End Property

    Protected ReadOnly Property ProfileInfo() As ProfileVersionInfo
        Get
            Return mProfileVersionInfo
        End Get
    End Property

    Protected MustOverride ReadOnly Property ProfilePdfTitle() As String

    Public Sub New(ByVal profileVersionId As Guid)
        Me.New(ProfileVersionInfo.GetProfileVersionInfo(profileVersionId))
    End Sub

    Public Sub New(ByVal profileVersion As ProfileVersionInfo)
        mProfileVersionInfo = profileVersion
    End Sub

#Region "Initialize document"

    Protected Overrides Sub SetPdfMetadata()

        MyBase.SetPdfMetadata()
        With PdfDocument.DocumentInfo
            .Subject = mProfileVersionInfo.ToString()
            .Title = String.Format("{0} for {1}", ProfilePdfTitle, mProfileVersionInfo.ToString().StripHtmlTags())
        End With

    End Sub

    Protected Overrides Function CreateSectionHeader() As Paragraph

        Dim headerParagraph As New XhtmlParagraph()
        With headerParagraph
            .HorizontalAlignment = HorizontalAlignment.Center
            .Margin.Top = New Unit(0.5, UnitType.Inch)
            .Text = String.Format(
                "<html style='font-family:Arial,Helvetica'><center>{0} for:<br/>{1}</center></html>",
                ProfilePdfTitle.StripPTags.SanitizeHtml,
                mProfileVersionInfo.FullTitle.StripPTags.SanitizeHtml())
            .Border = New Border()
            .Border.Bottom = DefaultPen
        End With

        Return headerParagraph

    End Function

    Protected Overrides Function CreateSectionFooter() As Paragraph

        Dim pageNumberParagraph As New TextParagraph()
        pageNumberParagraph.HorizontalAlignment = HorizontalAlignment.Center
        Dim pageNumberFragment As New Fragment()
        pageNumberFragment.HasContextFields = True
        pageNumberFragment.Text = "Page #p of #P"
        pageNumberParagraph.Fragments.Add(pageNumberFragment)

        Return pageNumberParagraph

    End Function

    Protected Overrides Sub WriteStamp(ByVal pdfSection As TallComponents.PDF.Layout.Section, ByVal orientation As SectionOrientation)

         If ProfileInfo.Status = ProfileVersionStatus.Draft AndAlso _
            (Not ProfileInfo.IsCurrent OrElse _
             (ProfileInfo.IsCurrent AndAlso _
              Not ProfileInfo.ProfileStatusName.ToLower() = "validation complete")) Then

            CreateStamp(pdfSection, "DRAFT CONTENT", orientation)

        End If

    End Sub

#End Region

    Protected Overrides Function CreateFrontPage() As Section

        Dim frontPageSection As New CrossreferenceSection()

        SetPdfSectionSize(frontPageSection)

        'front page header
        frontPageSection.Header = New Header()
        Dim headerTable As Table = New LogoHeaderTable(Me, frontPageSection.PageSize.Width)
        frontPageSection.Header.Paragraphs.Add(headerTable)

        WriteStamp(frontPageSection, SectionOrientation.Portrait)

        Dim headingTitleParagraph As New XhtmlParagraph()
        headingTitleParagraph.Text = String.Format(
                "<html style='font-family:Arial,Helvetica; font-size: 16px; font-weight: bold'>{0} for: {1}</html>",
                ProfilePdfTitle.SanitizeHtml,
                mProfileVersionInfo.FullTitle.SanitizeHtml())
        frontPageSection.Paragraphs.Add(headingTitleParagraph)

        Dim versionLabel As New TextParagraph()
        frontPageSection.Paragraphs.Add(versionLabel)
        versionLabel.Fragments.Add(New Fragment(String.Format("Version: {0}", mProfileVersionInfo.Version), 12))

        If mProfileVersionInfo.Status = ProfileVersionStatus.Published Then
            Dim publishedDateLabel As New TextParagraph()
            frontPageSection.Paragraphs.Add(publishedDateLabel)
            publishedDateLabel.Fragments.Add(New Fragment(String.Format("Published: {0}", mProfileVersionInfo.EffectiveDateFrom.ToString("d MMMM yyyy")), 12))
            publishedDateLabel.SpacingAfter = 10
        Else
            versionLabel.SpacingAfter = 10
        End If

        'table of contents
        Dim contentsTable As Table = New Table
        contentsTable.ForceWidth = True
        contentsTable.PreferredWidth = 400
        contentsTable.HorizontalAlignment = HorizontalAlignment.Center
        frontPageSection.Paragraphs.Add(contentsTable)

        Dim contentsHeaderRow As Row = contentsTable.Rows.Add
        Dim contentsHeaderCell As Cell = contentsHeaderRow.Cells.Add
        Dim contentsHeaderText As TextParagraph = New TextParagraph
        contentsHeaderCell.Paragraphs.Add(contentsHeaderText)
        contentsHeaderCell.FitToContent = True
        contentsHeaderCell.Margin.Right = 10

        Dim contentsHeaderFragment As New Fragment("Contents")
        contentsHeaderFragment.Bold = True
        contentsHeaderFragment.Underline = True
        contentsHeaderText.SpacingBefore = 6
        contentsHeaderText.Fragments.Add(contentsHeaderFragment)

        AddHandler frontPageSection.ComposeEntry, AddressOf RenderTocEntry

        Dim reportLinkParagraph As New TextParagraph
        reportLinkParagraph.HorizontalAlignment = HorizontalAlignment.Center

        Dim reportLinkFragment1 As New Fragment
        reportLinkFragment1.FontSize -= 2
        reportLinkFragment1.Text = "For internal Defra users other reports are available on: "

        Dim reportLinkFragment2 As New Fragment
        reportLinkFragment2.FontSize -= 2
        reportLinkFragment2.TextColor = New Colors.RgbColor(0, 0, 255)
        reportLinkFragment2.Underline = True
        reportLinkFragment2.Text = InternalHomePageUrlForReports

        reportLinkParagraph.Fragments.Add(reportLinkFragment1)
        reportLinkParagraph.Fragments.Add(reportLinkFragment2)

        Dim externalLinkParagraph As New TextParagraph
        externalLinkParagraph.HorizontalAlignment = HorizontalAlignment.Center

        Dim externalLinkParagraph1 As New TextParagraph
        externalLinkParagraph1.HorizontalAlignment = HorizontalAlignment.Center

        Dim externalLinkFragment3 As New Fragment
        externalLinkFragment3.FontSize -= 2
        externalLinkFragment3.Text = GlobalSettings.PDFQualityStatementText

        externalLinkParagraph1.Fragments.Add(externalLinkFragment3)

        Dim pageNumberParagraph As New TextParagraph
        pageNumberParagraph.HorizontalAlignment = HorizontalAlignment.Center

        Dim pageNumberFragment As New Fragment
        pageNumberFragment.HasContextFields = True
        pageNumberFragment.Text = "Page #p of #P"
        pageNumberParagraph.Fragments.Add(pageNumberFragment)

        frontPageSection.Footer = New Footer()
        frontPageSection.Footer.Paragraphs.Add(reportLinkParagraph)
        frontPageSection.Footer.Paragraphs.Add(externalLinkParagraph)
        frontPageSection.Footer.Paragraphs.Add(externalLinkParagraph1)
        frontPageSection.Footer.Paragraphs.Add(pageNumberParagraph)

        Return frontPageSection

    End Function

    Private Shared Sub RenderTocEntry(ByVal crossRef As CrossreferenceSection, ByVal args As ComposeEntryEventArgs)

        If Not (TypeOf args.CurrentParagraph Is Heading) Then
            Return
        End If

        Dim heading As Heading = DirectCast(args.CurrentParagraph, Heading)
        If heading.Level > 0 OrElse heading.Bookmark = "Front page" Then
            Return
        End If

        Dim contentsTable As Table = DirectCast(crossRef.Paragraphs(crossRef.Paragraphs.Count - 1), Table)
        Dim contentsRow As Row = contentsTable.Rows.Add
        Dim cell As Cell = contentsRow.Cells.Add
        Dim fragment As Fragment
        Dim text As TextParagraph = New TextParagraph
        cell.Paragraphs.Add(text)
        cell.FitToContent = True
        cell.Margin.Right = 10

        fragment = New Fragment("#c")
        fragment.Actions.Add(New Actions.GoToAction(args.CurrentParagraph))
        fragment.PreserveWhiteSpace = True
        text.SpacingBefore = 4
        text.SpacingAfter = 3
        text.Fragments.Add(fragment)

        cell = contentsRow.Cells.Add
        cell.PreferredWidth = 50
        text = New TextParagraph
        text.HorizontalAlignment = HorizontalAlignment.Right
        cell.Paragraphs.Add(text)
        fragment = New Fragment("#p")
        fragment.Actions.Add(New Actions.GoToAction(args.CurrentParagraph))
        fragment.PreserveWhiteSpace = True
        text.SpacingBefore = 4
        text.SpacingAfter = 3
        text.Fragments.Add(fragment)

    End Sub

#Region "BuildQuestionTable and subordinate functions"

    Protected Function BuildQuestionTable(ByVal question As QuestionBase, ByVal sectionNumber As Integer) As Table

        Dim titleRow As Row = New QuestionHeadingRow(question, sectionNumber, 1)
        Dim answersTable As Table = AnswerTable.GetAnswerTable(question, 2, Me)
        Return New QuestionTable(titleRow, String.Empty, answersTable)

    End Function

    Protected Function BuildRenumberedQuestionTable(ByVal sectionNumber As Integer, ByVal questionNumber As Integer, ByVal newNumber As String) As Table

        Dim questionData As QuestionBase = ProfileVersionQuestionData(sectionNumber, questionNumber)
        Dim titleRow As Row = New QuestionHeadingRow(String.Format("{0} {1}", newNumber, questionData.Name), newNumber, 1)
        Dim answersTable As Table = AnswerTable.GetAnswerTable(questionData, 2, Me)
        Return New QuestionTable(titleRow, String.Empty, answersTable)

    End Function

    Protected Function BuildRenumberedControlledQuestionTable(ByVal controllingSectionNumber As Integer, _
                                                               ByVal controllingQuestionNumber As Integer, _
                                                               ByVal trueValue As String, _
                                                               ByVal trueSectionNumber As Integer, _
                                                               ByVal trueQuestionNumber As Integer, _
                                                               ByVal falseSectionNumber As Integer, _
                                                               ByVal falseQuestionNumber As Integer, _
                                                               ByVal newNumber As String) As Table


        Dim controllingQuestion As StandardQuestion = DirectCast(ProfileVersionQuestionData(controllingSectionNumber, controllingQuestionNumber), StandardQuestion)

        Dim titleRow As Row
        Dim answersTable As Table
        Dim questionData As QuestionBase

        If controllingQuestion.FieldValues.Count > 0 AndAlso _
            controllingQuestion.FieldValues(0).ToString(0).ToLower() = trueValue.ToLower() Then

            questionData = ProfileVersionQuestionData(trueSectionNumber, trueQuestionNumber)
            titleRow = New QuestionHeadingRow(String.Format("{0} {1}", newNumber, questionData.Name), newNumber, 1)
            answersTable = AnswerTable.GetAnswerTable(questionData, 2, Me)
        Else
            questionData = ProfileVersionQuestionData(falseSectionNumber, falseQuestionNumber)
            titleRow = New QuestionHeadingRow(String.Format("{0} {1}", newNumber, questionData.Name), newNumber, 1)
            answersTable = AnswerTable.GetAnswerTable(questionData, 2, Me)
        End If

        Return New QuestionTable(titleRow, String.Empty, answersTable)

    End Function

    Protected Function BuildRenamedQuestionTable(ByVal sectionNumber As Integer, ByVal questionNumber As Integer, ByVal newName As String) As Table

        Dim questionData As QuestionBase = ProfileVersionQuestionData(sectionNumber, questionNumber)
        Dim titleRow As Row = New QuestionHeadingRow( _
            String.Format("{0}.{1} {2}", sectionNumber.ToString(), questionData.QuestionNumber.ToString(), newName), _
            String.Format("{0}.{1}", sectionNumber.ToString(), questionData.QuestionNumber.ToString()), _
            1)
        Dim answersTable As Table = AnswerTable.GetAnswerTable(questionData, 2, Me)
        Return New QuestionTable(titleRow, String.Empty, answersTable)

    End Function

     Protected Function BuildRenamedAndRenumberedQuestionTable(ByVal sectionNumber As Integer, ByVal questionNumber As Integer, ByVal newName As String, ByVal newNumber As String) As Table

        Dim questionData As QuestionBase = ProfileVersionQuestionData(sectionNumber, questionNumber)
        Dim titleRow As Row = New QuestionHeadingRow( _
            String.Format("{0} {1}", newNumber, newName), _
            String.Format("{0}", newNumber), _
            1)
        Dim answersTable As Table = AnswerTable.GetAnswerTable(questionData, 2, Me)
        Return New QuestionTable(titleRow, String.Empty, answersTable)

    End Function

    Protected Function BuildRetitledQuestionTable(ByVal sectionNumber As Integer, ByVal questionNumber As Integer, ByVal newTitle As String) As Table

        Return BuildRetitledQuestionTable(sectionNumber, questionNumber, newTitle, 1, String.Empty)

    End Function

    Protected Function BuildRetitledQuestionTable(ByVal sectionNumber As Integer, ByVal questionNumber As Integer, ByVal newTitle As String, ByVal additionalInfo As String) As Table

        Return BuildRetitledQuestionTable(sectionNumber, questionNumber, newTitle, 1, additionalInfo)

    End Function

    Protected Function BuildRetitledQuestionTable(ByVal sectionNumber As Integer, ByVal questionNumber As Integer, ByVal newTitle As String, ByVal headingLevel As Integer) As Table

        Dim questionData As QuestionBase = ProfileVersionQuestionData(sectionNumber, questionNumber)
        Dim titleRow As Row = New QuestionHeadingRow(newTitle, newTitle, headingLevel)
        Dim answersTable As Table = AnswerTable.GetAnswerTable(questionData, headingLevel + 1, Me)
        Return New QuestionTable(titleRow, questionData.Name, answersTable)

    End Function

    Protected Function BuildRetitledQuestionTable(ByVal sectionNumber As Integer, ByVal questionNumber As Integer, ByVal newTitle As String, ByVal headingLevel As Integer, ByVal additionalInfo As String) As Table

        Dim titleRow As Row = New QuestionHeadingRow(newTitle, newTitle, headingLevel)
        Dim answersTable As Table = AnswerTable.GetAnswerTable(ProfileVersionQuestionData(sectionNumber, questionNumber), headingLevel + 1, Me)
        Return New QuestionTable(titleRow, additionalInfo, answersTable)

    End Function

    Protected Function BuildNonTechnicalTitledQuestionTable(ByVal sectionNumber As Integer, ByVal questionNumber As Integer, ByVal newQuestionNumber As String, ByVal headingLevel As Integer) As Table

        Dim questionData As QuestionBase = ProfileVersionQuestionData(sectionNumber, questionNumber)
        Dim newTitle As String = newQuestionNumber & " " & questionData.NonTechnicalName
        Dim titleRow As Row = New QuestionHeadingRow(newTitle, newTitle, headingLevel)
        Dim answersTable As Table = AnswerTable.GetAnswerTable(questionData, headingLevel + 1, Me)
        Return New QuestionTable(titleRow, questionData.Name, answersTable)

    End Function

    Protected Function BuildNonTechnicalTitledQuestionTable(ByVal sectionNumber As Integer, _
                                                            ByVal questionNumber As Integer, _
                                                            ByVal newQuestionNumber As String, _
                                                            ByVal headingLevel As Integer, _
                                                            ByVal additionalInfo As String) As Table

        Dim questionData As QuestionBase = ProfileVersionQuestionData(sectionNumber, questionNumber)
        Dim newTitle As String = newQuestionNumber & " " & questionData.NonTechnicalName
        Dim titleRow As Row = New QuestionHeadingRow(newTitle, newTitle, headingLevel)
        Dim answersTable As Table = AnswerTable.GetAnswerTable(questionData, headingLevel + 1, Me)
        Return New QuestionTable(titleRow, additionalInfo, answersTable)

    End Function


#End Region

End Class


