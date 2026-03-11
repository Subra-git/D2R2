<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false" Inherits="Profiles.Web.MaintainContributors" Title="Maintain profile contributors" Codebehind="MaintainContributors.aspx.vb" %>

<%@ Register Src="NavigationLinks.ascx" TagName="NavigationLinks" TagPrefix="nav" %>
<%@ Register Src="Paginator.ascx" TagName="Paginator" TagPrefix="auc" %>
<%@ Register Src="~/PaginatorPageSize.ascx" TagPrefix="auc" TagName="PaginatorPageSize" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" runat="Server">
    <div style="clear: both" />
    <table>
        <tr>
            <td align="right">
                <asp:HyperLink ID="lnkManageProfile" CssClass="govuk-link" runat="server">Manage profile</asp:HyperLink>
            </td>
        </tr>
    </table>
    <div style="width: 100%; float: left; margin-top: 10px;">
        <asp:UpdatePanel runat="server" ID="pnlUpdate">
            <ContentTemplate>
            <div class="row">
                  <auc:PaginatorPageSize runat="server" id="PaginatorPageSize" PaginatorId="bottomPaginator" GridId="grdProfileContributors" />
            </div>
                <pwc:GridViewExternalPaging ID="grdProfileContributors" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    DataSourceID="dsProfileContributorList" Width="100%" AllowSorting="True" GridLines="None"
                    CssClass="gridview" DefaultSortExpression="FullName">
                    <Columns>
                        <asp:BoundField DataField="UserName" HeaderText="Username" SortExpression="UserName" />
                        <asp:BoundField DataField="FullName" HeaderText="Full name" SortExpression="FullName" />
                        <asp:BoundField DataField="Organisation" HeaderText="Organisation" SortExpression="Organisation" />
                        <asp:BoundField DataField="Role" HeaderText="Role" SortExpression="Role" />
                        <asp:ButtonField CommandName="EditContributor" Text="Edit" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton 
                                    CommandName="DeleteContributor" 
                                    runat="server" 
                                    ID="lnkDelete" 
                                    OnClientClick="apha.confirmPrompt('Are you sure you want to delete this contributor?', this); return false;">Delete</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle CssClass="gridviewHeader" />
                    <RowStyle CssClass="gridviewRow" />
                    <AlternatingRowStyle CssClass="gridviewAltRow" />
                </pwc:GridViewExternalPaging>
                <csla:CslaDataSource ID="dsProfileContributorList" runat="server" TypeAssemblyName="ProfilesLibrary"
                    TypeName="ProfilesLibrary.ProfileContributorList">
                </csla:CslaDataSource>
                <csla:CslaDataSource ID="dsProfileUserRoleList" runat="server" TypeAssemblyName="ProfilesLibrary"
                    TypeName="ProfilesLibrary.ProfileUserRoleList">
                </csla:CslaDataSource>
                <div>
                    &nbsp;</div>
            <div class=" pb-4">
              <auc:Paginator runat="server" ID="bottomPaginator"></auc:Paginator>
            </div>
                <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="govuk-button"></asp:Button><br />
                <br />
                <asp:ValidationSummary ID="valSumUsername" DisplayMode="BulletList" runat="server"
                    HeaderText="The following errors have occurred:" ValidationGroup="valUsernameGroup"
                    CssClass="ErrorLabel" />
                <asp:ValidationSummary ID="valSumAdd" DisplayMode="BulletList" runat="server" HeaderText="The following errors have occurred:"
                    ValidationGroup="valAddProfileContributor" CssClass="ErrorLabel" />
                <asp:Label ID="lblPermissionErrorMsg" CssClass="ErrorLabel" runat="server" Visible="false"></asp:Label>
                <asp:Label ID="lblErrorMsg" CssClass="ErrorLabel" runat="server" Visible="False"></asp:Label>
                <div>
                    &nbsp;</div>
                <asp:Panel ID="pnlProfileContributor" runat="server" Visible="False">
                   
                        <asp:Label ID="lblPanelTitle" CssClass="govuk-label" runat="server"></asp:Label>
                    <div class="collapsePanel">
                        <table width="100%">
                            <tr style="height: 3rem">
                                <td style="width: 10%">
                                    <asp:Label ID="lblUserName" CssClass="govuk-label" AssociatedControlID="txtUserName" runat="server" Text="Username:"></asp:Label>
                                </td>
                                <td style="width: 40%">
                                    <asp:TextBox ID="txtUserName" CssClass="govuk-input" runat="server" Width="200px" onkeypress="return noenter()"
                                        MaxLength="50"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="valUserNameRequired" Display="Dynamic" runat="server"
                                        ControlToValidate="txtUserName" ErrorMessage="Please enter a username" ToolTip="Please enter a username"
                                        Text=" *" ValidationGroup="valUsernameGroup"></asp:RequiredFieldValidator>
                                </td>
                                <td style="width: 10%">
                                    <asp:Label ID="lblRole" CssClass="govuk-label" AssociatedControlID="ddlRole" runat="server" Text="Role:"></asp:Label>
                                </td>
                                <td style="width: 40%">
                                    <asp:DropDownList ID="ddlRole" CssClass="govuk-select" runat="server" Width="200px" DataSourceID="dsProfileUserRoleList"
                                        DataTextField="RoleName" DataValueField="Id" AppendDataBoundItems="true" AutoPostBack="true">
                                        <asp:ListItem Text="Please select..." Selected="True" Enabled="true" Value=""></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="valRole" Display="Dynamic" runat="server" ControlToValidate="ddlRole"
                                        ErrorMessage="Please select a valid role" Text=" *" ToolTip="Please select a valid role"
                                        ValidationGroup="valAddProfileContributor"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr style="height: 3rem">
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    <asp:Button ID="btnLookup" CssClass="govuk-button govuk-button--secondary" runat="server" Text="Look up" ValidationGroup="valUsernameGroup" />
                                </td>
                                <td>
                                    <asp:Label ID="lblFullName" CssClass="govuk-label" AssociatedControlID="txtFullName" runat="server" Text="Full Name:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtFullName" CssClass="govuk-input" runat="server" Width="200px" onkeypress="return noenter()"
                                        MaxLength="100"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="valFullNameRequired" Display="Dynamic" runat="server"
                                        ControlToValidate="txtFullName" ErrorMessage="Please enter a full name" ToolTip="Please enter a full name"
                                        Text=" *" ValidationGroup="valAddProfileContributor"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr style="height: 3rem">
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                </td>
                                <td>
                                    <asp:Label ID="lblOrganisation" CssClass="govuk-label" AssociatedControlID="txtOrganisation" runat="server" Text="Organisation:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtOrganisation" CssClass="govuk-input" runat="server" Width="200px" onkeypress="return noenter()"
                                        MaxLength="100"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="valOrganisationRequired" runat="server" Display="Dynamic"
                                        ControlToValidate="txtOrganisation" ErrorMessage="Please enter an organisation"
                                        ToolTip="Please enter an organisation" Text=" *" ValidationGroup="valAddProfileContributor"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr style="height: 3rem">
                                <td colspan="4">
                                    <br />
                                    <asp:Panel runat="server" ID="pnlSectionPermissions" Visible="False" Width="100%">
                                    </asp:Panel>
                                    <br />
                                </td>
                            </tr>
                            <tr style="height: 3rem">
                                <td style="height: 30px" colspan="2">
                                    <asp:Panel runat="server" ID="pnlCheckUncheckAll" Visible="false">
                                        <asp:Button ID="btnCheckAll" CssClass="govuk-button govuk-button--secondary" runat="server" Text="Tick all" />&nbsp;
                                        <asp:Button ID="btnUncheckAll" CssClass="govuk-button govuk-button--secondary" runat="server" Text="Untick all" />
                                    </asp:Panel>
                                </td>                               
                                <td style="height: 30px">
                                    &nbsp;
                                </td>
                                <td align="right">
                                    <div style="text-align: right;">
                                        <asp:Button ID="btnSave" CssClass="govuk-button" runat="server" Text="OK" Enabled="False" ValidationGroup="valAddProfileContributor" />&nbsp;
                                        <asp:Button ID="btnCancel" CssClass="govuk-button govuk-button--secondary" runat="server" Text="Cancel" /></div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
