<%@ Page Language="VB" MasterPageFile="~/NestedProfileQuestions.master" AutoEventWireup="false" Inherits="Profiles.Web.EditSpecies" Title="Edit species data" CodeBehind="EditSpecies.aspx.vb" %>

<%@ Register Src="SpeciesSectionLinks.ascx" TagName="SectionLinks" TagPrefix="sec" %>
<%@ Register TagPrefix="pwc" Namespace="Profiles.WebControls.ProfilesWeb.Controls" Assembly="Profiles.WebControls" %>
<%@ Register Src="~/SectionPagination.ascx" TagPrefix="pag" TagName="SectionPagination" %>

<asp:Content ID="navContent" ContentPlaceHolderID="SectionLinksContent" runat="Server">
    <sec:SectionLinks ID="ctlSectionLinks" runat="server" />
</asp:Content>
<asp:Content ID="NestedProfileContent" ContentPlaceHolderID="NestedProfileContent" runat="Server">
    <style>
        .govuk-heading-xl {
            margin-left: 25%;
        }
    </style>
    <script type="text/javascript" src="Javascript/panel-manager.js"></script>
    <table style="width: 100%">
        <tr>
            <td>
                <pwc:InvalidReasonList ID="ctlInvalidReasonList" runat="server" />
            </td>
            <td style="text-align: right">
                <div align="right">
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="govuk-button m-0" />
                </div>
            </td>
        </tr>
    </table>
    <asp:UpdatePanel runat="server" ID="updError" RenderMode="Inline" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Label ID="lblErrorDesc" runat="server" EnableViewState="false" CssClass="ErrorLabel"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
    <pwc:TabStrip ID="tabStrip" runat="server">
        <pwc:TabItem IsActive="true" />
    </pwc:TabStrip>
    <div class="TabBody">
        <div class="govuk-frontend-supported QuestionsPanelSpacer">
            <p style="display: none;">
                <asp:LinkButton ID="lnkExpandAll" runat="server" Style="font-size: 80%;">Expand all</asp:LinkButton>
                <asp:LinkButton ID="lnkCollapseAll" runat="server" Style="font-size: 80%;">Collapse all</asp:LinkButton>
            </p>
            <div class="govuk-accordion" data-module="govuk-accordion" id="accordion-default">
                <div class="govuk-accordion__controls">
                    <button type="button" class="govuk-accordion__show-all" aria-expanded="false" onclick="togglePanelState('<%= lnkExpandAll.ClientID %>', '<%= lnkCollapseAll.ClientID %>');">
                        <span class="govuk-accordion-nav__chevron govuk-accordion-nav__chevron--down" id="expandAllChevron"></span>
                        <span class="govuk-accordion__show-all-text apha-font-size-19" id="expandAllTitle">Show all sections</span></button>
                </div>
                <asp:PlaceHolder ID="plhQuestion" runat="server"></asp:PlaceHolder>
            </div>
        </div>
    </div>
    <table style="width: 100%">
        <tr>
            <td style="text-align: right">
                <div align="right">
                    <asp:Button ID="btnSave2" runat="server" Text="Save" CssClass="govuk-button m-0" />
                </div>
            </td>
        </tr>
    </table>
    <div class="SectionPaginationAdjuster">
        <pag:SectionPagination runat="server" id="SectionPagination" />
    </div>
</asp:Content>
