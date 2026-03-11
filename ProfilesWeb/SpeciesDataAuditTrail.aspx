<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false"
    CodeFile="SpeciesDataAuditTrail.aspx.vb" Inherits="SpeciesDataAuditTrail" Title="Species data audit trail" %>

<%@ Register Src="NavigationLinks.ascx" TagName="NavigationLinks" TagPrefix="nav" %>
<asp:Content ID="navContent" ContentPlaceHolderID="cphNavigation" runat="Server">
    <nav:NavigationLinks ID="ctlNavigationLinks" runat="server" />
</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" runat="Server">
    <table style="width:100%">
        <tr>
            <td style="text-align:right">
                <asp:HyperLink ID="lnkSpeciesReference" runat="server" NavigateUrl="~/MaintainSpeciesData.aspx">Maintain species data</asp:HyperLink>
            </td>
        </tr>
    </table>
    <div style="width: 100%; float: left; margin-top: 10px;">
        <asp:UpdatePanel runat="server" ID="pnlUpdate">
            <ContentTemplate>
                <pwc:GridView ID="grdAuditTrail" runat="server" AllowPaging="True" AllowSorting="True"
                    AutoGenerateColumns="False" DataSourceID="dsSpeciesDataAuditTrailInfoList" Width="100%"
                    GridLines="None" CssClass="gridview" DefaultSortExpression="LogDate" DefaultSortDirection="Descending">
                    <Columns>
                        <asp:BoundField DataField="OldName" HeaderText="Old name" SortExpression="OldName" />
                        <asp:BoundField DataField="NewName" HeaderText="New name" SortExpression="NewName" />
                        <asp:BoundField DataField="User" HeaderText="User" SortExpression="User" />
                        <asp:BoundField DataField="LogDate" HeaderText="Date of change" SortExpression="LogDate"
                            DataFormatString="{0:d MMMM yyyy hh:mm}" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lnkViewDetails" CommandArgument='<% # Eval("Id") %>'
                                    CommandName="ViewDetails" Text="View details" CausesValidation="false"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle CssClass="gridviewHeader" />
                    <RowStyle CssClass="gridviewRow" />
                    <AlternatingRowStyle CssClass="gridviewAltRow" />
                </pwc:GridView>
                <csla:CslaDataSource ID="dsSpeciesDataAuditTrailInfoList" runat="server" TypeAssemblyName="ProfilesLibrary"
                    TypeName="ProfilesLibrary.SpeciesDataAuditTrailInfoList">
                </csla:CslaDataSource>
                <br />
                <br />
                <asp:Label ID="lblErrorMsg" CssClass="ErrorLabel" runat="server" Visible="False"></asp:Label>
                <div>
                    &nbsp;</div>
                <asp:Panel ID="pnlAuditDetails" runat="server" Visible="False">
                    <div class="collapsePanelHeader">
                        <asp:Label ID="lblPanelTitle" runat="server"></asp:Label></div>
                    <div class="collapsePanel">
                        <table width="100%">
                            <tr>
                                <td style="width: 15%">
                                    Old name:
                                </td>
                                <td style="width: 35%">
                                    <asp:TextBox ID="txtOldName" runat="server" style="width:95%" Enabled="false" />
                                </td>
                                <td style="width: 15%">
                                    New name:
                                </td>
                                <td style="width: 35%">
                                    <asp:TextBox ID="txtNewName" runat="server" style="width:95%" Enabled="false" />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 15%">
                                    Old parent:
                                </td>
                                <td style="width: 35%">
                                    <asp:TextBox ID="txtOldParent" runat="server" style="width:95%" 
                                        Enabled="false" />
                                </td>
                                <td style="width: 15%">
                                    New parent:
                                </td>
                                <td style="width: 35%">
                                    <asp:TextBox ID="txtNewParent" runat="server" style="width:95%" 
                                        Enabled="false" />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 15%">
                                    Changed by:
                                </td>
                                <td style="width: 35%">
                                    <asp:TextBox ID="txtUser" runat="server" style="width:95%" Enabled="false" />
                                </td>
                                <td>
                                    Date of change:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDateOfChange" runat="server" style="width:95%" 
                                        Enabled="false" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Reason for change:
                                </td>
                                <td colspan="3">
                                    <asp:TextBox ID="txtReasonForChange" runat="server" style="width:98%" 
                                        Enabled="false" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
