Imports TallComponents.PDF.Layout
Imports TallComponents.PDF.Layout.Paragraphs
Imports TallComponents.PDF.Layout.Colors
Imports ProfilesLibrary

Friend Class QuestionTable
    Inherits Table

    Friend Sub New(ByVal titleRow As Row, ByVal additionalInfo As String, ByVal answerTable As Table, ByVal width As Double)

        Me.PreferredWidth = width
        Me.ForceWidth = True
        Me.SpacingBefore = 5
        Me.HorizontalAlignment = HorizontalAlignment.Center

        Me.Rows.Add(titleRow)
        If additionalInfo.Length > 0 Then
            Me.Rows.Add(BuildAdditionalInfoRow(additionalInfo))
        End If

        Dim answerRow As Row = Me.Rows.Add()
        Dim answerCell As Cell = answerRow.Cells.Add()
        answerCell.Paragraphs.Add(answerTable)

    End Sub

    Friend Sub New(ByVal titleRow As Row, ByVal additionalInfo As String, ByVal answerTable As Table)
        Me.New(titleRow, additionalInfo, answerTable, 550)
    End Sub

    Private Function BuildAdditionalInfoRow(ByVal additionalInfo As String) As Row

        Dim additionalInfoRow As New Row
        Dim additionalInfoCell As Cell = additionalInfoRow.Cells.Add()
        Dim additionalInfoParagraph As New TextParagraph
        additionalInfoParagraph.SpacingBefore = 5
        additionalInfoCell.Paragraphs.Add(additionalInfoParagraph)
        Dim additionalInfoFragment As New Fragment(additionalInfo.StripHtmlTags)
        additionalInfoParagraph.Fragments.Add(additionalInfoFragment)
        additionalInfoFragment.Italic = True

        Return additionalInfoRow

    End Function

End Class

