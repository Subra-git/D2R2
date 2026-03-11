Imports TallComponents.PDF.Layout
Imports TallComponents.PDF.Layout.Navigation
Imports TallComponents.PDF.Layout.Paragraphs
Imports ProfilesLibrary

Public MustInherit Class PdfBase

    Private mPdfData As Byte()

    'Pdf document objects
    Private mPdfDocument As Document
    Private mPdfSection As Section

    Private mPen As Pens.Pen
    Private mDefraLogo As System.Drawing.Bitmap
    Private mD2R2Logo As System.Drawing.Bitmap
    Private mCheckboxSelected As System.Drawing.Bitmap
    Private mCheckboxUnselected As System.Drawing.Bitmap

    Public Enum SectionOrientation
        Portrait
        Landscape
    End Enum

    Public ReadOnly Property PdfData() As Byte()
        Get
            If mPdfData Is Nothing Then
                mPdfData = GeneratePdf()
            End If
            Return mPdfData
        End Get
    End Property

    Protected ReadOnly Property PdfDocument() As Document
        Get
            Return mPdfDocument
        End Get
    End Property

    Protected ReadOnly Property PdfSection() As Section
        Get
            Return mPdfSection
        End Get
    End Property

    Protected Friend ReadOnly Property DefaultPen() As Pens.Pen
        Get
            Return mPen
        End Get
    End Property

    Protected Friend ReadOnly Property DefraLogo() As System.Drawing.Bitmap
        Get
            Return mDefraLogo
        End Get
    End Property

    Protected Friend ReadOnly Property D2R2Logo() As System.Drawing.Bitmap
        Get
            Return mD2R2Logo
        End Get
    End Property

    Protected Friend ReadOnly Property CheckboxSelected() As System.Drawing.Bitmap
        Get
            Return mCheckboxSelected
        End Get
    End Property

    Protected Friend ReadOnly Property CheckboxUnselected() As System.Drawing.Bitmap
        Get
            Return mCheckboxUnselected
        End Get
    End Property

    Private Function GeneratePdf() As Byte()

        Dim output As Byte() = Nothing
        Try
            mDefraLogo = New System.Drawing.Bitmap(Me.GetType(), "aphalogo.png")
            mD2R2Logo = New System.Drawing.Bitmap(Me.GetType(), "D2R2LogoSmall.png")
            mCheckboxSelected = New System.Drawing.Bitmap(Me.GetType(), "CheckboxSelected.png")
            mCheckboxUnselected = New System.Drawing.Bitmap(Me.GetType(), "CheckboxUnselected.png")
            mPen = New Pens.Pen

            mPdfDocument = New Document()
            SetPdfMetadata()

            Dim frontPageSection As Section = CreateFrontPage()
            If frontPageSection IsNot Nothing Then
                mPdfDocument.Sections.Add(frontPageSection)
            End If

            AddPdfSection()
            BuildDocumentBody()

            'output PDF to byte array
            Using stream As New IO.MemoryStream()
                mPdfDocument.Write(stream)
                output = stream.ToArray()
            End Using

        Finally
            If mDefraLogo IsNot Nothing Then
                mDefraLogo.Dispose()
            End If

            If mDefraLogo IsNot Nothing Then
                mD2R2Logo.Dispose()
            End If

            If mCheckboxSelected IsNot Nothing Then
                mCheckboxSelected.Dispose()
            End If

            If mCheckboxUnselected IsNot Nothing Then
                mCheckboxUnselected.Dispose()
            End If
        End Try

        Return output

    End Function
    Protected Overridable Sub AddPdfSection()
        AddPdfSection(SectionOrientation.Portrait)
    End Sub

    Protected Overridable Sub AddPdfSection(ByVal orientation As SectionOrientation)
        AddPdfSection(orientation, True, 0)
    End Sub

    Protected Overridable Sub AddPdfSection(ByVal orientation As SectionOrientation, _
                                            ByVal startOnNewPage As Boolean)
        AddPdfSection(orientation, startOnNewPage, 0)
    End Sub

    Protected Overridable Sub AddPdfSection(ByVal orientation As SectionOrientation, _
                                            ByVal startOnNewPage As Boolean, _
                                            ByVal bottomMargin As Integer)

        mPdfSection = New Section()
        mPdfSection.StartOnNewPage = startOnNewPage
        mPdfDocument.Sections.Add(mPdfSection)
        SetPdfSectionSize(mPdfSection, orientation)
        'section header
        Dim sectionHeader As Paragraph = CreateSectionHeader()
        If sectionHeader IsNot Nothing Then
            mPdfSection.Header = New Header()
            mPdfSection.Header.Paragraphs.Add(sectionHeader)
        End If
        'section footer
        Dim sectionFooter As Paragraph = CreateSectionFooter()
        If sectionFooter IsNot Nothing Then
            mPdfSection.Footer = New Footer()
            mPdfSection.Footer.Paragraphs.Add(sectionFooter)
        End If

        If bottomMargin > 0 Then
            mPdfSection.Margin.Bottom = bottomMargin
        End If

        WriteStamp(mPdfSection, orientation)

    End Sub

    Friend Sub BuildWarningTextSection()

        AddPdfSection(SectionOrientation.Portrait, True)

        Dim sectionHeading As New Heading(1)
        sectionHeading.SpacingAfter = 5
        sectionHeading.Caption = String.Format("Please Note")
        Dim headingFragment As New Fragment(sectionHeading.Caption)
        sectionHeading.Fragments.Add(headingFragment)
        sectionHeading.Bookmark = String.Format("NB")

        PdfSection.Paragraphs.Add(sectionHeading)

        BuildWarningNoteTable()

    End Sub

    Private Sub BuildWarningNoteTable()
        Dim warningTable As New Table
        warningTable.PreferredWidth = 400
        warningTable.ForceWidth = False
        warningTable.SpacingBefore = 10
        warningTable.ColumnDefinitions.Add(New TableColumnDefinition(530, True, True))
        warningTable.RepeatFirstRow = False

        Dim noteRow As Row = warningTable.Rows.Add()
        noteRow.Padding.Bottom = 5
        noteRow.Border = Nothing
        Dim noteCell As Cell
        noteCell = noteRow.Cells.Add()
        Dim noteParagraph As New TextParagraph()
        noteCell.Paragraphs.Add(noteParagraph)
        Dim noteFragment As New Fragment()
        noteFragment.Italic = False
        noteFragment.Text = "The content in a number of questions constitutes static information, or is no longer deemed critical,
                            and, to minimise the resource requirements of D2R2, is not scheduled to be updated.
                            Please see the D2R2 quality statement for a list of these questions."
        noteFragment.TextColor = New Colors.RgbColor(0, 0, 0)
        noteParagraph.Fragments.Add(noteFragment)


        PdfSection.Paragraphs.Add(warningTable)

    End Sub

    Protected Overridable Sub SetPdfMetadata()

        With mPdfDocument.DocumentInfo
            .Author = "DEFRA"
            .Creator = "Generated by the D2R2 application"
        End With

        mPdfDocument.ViewerPreferences = New ViewerPreferences()
        mPdfDocument.ViewerPreferences.PageMode = PageMode.Outlines

    End Sub

    Protected Overridable Sub SetPdfSectionSize(ByVal section As Section)

        SetPdfSectionSize(section, SectionOrientation.Portrait)

    End Sub

    Protected Sub SetPdfSectionSize(ByVal section As Section, ByVal orientation As SectionOrientation)

        If orientation = SectionOrientation.Portrait Then
            section.PageSize = PageSize.A4
        Else
            section.PageSize.Width = PageSize.A4.Height
            section.PageSize.Height = PageSize.A4.Width
        End If

        With section
            .Margin.Left = New Unit(0.5, UnitType.Inch)
            .Margin.Right = New Unit(0.5, UnitType.Inch)
            .Margin.Top = New Unit(1, UnitType.Inch)
            .Margin.Bottom = New Unit(1, UnitType.Inch)
        End With

    End Sub

    Protected Overridable Sub CreateStamp(ByVal section As Section, ByVal text As String)

        CreateStamp(section, text, SectionOrientation.Portrait)

    End Sub

    Protected Sub CreateStamp(ByVal section As Section, ByVal text As String, ByVal orientation As SectionOrientation)

        Dim draftArea As New Area(0, section.PageSize.Height, section.PageSize.Width, section.PageSize.Height)

        section.ForegroundAreas.Add(draftArea)

        Dim draftDrawing As New Drawing(draftArea.Width, draftArea.Height)
        draftArea.Paragraphs.Add(draftDrawing)

        Dim draftTextShape As New Shapes.TextShape()
        draftTextShape.Text = text
        draftTextShape.FontSize = 72
        draftTextShape.TextColor = New Colors.RgbColor(255, 166, 166)
        draftTextShape.Opacity = 128

        If orientation = SectionOrientation.Portrait Then
            draftTextShape.Rotation = -45
            draftTextShape.X = 110
            draftTextShape.Y = 160
        Else
            draftTextShape.Rotation = -35
            draftTextShape.X = 190
            draftTextShape.Y = 120
        End If

        draftDrawing.Shapes.Add(draftTextShape)

    End Sub

    Protected Overridable Function BuildDocumentSectionHeader(ByVal caption As String) As Heading
        Return BuildDocumentSectionHeader(caption, caption)
    End Function

    Protected Overridable Function BuildDocumentSectionHeader(ByVal caption As String, ByVal bookmark As String) As Heading

        Dim sectionHeading As New Heading(0)
        sectionHeading.StartOnNewPage = True
        sectionHeading.Border = New Border()
        sectionHeading.Border.Bottom = DefaultPen
        sectionHeading.Padding.Bottom = 10
        sectionHeading.SpacingAfter = 10
        sectionHeading.Caption = caption
        Dim headingFragment As New Fragment(caption.StripHtmlTags)
        headingFragment.FontSize += 2
        sectionHeading.Fragments.Add(headingFragment)
        sectionHeading.Bookmark = bookmark.StripHtmlTags

        Return sectionHeading

    End Function

    Protected Overridable Function CreateFrontPage() As Section
        Return Nothing
    End Function

    Protected Overridable Function CreateSectionHeader() As Paragraph
        Return Nothing
    End Function

    Protected Overridable Function CreateSectionFooter() As Paragraph
        Return Nothing
    End Function

    Protected Overridable Function CreateSectionFooterLink() As Paragraph
        Return Nothing
    End Function

    Protected Overridable Sub WriteStamp(ByVal pdfSection As Section, ByVal orientation As SectionOrientation)
        'do nothing
    End Sub

    Protected MustOverride Sub BuildDocumentBody()

