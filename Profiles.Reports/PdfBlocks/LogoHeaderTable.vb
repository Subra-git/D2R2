Imports TallComponents.PDF.Layout
Imports TallComponents.PDF.Layout.Paragraphs
Imports TallComponents.PDF.Layout.Colors
Imports ProfilesLibrary

Friend Class LogoHeaderTable
    Inherits Table

    Public Sub New(ByVal base As PdfBase, ByVal width As Double)

        Me.New(base, width, String.Empty)

    End Sub

    Public Sub New(ByVal base As PdfBase, ByVal width As Double, ByVal text As String, Optional ByVal subtext As String = Nothing)

        Me.HorizontalAlignment = HorizontalAlignment.Left

        Dim headerRow As Row = Me.Rows.Add()
        headerRow.Margin.Top = 10
        Dim defraLogoCell As Cell = headerRow.Cells.Add()

        Dim defraImage As New Image(base.DefraLogo)
        defraImage.Height = 50
        defraImage.KeepAspectRatio = True

        defraLogoCell.PreferredWidth = defraImage.Width
        defraLogoCell.Fixed = True
        defraLogoCell.Paragraphs.Add(defraImage)

        If Not text.Equals(String.Empty) Then

            Dim titleCell As Cell = headerRow.Cells.Add()
            Dim titleParagraph As New XhtmlParagraph()
            With titleParagraph
                .Text = String.Format(
                 "<html style='font-family:Arial,Helvetica; font-size: 12px;'><br/>{0}</html>",
                 text.SanitizeHtml)
                If subtext <> Nothing Then
                    .Text &= String.Format( _
                    "<html style='font-family:Arial, Helvetica;font-size:9px'><br />{0}</html>", _
                    subtext)
                End If
                .HorizontalAlignment = HorizontalAlignment.Left
                .LeftIndentation = 20
            End With
            titleCell.Paragraphs.Add(titleParagraph)

            Dim headerRow2 As Row = Me.Rows.Add()
            Me.PreferredWidth = width
            Me.ForceWidth = True

            Dim underlineCell As Cell = headerRow2.Cells.Add()
            underlineCell.ColSpan = 3
            Dim line As New HorizontalLine()
            With line
                .Width = width
                .HorizontalAlignment = TallComponents.PDF.Layout.HorizontalAlignment.Center
            End With
            underlineCell.Paragraphs.Add(line)

        Else
            Dim titleCell As Cell = headerRow.Cells.Add()
            Me.PreferredWidth = width
            Me.ForceWidth = True
        End If

        Dim d2R2Image As New Image(base.D2R2Logo)
        d2R2Image.Height = 38
        d2R2Image.KeepAspectRatio = True

        Dim d2r2LogoCell As Cell = headerRow.Cells.Add()
        d2r2LogoCell.VerticalAlignment = VerticalAlignment.Middle
        d2r2LogoCell.PreferredWidth = d2R2Image.Width
        d2r2LogoCell.Fixed = True
        d2r2LogoCell.Paragraphs.Add(d2R2Image)

    End Sub

    Public Sub New(ByVal base As PdfBase, ByVal width As Double, ByVal paragraphs As List(Of Paragraph))
        Me.HorizontalAlignment = HorizontalAlignment.Left

        Dim headerRow As Row = Me.Rows.Add()
        headerRow.Margin.Top = 10
        Dim defraLogoCell As Cell = headerRow.Cells.Add()

        Dim defraImage As New Image(base.DefraLogo)
        defraImage.Height = 50
        defraImage.KeepAspectRatio = True

        defraLogoCell.PreferredWidth = defraImage.Width
        defraLogoCell.Fixed = True
        defraLogoCell.Paragraphs.Add(defraImage)

        If paragraphs.Count > 0 Then
            Dim titleCell As Cell = headerRow.Cells.Add()
            Dim blankParagraph As New XhtmlParagraph()
            blankParagraph.Text = "<br/>"
            blankParagraph.LeftIndentation = 20
            blankParagraph.HorizontalAlignment = HorizontalAlignment.Left
            titleCell.Paragraphs.Add(blankParagraph)
            For Each par As Paragraph In paragraphs
                par.HorizontalAlignment = HorizontalAlignment.Left
                par.LeftIndentation = 20
                titleCell.Paragraphs.Add(par)
            Next

            Dim headerRow2 As Row = Me.Rows.Add()
            Me.PreferredWidth = width
            Me.ForceWidth = True

            Dim underlineCell As Cell = headerRow2.Cells.Add()
            underlineCell.ColSpan = 3
            Dim line As New HorizontalLine()
            With line
                .Width = width
                .HorizontalAlignment = HorizontalAlignment.Center
            End With
            underlineCell.Paragraphs.Add(line)

        Else
            Dim titleCell As Cell = headerRow.Cells.Add()
            Me.PreferredWidth = width
            Me.ForceWidth = True
        End If

        Dim d2R2Image As New Image(base.D2R2Logo)
        d2R2Image.Height = 38
        d2R2Image.KeepAspectRatio = True

        Dim d2r2LogoCell As Cell = headerRow.Cells.Add()
        d2r2LogoCell.VerticalAlignment = VerticalAlignment.Middle
        d2r2LogoCell.PreferredWidth = d2R2Image.Width
        d2r2LogoCell.Fixed = True
        d2r2LogoCell.Paragraphs.Add(d2R2Image)
    End Sub

End Class
