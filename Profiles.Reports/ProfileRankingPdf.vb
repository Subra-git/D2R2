Imports ProfilesLibrary
Imports System.Web.UI.DataVisualization.Charting
Imports System.IO
Imports TallComponents.PDF.Layout
Imports TallComponents.PDF.Layout.Paragraphs
Imports TallComponents.PDF.Layout.Navigation
Imports TallComponents.PDF.Layout.Fonts
Imports System.Drawing
Imports System.Text
Imports TallComponents.PDF.Layout.Shapes


Public Class ProfileRankingReportPdf
    Inherits PdfBase

    Public Enum ProfileRankingReportType As Integer
        All
        Fish
        Terrestrial
    End Enum

    Public mReportFilterType As String
    Private mReportType As ProfileRankingReportType

    Public Property ReportType() As ProfileRankingReportType
        Get
            Return mReportType
        End Get
        Set(ByVal value As ProfileRankingReportType)
            mReportType = value
        End Set
    End Property

    Public Property NameOfFilter() As String
        Get
            Return mReportFilterType
        End Get
        Set(ByVal value As String)
            mReportFilterType = value
        End Set
    End Property

    Private mRankProfileList As RankProfileInfoList
    Public mTitle As String = "RFI scoring report. "

    Private Function GetBlankLine() As Paragraphs.XhtmlParagraph
        Dim blankLine As New Paragraphs.XhtmlParagraph
        blankLine.Text = "<span style='font-size: 1'><br /></span>"
        Return blankLine
    End Function

    Private Function GetBlankRow() As Paragraphs.Row
        Dim row As New Paragraphs.Row
        Dim cell As New Paragraphs.Cell
        cell.Paragraphs.Add(GetBlankLine())
        row.Cells.Add(cell)
        Return row
    End Function

    Private Function GetFrontPageWarningText() As Paragraphs.Table

        Dim newTable As New Paragraphs.Table
        newTable.ForceWidth = True
        newTable.PreferredWidth = 1000

        Dim row1 As New Paragraphs.Row
        Dim cell1 As New Paragraphs.Cell
        Dim frag1 As New Fragment
        Dim frag2 As New Fragment
        Dim frag3 As New Fragment
        Dim parg1 As New TextParagraph
        parg1.HorizontalAlignment = HorizontalAlignment.Center

        frag1.Text = "PLEASE NOTE: SCORES ARE "
        frag1.Font = Fonts.Font.Helvetica
        frag1.FontSize = 9

        frag2.Text = "NOT "
        frag2.Font = Fonts.Font.Helvetica
        frag2.FontSize = 9
        frag2.Underline = True

        frag3.Text = "COMPARABLE ACROSS TABLES (BETWEEN RFI's) WHICH IS WHY RANKINGS ARE IN BOLD"
        frag3.Font = Fonts.Font.Helvetica
        frag3.FontSize = 9

        parg1.Fragments.Add(frag1)
        parg1.Fragments.Add(frag2)
        parg1.Fragments.Add(frag3)

        cell1.Paragraphs.Add(parg1)
        row1.Cells.Add(cell1)
        newTable.Rows.Add(row1)

        Return newTable

    End Function

    Private Function GetFrontPageText() As Paragraphs.Table

        Dim newTable As New Paragraphs.Table
        newTable.ForceWidth = True
        newTable.PreferredWidth = 1000

        Dim row1 As New Paragraphs.Row
        Dim cell1 As New Paragraphs.Cell
        Dim frag1a As New Fragment
        Dim frag1b As New Fragment
        Dim parg1 As New TextParagraph
        Dim sb1 As New StringBuilder

        frag1a.Text = "Top 25 Disease Ranking: "
        frag1a.FontSize = 9
        frag1a.Bold = True
        frag1a.Underline = True

        sb1.Append("Summary table of the top scoring diseases ")
        sb1.Append("for exotics and endemics, combined to show their overall ranking ")
        sb1.Append("for each RFI. ")
        sb1.Append("Post mitigation risk (score shown in ‘PMR’ columns on this page) ")
        sb1.Append("is not ranked separately as diseases are only important to Defra if they have a significant impact. ")
        sb1.Append("Note: *=Disease profiles awaiting validation.")
        frag1b.Text = sb1.ToString()
        frag1b.Font = Fonts.Font.Helvetica
        frag1b.FontSize = 9
        parg1.Fragments.Add(frag1a)
        parg1.Fragments.Add(frag1b)
        cell1.Paragraphs.Add(parg1)

        row1.Cells.Add(cell1)

        Dim cell2 As New Cell
        cell2.PreferredWidth = 80
        cell2.Fixed = True
        cell2.Paragraphs.Add(GetFrontPageKey())
        row1.Cells.Add(cell2)
        row1.Margin.Top = 20
        newTable.Rows.Add(row1)

        Return newTable

    End Function

    Private Function GetFrontPageKey() As Paragraphs.Table

        Dim newTable As New Paragraphs.Table
        Dim row1 As New Paragraphs.Row
        Dim row2 As New Paragraphs.Row
        Dim row3 As New Paragraphs.Row

        row1.Cells.Add(GetCell("Key", True, Color.White, 8, 75))
        row2.Cells.Add(GetCell("EXOTIC DISEASE", False, Color.FromArgb(204, 204, 204), 8, 50))
        row3.Cells.Add(GetCell("Endemic disease", False, Color.White, 8, 50))

        newTable.Rows.Add(row1)
        newTable.Rows.Add(row2)
        newTable.Rows.Add(row3)

        Return newTable

    End Function

    Protected Overrides Function CreateFrontPage() As TallComponents.PDF.Layout.Section

        Select Case ReportType
            Case ProfileRankingReportType.All
                'NameOfFilter = mReportFilterType
                mRankProfileList = RankProfileInfoList.GetRankProfileInfoListWithFilter(mReportFilterType)
            Case ProfileRankingReportType.Fish
                mRankProfileList = RankProfileInfoList.GetFishRankProfileInfoList()
            Case ProfileRankingReportType.Terrestrial
                mRankProfileList = RankProfileInfoList.GetTerrestrialProfileInfoList()
            Case Else
                Throw New Exception("Invalid Report Type.")
        End Select

        Dim frontSection As New Section
        SetPdfSectionSize(frontSection, SectionOrientation.Landscape)

        Dim firstPageArea As New Area(frontSection.Margin.Left, frontSection.PageSize.Height, frontSection.PageSize.Width - frontSection.Margin.Left - frontSection.Margin.Right, frontSection.PageSize.Height)
        'Dim title As String = "Diseases ranked by impact (or potential impact if exotic) on each of the four reasons for government intervention"
        Dim title As String = "Issues ranked by impact on each of the four reasons for government intervention for " + If(ReportType.ToString() = ProfileRankingReportType.Fish.ToString(), "Aquatic Diseases", If(ReportType.ToString() = ProfileRankingReportType.Terrestrial.ToString(), "Terrestrial Diseases", If(ReportType.ToString() = ProfileRankingReportType.All.ToString(), mReportFilterType, "")))

        If (ReportType.ToString() <> "") Then
            mTitle = "RFI scoring report for " + If(ReportType.ToString() = ProfileRankingReportType.Fish.ToString(), "Aquatic", If(ReportType.ToString() = ProfileRankingReportType.Terrestrial.ToString(), "Terrestrial", If(ReportType.ToString() = ProfileRankingReportType.All.ToString(), mReportFilterType, ""))) + "."
        End If

        Dim subtitle As String = "This report presents a table of rankings for each reason for intervention (RFI) for diseases both exotic (giving anticipated potential impact should disease reach GB) and endemic to the UK with graphical representations on the following pages."

        firstPageArea.Paragraphs.Add(New LogoHeaderTable(Me, frontSection.PageSize.Width, title, subtitle))
        frontSection.ForegroundAreas.Add(firstPageArea)
        frontSection.Paragraphs.Add(GetFrontPageText())
        frontSection.Paragraphs.Add(GetFrontPageWarningText())
        frontSection.Paragraphs.Add(GetBlankLine())
        frontSection.Paragraphs.Add(GetContainerTable(mRankProfileList))

        frontSection.Footer = New Footer()
        Dim sectionFooter As Paragraph = CreateSectionFooter(SectionOrientation.Landscape)
        frontSection.Footer.Paragraphs.Add(sectionFooter)

        frontSection.Margin.Bottom = 35

        Return frontSection

    End Function

    Private Function GetChunkedDataLists(ByVal dataList As List(Of RankProfileInfo), ByVal chunkSize As Integer) As List(Of List(Of RankProfileInfo))
        ' returns a list of lists

        Dim listOfLists As New List(Of List(Of RankProfileInfo))

        Dim numberOfLists As Integer = CInt(Math.Ceiling(dataList.Count / chunkSize))

        For count As Integer = 1 To numberOfLists

            Dim endIndex As Integer = dataList.Count - 1 - ((count - 1) * chunkSize)
            Dim startIndex As Integer = endIndex - chunkSize

            If startIndex < 0 Then
                startIndex = 0
            End If

            Dim newInnerList As List(Of RankProfileInfo) = GetSubsetList(dataList, startIndex, endIndex)
            listOfLists.Add(newInnerList)

        Next

        Return listOfLists

    End Function

    Private Function GetSubsetList(ByVal dataList As List(Of RankProfileInfo), _
                                   ByVal startIndex As Integer, _
                                   ByVal endIndex As Integer) As List(Of RankProfileInfo)

        Dim newList As New List(Of RankProfileInfo)

        For index As Integer = startIndex To endIndex
            newList.Add(dataList(index))
        Next

        Return newList

    End Function

    Protected Overrides Sub BuildDocumentBody()

        Dim graphParmsList As New List(Of GraphParameters)
        graphParmsList.Add(New GraphParameters(True, RankCategory.Public_Health, ComponentModel.ListSortDirection.Ascending))
        graphParmsList.Add(New GraphParameters(False, RankCategory.Public_Health, ComponentModel.ListSortDirection.Ascending))
        graphParmsList.Add(New GraphParameters(True, RankCategory.Animal_Welfare, ComponentModel.ListSortDirection.Ascending))
        graphParmsList.Add(New GraphParameters(False, RankCategory.Animal_Welfare, ComponentModel.ListSortDirection.Ascending))
        graphParmsList.Add(New GraphParameters(True, RankCategory.Wider_Society, ComponentModel.ListSortDirection.Ascending))
        graphParmsList.Add(New GraphParameters(False, RankCategory.Wider_Society, ComponentModel.ListSortDirection.Ascending))
        graphParmsList.Add(New GraphParameters(True, RankCategory.International_Trade, ComponentModel.ListSortDirection.Ascending))
        graphParmsList.Add(New GraphParameters(False, RankCategory.International_Trade, ComponentModel.ListSortDirection.Ascending))

        Dim filteredList1 As List(Of RankProfileInfo)
        Dim filteredList2 As List(Of RankProfileInfo)
        For count As Integer = 0 To graphParmsList.Count - 1 Step 2

            filteredList1 = mRankProfileList.GetFilteredSortedList(graphParmsList(count).IsExotic, _
                                                                   graphParmsList(count).Category, _
                                                                   False, _
                                                                   True)
            filteredList1 = RankProfileInfoList.FilterDiseasesWithNoRfiImpact(filteredList1, graphParmsList(count).Category)


            Dim yMaxLeft As Double

            If filteredList1.Count > 0 Then
                yMaxLeft = Math.Round((RankProfileInfoList.GetMaxTotalRank(filteredList1) + 50) / 50) * 50
            End If

            filteredList2 = mRankProfileList.GetFilteredSortedList(graphParmsList(count + 1).IsExotic, _
                                                                   graphParmsList(count + 1).Category, _
                                                                   False, _
                                                                   True)
            filteredList2 = RankProfileInfoList.FilterDiseasesWithNoRfiImpact(filteredList2, graphParmsList(count).Category)

            Dim yMaxRight As Double

            If filteredList2.Count > 0 Then
                yMaxRight = Math.Round((RankProfileInfoList.GetMaxTotalRank(filteredList2) + 50) / 50) * 50
            End If


            Dim exoticListOfLists As List(Of List(Of RankProfileInfo)) = GetChunkedDataLists(filteredList1, 49)
            Dim endemicListOfLists As List(Of List(Of RankProfileInfo)) = GetChunkedDataLists(filteredList2, 49)

            Dim title1 As String
            Dim title2 As String

            title1 = graphParmsList(count).Title
            title2 = graphParmsList(count + 1).Title

            Dim currentExoticList As List(Of RankProfileInfo) = Nothing
            Dim currentEndemicList As List(Of RankProfileInfo) = Nothing

            If exoticListOfLists.Count > 0 Then
                currentExoticList = exoticListOfLists(0)
            Else
                currentExoticList = New List(Of RankProfileInfo)
            End If

            If endemicListOfLists.Count > 0 Then
                currentEndemicList = endemicListOfLists(0)
            Else
                currentEndemicList = New List(Of RankProfileInfo)
            End If

            Dim chartText As StringBuilder = New StringBuilder()
            chartText.Append("Top 50 Graphical Disease Reports, showing the top scoring profiles, ")
            chartText.Append("with a separate graph for EXOTIC and endemic diseases, for each RFI. ")
            chartText.Append("Each graph is ranked by the RFI, then by the post mitigation risk, ")
            chartText.Append("(Black) which has been multiplied ")
            chartText.Append("by -1 to separate it from the RFI bars in each graph. ")
            chartText.Append("Note: *=Disease profiles awaiting validation.")

            PdfSection.Paragraphs.Add(GetChartTable(graphParmsList(count).Category, _
                                                    title1, _
                                                    chartText.ToString(), _
                                                    currentExoticList, _
                                                    True, _
                                                    -100, _
                                                    yMaxLeft))

            If graphParmsList(count).Category <> RankCategory.International_Trade Then
                PdfSection.Paragraphs.Add(GetChartTable(graphParmsList(count).Category, _
                                                        title2, _
                                                        chartText.ToString(), _
                                                        currentEndemicList, _
                                                        True, _
                                                        -100, _
                                                        yMaxRight))
            Else
                'Display additional paragraph for endemic disease international trade graph
                Dim sb As New StringBuilder()
                sb.Append("The Animal Health and Welfare Strategy sets out four reasons for Government intervention. ")
                sb.Append("These include International Trade. ")
                sb.Append("The presence of animal disease, either at the national, regional or local (on farm) level, can reduce our ability to trade. ")
                sb.Append("The EU and OIE operate trade rule systems that help to reduce the risk of animals or animal products spreading disease. ")
                sb.Append("In order to trade at a national level without restrictions, countries must maintain disease free status for notifiable diseases. ")
                sb.Append("The D2R2 scores for International Trade reflect trade from the UK at a national or regional level, not at a farm level. ")
                sb.Append("Most of the endemic diseases in D2R2 are not notifiable or if they are do not have an impact on national trading patterns. ")
                sb.Append("Therefore the graph of endemic diseases does not contain many diseases.")
                Dim frag1 As New Fragment(chartText.ToString())
                frag1.FontSize = 9
                Dim par1 As New TextParagraph
                par1.Fragments.Add(frag1)
                Dim frag2 As New Fragment(Environment.NewLine)
                frag2.FontSize = 9
                Dim frag3 As New Fragment(sb.ToString())
                frag3.FontSize = 9
                Dim par2 As New TextParagraph
                par2.Fragments.Add(frag2)
                Dim par3 As New TextParagraph
                par3.Fragments.Add(frag3)
                Dim pars As New List(Of TextParagraph)
                pars.Add(par1)
                pars.Add(par2)
                pars.Add(par3)
                PdfSection.Paragraphs.Add(GetChartTable(graphParmsList(count).Category, _
                                                        title2, _
                                                        pars, _
                                                        currentEndemicList, _
                                                        True, _
                                                        -100, _
                                                        yMaxRight))
            End If
        Next

        Dim filteredList3 As List(Of RankProfileInfo) = mRankProfileList.GetFilteredSortedList(Nothing, RankCategory.Total, False)
        Dim filteredList4 As List(Of RankProfileInfo) = mRankProfileList.GetFilteredSortedList(Nothing, RankCategory.Total_Including_Risk, False)

        Dim listOfLists1 As List(Of List(Of RankProfileInfo)) = GetChunkedDataLists(filteredList3, 59)
        Dim listOfLists2 As List(Of List(Of RankProfileInfo)) = GetChunkedDataLists(filteredList4, 59)

        AddPdfSection(SectionOrientation.Portrait, True, 42)


        Dim title3 As String = "Diseases ranked by total relative impact on the four reasons for government intervention"
        Dim title4 As String = "Diseases ranked by post mitigation risk plus total relative impact on the four reasons for government intervention"

        Dim yMax1 As Double
        If filteredList3.Count > 0 Then
            yMax1 = Math.Round((RankProfileInfoList.GetMaxTotalRank(filteredList3) + 50) / 50) * 50
        End If

        Dim yMax2 As Double
        If filteredList4.Count > 0 Then
            yMax2 = Math.Round((RankProfileInfoList.GetMaxTotalRankIncludingRisk(filteredList4) + 50) / 50) * 50
        End If

        Dim count2 As Integer = 1
        For Each item As List(Of RankProfileInfo) In listOfLists1
            If count2 = 1 Then
                PdfSection.Paragraphs.Add(GetChartTable(RankCategory.Total, title3, GetTotalChartParagraphs(), item, False, -100, yMax1))
            Else
                PdfSection.Paragraphs.Add(GetChartTable(RankCategory.Total, title3 & " continued...", GetTotalChartParagraphs(), item, True, -100, yMax1))
            End If
            count2 = count2 + 1
        Next

        count2 = 1
        For Each item As List(Of RankProfileInfo) In listOfLists2
            If count2 = 1 Then
                PdfSection.Paragraphs.Add(GetChartTable(RankCategory.Total_Including_Risk, title4, GetTotalPlusRiskChartParagraphs(), item, True, -50, yMax2))
            Else
                PdfSection.Paragraphs.Add(GetChartTable(RankCategory.Total_Including_Risk, title4 & " continued...", GetTotalPlusRiskChartParagraphs(), item, True, -50, yMax2))
            End If
            count2 = count2 + 1
        Next

    End Sub

    Private Function GetChartTable(ByVal category As RankCategory, _
                                   ByVal title As String, _
                                   ByVal paragraphs As List(Of TextParagraph), _
                                   ByVal dataList As List(Of RankProfileInfo), _
                                   ByVal startOnNewPage As Boolean, _
                                   ByVal yMin As Double, _
                                   ByVal yMax As Double) As Paragraphs.Table

        Dim chartTable As New Table
        Dim paragraphRow As New Row
        Dim paragraphCell As New Cell
        Dim chartRow As New Row
        Dim chartCell As New Cell
        chartCell.VerticalAlignment = VerticalAlignment.Top

        Dim height1 As Integer
        height1 = CInt(Math.Floor(dataList.Count * 13)) + 80

        If paragraphs.Count > 0 Then
            For Each par As TextParagraph In paragraphs
                paragraphCell.Paragraphs.Add(par)
                paragraphCell.Paragraphs.Add(GetBlankLine())
            Next
            paragraphCell.Paragraphs.RemoveAt(paragraphCell.Paragraphs.Count - 1)

            paragraphRow.Cells.Add(paragraphCell)
            chartTable.Rows.Add(paragraphRow)
            chartTable.Rows.Add(GetBlankRow())
        End If

        chartCell.Paragraphs.Add(GetChartImage(title, dataList, category, 700, height1, yMin, yMax))
        chartRow.Cells.Add(chartCell)
        chartTable.Rows.Add(chartRow)
        chartTable.StartOnNewPage = startOnNewPage
        Return chartTable

    End Function

    Private Function GetChartTable(ByVal category As RankCategory, _
                                   ByVal title As String, _
                                   ByVal dataList As List(Of RankProfileInfo), _
                                   ByVal startOnNewPage As Boolean, _
                                   ByVal yMin As Double, _
                                   ByVal yMax As Double) As Paragraphs.Table
        Return GetChartTable(category, title, New List(Of TextParagraph)(), dataList, startOnNewPage, yMin, yMax)
    End Function

    Private Function GetChartTable(ByVal category As RankCategory, _
                                   ByVal title As String, _
                                   ByVal text As String, _
                                   ByVal dataList As List(Of RankProfileInfo), _
                                   ByVal startOnNewPage As Boolean, _
                                   ByVal yMin As Double, _
                                   ByVal yMax As Double) As Paragraphs.Table
        Dim frag As Fragment = New Fragment(text)
        frag.FontSize = 9
        Dim par As TextParagraph = New TextParagraph()
        par.Fragments.Add(frag)
        Dim pars As New List(Of TextParagraph)()
        pars.Add(par)
        Return GetChartTable(category, title, pars, dataList, startOnNewPage, yMin, yMax)
    End Function

    Private Function GetCategoryBackColor(ByVal category As RankCategory) As Color

        Select Case category
            Case RankCategory.International_Trade
                Return Color.FromArgb(255, 255, 115) 'Yellow
            Case RankCategory.Wider_Society
                Return Color.FromArgb(153, 204, 255) 'Blue
            Case RankCategory.Animal_Welfare
                Return Color.FromArgb(193, 255, 193) 'Green
            Case RankCategory.Public_Health
                Return Color.FromArgb(253, 153, 204) 'Pink
            Case RankCategory.Risk
                Return Color.FromArgb(0, 0, 0) 'Black
            Case Else
                Return Color.FromArgb(0, 163, 59)
        End Select

    End Function

    Private Sub AddChartSeries(ByRef cht As Chart, _
                               ByVal seriesName As String, _
                               ByVal xMemberString As String, _
                               ByVal yMembersString As String, _
                               ByVal category As RankCategory)


        cht.Series.Add(seriesName)
        cht.Series(seriesName).XValueMember = xMemberString
        cht.Series(seriesName).YValueMembers = yMembersString
        cht.Series(seriesName).ChartType = SeriesChartType.StackedBar
        cht.Series(seriesName).Color = GetCategoryBackColor(category)
        cht.Series(seriesName)("PixelPointWidth") = "8"
        cht.Series(seriesName).BorderColor = Color.Black
        cht.Series(seriesName).BorderWidth = 1

    End Sub

    Private Function GetChartImage(ByVal title As String, _
                                   ByVal rankProfileList As List(Of RankProfileInfo), _
                                   ByVal category As RankCategory, _
                                   ByVal width As Integer, _
                                   ByVal height As Integer, _
                                   ByVal yMin As Double, _
                                   ByVal yMax As Double) As Paragraphs.Image

        Dim chart As New Chart

        chart.DataSource = rankProfileList
        chart.BorderlineColor = Color.Gray
        chart.BorderlineWidth = 1
        chart.BorderlineDashStyle = ChartDashStyle.Solid
        chart.AntiAliasing = AntiAliasingStyles.All

        chart.Titles.Add("Title")
        chart.Titles(0).Text = title
        chart.Titles(0).Font = New System.Drawing.Font("Helvetica", 8, FontStyle.Regular)
        chart.Titles(0).Alignment = ContentAlignment.TopLeft
        chart.Titles(0).Position.Width = 75
        chart.Titles(0).Position.X = 2
        chart.Titles(0).Position.Y = CInt(Math.Ceiling((10 / height) * 100))

        chart.Width = width
        chart.Height = height

        Dim headerAbsoluteHeight As Integer = 60
        Dim headerRelativeHeight As Integer = CInt(Math.Ceiling((headerAbsoluteHeight / height) * 100))

        Dim footerAbsoluteHeight As Integer = 20
        Dim footerRelativeHeight As Integer = CInt(Math.Ceiling((footerAbsoluteHeight / height) * 100))

        chart.ImageStorageMode = ImageStorageMode.UseImageLocation
        chart.ImageLocation = "ChartImage/ChartImage"
        chart.ChartAreas.Add("ChartArea1")
        chart.ChartAreas("ChartArea1").AxisX.Interval = 1
        chart.ChartAreas("ChartArea1").AxisY.LabelStyle.IsEndLabelVisible = False

        chart.ChartAreas("ChartArea1").AxisY.Enabled = AxisEnabled.True
        chart.ChartAreas("ChartArea1").AxisY.LabelStyle.IsStaggered = False
        chart.ChartAreas("ChartArea1").Position.Auto = False
        chart.ChartAreas("ChartArea1").Position.X = 5
        chart.ChartAreas("ChartArea1").Position.Y = 0
        chart.ChartAreas("ChartArea1").Position.Width = 95
        chart.ChartAreas("ChartArea1").Position.Height = 100

        chart.ChartAreas("ChartArea1").InnerPlotPosition.Auto = False
        chart.ChartAreas("ChartArea1").InnerPlotPosition.X = 50
        chart.ChartAreas("ChartArea1").InnerPlotPosition.Y = headerRelativeHeight
        chart.ChartAreas("ChartArea1").InnerPlotPosition.Width = 50
        chart.ChartAreas("ChartArea1").InnerPlotPosition.Height = 100 - headerRelativeHeight - footerRelativeHeight
        chart.ChartAreas("ChartArea1").AxisX.MajorGrid.LineDashStyle = ChartDashStyle.NotSet
        chart.ChartAreas("ChartArea1").AxisX.MinorGrid.LineDashStyle = ChartDashStyle.NotSet
        chart.ChartAreas("ChartArea1").AxisX.LineDashStyle = ChartDashStyle.NotSet
        chart.ChartAreas("ChartArea1").AxisX.LabelStyle.Font = New System.Drawing.Font("Helvetica", 8, FontStyle.Regular)
        chart.ChartAreas("ChartArea1").AxisY.MajorGrid.LineDashStyle = ChartDashStyle.Solid
        chart.ChartAreas("ChartArea1").AxisY.MajorGrid.LineWidth = 1
        chart.ChartAreas("ChartArea1").AxisY.MajorGrid.LineColor = Color.Gray
        chart.ChartAreas("ChartArea1").AxisX.LabelStyle.Angle = 0
        chart.ChartAreas("ChartArea1").AxisX.LabelAutoFitStyle = LabelAutoFitStyles.DecreaseFont

        chart.ChartAreas("ChartArea1").AxisX.MinorGrid.LineDashStyle = ChartDashStyle.NotSet
        chart.ChartAreas("ChartArea1").AxisX.LineDashStyle = ChartDashStyle.NotSet

        chart.ChartAreas("ChartArea1").AxisY.Minimum = yMin
        chart.ChartAreas("ChartArea1").AxisY.Maximum = yMax
        chart.ChartAreas("ChartArea1").AxisY.Interval = 50

        Select Case category

            Case RankCategory.Public_Health
                AddChartSeries(chart, "Post mitigation risk x-1", "FullTitle", "RiskRank", RankCategory.Risk)
                AddChartSeries(chart, "Public health", "FullTitle", "PublicHealthRank", RankCategory.Public_Health)
                AddChartSeries(chart, "Welfare", "FullTitle", "AnimalWelfareRank", RankCategory.Animal_Welfare)
                AddChartSeries(chart, "Wider society", "FullTitle", "WiderSocietyRank", RankCategory.Wider_Society)
                AddChartSeries(chart, "International trade", "FullTitle", "InternationalTradeRank", RankCategory.International_Trade)
            Case RankCategory.Animal_Welfare
                AddChartSeries(chart, "Post mitigation risk x-1", "FullTitle", "RiskRank", RankCategory.Risk)
                AddChartSeries(chart, "Welfare", "FullTitle", "AnimalWelfareRank", RankCategory.Animal_Welfare)
                AddChartSeries(chart, "Wider society", "FullTitle", "WiderSocietyRank", RankCategory.Wider_Society)
                AddChartSeries(chart, "International trade", "FullTitle", "InternationalTradeRank", RankCategory.International_Trade)
                AddChartSeries(chart, "Public health", "FullTitle", "PublicHealthRank", RankCategory.Public_Health)
            Case RankCategory.Wider_Society
                AddChartSeries(chart, "Post mitigation risk x-1", "FullTitle", "RiskRank", RankCategory.Risk)
                AddChartSeries(chart, "Wider society", "FullTitle", "WiderSocietyRank", RankCategory.Wider_Society)
                AddChartSeries(chart, "International trade", "FullTitle", "InternationalTradeRank", RankCategory.International_Trade)
                AddChartSeries(chart, "Public health", "FullTitle", "PublicHealthRank", RankCategory.Public_Health)
                AddChartSeries(chart, "Welfare", "FullTitle", "AnimalWelfareRank", RankCategory.Animal_Welfare)
            Case RankCategory.International_Trade
                AddChartSeries(chart, "Post mitigation risk x-1", "FullTitle", "RiskRank", RankCategory.Risk)
                AddChartSeries(chart, "International trade", "FullTitle", "InternationalTradeRank", RankCategory.International_Trade)
                AddChartSeries(chart, "Public health", "FullTitle", "PublicHealthRank", RankCategory.Public_Health)
                AddChartSeries(chart, "Welfare", "FullTitle", "AnimalWelfareRank", RankCategory.Animal_Welfare)
                AddChartSeries(chart, "Wider society", "FullTitle", "WiderSocietyRank", RankCategory.Wider_Society)
            Case RankCategory.Total
                AddChartSeries(chart, "Post mitigation risk x-1", "FullTitle", "RiskRank", RankCategory.Risk)
                AddChartSeries(chart, "Public health", "FullTitle", "PublicHealthRank", RankCategory.Public_Health)
                AddChartSeries(chart, "Welfare", "FullTitle", "AnimalWelfareRank", RankCategory.Animal_Welfare)
                AddChartSeries(chart, "Wider society", "FullTitle", "WiderSocietyRank", RankCategory.Wider_Society)
                AddChartSeries(chart, "International trade", "FullTitle", "InternationalTradeRank", RankCategory.International_Trade)
            Case RankCategory.Total_Including_Risk
                AddChartSeries(chart, "Post mitigation risk", "FullTitle", "PositiveRiskRank", RankCategory.Risk)
                AddChartSeries(chart, "Public health", "FullTitle", "PublicHealthRank", RankCategory.Public_Health)
                AddChartSeries(chart, "Welfare", "FullTitle", "AnimalWelfareRank", RankCategory.Animal_Welfare)
                AddChartSeries(chart, "Wider society", "FullTitle", "WiderSocietyRank", RankCategory.Wider_Society)
                AddChartSeries(chart, "International trade", "FullTitle", "InternationalTradeRank", RankCategory.International_Trade)
        End Select

        Dim legend As New Legend("Legend1")
        legend.LegendStyle = LegendStyle.Column
        legend.Position.X = 80
        legend.Position.Y = 0
        legend.Position.Width = 20
        legend.Position.Height = headerRelativeHeight
        legend.Alignment = StringAlignment.Far
        legend.BorderColor = Color.Black
        legend.BorderWidth = 0
        legend.BorderDashStyle = ChartDashStyle.Solid
        legend.Font = New System.Drawing.Font("Arial", 6, FontStyle.Regular)
        legend.BackColor = Color.Transparent

        chart.Legends.Add(legend)

        Dim imageStream As New MemoryStream
        chart.SaveImage(imageStream, ChartImageFormat.Png)
        Dim img As New TallComponents.PDF.Layout.Paragraphs.Image(imageStream)

        Return img

    End Function

    Private Function GetContainerTable(ByVal rankProfileList As RankProfileInfoList) As Paragraphs.Table

        Dim containerTable As New Paragraphs.Table
        containerTable.PreferredWidth = 1000
        containerTable.ForceWidth = True
        Dim containerRow As New Paragraphs.Row

        Dim filteredList1 As List(Of RankProfileInfo) = rankProfileList.GetFilteredSortedList(Nothing, RankCategory.Public_Health, False, True)
        filteredList1 = RankProfileInfoList.FilterDiseasesWithNoRfiImpact(filteredList1, RankCategory.Public_Health)

        Dim filteredList2 As List(Of RankProfileInfo) = rankProfileList.GetFilteredSortedList(Nothing, RankCategory.Animal_Welfare, False, True)
        filteredList2 = RankProfileInfoList.FilterDiseasesWithNoRfiImpact(filteredList2, RankCategory.Animal_Welfare)

        Dim filteredList3 As List(Of RankProfileInfo) = rankProfileList.GetFilteredSortedList(Nothing, RankCategory.Wider_Society, False, True)
        filteredList3 = RankProfileInfoList.FilterDiseasesWithNoRfiImpact(filteredList3, RankCategory.Wider_Society)

        Dim filteredList4 As List(Of RankProfileInfo) = rankProfileList.GetFilteredSortedList(Nothing, RankCategory.International_Trade, False, True)
        filteredList4 = RankProfileInfoList.FilterDiseasesWithNoRfiImpact(filteredList4, RankCategory.International_Trade)

        containerRow.Cells.Add(BuildTopDiseaseTable(filteredList1, RankCategory.Public_Health))
        containerRow.Cells.Add(BuildTopDiseaseTable(filteredList2, RankCategory.Animal_Welfare))
        containerRow.Cells.Add(BuildTopDiseaseTable(filteredList3, RankCategory.Wider_Society))
        containerRow.Cells.Add(BuildTopDiseaseTable(filteredList4, RankCategory.International_Trade))

        containerTable.Rows.Add(containerRow)

        Return containerTable

    End Function

    Private Function BuildTopDiseaseTable(ByVal dataList As List(Of RankProfileInfo), _
                                     ByVal category As RankCategory) As Paragraphs.Cell

        Dim topDiseaseTable As New Paragraphs.Table
        Dim maxRows As Integer = 25
        Dim numRows As Integer

        dataList = RankProfileInfoList.CalculateRankPosition(dataList, category)

        Dim title As String = [Enum].GetName(GetType(RankCategory), category).Replace("_", " ").ToUpper()
        Dim categoryColour As Color = GetCategoryBackColor(category)

        'header row
        topDiseaseTable.Rows.Add(GetTopDiseaseHeaderRow(title, categoryColour))

        'get number of rows as lesser of maxRows or dataList count
        If maxRows < dataList.Count Then
            numRows = maxRows
        Else
            numRows = dataList.Count
        End If

        Dim index As Integer = 0
        For i As Integer = dataList.Count - 1 To 0 Step -1
            Dim item As RankProfileInfo = dataList(i)

            Dim backColour As Color
            If item.IsExotic Then
                backColour = Color.FromArgb(204, 204, 204)
            Else
                backColour = Color.White
            End If

            Dim rankString As String = item.RankPosition.ToString()

            If (i < dataList.Count - 1 AndAlso dataList(i + 1).RankPosition = item.RankPosition) _
               Or (i > 0 AndAlso dataList(i - 1).RankPosition = item.RankPosition) Then
                rankString &= "="
            End If

            topDiseaseTable.Rows.Add(GetTopDiseaseRow(item.FullTitleMixedCase(55), _
                                            rankString, _
                                            item.GetRankByCategory(category).ToString(), _
                                            item.PositiveRiskRank.ToString(), _
                                            backColour, _
                                            categoryColour))

            index += 1

            'numRows required only
            If index = numRows Then
                Exit For
            End If
        Next

        Dim cell As New Cell
        cell.Paragraphs.Add(topDiseaseTable)
        cell.Margin.Left = 0
        cell.Margin.Right = 0

        Return cell

    End Function

    Private Function GetTopDiseaseHeaderRow(ByVal title As String, ByVal color As System.Drawing.Color) As Paragraphs.Row
        Dim row As New Paragraphs.Row
        row.Cells.Add(GetCell(title.ToUpper(), True, color, 8, 120))
        row.Cells.Add(GetCell("RANK", True, color, 8))
        row.Cells.Add(GetCell("SCORE", True, color, 8))
        row.Cells.Add(GetCell("PMR", True, color, 8))
        Return row
    End Function

    Private Function GetTopDiseaseRow(ByVal disease As String, _
                                 ByVal rank As String, _
                                 ByVal score As String, _
                                 ByVal riskAndMitigation As String) As Paragraphs.Row

        Return GetTopDiseaseRow(disease, score, rank, riskAndMitigation, Color.White, Color.White)

    End Function

    Private Function GetTopDiseaseRow(ByVal disease As String, _
                                 ByVal rank As String, _
                                 ByVal score As String, _
                                 ByVal riskAndMitigation As String, _
                                 ByVal colour As Color, _
                                 ByVal rfiColour As Color) As Paragraphs.Row

        Dim row As New Paragraphs.Row
        row.Cells.Add(GetCell(disease, False, colour, 8, 120))
        row.Cells.Add(GetCell(rank, True, rfiColour, 9))
        row.Cells.Add(GetCell(score, False, colour, 8))
        row.Cells.Add(GetCell(riskAndMitigation, False, colour, 8))
        Return row

    End Function

    Private Function GetBorder(ByVal colour As Color) As Border
        Dim newBorder As New Border(Colors.RgbColor.Black, 0.01)

        Dim brsh As New TallComponents.PDF.Layout.Brushes.SolidBrush(colour)
        newBorder.Background = brsh

        Return newBorder
    End Function

    Private Function GetCell(ByVal text As String, _
                             ByVal isBold As Boolean, _
                             ByVal colour As Color, _
                             ByVal fontSize As Integer, _
                             Optional ByVal width As Double = 0) As Paragraphs.Cell

        Dim cell As New Paragraphs.Cell()
        cell.Border = GetBorder(colour)

        If width <> 0 Then
            cell.PreferredWidth = width
            cell.Fixed = True
            cell.FitToContent = False
        Else
            cell.FitToContent = True
        End If

        Dim frag As New Fragment(text.StripHtmlTags)
        frag.Font = Fonts.Font.Helvetica
        frag.FontSize = fontSize
        frag.Bold = isBold

        Dim par As New TextParagraph
        par.Fragments.Add(frag)
        par.HorizontalAlignment = HorizontalAlignment.Center
        cell.Paragraphs.Add(par)
        Return cell

    End Function

    Protected Function GetTotalChartParagraphs() As List(Of TextParagraph)
        Dim totalText As New StringBuilder()
        totalText.Append("Graphical Disease Report, showing all the scored profiles ranked after addition of the score ")
        totalText.Append("for each individual RFI, but with post mitigation risk (Black) ")
        totalText.Append("score multiplied by -1 to separate it from the RFI bars in each graph. This graph allows the ")
        totalText.Append("score for every profile to be identified even if it is not near the top of the rankings for any ")
        totalText.Append("of the RFIs. However this total score should not be used for resource allocation decisions - ")
        totalText.Append("the rankings per RFI are the more appropriate tool to use to support decision making. Note: ")
        totalText.Append("*=Disease profiles awaiting validation; EXOTIC diseases appear in capitals and endemic diseases ")
        totalText.Append("in standard case format.")
        Dim totalFrag As New Fragment(totalText.ToString())
        totalFrag.FontSize = 9
        Dim totalPar As New TextParagraph()
        totalPar.Fragments.Add(totalFrag)
        Dim totalPars As New List(Of TextParagraph)()
        totalPars.Add(totalPar)
        Return totalPars
    End Function

    Protected Function GetTotalPlusRiskChartParagraphs() As List(Of TextParagraph)
        Dim totalPlusRiskText As New StringBuilder()
        totalPlusRiskText.Append("Graphical Disease Report, showing all the scored profiles ranked after addition of the score ")
        totalPlusRiskText.Append("for each individual RFI and also including the post mitigation risk (Black) score. ")
        totalPlusRiskText.Append("This graph allows the score for every profile to be identified even if it is not near the top ")
        totalPlusRiskText.Append("of the rankings for any of the RFIs. However this total score should not be used for resource ")
        totalPlusRiskText.Append("allocation decisions- the rankings per RFI are the more appropriate tool to use to support ")
        totalPlusRiskText.Append("decision making. Note: *=Disease profiles awaiting validation; EXOTIC diseases appear in ")
        totalPlusRiskText.Append("capitals and endemic diseases in standard case format. ")
        Dim totalPlusRiskFrag As New Fragment(totalPlusRiskText.ToString())
        totalPlusRiskFrag.FontSize = 9
        Dim totalPlusRiskPar As New TextParagraph()
        totalPlusRiskPar.Fragments.Add(totalPlusRiskFrag)
        Dim totalPlusRiskPars As New List(Of TextParagraph)()
        totalPlusRiskPars.Add(totalPlusRiskPar)
        Return totalPlusRiskPars
    End Function

    Protected Overrides Function CreateSectionHeader() As TallComponents.PDF.Layout.Paragraphs.Paragraph

        Dim headerParagraph As Paragraph = New LogoHeaderTable(Me, PageSize.A4.Height, String.Empty)
        Return headerParagraph

    End Function

    Protected Overrides Function CreateSectionFooter() As TallComponents.PDF.Layout.Paragraphs.Paragraph

        Return CreateSectionFooter(SectionOrientation.Portrait)

    End Function

    Protected Overloads Function CreateSectionFooter(ByVal orientation As SectionOrientation) As TallComponents.PDF.Layout.Paragraphs.Paragraph

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
        reportLinkParagraph.HorizontalAlignment = HorizontalAlignment.Center

        Dim reportLinkParagraph2 As New TextParagraph
        reportLinkParagraph2.HorizontalAlignment = HorizontalAlignment.Center

        Dim reportLinkParagraph3 As New TextParagraph
        reportLinkParagraph3.HorizontalAlignment = HorizontalAlignment.Center

        Dim reportLinkFragment1 As New Fragment
        reportLinkFragment1.Text = "For internal Defra users other reports are available on: "
        reportLinkFragment1.FontSize = 8

        Dim reportLinkFragment2 As New Fragment
        reportLinkFragment2.TextColor = New Colors.RgbColor(0, 0, 255)
        reportLinkFragment2.Underline = True
        reportLinkFragment2.FontSize = 8
        reportLinkFragment2.Text = InternalHomePageUrlForReports

        Dim externalLinkFragment3 As New Fragment
        externalLinkFragment3.FontSize = 8
        externalLinkFragment3.KeepWithNext = True
        externalLinkFragment3.Text = GlobalSettings.PDFQualityStatementText

        reportLinkParagraph.Fragments.Add(reportLinkFragment1)
        reportLinkParagraph.Fragments.Add(reportLinkFragment2)

        If orientation = SectionOrientation.Landscape Then
            reportLinkParagraph.Fragments.Add(externalLinkFragment3)
        Else
            reportLinkParagraph3.Fragments.Add(externalLinkFragment3)
        End If

        Dim pageNumberParagraph As New TextParagraph()
        pageNumberParagraph.HorizontalAlignment = HorizontalAlignment.Center
        Dim pageNumberFragment As New Fragment()
        pageNumberFragment.HasContextFields = True
        pageNumberFragment.Text = mTitle
        pageNumberFragment.Text &= String.Format("Generated: {0}", Date.Now.ToShortDateString())
        pageNumberFragment.Text &= ". "
        pageNumberFragment.Text &= "Page #p of #P"
        pageNumberFragment.FontSize = 8
        pageNumberParagraph.Fragments.Add(pageNumberFragment)

        footerLinkCell.Paragraphs.Add(reportLinkParagraph)
        If reportLinkParagraph2.Fragments.Count > 0 Then
            footerLinkCell.Paragraphs.Add(reportLinkParagraph2)
        End If
        If reportLinkParagraph3.Fragments.Count > 0 Then
            footerLinkCell.Paragraphs.Add(reportLinkParagraph3)
        End If
        pageNumberCell.Paragraphs.Add(pageNumberParagraph)

        Return sectionTable

    End Function


