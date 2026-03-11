<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false"
    CodeFile="EditSpecies.aspx.vb" Inherits="EditSpecies" Title="Edit species data" %>

<%@ MasterType TypeName="ProfilesTemplate" %>
<%@ Register Src="SpeciesSectionLinks.ascx" TagName="SectionLinks" TagPrefix="sec" %>
<%@ Register TagPrefix="pwc" Namespace="Profiles.WebControls.ProfilesWeb.Controls" Assembly="Profiles.WebControls" %>
<asp:Content ID="navContent" ContentPlaceHolderID="cphNavigation" runat="Server">
    <sec:SectionLinks ID="ctlSectionLinks" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <table style="width: 100%">
        <tr>
            <td style="text-align: right" colspan="2">
                <asp:LinkButton ID="lnkSpeciesReference" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <pwc:InvalidReasonList ID="ctlInvalidReasonList" runat="server" />
                &nbsp;
            </td>
            <td style="text-align: right">
                <div align="right">
                    <asp:Button ID="btnSave" runat="server" Text="Save" />
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
        <p>
            <asp:ImageButton ID="imgExpandAll" runat="server" AlternateText="Expand all" ImageUrl="~/Images/ExpandPanel.gif" />
            <asp:LinkButton ID="lnkExpandAll" runat="server" Style="font-size: 80%;">Expand all</asp:LinkButton>
            <asp:ImageButton ID="imgCollapseAll" runat="server" AlternateText="Collapse all"
                ImageUrl="~/Images/CollapsePanel.gif" />
            <asp:LinkButton ID="lnkCollapseAll" runat="server" Style="font-size: 80%;">Collapse all</asp:LinkButton></p>
        <asp:PlaceHolder ID="plhQuestion" runat="server"></asp:PlaceHolder>
    </div>
    <table style="width: 100%">
        <tr>
            <td style="text-align: right">
                <div align="right">
                    <asp:Button ID="btnSave2" runat="server" Text="Save" />
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
