Imports System.Web.UI
Imports Microsoft.VisualBasic
Imports ProfilesLibrary

Namespace Profiles.WebControls.AnswerControls

    Public Class SectionPanel
        Inherits LiteralControl

        Private mSection As SectionBase
        Private mProfileVersionId As Guid

        Public Property Section() As SectionBase
            Get
                Return mSection
            End Get
            Set(ByVal value As SectionBase)
                mSection = value
            End Set
        End Property

        Public Property ProfileVersionId() As Guid
            Get
                Return mProfileVersionId
            End Get
            Set(ByVal value As Guid)
                mProfileVersionId = value
            End Set
        End Property

        Protected Overrides Sub Render(ByVal output As System.Web.UI.HtmlTextWriter)

            If mSection IsNot Nothing Then

                For Each question As QuestionBase In mSection.Questions
                    Dim title As String = String.Format("{0}.{1} {2}", _
                        mSection.SectionNumber.ToString(), _
                        question.QuestionNumber.ToString(), _
                        question.Name)
                    Dim panel As New QuestionRenderer(title, question, Not mProfileVersionId.Equals(Guid.Empty))
                    panel.Render(output)
                Next

            Else

                Dim sectionList As ProfileSectionMetadataList = ProfileSectionMetadataList.GetProfileSectionMetadataList()
                For Each section As ProfileSectionMetadata In sectionList
                    Dim sectionNotes As New SectionNoteListRenderer(section, mProfileVersionId)
                    sectionNotes.Render(output)
                Next
            End If

        End Sub

    End Class

End Namespace