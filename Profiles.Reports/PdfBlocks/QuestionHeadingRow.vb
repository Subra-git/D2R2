Imports ProfilesLibrary
Imports TallComponents.PDF.Layout
Imports TallComponents.PDF.Layout.Paragraphs
Imports TallComponents.PDF.Layout.Colors

Friend Class QuestionHeadingRow
    Inherits HeadingRow

    Public Sub New(ByVal caption As String, ByVal bookmark As String, ByVal level As Integer)
        MyBase.New(caption, bookmark, level, New Colors.GrayColor(255), New Colors.RgbColor(0, 163, 59))
    End Sub

    Public Sub New(ByVal question As QuestionBase, ByVal sectionNumber As Integer, ByVal level As Integer)
        Me.New( _
            String.Format("{0}.{1} {2}", sectionNumber.ToString(), question.QuestionNumber.ToString(), question.Name), _
            String.Format("{0}.{1}", sectionNumber.ToString(), question.QuestionNumber.ToString()), _
            level)
    End Sub

End Class
