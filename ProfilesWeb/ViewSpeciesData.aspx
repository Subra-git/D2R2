<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false"
    CodeFile="ViewSpeciesData.aspx.vb" Inherits="ViewSpeciesData" Title="View species data" %>

<%@ Register Src="NavigationLinks.ascx" TagName="NavigationLinks" TagPrefix="nav" %>
<%@ Register Assembly="RadTreeView.Net2" Namespace="Telerik.WebControls" TagPrefix="radT" %>
<asp:Content ID="navContent" ContentPlaceHolderID="cphNavigation" runat="Server">
    <nav:NavigationLinks ID="ctlNavigationLinks" runat="server" />
</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" runat="Server">
    <div style="float: left">
        This page details the species that are used by the Profiles system. It is presented
        as a hierarchical list that groups species into groups; a profile can reference
        an individual species or an entire species group. Click on any species or species
        group to view the data that is associated with that species.
        <br />
        <br />
    </div>
    <div style="width: 100%; float: left; margin-top: 10px;">
        <table width="100%">
            <tr>
                <td style="width: 60%;">
                    <div style="border-width: 1px; border-style: solid">
                        <radT:RadTreeView ID="tvwSpecies" runat="server" CheckBoxes="False" TabIndex="1"
                            AccessKey="S" DataFieldID="Id" DataFieldParentID="ParentId" Height="200px" AutoPostBack="False">
                        </radT:RadTreeView>
                    </div>
                </td>
                <td style="width: 10%; text-align: center; vertical-align: middle;" align="center">
                    <br />
                </td>
                <td style="width: 30%; text-align: center;" align="center">
                    <asp:Button ID="btnViewData" runat="server" Text="View data" Width="150" />
                </td>
            </tr>
        </table>
        <br />
        <asp:Label ID="lblSelectNode" runat="server" CssClass="ErrorLabel"></asp:Label><br />
        <%--        <asp:Label ID="lblErrorMsg" CssClass="ErrorLabel" runat="server" EnableViewState="false"></asp:Label>
                <asp:Panel ID="pnlViewSpeciesData" runat="server" Visible="False">
                    <div class="collapsePanelHeader">
                        <asp:Label ID="lblPanelTitle" runat="server"></asp:Label></div>
                    <div class="collapsePanel">
                        <asp:PlaceHolder ID="plhSpeciesData" runat="server"></asp:PlaceHolder>
                        <table width="100%">
                            <tr>
                                <td style="width:20%">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                 <td>
                                 </td>
                                 <td>
                                     &nbsp;</td>
                            </tr>
                        </table>
                    </div>
                </asp:Panel>--%>
    </div>
</asp:Content>
