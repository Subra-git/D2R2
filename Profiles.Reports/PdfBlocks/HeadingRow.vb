Imports TallComponents.PDF.Layout
Imports TallComponents.PDF.Layout.Paragraphs
Imports TallComponents.PDF.Layout.Colors

Friend Class HeadingRow
    Inherits Row

    Public Sub New()
        '
    End Sub

    Public Sub New(ByVal caption As String, ByVal level As Integer)
        Me.New(caption, caption, level)
    End Sub

    Public Sub New(ByVal caption As String, ByVal level As Integer, ByVal width As Double, ByVal colSpan As Integer)
        Me.New(caption, caption, level, New Colors.GrayColor(0), New Colors.GrayColor(220), width, colSpan)
    End Sub

    Public Sub New(ByVal caption As String, ByVal bookmark As String, ByVal level As Integer)
        Me.New(caption, bookmark, level, New Colors.GrayColor(0), New Colors.GrayColor(220))
    End Sub

    Public Sub New(ByVal caption As String, ByVal bookmark As String, ByVal level As Integer, ByVal foreColor As Colors.Color, ByVal backColor As Colors.Color)
        Me.Cells.Add(New HeadingCell(caption, bookmark, level, foreColor, backColor))
    End Sub

    Public Sub New(ByVal caption As String, ByVal bookmark As String, ByVal level As Integer, ByVal foreColor As Colors.Color, ByVal backColor As Colors.Color, ByVal width As Double, ByVal colSpan As Integer)
        Me.Cells.Add(New HeadingCell(caption, bookmark, level, foreColor, backColor, width, colSpan))
    End Sub


End Class
