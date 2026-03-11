Imports TallComponents.PDF.Layout
Imports TallComponents.PDF.Layout.Paragraphs
Imports TallComponents.PDF.Layout.Colors
Imports ProfilesLibrary


Friend Class HeadingCell
    Inherits Cell

    Public Sub New()
        '
    End Sub

    Public Sub New(ByVal caption As String, ByVal bookmark As String, ByVal level As Integer, ByVal foreColor As Colors.Color, ByVal backColor As Colors.Color)
        Me.New(caption, bookmark, level, foreColor, backColor, 0, 1)
    End Sub

    Public Sub New(ByVal caption As String, ByVal bookmark As String, ByVal level As Integer, ByVal foreColor As Colors.Color, ByVal backColor As Colors.Color, ByVal width As Double, ByVal colSpan As Integer)

        Dim safeText As String = caption.StripHtmlTags
        Dim safeBookmark As String = bookmark.StripHtmlTags

        Me.Border = New Border()
        Me.Border.Background = New Brushes.SolidBrush(backColor)

        If colSpan <> 1 Then
            Me.ColSpan = colSpan
            Me.Fixed = True
            Me.PreferredWidth = width
        End If

        Dim titleLabel As New Heading(level)
        titleLabel.Caption = safeText
        titleLabel.Padding.Left = 5
        titleLabel.Padding.Right = 5

        Dim titleFragment As New Fragment(safeText)
        titleFragment.TextColor = foreColor
        titleLabel.Fragments.Add(titleFragment)
        titleLabel.Bookmark = safeBookmark
        Me.Paragraphs.Add(titleLabel)

    End Sub

End Class
