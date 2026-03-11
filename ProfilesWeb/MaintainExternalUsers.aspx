<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false"
    CodeFile="MaintainExternalUsers.aspx.vb" Inherits="MaintainExternalUsers" Title="Maintain external users" %>

<%@ Register Src="NavigationLinks.ascx" TagName="NavigationLinks" TagPrefix="nav" %>
<asp:Content ID="navContent" ContentPlaceHolderID="cphNavigation" runat="Server">
    <nav:NavigationLinks ID="ctlNavigationLinks" runat="server" />
</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" runat="Server">
    <div style="float: left">
        Use this function to grant external users access to one or more profiles.
        <br />
        <br />
    </div>
    <div style="width: 100%; float: left; margin-top: 10px;">
        <asp:UpdatePanel runat="server" ID="pnlUpdate">
            <ContentTemplate>
                <asp:Panel ID="pnlExternalUsers" runat="server">
                    <div class="collapsePanelHeader">
                        <asp:Label ID="pnlUsersTitle" runat="server"></asp:Label></div>
                    <div class="collapsePanel">
                        <pwc:GridView ID="grdExternalUsers" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            DataSourceID="dsExternalUserList" Width="100%" AllowSorting="True" GridLines="None"
                            CssClass="gridview" DefaultSortExpression="FullName">
                            <Columns>
                                <asp:BoundField DataField="UserName" HeaderText="Username" SortExpression="UserName" />
                                <asp:BoundField DataField="FullName" HeaderText="Full name" SortExpression="FullName" />
                                <asp:BoundField DataField="Organisation" HeaderText="Organisation" SortExpression="Organisation" />
                                <asp:ButtonField CommandName="EditExternalUser" Text="Edit" />
                            </Columns>
                            <HeaderStyle CssClass="gridviewHeader" />
                            <RowStyle CssClass="gridviewRow" />
                            <AlternatingRowStyle CssClass="gridviewAltRow" />
                        </pwc:GridView>
                        <csla:CslaDataSource ID="dsExternalUserList" runat="server" TypeAssemblyName="ProfilesLibrary"
                            TypeName="ProfilesLibrary.SsoUserList">
                        </csla:CslaDataSource>
                        <div>
                            &nbsp;</div>
                        <asp:Panel ID="pnlProfiles" runat="server" Visible="False">
                            <div class="collapsePanelHeader">
                                <asp:Label ID="lblProfileTitle" runat="server"></asp:Label></div>
                            <div class="collapsePanel">
                                <br />
                                <asp:Panel runat="server" ID="pnlAddProfile">
                                    <div>
                                        Select a profile to add:&nbsp;<asp:DropDownList runat="server" ID="ddlProfileList">
                                        </asp:DropDownList>
                                        &nbsp;
                                        <asp:Button runat="server" ID="btnAddProfile" Text="Add" /><br />
                                        <br />
                                    </div>
                                </asp:Panel>
                                <pwc:GridView ID="grdProfileList" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                    DataSourceID="dsProfileList" Width="100%" AllowSorting="True" GridLines="None"
                                    CssClass="gridview" DefaultSortExpression="Title">
                                    <EmptyDataTemplate>
                                        This user does not have access to any profiles.
                                    </EmptyDataTemplate>
                                    <Columns>
                                        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" ItemStyle-Width="80%" />
                                        <asp:ButtonField CommandName="EditProfile" Text="Edit" ItemStyle-Width="10%" />
                                        <asp:ButtonField CommandName="DeleteProfile" Text="Delete" ItemStyle-Width="10%" />
                                    </Columns>
                                    <HeaderStyle CssClass="gridviewHeader" />
                                    <RowStyle CssClass="gridviewRow" />
                                    <AlternatingRowStyle CssClass="gridviewAltRow" />
                                </pwc:GridView>
                                <asp:Panel runat="server" ID="pnlProfileButtons">
                                    <br />
                                    <table width="100%">
                                        <tr>
                                            <td align="right">
                                                <div style="text-align: right;">
                                                    <asp:Button ID="btnProfilesOK" runat="server" Text="OK" CausesValidation="true" ValidationGroup="valSection" />&nbsp;
                                                    <asp:Button ID="btnProfilesCancel" runat="server" Text="Cancel" CausesValidation="false" />
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <csla:CslaDataSource ID="dsProfileList" runat="server" TypeAssemblyName="ProfilesLibrary"
                                    TypeName="ProfilesLibrary.SsoUserProfileList">
                                </csla:CslaDataSource>
                                <br />
                                <asp:Panel ID="pnlSections" runat="server" Visible="False">
                                    <div class="collapsePanelHeader">
                                        <asp:Label ID="lblSectionTitle" runat="server"></asp:Label></div>
                                    <div class="collapsePanel">
                                        <asp:ValidationSummary ID="valSection" DisplayMode="BulletList" runat="server" ValidationGroup="valSection"
                                            CssClass="ErrorLabel" />
                                        <br />
                                        <table width="100%">
                                            <tr>
                                                <td style="width: 10%">
                                                    <asp:Label ID="lblRole" runat="server" Text="Role:"></asp:Label>
                                                </td>
                                                <td style="width: 40%">
                                                    <asp:DropDownList ID="ddlRole" runat="server" Width="200px" DataSourceID="dsProfileUserRoleList"
                                                        DataTextField="RoleName" DataValueField="Id" AppendDataBoundItems="true" AutoPostBack="true"
                                                        CausesValidation="true" ValidationGroup="valSection">
                                                        <asp:ListItem Text="Please select..." Selected="True" Enabled="true" Value=""></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:CustomValidator runat="server" ID="valRoleDropDown" EnableClientScript="false"
                                                        OnServerValidate="RoleDropDownValidation" ErrorMessage="Please select a valid role."
                                                        ValidationGroup="valSection" Display="Dynamic" Text=" *"></asp:CustomValidator>
                                                </td>
                                                <td style="width: 50%">
                                                    <asp:CheckBox ID="chkSubscribeEmail" runat ="server" Text ="Subscribe to profile review emails" />
                                                </td>
                                            </tr>                                            
                                        </table>
                                        <br />
                                        <br />
                                        <br />
                                        <csla:CslaDataSource ID="dsProfileUserRoleList" runat="server" TypeAssemblyName="ProfilesLibrary"
                                            TypeName="ProfilesLibrary.ProfileUserRoleList">
                                        </csla:CslaDataSource>
                                        <asp:Panel runat="server" ID="pnlSectionPermissions" Visible="False" Width="100%">
                                        </asp:Panel>
                                        <asp:CustomValidator runat="server" ID="valSectionPermissions" EnableClientScript="false"
                                            OnServerValidate="SectionValidation" ErrorMessage="At least one section must be ticked."
                                            ValidationGroup="valSection" Display="None"></asp:CustomValidator>
                                        <br />
                                        <table width="100%">
                                            <tr>
                                                <td style="height: 30px">
                                                    <asp:Panel runat="server" ID="pnlCheckUncheckAll" Visible="false">
                                                        <asp:Button ID="btnCheckAll" runat="server" Text="Tick all" CausesValidation="false" />&nbsp;
                                                        <asp:Button ID="btnUncheckAll" runat="server" Text="Untick all" CausesValidation="false" />
                                                    </asp:Panel>
                                                </td>
                                                <td align="right">
                                                    <div style="text-align: right;">
                                                        <asp:Button ID="btnSectionOK" runat="server" Text="OK" ValidationGroup="valSection"
                                                            CausesValidation="true" />&nbsp;
                                                        <asp:Button ID="btnSectionCancel" runat="server" Text="Cancel" CausesValidation="false" />
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </asp:Panel>
                            </div>
                        </asp:Panel>
                    </div>
                </asp:Panel>
                <asp:Panel ID="pnlErrorMessage" runat="server" Visible="false">
                    <br />
                    <asp:Label ID="lblErrorMessage" runat="server" Text="You have pending changes. To save these changes, click the OK button."
                        CssClass="ErrorLabel"></asp:Label>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