#Region " Helper class "

    Private Class GraphParameters

        Private mIsExotic As Boolean
        Private mRankCategory As RankCategory
        Private mSortDirection As ComponentModel.ListSortDirection

        Public ReadOnly Property Title() As String
            Get
                Dim sb As New StringBuilder
                If mIsExotic Then
                    sb.Append("Exotic diseases ranked according to potential impact on ")
                Else
                    sb.Append("Endemic diseases ranked according to impact on ")
                End If
                sb.Append([Enum].GetName(GetType(RankCategory), Category).Replace("_", " "))
                Return sb.ToString()
            End Get
        End Property

        Public ReadOnly Property IsExotic() As Boolean
            Get
                Return mIsExotic
            End Get
        End Property

        Public ReadOnly Property Category() As RankCategory
            Get
                Return mRankCategory
            End Get
        End Property

        Public ReadOnly Property SortDirection() As ComponentModel.ListSortDirection
            Get
                Return mSortDirection
            End Get
        End Property

        Public Sub New(ByVal isExotic As Boolean, _
                       ByVal category As RankCategory, _
                       ByVal direction As ComponentModel.ListSortDirection)

            mIsExotic = isExotic
            mRankCategory = category
            mSortDirection = direction

        End Sub

    End Class

#End Region

End Class

