Imports System
Imports System.ComponentModel
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Text
Imports ProfilesLibrary

Namespace ProfilesWeb.Controls

    Public Class StatusResultListItem
        Inherits ResultListItemBase

        Private mScenario As ProfileScenarioInfo
        Private mStatus As ProfileVersionStatus

        Friend Property Scenario() As ProfileScenarioInfo
            Get
                Return mScenario
            End Get
            Set(ByVal value As ProfileScenarioInfo)
                mScenario = value
            End Set
        End Property

        Friend Property Status() As ProfileVersionStatus
            Get
                Return mStatus
            End Get
            Set(ByVal value As ProfileVersionStatus)
                mStatus = value
            End Set
        End Property

        Protected Overrides Sub CreateChildControls()

            For Each version As ProfileVersionSummaryInfo In GetVersions()
                Dim versionItem As New VersionResultListItem
                versionItem.ID = "_versionItem" & version.Id.ToString().Replace("-", String.Empty)
                AddChildListItem(versionItem)
                versionItem.Version = version
            Next

        End Sub

        Public Overrides Function ToString() As String
            Return mStatus.ToString()
        End Function

        Protected Overrides Sub RenderItem(ByVal writer As System.Web.UI.HtmlTextWriter)

            writer.RenderBeginTag(HtmlTextWriterTag.Tr)
            writer.AddStyleAttribute(HtmlTextWriterStyle.Padding, "0px")
            writer.AddStyleAttribute(HtmlTextWriterStyle.VerticalAlign, "middle")
            writer.RenderBeginTag(HtmlTextWriterTag.Td)

            writer.Write(mStatus.ToString())

            Dim currentVersion As ProfileVersionSummaryInfo = GetVersions().CurrentVersion
            If currentVersion Is Nothing Then
                writer.AddStyleAttribute(HtmlTextWriterStyle.FontSize, "smaller")
                writer.RenderBeginTag(HtmlTextWriterTag.Span)
                writer.Write("&nbsp;(No current " & mStatus.ToString.ToLower() & " version)")
                writer.RenderEndTag() 'Span
            End If

            writer.RenderEndTag() 'Td

            If currentVersion IsNot Nothing Then
                writer.AddStyleAttribute(HtmlTextWriterStyle.Padding, "0px")
                writer.AddStyleAttribute(HtmlTextWriterStyle.VerticalAlign, "middle")
                writer.AddStyleAttribute(HtmlTextWriterStyle.Color, "#999933")
                writer.RenderBeginTag(HtmlTextWriterTag.Td)
                writer.Write("&nbsp;Current version: " & currentVersion.Version)
                writer.RenderEndTag() 'Td
            End If

            writer.RenderEndTag() 'Tr

            writer.RenderBeginTag(HtmlTextWriterTag.Tr)
            writer.AddStyleAttribute(HtmlTextWriterStyle.Padding, "0px")
            writer.AddStyleAttribute(HtmlTextWriterStyle.VerticalAlign, "middle")
            writer.RenderBeginTag(HtmlTextWriterTag.Td)

            writer.Write(String.Empty)

            If currentVersion IsNot Nothing AndAlso currentVersion.Status = ProfileVersionStatus.Draft Then
                writer.AddStyleAttribute(HtmlTextWriterStyle.Padding, "0px")
                writer.AddStyleAttribute(HtmlTextWriterStyle.VerticalAlign, "middle")
                writer.AddStyleAttribute(HtmlTextWriterStyle.Color, "#999933")
                writer.RenderBeginTag(HtmlTextWriterTag.Td)

                If String.IsNullOrEmpty(Scenario.ProfileStatus) Then
                    writer.Write("&nbsp;Profile status: None<br/>")
                Else
                    writer.Write("&nbsp;Profile status: " & Scenario.ProfileStatus & "<br/>")
                End If

                If Scenario.NextReviewDate.IsEmpty Then
                    If Scenario.ReviewIncomplete Then
                        writer.Write("&nbsp;Review incomplete")
                    Else
                        writer.Write("&nbsp;Review complete")
                    End If
                Else
                    If Scenario.NextReviewDate < DateTime.Now() Then
                        writer.Write("&nbsp;Review overdue: " & Scenario.NextReviewDate.ToString())
                    Else
                        writer.Write("&nbsp;Next review: " & Scenario.NextReviewDate.ToString())
                    End If
                End If

                writer.RenderEndTag() 'Td
            End If

            writer.RenderEndTag() 'Tr

        End Sub

        Protected Overrides Sub RenderLinks(ByVal writer As System.Web.UI.HtmlTextWriter)

            Dim currentVersion As ProfileVersionSummaryInfo = GetVersions().CurrentVersion

            If currentVersion IsNot Nothing AndAlso Not Me.Expanded Then

                If currentVersion.Status = ProfileVersionStatus.Published Then
                    writer.AddAttribute(HtmlTextWriterAttribute.Href, String.Format("ProfileReports.aspx?ProfileVersionId={0}", currentVersion.Id))
                    writer.RenderBeginTag(HtmlTextWriterTag.A)
                    writer.Write("Reports")
                    writer.RenderEndTag() 'A

                    writer.Write("&nbsp;")
                End If

                writer.AddAttribute(HtmlTextWriterAttribute.Href, String.Format("EditProfileQuestions.aspx?ProfileVersionId={0}", currentVersion.Id))
                If Not ProfileVersionSection.CanGetProfileVersionSection(currentVersion.Id) Then
                    writer.AddAttribute(HtmlTextWriterAttribute.Onclick, "alert('You do not have permission to view the content of this draft profile. Please contact the D2R2 team to obtain access to this profile.');return false;")
                End If
                writer.RenderBeginTag(HtmlTextWriterTag.A)
                writer.Write("Browse")
                writer.RenderEndTag() 'A

                If Profile.CanCreateProfile() AndAlso Not currentVersion.IsWhatIfScenario Then

                    writer.Write("&nbsp;")
                    writer.AddAttribute(HtmlTextWriterAttribute.Href, String.Format("ProfileProperties.aspx?CloneProfileVersionId={0}", currentVersion.Id))
                    writer.RenderBeginTag(HtmlTextWriterTag.A)
                    writer.Write("Clone profile")
                    writer.RenderEndTag() 'A
                End If

                If Profile.CanCreateScenario() Then

                    writer.Write("&nbsp;")
                    writer.AddAttribute(HtmlTextWriterAttribute.Href, String.Format("ProfileProperties.aspx?CloneProfileVersionId={0}&Scenario=1", currentVersion.Id))
                    writer.RenderBeginTag(HtmlTextWriterTag.A)
                    writer.Write("Clone scenario")
                    writer.RenderEndTag() 'A
                End If

            End If

        End Sub

        Private Function GetVersions() As ProfileVersionSummaryInfoList

            If mStatus = ProfileVersionStatus.Draft Then
                Return mScenario.GetDraftVersions()
            End If

            If mStatus = ProfileVersionStatus.Published Then
                Return mScenario.GetPublishedVersions()
            End If

            Return Nothing

        End Function

    End Class

End Namespace



