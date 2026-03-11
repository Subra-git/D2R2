Imports ProfilesLibrary
Imports TallComponents.PDF.Layout
Imports TallComponents.PDF.Layout.Paragraphs
Imports TallComponents.PDF.Layout.Colors
Imports TallComponents.PDF.Layout.Navigation

Public Class SummaryPrioritisationPdf
    Inherits ProfileReportPdfBase

    Protected Overrides ReadOnly Property ProfilePdfTitle() As String
        Get
            Return "Summary prioritisation report"
        End Get
    End Property


    Public Sub New(ByVal profileVersionId As Guid)
        Me.New(ProfileVersionInfo.GetProfileVersionInfo(profileVersionId))
    End Sub

    Public Sub New(ByVal profileVersion As ProfileVersionInfo)
        MyBase.New(profileVersion)
    End Sub

    Protected Overrides Function CreateFrontPage() As Section

        Dim frontPageSection As New Section
        SetPdfSectionSize(frontPageSection)

        If ProfileInfo.Status = ProfileVersionStatus.Draft AndAlso _
           (Not ProfileInfo.IsCurrent OrElse _
            (ProfileInfo.IsCurrent AndAlso _
             Not ProfileInfo.ProfileStatusName.ToLower() = "validation complete")) Then

            CreateStamp(frontPageSection, "DRAFT CONTENT")

        End If

        Dim firstPageArea As New Area(frontPageSection.Margin.Left, frontPageSection.PageSize.Height, frontPageSection.PageSize.Width - frontPageSection.Margin.Left - frontPageSection.Margin.Right, 500)
        frontPageSection.ForegroundAreas.Add(firstPageArea)
        firstPageArea.Middle = False
        firstPageArea.Last = False
        firstPageArea.Paragraphs.Add(CreateSectionHeader())

        Dim subsequentPageArea As New Area(frontPageSection.Margin.Left, frontPageSection.PageSize.Height, frontPageSection.PageSize.Width - frontPageSection.Margin.Left - frontPageSection.Margin.Right, 500)
        frontPageSection.ForegroundAreas.Add(subsequentPageArea)
        subsequentPageArea.First = False
        subsequentPageArea.Paragraphs.Add(CreateSectionHeader())

        frontPageSection.Footer = New Footer()
        Dim sectionFooter As Paragraph = CreateSectionFooter()
        frontPageSection.Footer.Paragraphs.Add(sectionFooter)

        Dim anchorBookmark As New Heading(0)
        anchorBookmark.Bookmark = ProfilePdfTitle
        frontPageSection.Paragraphs.Add(anchorBookmark)

        Dim categoryScoreList As PrioritisationCategoryScoreList = PrioritisationCategoryScoreList.GetList(ProfileInfo.Id)

        If categoryScoreList.Count = 0 Then
            Dim noDataParagraph As New TextParagraph
            frontPageSection.Paragraphs.Add(noDataParagraph)
            noDataParagraph.Margin.Top = 20
            noDataParagraph.Margin.Bottom = 20
            Dim noDataFragment As New Fragment("Prioritisation data has not been generated for this profile version.")
            noDataParagraph.Fragments.Add(noDataFragment)
            noDataFragment.Italic = True
            Return frontPageSection
        End If

        frontPageSection.Paragraphs.Add(BuildRetitledQuestionTable(1, 1, SummaryPrioritisationReportHeadings.Section1Heading))

        frontPageSection.Paragraphs.Add(BuildRetitledQuestionTable(6, 14, SummaryPrioritisationReportHeadings.Section2Heading))
        frontPageSection.Paragraphs.Add(BuildCategoryTable(categoryScoreList, "Public health"))

        frontPageSection.Paragraphs.Add(BuildRetitledQuestionTable(5, 9, SummaryPrioritisationReportHeadings.Section3Heading))
        frontPageSection.Paragraphs.Add(BuildCategoryTable(categoryScoreList, "Welfare"))

        frontPageSection.Paragraphs.Add(BuildRetitledQuestionTable(7, 7, SummaryPrioritisationReportHeadings.Section4Heading))
        frontPageSection.Paragraphs.Add(BuildCategoryTable(categoryScoreList, "Wider society"))

        frontPageSection.Paragraphs.Add(BuildRetitledQuestionTable(13, 11, SummaryPrioritisationReportHeadings.Section5Heading))
        frontPageSection.Paragraphs.Add(BuildCategoryTable(categoryScoreList, "International trade"))

        frontPageSection.Paragraphs.Add(BuildRetitledQuestionTable(3, 20, SummaryPrioritisationReportHeadings.Section6Heading))
        frontPageSection.Paragraphs.Add(BuildCategoryTable(categoryScoreList, "Post mitigation risk"))

        Dim noteParagraph As New TextParagraph
        frontPageSection.Paragraphs.Add(noteParagraph)
        noteParagraph.Margin.Top = 20
        noteParagraph.Margin.Bottom = 20
        Dim noteFragment As New Fragment("The following information is derived from evidence assessed in a standardised way, and is of relevance when considering distribution of funds. However, it is not considered to directly determine the relative importance of animal health issues.")
        noteParagraph.Fragments.Add(noteFragment)
        noteFragment.Italic = True

        'This additional logic is for CR-40. 
        'If the IsVisibleOnSPR report flag is set to false in the PrioritisationCategory table then
        'this section of the SPR will not be shown.
        If categoryScoreList.IsAvailable("Potential to add value") Then

            frontPageSection.Paragraphs.Add(BuildRetitledQuestionTable(14, 1, "Opportunity to enhance risk mitigation and/or understanding"))
            frontPageSection.Paragraphs.Add(BuildCategoryTable(categoryScoreList, "Potential to add value"))

        End If

        frontPageSection.Paragraphs.Add(BuildRetitledQuestionTable(15, 1, SummaryPrioritisationReportHeadings.Section7Heading))
        frontPageSection.Paragraphs.Add(BuildRetitledQuestionTable(7, 8, SummaryPrioritisationReportHeadings.Section8Heading))
        frontPageSection.Paragraphs.Add(BuildRetitledQuestionTable(16, 1, SummaryPrioritisationReportHeadings.Section9Heading))
        frontPageSection.Paragraphs.Add(BuildRetitledQuestionTable(8, 4, SummaryPrioritisationReportHeadings.Section10Heading))

        Return frontPageSection

    End Function

    Protected Overrides Sub BuildDocumentBody()

        Dim categoryScoreList As PrioritisationCategoryScoreList = PrioritisationCategoryScoreList.GetList(ProfileInfo.Id)
        Dim criterionScoreList As PrioritisationCriterionScoreList = PrioritisationCriterionScoreList.GetList(ProfileInfo.Id)
        Dim prioritisedSpecies As PrioritisedSpeciesList = PrioritisedSpeciesList.GetList(ProfileInfo.Id)
        Dim profiledSpecies As New List(Of PrioritisedSpeciesList.NameValuePair)()

        For Each species As PrioritisedSpeciesList.NameValuePair In prioritisedSpecies
            If IsProfiledSpecies(species.Key, categoryScoreList) Then
                profiledSpecies.Add(species)
            End If
        Next

        Dim count As Integer = 0
        While count < profiledSpecies.Count
            Dim sectionHeading As New XhtmlParagraph()
            'Dim sectionHeading As New TextParagraph()
            sectionHeading.SpacingBefore = 0
            sectionHeading.SpacingAfter = 0
            Dim headingFragment As Fragment
            If profiledSpecies.Count - count >= 2 Then
                sectionHeading.Caption = profiledSpecies(count).Value & " and " & profiledSpecies(count + 1).Value
                headingFragment = New Fragment(profiledSpecies(count).Value & " and " & profiledSpecies(count + 1).Value)
            Else
                sectionHeading.Caption = profiledSpecies(count).Value
                headingFragment = New Fragment(profiledSpecies(count).Value)
            End If
            'headingFragment.Bold = True
            Dim cssString As String = "<style>* {font-family:Arial,Helvetica;}</style>"
            sectionHeading.Text = cssString & "<strong>" & headingFragment.Text & "</strong>"
            If profiledSpecies.Count - count >= 2 Then
                PdfSection.Paragraphs.Add(BuildDocumentSectionHeader("Detailed criteria scores", "Detailed criteria scores: " & profiledSpecies(count).Value & "/" & profiledSpecies(count + 1).Value))
                PdfSection.Paragraphs.Add(sectionHeading)
                PdfSection.Paragraphs.Add(BuildCriterionTable(categoryScoreList, criterionScoreList, profiledSpecies(count), profiledSpecies(count + 1)))
                count += 2
            Else
                PdfSection.Paragraphs.Add(BuildDocumentSectionHeader("Detailed criteria scores", "Detailed criteria scores: " & profiledSpecies(count).Value))
                PdfSection.Paragraphs.Add(sectionHeading)
                PdfSection.Paragraphs.Add(BuildCriterionTable(categoryScoreList, criterionScoreList, profiledSpecies(count).Key))
                count += 1
            End If

        End While

        BuildWarningTextSection()

    End Sub

    'because the PrioritisedSpeciesList doesn't expose an IsProfiledSpecies property, use the information in the 
    'PrioritisationCategoryScoreList
    Private Function IsProfiledSpecies(ByVal speciesId As Guid, ByVal categoryScoreList As PrioritisationCategoryScoreList) As Boolean

        For Each currentCategory As PrioritisationCategoryScore In categoryScoreList
            If currentCategory.SpeciesId.Equals(speciesId) Then
                Return currentCategory.IsProfiledSpecies
            End If
        Next
        Return False

    End Function

    Private Function BuildCategoryTable(ByVal categoryScoreList As PrioritisationCategoryScoreList, ByVal categoryName As String) As Table

        Dim currentCategoryRow As Row = Nothing
        Dim speciesNameCell As Cell = Nothing
        Dim scoreCell As Cell = Nothing

        Dim greyPen As New Pens.Pen(New Colors.GrayColor(210))

        Dim categoryTable As New Table
        categoryTable.PreferredWidth = 500
        categoryTable.HorizontalAlignment = HorizontalAlignment.Center
        categoryTable.ForceWidth = True
        categoryTable.SpacingBefore = 5
        categoryTable.ColumnDefinitions.Add(New TableColumnDefinition())
        categoryTable.ColumnDefinitions.Add(New TableColumnDefinition(150, False, True)) 'fix the second column width
        For Each currentCategory As PrioritisationCategoryScore In categoryScoreList

            If currentCategory.PrioritisationCategoryName.ToLower() <> categoryName.ToLower() Then
                Continue For
            End If

            If Not currentCategory.IsProfiledSpecies Then
                Continue For
            End If

            currentCategoryRow = categoryTable.Rows.Add()
            currentCategoryRow.Border = New Border()
            currentCategoryRow.Border.Top = greyPen
            currentCategoryRow.Border.Left = greyPen
            currentCategoryRow.Border.Right = greyPen
            currentCategoryRow.Padding.Top = 5
            currentCategoryRow.Padding.Bottom = 5

            speciesNameCell = currentCategoryRow.Cells.Add()
            scoreCell = currentCategoryRow.Cells.Add()

            Dim speciesNameParagraph As New FormattedXhtmlParagraph(currentCategory.SpeciesName)
            speciesNameParagraph.Padding.Left = 5
            speciesNameParagraph.Padding.Right = 5
            speciesNameCell.Paragraphs.Add(speciesNameParagraph)

            Dim scoreParagraph As New TextParagraph()
            scoreParagraph.Padding.Left = 5
            scoreParagraph.Padding.Right = 5
            scoreCell.Paragraphs.Add(scoreParagraph)
            Dim scoreFragment As New Fragment
            If currentCategory.DataIncomplete Then
                scoreFragment.Text = "- Data incomplete - "
                scoreFragment.TextColor = New Colors.GrayColor(200)
                scoreFragment.Italic = True
            Else
                scoreFragment.Text = currentCategory.Rank.ToString()
            End If
            scoreParagraph.Fragments.Add(scoreFragment)
        Next

        If currentCategoryRow IsNot Nothing Then
            currentCategoryRow.Border.Bottom = greyPen
        End If

        Return categoryTable

    End Function

    Private Function BuildCriterionTable(ByVal categoryScoreList As PrioritisationCategoryScoreList, ByVal criterionScoreList As PrioritisationCriterionScoreList, ByVal speciesId As Guid) As Table

        Dim currentCategoryId As New Guid
        Dim currentCriterionId As New Guid
        Dim currentCriterionRow As Row = Nothing
        Dim criterionNameCell As Cell = Nothing
        Dim speciesNameCell As Cell = Nothing
        Dim valueCell As Cell = Nothing

        Dim criterionTable As New Table
        criterionTable.PreferredWidth = 550
        criterionTable.ForceWidth = True
        criterionTable.SpacingBefore = 10
        criterionTable.ColumnDefinitions.Add(New TableColumnDefinition())
        criterionTable.ColumnDefinitions.Add(New TableColumnDefinition(150, False, True))

        For Each currentCriterion As PrioritisationCriterionScore In criterionScoreList

            If Not currentCriterion.SpeciesId.Equals(speciesId) Then
                Continue For
            End If

            If Not currentCategoryId.Equals(currentCriterion.PrioritisationCategoryId) Then

                currentCategoryId = currentCriterion.PrioritisationCategoryId

                Dim titleRow As Row = criterionTable.Rows.Add()
                titleRow.Border = New Border()
                titleRow.Border.Top = DefaultPen
                titleRow.Border.Left = DefaultPen
                titleRow.Border.Right = DefaultPen
                titleRow.Border.Background = New Brushes.SolidBrush(GetCategoryBackColor(currentCriterion.PrioritisationCategoryName))

                Dim titleCell As Cell = titleRow.Cells.Add()
                Dim titleLabel As New XhtmlParagraph
                titleLabel.Padding.Left = 5
                titleLabel.Padding.Right = 5
                Dim strColor As String = GetCategoryForeColor(currentCriterion.PrioritisationCategoryName.StripHtmlTags).Convert.Name
                Dim titleLabelText As String = New FormattedHtmlFragment(currentCriterion.PrioritisationCategoryDisplayName, strColor).Text
                titleLabel.Text = titleLabelText
                titleCell.Paragraphs.Add(titleLabel)

                Dim rankCell As Cell = titleRow.Cells.Add()
                Dim rankLabel As New TextParagraph
                Dim rankFragment As New Fragment()
                Dim category As PrioritisationCategoryScore = GetCategory(categoryScoreList, currentCriterion.PrioritisationCategoryId, currentCriterion.SpeciesId)
                If category.DataIncomplete Then
                    rankFragment.Text = " - Data incomplete - "
                    rankFragment.Italic = True
                Else
                    rankFragment.Text = category.Rank.ToString()
                End If
                rankFragment.TextColor = GetCategoryForeColor(currentCriterion.PrioritisationCategoryName.StripHtmlTags)
                rankLabel.Fragments.Add(rankFragment)
                rankCell.Paragraphs.Add(rankLabel)
            End If

            If Not currentCriterionId.Equals(currentCriterion.PrioritisationCriterionId) Then
                currentCriterionId = currentCriterion.PrioritisationCriterionId
                currentCriterionRow = criterionTable.Rows.Add()
                currentCriterionRow.Border = New Border()
                currentCriterionRow.Border.Top = DefaultPen
                currentCriterionRow.Border.Left = DefaultPen
                currentCriterionRow.Border.Right = DefaultPen
                currentCriterionRow.Padding.Top = 5
                currentCriterionRow.Padding.Bottom = 5

                criterionNameCell = currentCriterionRow.Cells.Add()
                valueCell = currentCriterionRow.Cells.Add()

                Dim criterionNameParagraph As New XhtmlParagraph()
                criterionNameParagraph.Padding.Left = 5
                criterionNameParagraph.Padding.Right = 5
                criterionNameCell.Paragraphs.Add(criterionNameParagraph)
                criterionNameParagraph.Text = New FormattedHtmlFragment(currentCriterion.PrioritisationCriterionName).Text
            End If

            Dim valueParagraph As New XhtmlParagraph()
            valueParagraph.Padding.Left = 5
            valueParagraph.Padding.Right = 5
            valueCell.Paragraphs.Add(valueParagraph)
            If currentCriterion.DataIncomplete Then
                valueParagraph.Text = New FormattedHtmlFragment("- Data incomplete - ", "#C8C8C8", True).Text
            ElseIf currentCriterion.IrrelevantCategory Then
                valueParagraph.Text = New FormattedHtmlFragment("- Irrelevant category - ", "#C8C8C8", True).Text
            Else
                valueParagraph.Text = New FormattedHtmlFragment(currentCriterion.CriterionValue).Text
            End If

        Next

        currentCriterionRow.Border.Bottom = DefaultPen

        Return criterionTable

    End Function

    Private Function BuildCriterionTable(ByVal categoryScoreList As PrioritisationCategoryScoreList, ByVal criterionScoreList As PrioritisationCriterionScoreList, ByVal species1 As PrioritisedSpeciesList.NameValuePair, ByVal species2 As PrioritisedSpeciesList.NameValuePair) As Table

        Dim currentCategoryId As New Guid
        Dim currentCriterionId As New Guid
        Dim currentCriterionRow As Row = Nothing
        Dim criterionNameCell As Cell = Nothing
        Dim speciesNameCell As Cell = Nothing
        Dim valueCell1 As Cell = Nothing
        Dim valueCell2 As Cell = Nothing
        Dim speciesId1 As Guid = species1.Key
        Dim speciesId2 As Guid = species2.Key

        Dim criterionTable As New Table
        criterionTable.PreferredWidth = 550
        criterionTable.ForceWidth = True
        criterionTable.SpacingBefore = 10
        criterionTable.ColumnDefinitions.Add(New TableColumnDefinition())
        criterionTable.ColumnDefinitions.Add(New TableColumnDefinition(120, False, True))
        criterionTable.ColumnDefinitions.Add(New TableColumnDefinition(120, False, True))

        Dim preTitleRow As Row = criterionTable.Rows.Add()
        preTitleRow.Cells.Add(New Cell())
        Dim species1Cell As Cell = preTitleRow.Cells.Add()
        Dim species2Cell As Cell = preTitleRow.Cells.Add()
        Dim species1Paragraph As New XhtmlParagraph()
        Dim species2Paragraph As New XhtmlParagraph()
        species1Cell.Paragraphs.Add(species1Paragraph)
        species2Cell.Paragraphs.Add(species2Paragraph)
        species1Paragraph.Text = species1.Value
        species2Paragraph.Text = species2.Value


        For Each currentCriterion As PrioritisationCriterionScore In criterionScoreList

            If Not currentCriterion.SpeciesId.Equals(speciesId1) Then
                Continue For
            End If

            If Not currentCategoryId.Equals(currentCriterion.PrioritisationCategoryId) Then

                currentCategoryId = currentCriterion.PrioritisationCategoryId

                Dim titleRow As Row = criterionTable.Rows.Add()
                titleRow.Border = New Border()
                titleRow.Border.Top = DefaultPen
                titleRow.Border.Left = DefaultPen
                titleRow.Border.Right = DefaultPen
                titleRow.Border.Background = New Brushes.SolidBrush(GetCategoryBackColor(currentCriterion.PrioritisationCategoryName.StripHtmlTags))

                Dim titleCell As Cell = titleRow.Cells.Add()
                Dim titleLabel As New XhtmlParagraph
                titleLabel.Padding.Left = 5
                titleLabel.Padding.Right = 5

                Dim strColor As String = GetCategoryForeColor(currentCriterion.PrioritisationCategoryName.StripHtmlTags).Convert.Name
                Dim titleLabelText As String = New FormattedHtmlFragment(currentCriterion.PrioritisationCategoryDisplayName, strColor).Text
                titleLabel.Text = titleLabelText
                titleCell.Paragraphs.Add(titleLabel)

                Dim rankCell1 As Cell = titleRow.Cells.Add()
                Dim rankLabel1 As New TextParagraph
                Dim rankFragment1 As New Fragment()
                Dim category1 As PrioritisationCategoryScore = GetCategory(categoryScoreList, currentCriterion.PrioritisationCategoryId, currentCriterion.SpeciesId)
                If category1.DataIncomplete Then
                    rankFragment1.Text = " - Data incomplete - "
                    rankFragment1.Italic = True
                Else
                    rankFragment1.Text = category1.Rank.ToString()
                End If
                rankFragment1.TextColor = GetCategoryForeColor(currentCriterion.PrioritisationCategoryName.StripHtmlTags)
                rankLabel1.Fragments.Add(rankFragment1)
                rankCell1.Paragraphs.Add(rankLabel1)

                Dim rankCell2 As Cell = titleRow.Cells.Add()
                Dim rankLabel2 As New TextParagraph()
                Dim rankFragment2 As New Fragment()
                Dim category2 As PrioritisationCategoryScore = GetCategory(categoryScoreList, currentCriterion.PrioritisationCategoryId, speciesId2)
                If category2.DataIncomplete Then
                    rankFragment2.Text = " - Data incomplete - "
                    rankFragment2.Italic = True
                Else
                    rankFragment2.Text = category2.Rank.ToString()
                End If
                rankFragment2.TextColor = GetCategoryForeColor(currentCriterion.PrioritisationCategoryName.StripHtmlTags)
                rankLabel2.Fragments.Add(rankFragment2)
                rankCell2.Paragraphs.Add(rankLabel2)
            End If

            If Not currentCriterionId.Equals(currentCriterion.PrioritisationCriterionId) Then
                currentCriterionId = currentCriterion.PrioritisationCriterionId
                currentCriterionRow = criterionTable.Rows.Add()
                currentCriterionRow.Border = New Border()
                currentCriterionRow.Border.Top = DefaultPen
                currentCriterionRow.Border.Left = DefaultPen
                currentCriterionRow.Border.Right = DefaultPen
                currentCriterionRow.Padding.Top = 5
                currentCriterionRow.Padding.Bottom = 5

                criterionNameCell = currentCriterionRow.Cells.Add()
                valueCell1 = currentCriterionRow.Cells.Add()
                valueCell2 = currentCriterionRow.Cells.Add()

                Dim criterionNameParagraph As New XhtmlParagraph()
                criterionNameParagraph.Padding.Left = 5
                criterionNameParagraph.Padding.Right = 5
                criterionNameCell.Paragraphs.Add(criterionNameParagraph)
                criterionNameParagraph.Text = New FormattedHtmlFragment(currentCriterion.PrioritisationCriterionName).Text
            End If

            Dim valueParagraph1 As New XhtmlParagraph()
            valueParagraph1.Padding.Left = 5
            valueParagraph1.Padding.Right = 5
            valueCell1.Paragraphs.Add(valueParagraph1)
            If currentCriterion.DataIncomplete Then
                valueParagraph1.Text = New FormattedHtmlFragment("- Data incomplete - ", "#C8C8C8", True).Text
            ElseIf currentCriterion.IrrelevantCategory Then
                valueParagraph1.Text = New FormattedHtmlFragment("- Irrelevant category - ", "#C8C8C8", True).Text
            Else
                valueParagraph1.Text = New FormattedHtmlFragment(currentCriterion.CriterionValue).Text
            End If

            Dim valueParagraph2 As New XhtmlParagraph()
            valueParagraph2.Padding.Left = 5
            valueParagraph2.Padding.Right = 5
            valueCell2.Paragraphs.Add(valueParagraph2)
            Dim currentCriterion2 As PrioritisationCriterionScore = Nothing
            For Each crit As PrioritisationCriterionScore In criterionScoreList
                If crit.PrioritisationCriterionId = currentCriterionId And crit.SpeciesId = speciesId2 Then
                    currentCriterion2 = crit
                    Exit For
                End If
            Next
            If currentCriterion2.DataIncomplete Then
                valueParagraph2.Text = New FormattedHtmlFragment("- Irrelevant category - ", New Colors.GrayColor(200).Name, True).Text
            ElseIf currentCriterion2.IrrelevantCategory Then
                valueParagraph2.Text = New FormattedHtmlFragment("- Irrelevant category - ", "#C8C8C8", True).Text
            Else
                valueParagraph2.Text = New FormattedHtmlFragment(currentCriterion2.CriterionValue).Text
            End If

        Next

        currentCriterionRow.Border.Bottom = DefaultPen

        Return criterionTable

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

    Private Function GetCategory(ByVal categoryScoreList As PrioritisationCategoryScoreList, ByVal prioritisationCategoryId As Guid, ByVal speciesId As Guid) As PrioritisationCategoryScore

        For Each categoryScore As PrioritisationCategoryScore In categoryScoreList
            If categoryScore.PrioritisationCategoryId.Equals(prioritisationCategoryId) AndAlso _
                categoryScore.SpeciesId.Equals(speciesId) Then
                Return categoryScore
            End If
        Next
        Return Nothing

    End Function

    Protected Overrides Function CreateSectionHeader() As Paragraph
        Dim htmlTitle As XhtmlParagraph = New XhtmlParagraph()

        htmlTitle.Text = $"<html style='font-family:Arial,Helvetica;'>{ProfilePdfTitle.StripPTags.SanitizeHtml} for:<br/>{ProfileInfo.FullTitle.StripPTags.SanitizeHtml}</html>"

        Dim pars As New List(Of Paragraph)()
        pars.Add(htmlTitle)

        Dim headerParagraph As Paragraph = New LogoHeaderTable(Me, PageSize.A4.Width, pars)
        Return headerParagraph

    End Function

    Protected Overrides Function CreateSectionFooter() As Paragraph

        Dim sectionTable As New Table
        sectionTable.ForceWidth = True
        sectionTable.PreferredWidth = PageSize.A4.Width

        Dim reportFooterTitleRow As New Row
        Dim footerLinkRow As New Row
        Dim pageNumberRow As New Row

        Dim reportFooterTitleCell As New Cell
        Dim footerLinkCell As New Cell
        Dim pageNumberCell As New Cell

        reportFooterTitleRow.Cells.Add(reportFooterTitleCell)
        footerLinkRow.Cells.Add(footerLinkCell)
        pageNumberRow.Cells.Add(pageNumberCell)

        sectionTable.Rows.Add(reportFooterTitleRow)
        sectionTable.Rows.Add(footerLinkRow)
        sectionTable.Rows.Add(pageNumberRow)

        Dim reportFooterTitleParagraph As New XhtmlParagraph()
        Dim reportFooterTitleFragment As New Fragment()
        reportFooterTitleParagraph.HorizontalAlignment = HorizontalAlignment.Center
        Dim strHtmlFooter As String = ""
        strHtmlFooter &= "<span style='font-family:Arial,Helvetica; font-size: " & reportFooterTitleFragment.FontSize - 2 & "'>"
        strHtmlFooter &= String.Format(
            "{0} for {1} v{2}", ProfilePdfTitle, ProfileInfo.FullTitle, ProfileInfo.Version)
        If ProfileInfo.Status = ProfileVersionStatus.Published Then
            strHtmlFooter &= String.Format(" Published: {0}", ProfileInfo.EffectiveDateFrom.ToString("d MMMM yyyy"))
        End If
        strHtmlFooter &= "</span>"
        reportFooterTitleParagraph.Text = strHtmlFooter

        Dim reportLinkParagraph As New TextParagraph
        reportLinkParagraph.HorizontalAlignment = HorizontalAlignment.Center

        Dim reportLinkFragment1 As New Fragment
        reportLinkFragment1.Text = "For internal Defra users other reports are available on: "
        reportLinkFragment1.FontSize -= 2

        Dim reportLinkFragment2 As New Fragment
        reportLinkFragment2.TextColor = New Colors.RgbColor(0, 0, 255)
        reportLinkFragment2.Underline = True
        reportLinkFragment2.FontSize -= 2
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

        Dim pageNumberParagraph As New TextParagraph()
        pageNumberParagraph.HorizontalAlignment = HorizontalAlignment.Center
        Dim pageNumberFragment As New Fragment()
        pageNumberFragment.HasContextFields = True
        pageNumberFragment.FontSize -= 2
        pageNumberFragment.Text = "Page #p of #P"
        pageNumberParagraph.Fragments.Add(pageNumberFragment)

        reportFooterTitleCell.Paragraphs.Add(reportFooterTitleParagraph)
        footerLinkCell.Paragraphs.Add(reportLinkParagraph)
        footerLinkCell.Paragraphs.Add(externalLinkParagraph)
        footerLinkCell.Paragraphs.Add(externalLinkParagraph1)
        pageNumberCell.Paragraphs.Add(pageNumberParagraph)

        Return sectionTable

    End Function

End Class