#Region "Text wrapping functions - not currently used"

    ''' <summary>
    ''' adds spaces into a text string so that when it is displayed, it word-wraps correctly within a given area, even if to begin with
    ''' it contains very long "words" with no spaces in them
    ''' </summary>
    ''' <param name="text">the original text to add spaces into</param>
    ''' <param name="targetFragment">the TallPDF fragment that the text is intended for (this has the font settings in it, which
    ''' affects how much space a given set of words takes up)</param>
    ''' <param name="maxWidth">the maximum width allowed for a word</param>
    ''' <returns>a string containing the formatted text with added spaces</returns>
    Protected Function FormatTextToWrap(ByVal text As String, ByVal targetFragment As Fragment, ByVal maxWidth As Integer) As String

        Dim measureShape As Shapes.TextShape
        Dim wrapPosition As Integer
        Dim currentWord As Integer
        Dim wordList As List(Of String)
        Dim separators() As Char = {" "c}

        wordList = New List(Of String)(text.Split(separators))

        currentWord = 0
        While currentWord < wordList.Count
            measureShape = New Shapes.TextShape(10, 10, wordList(currentWord), targetFragment.Font, targetFragment.FontSize)
            If measureShape.Width > maxWidth Then
                wrapPosition = CalculateWrapPosition(wordList(currentWord), targetFragment, maxWidth)
                wordList.Insert(currentWord + 1, wordList(currentWord).Substring(wrapPosition))
                wordList(currentWord) = wordList(currentWord).Substring(0, wrapPosition)
            End If
            currentWord += 1
        End While

        Return String.Join(" ", wordList.ToArray())

    End Function

    Private Function CalculateWrapPosition(ByVal word As String, ByVal targetFragment As Fragment, ByVal maxWidth As Integer) As Integer

        Dim low As Integer = 0
        Dim high As Integer = word.Length - 1
        Dim measureShape As New Shapes.TextShape
        Dim wrapPosition As Integer

        While low <= high
            wrapPosition = (low + high) \ 2
            measureShape = New Shapes.TextShape(10, 10, word.Substring(0, wrapPosition - 1), targetFragment.Font, targetFragment.FontSize)
            If measureShape.Width > maxWidth Then
                high = wrapPosition - 1
            ElseIf measureShape.Width < maxWidth Then
                low = wrapPosition + 1
            Else
                Return wrapPosition ' found
            End If
        End While

        If measureShape.Width > maxWidth Then
            Return wrapPosition - 1
        Else
            Return wrapPosition
        End If

    End Function

#End Region

End Class
