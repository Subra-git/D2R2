Imports System.Web.UI
Imports Microsoft.VisualBasic
Imports ProfilesLibrary

Namespace Profiles.WebControls.AnswerControls

    Public Class SectionNoteListRenderer
        Implements IRenderer

        Dim mSection As ProfileSectionMetadata
        Dim mProfileVersionId As Guid

        Public Sub New(ByVal section As ProfileSectionMetadata, ByVal profileVersionId As Guid)
            mSection = section
            mProfileVersionId = profileVersionId
        End Sub

        Public Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter) Implements IRenderer.Render

            writer.AddAttribute(HtmlTextWriterAttribute.Border, "0")
            writer.AddAttribute(HtmlTextWriterAttribute.Width, "100%")
            writer.AddAttribute(HtmlTextWriterAttribute.Cellpadding, "0")
            writer.AddAttribute(HtmlTextWriterAttribute.Cellspacing, "0")
            writer.RenderBeginTag(HtmlTextWriterTag.Table)
            writer.RenderBeginTag(HtmlTextWriterTag.Tr)

            writer.AddStyleAttribute(HtmlTextWriterStyle.TextAlign, "left")
            writer.RenderBeginTag(HtmlTextWriterTag.Th)
            writer.Write("&nbsp;" & mSection.SectionNumber & ". " & mSection.Name)
            writer.RenderEndTag() '/th
            writer.AddStyleAttribute(HtmlTextWriterStyle.MarginRight, "5px")
            writer.AddStyleAttribute(HtmlTextWriterStyle.TextAlign, "right")

            writer.RenderEndTag() '/tr
            writer.RenderBeginTag(HtmlTextWriterTag.Tr)
            writer.AddStyleAttribute(HtmlTextWriterStyle.MarginTop, "0")
            writer.AddStyleAttribute(HtmlTextWriterStyle.PaddingTop, "0")
            writer.RenderBeginTag(HtmlTextWriterTag.Td)
            writer.AddAttribute(HtmlTextWriterAttribute.Class, "lightgreenborder")
            writer.AddStyleAttribute(HtmlTextWriterStyle.MarginTop, "0")
            writer.AddStyleAttribute(HtmlTextWriterStyle.PaddingTop, "10px")
            writer.RenderBeginTag(HtmlTextWriterTag.Div)

            For Each noteType As NoteTypeInfo In NoteTypeInfoList.GetNoteTypeInfoList()
                Dim innerRenderer As New NoteListRenderer(noteType.Name, NoteList.GetNoteListBySection(mProfileVersionId, mSection.Id, noteType.Id))
                innerRenderer.Render(writer)
            Next

            writer.RenderEndTag() '/div
            writer.RenderEndTag() '/td
            writer.RenderEndTag() '/tr

            writer.RenderEndTag() '/table

        End Sub

    End Class

End Namespace



