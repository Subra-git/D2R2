<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false" Inherits="Profiles.Web.MaintainExternalUsers" Title="Maintain external users" Codebehind="MaintainExternalUsers.aspx.vb" %>

<%@ Register Src="NavigationLinks.ascx" TagName="NavigationLinks" TagPrefix="nav" %>
<%@ Register Src="Paginator.ascx" TagName="Paginator" TagPrefix="auc" %>
<%@ Register Src="~/PaginatorPageSize.ascx" TagPrefix="auc" TagName="PaginatorPageSize" %>

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
                        <asp:Label ID="pnlUsersTitle" runat="server"></asp:Label>
                    <div class="collapsePanel">
                        <div class="row">
                            <auc:PaginatorPageSize runat="server" ID="PaginatorPageSize" PaginatorId="bottomPaginator" GridId="grdExternalUsers" />
                        </div>
                        <pwc:GridViewExternalPaging ID="grdExternalUsers" runat="server" AllowPaging="True" AutoGenerateColumns="False"
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
                        </pwc:GridViewExternalPaging>
                        <csla:CslaDataSource ID="dsExternalUserList" runat="server" TypeAssemblyName="ProfilesLibrary"
                            TypeName="ProfilesLibrary.SsoUserList">
                        </csla:CslaDataSource>
                        <br />
                        <div class=" pb-4">
                          <auc:Paginator runat="server" ID="bottomPaginator"></auc:Paginator>
                        </div>
                        
                        <div>
                            &nbsp;</div>
                        <asp:Panel ID="pnlProfiles" runat="server" Visible="False">
                                <asp:Label ID="lblProfileTitle" runat="server"></asp:Label>
                            <div class="collapsePanel">
                                <br />
                                <asp:Panel runat="server" ID="pnlAddProfile">
                                    <div>
                                        Select a profile to add:&nbsp;<asp:DropDownList runat="server" CssClass="govuk-select" ID="ddlProfileList">
                                        </asp:DropDownList>
                                        &nbsp;
                                        <asp:Button CssClass="govuk-button" runat="server" ID="btnAddProfile" Text="Add" /><br />
                                        <br />
                                    </div>
                                </asp:Panel>
                                <div class="row">
                                    <auc:PaginatorPageSize runat="server" ID="PaginatorPageSizeProfileList" PaginatorId="bottomPaginatorProfileList" GridId="grdProfileList" />
                                </div>       
                                <pwc:GridViewExternalPaging ID="grdProfileList" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                    DataSourceID="dsProfileList" Width="100%" AllowSorting="True" GridLines="None"
                                    CssClass="gridview" DefaultSortExpression="Title">
                                    <EmptyDataTemplate>
                                        This user does not have access to any profiles.
                                    </EmptyDataTemplate>
                                    <Columns>
                                        <asp:BoundField DataField="Title" HeaderText="Title" HtmlEncode="false" SortExpression="Title" ItemStyle-Width="80%" />
                                        <asp:ButtonField CommandName="EditProfile" Text="Edit" ItemStyle-Width="10%" />
                                        <asp:ButtonField CommandName="DeleteProfile" Text="Delete" ItemStyle-Width="10%" />
                                    </Columns>
                                    <HeaderStyle CssClass="gridviewHeader" />
                                    <RowStyle CssClass="gridviewRow" />
                                    <AlternatingRowStyle CssClass="gridviewAltRow" />
                                </pwc:GridViewExternalPaging>
                                <br />
                                <auc:Paginator runat="server" ID="bottomPaginatorProfileList"></auc:Paginator>
                                <asp:Panel runat="server" ID="pnlProfileButtons">
                                    <br />
                                    <tr>
                                    <td colspan="2">
                                        
                                    </td>
                                    <td>
                                        </td>
                                       <td>
                                        <div class="govuk-checkboxes--small apha-font-size-19">
                                            <asp:CheckBox ID="chkSubscribeEmail"
                                                class="govuk-checkboxes__item"
                                                runat="server"                            
                                                Checked="false"
                                                Text="Subscribe to Review Emails"
                                                LabelPosition="before"
                                                AutoPostBack="true"/>
                                        </div>
                                       </td>
                                    <td>
                                   </tr>
                                    <br />
                                    <table width="100%">
                                        <tr>
                                            <td align="right">
                                                <div style="text-align: right;">
                                                    <asp:Button CssClass="govuk-button" ID="btnProfilesOK" runat="server" Text="OK" CausesValidation="true" ValidationGroup="valSection" />&nbsp;
                                                    <asp:Button CssClass="govuk-button govuk-button--secondary" ID="btnProfilesCancel" runat="server" Text="Cancel" CausesValidation="false" />
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
                                    <asp:Label ID="lblSectionTitle" runat="server"></asp:Label>
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
                                                    <asp:DropDownList ID="ddlRole" CssClass="govuk-select" runat="server" Width="200px" DataSourceID="dsProfileUserRoleList"
                                                        DataTextField="RoleName" DataValueField="Id" AppendDataBoundItems="true" AutoPostBack="true"
                                                        CausesValidation="true" ValidationGroup="valSection">
                                                        <asp:ListItem Text="Please select..." Selected="True" Enabled="true" Value=""></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:CustomValidator runat="server" ID="valRoleDropDown" EnableClientScript="false"
                                                        OnServerValidate="RoleDropDownValidation" ErrorMessage="Please select a valid role."
                                                        ValidationGroup="valSection" Display="Dynamic" Text=" *"></asp:CustomValidator>
                                                </td>
                                                <td style="width: 50%">
                                                    &nbsp;</td>
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
                                                        <asp:Button CssClass="govuk-button govuk-button--secondary" ID="btnCheckAll" runat="server" Text="Tick all" CausesValidation="false" />&nbsp;
                                                        <asp:Button CssClass="govuk-button govuk-button--secondary" ID="btnUncheckAll" runat="server" Text="Untick all" CausesValidation="false" />
                                                    </asp:Panel>
                                                </td>
                                                <td align="right">
                                                    <div style="text-align: right;">
                                                        <asp:Button CssClass="govuk-button" ID="btnSectionOK" runat="server" Text="OK" ValidationGroup="valSection"
                                                            CausesValidation="true" />&nbsp;
                                                        <asp:Button CssClass="govuk-button govuk-button--secondary" ID="btnSectionCancel" runat="server" Text="Cancel" CausesValidation="false" />
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
