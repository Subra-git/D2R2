Imports System.Web.UI
Imports Microsoft.VisualBasic
Imports ProfilesLibrary

Namespace Profiles.WebControls.AnswerControls

    Public Class NoteListRenderer
        Implements IRenderer

        Dim mNoteList As NoteList
        Dim mNoteListType As String

        Public Sub New(ByVal noteType As String, ByVal notes As NoteList)
            mNoteListType = noteType
            mNoteList = notes
        End Sub

        Public Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter) Implements IRenderer.Render

            'begin the table
            writer.AddStyleAttribute(HtmlTextWriterStyle.Width, "100%")
            writer.RenderBeginTag(HtmlTextWriterTag.Table)
            writer.RenderBeginTag(HtmlTextWriterTag.Tr)
            writer.AddStyleAttribute(HtmlTextWriterStyle.Width, "10%")
            writer.AddStyleAttribute(HtmlTextWriterStyle.TextAlign, "left")
            writer.RenderBeginTag(HtmlTextWriterTag.Th)
            writer.Write("Question")
            writer.RenderEndTag() '/th
            writer.AddStyleAttribute(HtmlTextWriterStyle.TextAlign, "left")
            writer.RenderBeginTag(HtmlTextWriterTag.Th)
            writer.Write(mNoteListType)
            writer.RenderEndTag() '/th
            writer.RenderEndTag() '/tr

            If mNoteList.Count > 0 Then

                For Each note As Note In mNoteList

                    writer.RenderBeginTag(HtmlTextWriterTag.Tr)
                    writer.AddStyleAttribute(HtmlTextWriterStyle.TextAlign, "left")
                    writer.RenderBeginTag(HtmlTextWriterTag.Td)
                    writer.Write(note.ReferenceList.QuestionReferenceListText)
                    writer.RenderEndTag() '/Td

                    writer.AddStyleAttribute(HtmlTextWriterStyle.TextAlign, "left")
                    writer.RenderBeginTag(HtmlTextWriterTag.Td)
                    writer.Write(note.NoteText)
                    writer.RenderEndTag() '/Td
                    writer.RenderEndTag() '/Tr

                Next

            Else
                writer.RenderBeginTag(HtmlTextWriterTag.Tr)
                writer.AddStyleAttribute(HtmlTextWriterStyle.TextAlign, "center")
                writer.AddAttribute(HtmlTextWriterAttribute.Colspan, "2")
                writer.RenderBeginTag(HtmlTextWriterTag.Td)
                writer.Write("- No references supplied -")
                writer.RenderEndTag() '/Td
                writer.RenderEndTag() '/Tr
            End If

            writer.RenderEndTag() '/Table

        End Sub

    End Class

End Namespace



