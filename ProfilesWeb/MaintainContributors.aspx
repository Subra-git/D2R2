<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false"
    CodeFile="MaintainContributors.aspx.vb" Inherits="MaintainContributors" Title="Maintain profile contributors" %>

<%@ Register Src="NavigationLinks.ascx" TagName="NavigationLinks" TagPrefix="nav" %>
<asp:Content ID="navContent" ContentPlaceHolderID="cphNavigation" runat="Server">
    <nav:NavigationLinks ID="ctlNavigationLinks" runat="server" />
</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" runat="Server">
    <div style="clear: both" />
    <table>
        <tr>
            <td align="right">
                <asp:HyperLink ID="lnkManageProfile" runat="server">Manage profile</asp:HyperLink>
            </td>
        </tr>
    </table>
    <div style="width: 100%; float: left; margin-top: 10px;">
        <asp:UpdatePanel runat="server" ID="pnlUpdate">
            <ContentTemplate>
                <pwc:GridView ID="grdProfileContributors" runat="server" AllowPaging="True" AutoGenerateColumns="False"
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
                                <asp:LinkButton CommandName="DeleteContributor" runat="server" ID="lnkDelete">Delete</asp:LinkButton>
                                <act:ConfirmButtonExtender ID="cbeDelete" runat="server" TargetControlID="lnkDelete"
                                    ConfirmText="Are you sure you want to delete this contributor?" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle CssClass="gridviewHeader" />
                    <RowStyle CssClass="gridviewRow" />
                    <AlternatingRowStyle CssClass="gridviewAltRow" />
                </pwc:GridView>
                <csla:CslaDataSource ID="dsProfileContributorList" runat="server" TypeAssemblyName="ProfilesLibrary"
                    TypeName="ProfilesLibrary.ProfileContributorList">
                </csla:CslaDataSource>
                <csla:CslaDataSource ID="dsProfileUserRoleList" runat="server" TypeAssemblyName="ProfilesLibrary"
                    TypeName="ProfilesLibrary.ProfileUserRoleList">
                </csla:CslaDataSource>
                <div>
                    &nbsp;</div>
                <asp:Button ID="btnAdd" runat="server" Text="Add"></asp:Button><br />
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
                    <div class="collapsePanelHeader">
                        <asp:Label ID="lblPanelTitle" runat="server"></asp:Label></div>
                    <div class="collapsePanel">
                        <table width="100%">
                            <tr>
                                <td style="width: 10%">
                                    <asp:Label ID="lblUserName" runat="server" Text="Username:"></asp:Label>
                                </td>
                                <td style="width: 40%">
                                    <asp:TextBox ID="txtUserName" runat="server" Width="200px" onkeypress="return noenter()"
                                        MaxLength="50"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="valUserNameRequired" Display="Dynamic" runat="server"
                                        ControlToValidate="txtUserName" ErrorMessage="Please enter a username" ToolTip="Please enter a username"
                                        Text=" *" ValidationGroup="valUsernameGroup"></asp:RequiredFieldValidator>
                                </td>
                                <td style="width: 10%">
                                    <asp:Label ID="lblRole" runat="server" Text="Role:"></asp:Label>
                                </td>
                                <td style="width: 40%">
                                    <asp:DropDownList ID="ddlRole" runat="server" Width="200px" DataSourceID="dsProfileUserRoleList"
                                        DataTextField="RoleName" DataValueField="Id" AppendDataBoundItems="true" AutoPostBack="true">
                                        <asp:ListItem Text="Please select..." Selected="True" Enabled="true" Value=""></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="valRole" Display="Dynamic" runat="server" ControlToValidate="ddlRole"
                                        ErrorMessage="Please select a valid role" Text=" *" ToolTip="Please select a valid role"
                                        ValidationGroup="valAddProfileContributor"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    <asp:Button ID="btnLookup" runat="server" Text="Look up" ValidationGroup="valUsernameGroup" />
                                </td>
                                <td>
                                    <asp:Label ID="lblFullName" runat="server" Text="Full Name:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtFullName" runat="server" Width="200px" onkeypress="return noenter()"
                                        MaxLength="100"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="valFullNameRequired" Display="Dynamic" runat="server"
                                        ControlToValidate="txtFullName" ErrorMessage="Please enter a full name" ToolTip="Please enter a full name"
                                        Text=" *" ValidationGroup="valAddProfileContributor"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                </td>
                                <td>
                                    <asp:Label ID="lblOrganisation" runat="server" Text="Organisation:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtOrganisation" runat="server" Width="200px" onkeypress="return noenter()"
                                        MaxLength="100"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="valOrganisationRequired" runat="server" Display="Dynamic"
                                        ControlToValidate="txtOrganisation" ErrorMessage="Please enter an organisation"
                                        ToolTip="Please enter an organisation" Text=" *" ValidationGroup="valAddProfileContributor"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td>                                
                                </td>                                
                                <td colspan="2">
                                    <asp:CheckBox ID="chkSubscribeEmail" runat ="server" Text ="Subscribe to profile review emails" />                                
                                </td>                                
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <br />
                                    <asp:Panel runat="server" ID="pnlSectionPermissions" Visible="False" Width="100%">
                                    </asp:Panel>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 30px" colspan="2">
                                    <asp:Panel runat="server" ID="pnlCheckUncheckAll" Visible="false">
                                        <asp:Button ID="btnCheckAll" runat="server" Text="Tick all" />&nbsp;
                                        <asp:Button ID="btnUncheckAll" runat="server" Text="Untick all" />
                                    </asp:Panel>
                                </td>                               
                                <td style="height: 30px">
                                    &nbsp;
                                </td>
                                <td align="right">
                                    <div style="text-align: right;">
                                        <asp:Button ID="btnSave" runat="server" Text="OK" Enabled="False" ValidationGroup="valAddProfileContributor" />&nbsp;<asp:Button
                                            ID="btnCancel" runat="server" Text="Cancel" /></div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
