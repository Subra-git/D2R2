<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false" Inherits="Profiles.Web.SpeciesDataAuditTrail" Title="Species data audit trail" Codebehind="SpeciesDataAuditTrail.aspx.vb" %>

<%@ Register Src="NavigationLinks.ascx" TagName="NavigationLinks" TagPrefix="nav" %>
<%@ Register Src="Paginator.ascx" TagName="Paginator" TagPrefix="auc" %>
<%@ Register Src="~/PaginatorPageSize.ascx" TagPrefix="auc" TagName="PaginatorPageSize" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" runat="Server">
    <table style="width:100%">
        <tr>
            <td style="text-align:right">
                <asp:HyperLink ID="lnkSpeciesReference" runat="server" NavigateUrl="~/MaintainSpeciesData.aspx" CssClass="govuk-link">Maintain species data</asp:HyperLink>
            </td>
        </tr>
    </table>
    <div style="width: 100%; float: left; margin-top: 10px;">
        <asp:UpdatePanel runat="server" ID="pnlUpdate">
            <ContentTemplate>
                <div class="row">
                    <auc:PaginatorPageSize runat="server" ID="PaginatorPageSize" PaginatorId="bottomPaginator" GridId="grdAuditTrail" />
                </div>
                <pwc:GridViewExternalPaging ID="grdAuditTrail" runat="server" AllowPaging="True" AllowSorting="True"
                    AutoGenerateColumns="False" DataSourceID="dsSpeciesDataAuditTrailInfoList" Width="100%"
                    GridLines="None" CssClass="gridview" DefaultSortExpression="LogDate" DefaultSortDirection="Descending">
                    <Columns>
                        <asp:BoundField DataField="OldName" HeaderText="Old name" SortExpression="OldNamePlainText" HtmlEncode="false"/>
                        <asp:BoundField DataField="NewName" HeaderText="New name" SortExpression="NewNamePlainText" HtmlEncode="false"/>
                        <asp:BoundField DataField="User" HeaderText="User" SortExpression="User" HtmlEncode="false"/>
                        <asp:BoundField DataField="LogDate" HeaderText="Date of change" SortExpression="LogDate"
                            DataFormatString="{0:d MMMM yyyy hh:mm}" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lnkViewDetails" CommandArgument='<% #Eval("Id") %>'
                                    CommandName="ViewDetails" Text="View details" CausesValidation="false"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle CssClass="gridviewHeader" />
                    <RowStyle CssClass="gridviewRow" />
                    <AlternatingRowStyle CssClass="gridviewAltRow" />
                </pwc:GridViewExternalPaging>
                <csla:CslaDataSource ID="dsSpeciesDataAuditTrailInfoList" runat="server" TypeAssemblyName="ProfilesLibrary"
                    TypeName="ProfilesLibrary.SpeciesDataAuditTrailInfoList">
                </csla:CslaDataSource>
                <br />
                <br />
                <asp:Label ID="lblErrorMsg" CssClass="ErrorLabel" runat="server" Visible="False"></asp:Label>
            <div class=" pb-4">
              <auc:Paginator runat="server" ID="bottomPaginator"></auc:Paginator>
            </div>
                <div>
                    &nbsp;</div>
                <asp:Panel ID="pnlAuditDetails" runat="server" Visible="False">
                    <div class="collapsePanelHeader">
                        <asp:Label ID="lblPanelTitle" runat="server"></asp:Label></div>
                    <div class="collapsePanel">
                        <table width="100%">
                            <tr>
                                <td style="width: 15%">
                                    <span class="fw-bold">Old name:</span>
                                </td>
                                <td style="width: 35%">
                                    <span id="txtOldNameSpan" runat="server"></span>
                                    <asp:TextBox ID="txtOldName" runat="server" style="width:95%" Enabled="false" Visible="false"/>
                                </td>
                                <td style="width: 15%">
                                    <span class="fw-bold">New name:</span>
                                </td>
                                <td style="width: 35%">
                                    <span id="txtNewNameSpan" runat="server"></span>
                                    <asp:TextBox ID="txtNewName" runat="server" style="width:95%" Enabled="false" Visible="false"/>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 15%">
                                    <span class="fw-bold">Old parent:</span>
                                </td>
                                <td style="width: 35%">
                                    <asp:TextBox ID="txtOldParent" runat="server" style="width:95%" 
                                        Enabled="false" Visible="false"/>
                                    <span id="txtOldParentSpan" runat="server"></span>
                                </td>
                                <td style="width: 15%">
                                    <span class="fw-bold">New parent:</span>
                                </td>
                                <td style="width: 35%">
                                    <asp:TextBox ID="txtNewParent" runat="server" style="width:95%" 
                                        Enabled="false" Visible="false"/>
                                    <span id="txtNewParentSpan" runat="server"></span>                                
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 15%">
                                    <span class="fw-bold">Changed by:</span>
                                </td>
                                <td style="width: 35%">
                                    <asp:TextBox ID="txtUser" runat="server" style="width:95%" Enabled="false" Visible="false"/>
                                    <span id="txtUserSpan" runat="server"></span>                                
                                </td>
                                <td>
                                    <span class="fw-bold">Date of change:</span>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDateOfChange" runat="server" style="width:95%" 
                                        Enabled="false" Visible="false"/>
                                    <span id="txtDateOfChangeSpan" runat="server"></span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="fw-bold">Reason for change:</span>
                                </td>
                                <td colspan="3">
                                    <asp:TextBox ID="txtReasonForChange" runat="server" style="width:98%" 
                                        Enabled="false" Visible="false"/>
                                    <span id="txtReasonForChangeSpan" runat="server"></span>
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
