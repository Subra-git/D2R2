Imports System
Imports System.ComponentModel
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Text
Imports ProfilesLibrary

Namespace ProfilesWeb.Controls

    Public Class VersionResultListItem
        Inherits ResultListItemBase

        Private mVersion As ProfileVersionSummaryInfo

        Friend Property Version() As ProfileVersionSummaryInfo
            Get
                Return mVersion
            End Get
            Set(ByVal value As ProfileVersionSummaryInfo)
                mVersion = value
            End Set
        End Property

        Protected Overrides ReadOnly Property ItemCssClass() As String
            Get
                Return "searchlistVersionItem"
            End Get
        End Property

        Public Overrides Function ToString() As String
            Return mVersion.ToString()
        End Function

        Protected Overrides Sub RenderItem(ByVal writer As System.Web.UI.HtmlTextWriter)

            writer.RenderBeginTag(HtmlTextWriterTag.Tr)

            writer.AddStyleAttribute(HtmlTextWriterStyle.Width, "30px")
            writer.AddStyleAttribute(HtmlTextWriterStyle.Padding, "0px")
            writer.AddStyleAttribute(HtmlTextWriterStyle.VerticalAlign, "middle")
            writer.RenderBeginTag(HtmlTextWriterTag.Td)
            writer.Write(mVersion.Version)
            writer.RenderEndTag() 'Td

            writer.AddStyleAttribute(HtmlTextWriterStyle.Padding, "0px")
            writer.AddStyleAttribute(HtmlTextWriterStyle.VerticalAlign, "middle")
            writer.RenderBeginTag(HtmlTextWriterTag.Td)
            writer.Write(mVersion.EffectiveDates)
            If mVersion.IsPublic Then
                writer.Write("&nbsp;&nbsp;&nbsp;(public)")
            End If
            writer.RenderEndTag() 'Td

            writer.RenderEndTag() 'Tr

        End Sub

        Protected Overrides Sub RenderLinks(ByVal writer As System.Web.UI.HtmlTextWriter)

            If mVersion.Status = ProfileVersionStatus.Published Then
                writer.AddAttribute(HtmlTextWriterAttribute.Href, String.Format("ProfileReports.aspx?ProfileVersionId={0}", mVersion.Id))
                writer.RenderBeginTag(HtmlTextWriterTag.A)
                writer.Write("Reports")
                writer.RenderEndTag() 'A

                writer.Write("&nbsp;")
            End If

            writer.AddAttribute(HtmlTextWriterAttribute.Href, String.Format("EditProfileQuestions.aspx?ProfileVersionId={0}", mVersion.Id))
            If Not ProfileVersionSection.CanGetProfileVersionSection(mVersion.Id) Then
                writer.AddAttribute(HtmlTextWriterAttribute.Onclick, "alert('You do not have permission to view the content of this draft profile. Please contact the D2R2 team to obtain access to this profile.');return false;")
            End If
            writer.RenderBeginTag(HtmlTextWriterTag.A)
            writer.Write("Browse")
            writer.RenderEndTag() 'A

            If Profile.CanCreateProfile() AndAlso Not mVersion.IsWhatIfScenario Then

                writer.Write("&nbsp;")
                writer.AddAttribute(HtmlTextWriterAttribute.Href, String.Format("ProfileProperties.aspx?CloneProfileVersionId={0}", mVersion.Id))
                writer.RenderBeginTag(HtmlTextWriterTag.A)
                writer.Write("Clone profile")
                writer.RenderEndTag() 'A
            End If

            If Profile.CanCreateScenario() Then

                writer.Write("&nbsp;")
                writer.AddAttribute(HtmlTextWriterAttribute.Href, String.Format("ProfileProperties.aspx?CloneProfileVersionId={0}&Scenario=1", mVersion.Id))
                writer.RenderBeginTag(HtmlTextWriterTag.A)
                writer.Write("Clone scenario")
                writer.RenderEndTag() 'A
            End If

        End Sub

    End Class

End Namespace



