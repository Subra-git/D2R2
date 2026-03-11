Imports ProfilesLibrary
Imports TallComponents.PDF.Layout
Imports TallComponents.PDF.Layout.Paragraphs
Imports TallComponents.PDF.Layout.Colors

Public Class ContributionsTable
    Inherits Table

    Protected Friend Sub New(ByVal contributionList As ProfileContributionInfoList)

        Me.HorizontalAlignment = HorizontalAlignment.Center
        Me.PreferredWidth = 497
        Me.ForceWidth = True
        Me.SpacingBefore = 10
        'Me.ColumnDefinitions.Add(New TableColumnDefinition(125, False, True))
        Me.ColumnDefinitions.Add(New TableColumnDefinition(166, False, True))
        Me.ColumnDefinitions.Add(New TableColumnDefinition(166, False, True))
        Me.ColumnDefinitions.Add(New TableColumnDefinition(166, False, True))
        Me.RepeatFirstRow = True

        If contributionList.Count > 0 Then

            Me.Rows.Add(AddContributionHeaderRow())

            For Each contribution As ProfileContributionInfo In contributionList
                Me.Rows.Add(AddContributionRow(contribution))
            Next
        Else
            Dim emptyRow As New Row
            Dim emptyCell As New Cell
            emptyCell.ColSpan = 4

            Dim emptyPar As New TextParagraph
            emptyPar.HorizontalAlignment = TallComponents.PDF.Layout.HorizontalAlignment.Center
            Dim emptyFrag As New Fragment(" - No contributions - ")
            emptyFrag.Italic = True
            emptyPar.Fragments.Add(emptyFrag)

            emptyCell.Paragraphs.Add(emptyPar)
            emptyRow.Cells.Add(emptyCell)

            Me.Rows.Add(emptyRow)
        End If

    End Sub

    Private Function AddContributionHeaderRow() As Row

        Dim contributionHeadingRow As New Row
        contributionHeadingRow.Margin.Bottom = 5
        contributionHeadingRow.Border = New Border()
        contributionHeadingRow.Border.Background = New Brushes.SolidBrush(New Colors.RgbColor(0, 163, 59))

        contributionHeadingRow.Cells.Add(AddContributionCell("Full name", New Colors.RgbColor(255, 255, 255)))
        contributionHeadingRow.Cells.Add(AddContributionCell("Organisation", New Colors.RgbColor(255, 255, 255)))
        contributionHeadingRow.Cells.Add(AddContributionCell("Contribution date", New Colors.RgbColor(255, 255, 255)))

        Return contributionHeadingRow

    End Function

    Private Function AddContributionRow(ByVal contribution As ProfileContributionInfo) As Row

        Dim contributionRow As New Row

        contributionRow.Cells.Add(AddContributionCell(contribution.FullName))
        contributionRow.Cells.Add(AddContributionCell(contribution.OrganisationName))
        contributionRow.Cells.Add(AddContributionCell(contribution.LastContributionDate.ToString()))

        Return contributionRow

    End Function

    Private Function AddContributionCell(ByVal text As String) As Cell
        Return AddContributionCell(text, New Colors.RgbColor(0, 0, 0))
    End Function

    Private Function AddContributionCell(ByVal text As String, ByVal backColor As Colors.Color) As Cell

        Dim contributionCell As New Cell
        contributionCell.Border = New Border()
      
        Dim contributionPar As New TextParagraph

        Dim contributionFrag As New Fragment
        contributionFrag.TextColor = backColor
        contributionFrag.Text = text.StripHtmlTags

        contributionPar.Fragments.Add(contributionFrag)
        contributionCell.Paragraphs.Add(contributionPar)

        Return contributionCell
    End Function


End Class
