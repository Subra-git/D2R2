Imports System
Imports System.ComponentModel
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Text
Imports ProfilesLibrary

Namespace Profiles.WebControls.SearchControls

    Public Class ScenarioResultListItem
        Inherits ResultListItemBase

        Private mScenario As ProfileScenarioInfo
        Private mPublished As StatusResultListItem
        Private mDraft As StatusResultListItem

        Friend Property Scenario() As ProfileScenarioInfo
            Get
                Return mScenario
            End Get
            Set(ByVal value As ProfileScenarioInfo)
                mScenario = value
            End Set
        End Property

        Protected Overrides ReadOnly Property MainCssClass() As String
            Get
                Return "searchlistScenario"
            End Get
        End Property

        Protected Overrides ReadOnly Property ItemCssClass() As String
            Get
                Return "searchlistScenarioItem"
            End Get
        End Property

        Protected Overrides ReadOnly Property DefaultExpanded() As Boolean
            Get
                Return True
            End Get
        End Property

        Protected Overrides Sub CreateChildControls()

            mPublished = New StatusResultListItem
            AddChildListItem(mPublished)
            mPublished.ID = "_statusP" & mScenario.Id.ToString().Replace("-", String.Empty)
            mPublished.Scenario = mScenario
            mPublished.Status = ProfileVersionStatus.Published

            mDraft = New StatusResultListItem
            AddChildListItem(mDraft)
            mDraft.ID = "_statusD" & mScenario.Id.ToString().Replace("-", String.Empty)
            mDraft.Scenario = mScenario
            mDraft.Status = ProfileVersionStatus.Draft

        End Sub

        Protected Friend Sub FilterList(ByVal displayPublished As Boolean, ByVal displayDraft As Boolean)

            EnsureChildControls()
            mPublished.Visible = displayPublished
            mDraft.Visible = displayDraft

        End Sub

        Public Overrides Function ToString() As String
            Return mScenario.ScenarioTitle
        End Function

        Protected Overrides Sub RenderItem(ByVal writer As System.Web.UI.HtmlTextWriter)

            writer.RenderBeginTag(HtmlTextWriterTag.Tr)
            writer.AddStyleAttribute(HtmlTextWriterStyle.Padding, "0px")
            writer.AddStyleAttribute(HtmlTextWriterStyle.VerticalAlign, "middle")
            writer.RenderBeginTag(HtmlTextWriterTag.Td)
            writer.Write(mScenario.ScenarioTitle)
            writer.RenderEndTag() 'Td

            If mScenario.UserRole.Length > 0 Then
                writer.AddStyleAttribute(HtmlTextWriterStyle.Padding, "0px")
                writer.AddStyleAttribute(HtmlTextWriterStyle.VerticalAlign, "middle")
                writer.AddStyleAttribute(HtmlTextWriterStyle.FontWeight, "normal")
                writer.RenderBeginTag(HtmlTextWriterTag.Td)
                writer.Write("You are a " & mScenario.UserRole.ToLower().Replace("va", "VA"))
                writer.RenderEndTag() 'Td
            End If

            writer.RenderEndTag() 'Tr

        End Sub

        Protected Overrides Sub RenderLinks(ByVal writer As System.Web.UI.HtmlTextWriter)

            If Profile.CanEditProfile() Then
                writer.AddAttribute(HtmlTextWriterAttribute.Href, String.Format("ManageProfile.aspx?ProfileId={0}", mScenario.Id))
                writer.RenderBeginTag(HtmlTextWriterTag.A)
                writer.Write("Manage")
                writer.RenderEndTag() 'A
            End If


            If Profile.CanGetContributionsReport() Then
                writer.Write(" ")
                writer.AddAttribute(HtmlTextWriterAttribute.Href, String.Format("ShowContributionReport.aspx?ProfileId={0}", mScenario.Id))
                writer.AddAttribute(HtmlTextWriterAttribute.Target, "_Blank")
                writer.RenderBeginTag(HtmlTextWriterTag.A)
                writer.Write("Contributions")
                writer.RenderEndTag() 'A
            End If

        End Sub

    End Class

End Namespace


