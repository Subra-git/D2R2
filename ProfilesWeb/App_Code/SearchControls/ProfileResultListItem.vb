Imports System
Imports System.ComponentModel
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Text
Imports System.Collections.Generic
Imports ProfilesLibrary

Namespace ProfilesWeb.Controls

    Public Class ProfileResultListItem
        Inherits ResultListItemBase

        Private mProfile As ProfileInfo

        Public Property Profile() As ProfileInfo
            Get
                Return mProfile
            End Get
            Set(ByVal value As ProfileInfo)
                mProfile = value
            End Set
        End Property

        Protected Friend Property Included() As Boolean
            Get
                If ViewState("Included") Is Nothing Then
                    Return False
                End If
                Return CBool(ViewState("Included"))
            End Get
            Set(ByVal value As Boolean)
                ViewState("Included") = value
            End Set
        End Property

        Protected Overrides ReadOnly Property MainCssClass() As String
            Get
                Return "searchlistProfile"
            End Get
        End Property

        Protected Overrides ReadOnly Property ItemCssClass() As String
            Get
                Return "searchlistProfileItem"
            End Get
        End Property

        Protected Overrides Sub CreateChildControls()

            For Each scenario As ProfileScenarioInfo In Profile.GetScenarios()
                Dim scenarioItem As New ScenarioResultListItem
                scenarioItem.ID = "_scenario" & scenario.Id.ToString().Replace("-", String.Empty)
                AddChildListItem(scenarioItem)
                scenarioItem.Scenario = scenario
            Next

        End Sub

        Protected Friend Sub FilterList(ByVal displayPublished As Boolean, ByVal displayDraft As Boolean, ByVal displayScenarios As Boolean, ByVal displayMyProfiles As Boolean, ByVal speciesList As List(Of Guid))

            Dim currentScenario As ScenarioResultListItem
            Dim scenarioIncluded As Boolean

            For currentControl As Integer = 0 To Me.Controls.Count - 1
                currentScenario = DirectCast(Controls(currentControl), ScenarioResultListItem)
                scenarioIncluded = (currentControl < 1 OrElse displayScenarios) AndAlso _
                    (currentScenario.Scenario.UserRole.Length > 0 Or (Not displayMyProfiles)) AndAlso _
                    (speciesList Is Nothing OrElse speciesList.Count = 0 OrElse currentScenario.Scenario.ContainsSpecies(speciesList))
                currentScenario.Visible = scenarioIncluded
                If scenarioIncluded Then
                    Included = True
                    currentScenario.FilterList(displayPublished, displayDraft)
                End If
            Next

        End Sub

        Public Overrides Function ToString() As String
            Return Profile.Title
        End Function

        Protected Overrides Sub RenderItem(ByVal writer As System.Web.UI.HtmlTextWriter)

            writer.RenderBeginTag(HtmlTextWriterTag.Tr)
            writer.AddStyleAttribute(HtmlTextWriterStyle.Padding, "0px")
            writer.AddStyleAttribute(HtmlTextWriterStyle.VerticalAlign, "middle")
            writer.RenderBeginTag(HtmlTextWriterTag.Td)

            writer.Write(Profile.Title)
            Dim scenarioCount As Integer = GetScenarioCount()
            If Not Me.Expanded AndAlso scenarioCount > 0 Then
                writer.AddStyleAttribute(HtmlTextWriterStyle.FontSize, "smaller")
                writer.RenderBeginTag(HtmlTextWriterTag.Span)
                writer.Write(String.Format( _
                            "&nbsp;( + {0} scenario{1})", _
                            scenarioCount, _
                            IIf(scenarioCount > 1, "s", String.Empty).ToString() _
                            ))
                writer.RenderEndTag() 'Span
            End If

            writer.RenderEndTag() 'Td
            writer.RenderEndTag() 'Tr

        End Sub

        Private Function GetScenarioCount() As Integer

            Dim currentScenario As ScenarioResultListItem
            Dim scenarioCount As Integer
            For currentControl As Integer = 0 To Me.Controls.Count - 1
                currentScenario = DirectCast(Controls(currentControl), ScenarioResultListItem)
                If currentScenario.Visible AndAlso currentScenario.Scenario.IsWhatIfScenario Then
                    scenarioCount += 1
                End If
            Next

            Return scenarioCount

        End Function

        Protected Overrides Sub RenderLinks(ByVal writer As System.Web.UI.HtmlTextWriter)

            If ProfilesLibrary.Profile.CanEditProfile() Then
                writer.AddAttribute(HtmlTextWriterAttribute.Href, String.Format("EditProfileTitle.aspx?ProfileId={0}", Profile.Id))
                writer.RenderBeginTag(HtmlTextWriterTag.A)
                writer.Write("Edit title")
                writer.RenderEndTag() 'A
            End If

        End Sub

    End Class

End Namespace

