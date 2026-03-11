<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false" Inherits="Profiles.Web.MaintainGlobalUsers" title="Maintain global users" Codebehind="MaintainGlobalUsers.aspx.vb" %>
<%@ Register Src="NavigationLinks.ascx" TagName="NavigationLinks" TagPrefix="nav" %>
<%@ Register Src="Paginator.ascx" TagName="Paginator" TagPrefix="auc" %>
<%@ Register Src="~/PaginatorPageSize.ascx" TagPrefix="auc" TagName="PaginatorPageSize" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" Runat="Server">
    <div>
        Use this function to grant either Profile editor or Policy profile user privileges to a Defra user. Profile editors have the highest level of 
        access to the system and should be regarded as administrators. Policy profile users have read-only access to all draft profiles.
        <br /><br />
    </div>
            
    <div>
        <asp:UpdatePanel runat="server" ID="pnlUpdate">
        <ContentTemplate>
            <div class="collapsePanel">
            <div class="row">
                 <auc:PaginatorPageSize runat="server" ID="PaginatorPageSize" PaginatorId="bottomPaginator" GridId="grdGlobalUsers" />
            </div>
                <pwc:GridViewExternalPaging ID="grdGlobalUsers" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                DataSourceID="dsGlobalUserList" Width="100%" AllowSorting="True" GridLines="None" CssClass="gridview"
                DefaultSortExpression="FullName">
                    <Columns>
                        <asp:BoundField DataField="UserName" HeaderText="Username" SortExpression="UserName" />
                        <asp:BoundField DataField="FullName" HeaderText="Full name" SortExpression="FullName" />
                        <asp:BoundField DataField="Organisation" HeaderText="Organisation" SortExpression="Organisation" />
                        <asp:BoundField DataField="UserRoleName" HeaderText="Role" SortExpression="UserRoleName" />
                        <asp:ButtonField CommandName="EditGlobalUser" Text="Edit" />
                        <asp:TemplateField>
                            <ItemTemplate>
                            <asp:LinkButton CommandName="DeleteGlobalUser"   runat="server" ID="lnkDelete" OnClientClick="apha.confirmPrompt('Are you sure you want to delete this global user?', this); return false;">Delete</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle CssClass="gridviewHeader" />
                    <RowStyle CssClass="gridviewRow" />
                    <AlternatingRowStyle CssClass="gridviewAltRow" />
                </pwc:GridViewExternalPaging>
               <csla:CslaDataSource ID="dsGlobalUserList" runat="server" TypeAssemblyName="ProfilesLibrary" TypeName="ProfilesLibrary.ProfileEditorList">
                </csla:CslaDataSource>
                <br />
            <div class=" pb-4">
              <auc:Paginator runat="server" ID="bottomPaginator"></auc:Paginator>
            </div>
            </div>
           
  
    <div>&nbsp;</div>
    <asp:Button CssClass="govuk-button" ID="btnAdd" runat="server" Text="Add"></asp:Button><br /><br />
    <asp:ValidationSummary  id="valSumUsername"  DisplayMode="BulletList"  runat="server" HeaderText="The following errors have occurred:" ValidationGroup="valUsernameGroup" cssClass="ErrorLabel"/>
    <asp:ValidationSummary id="valSumAdd"  DisplayMode="BulletList"  runat="server" HeaderText="The following errors have occurred:" ValidationGroup="valAddGlobalUser" cssClass="ErrorLabel"/>
<asp:Label ID="lblErrorMsg" cssClass="ErrorLabel" runat="server" Visible="False" EnableViewState="false"></asp:Label>
    <div>&nbsp;</div>
    <asp:Panel ID="pnlGlobalUser" runat="server" Visible="False">
       <asp:Label ID="lblPanelTitle" runat="server"></asp:Label> 
       <div class="collapsePanel">
           <table width="100%">
               <tr style="height: 3rem">
                    <td style="width:10%"><asp:Label ID="lblUserName" AssociatedControlID="txtUserName" CssClass="govuk-label" runat="server" Text="Username:" ></asp:Label></td>
                    <td style="width:40%"><asp:TextBox ID="txtUserName" CssClass="govuk-input" runat="server" Width="200px" onkeypress="return noenter()" MaxLength="50"></asp:TextBox> 
                        <asp:RequiredFieldValidator ID="valUserNameRequired" display="Dynamic" runat="server" ControlToValidate="txtUserName" ErrorMessage="Please enter a username" ToolTip="Please enter a username" Text=" *" ValidationGroup="valUsernameGroup"></asp:RequiredFieldValidator> 
                        <asp:RegularExpressionValidator  ID="valUserNameFormat" runat="server" display="Dynamic"   ControlToValidate="txtUserName" Text=" *" ErrorMessage="Please enter a username in the following format: Domain\UserId" ToolTip="Please enter a username in the following format: Domain\UserId"  ValidationGroup="valUsernameGroup"></asp:RegularExpressionValidator>
                    </td>
                    <td style="width:10%"><asp:Label ID="lblRole" AssociatedControlID="ddlRole" CssClass="govuk-label" runat="server" Text="Role:" ></asp:Label></td>
                    <td style="width:40%">
                        <asp:DropDownList ID="ddlRole" CssClass="govuk-select" runat="server" Width="200px">
                            <asp:ListItem Text="Please select..." Selected="True" Enabled="True" Value="" ></asp:ListItem>
                            <asp:ListItem Text="Profile editor" Selected="False" Enabled="True" Value="ProfileEditor" ></asp:ListItem>
                            <asp:ListItem Text="Policy profile user" Selected="False" Enabled="True" Value="PolicyProfileUser" ></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="valRole" display="Dynamic"  runat="server" ControlToValidate="ddlRole"  ErrorMessage="Please select a valid role" Text=" *" ToolTip="Please select a valid role" ValidationGroup="valAddGlobalUser"></asp:RequiredFieldValidator>
                    </td>
                </tr>  
                <tr style="height: 3rem">
                    <td>&nbsp;</td>
                    <td><asp:Button CssClass="govuk-button govuk-button--secondary" ID="btnLookup" runat="server" Text="Look up" ValidationGroup="valUsernameGroup" /></td>
                    <td style="width:10%">
                        <asp:Label ID="lblFullName" AssociatedControlID="txtFullName" CssClass="govuk-label" runat="server" Text="Full Name:" ></asp:Label>
                    </td>
                    <td style="width:40%">
                        <asp:TextBox ID="txtFullName" CssClass="govuk-input" runat="server" Width="200px" onkeypress="return noenter()" MaxLength="100"></asp:TextBox> 
                        <asp:RequiredFieldValidator ID="valFullNameRequired" display="Dynamic"  runat="server" ControlToValidate="txtFullName"  Text=" *" ErrorMessage="Please enter a full name" ToolTip="Please enter a full name" ValidationGroup="valAddGlobalUser"></asp:RequiredFieldValidator>
                    </td>
                 </tr>
                 <tr style="height: 3rem">
                    <td>&nbsp;</td>
                    <td></td>
                    <td>
                        <asp:Label ID="lblOrganisation" AssociatedControlID="txtOrganisation" CssClass="govuk-label" runat="server" Text="Organisation:"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtOrganisation" CssClass="govuk-input" runat="server"  Width="200px" onkeypress="return noenter()" MaxLength="100"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="valOrganisationRequired" runat="server" display="Dynamic"  ControlToValidate="txtOrganisation"  ErrorMessage="Please enter an organisation" ToolTip="Please enter an organisation" Text=" *" ValidationGroup="valAddGlobalUser"></asp:RequiredFieldValidator>
                    </td>
                 </tr>
                   <tr style="height: 3rem">
                    <td>&nbsp;</td>
                    <td></td>
                    <td colspan="2">
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
                 <tr style="height: 3rem">
                     <td>&nbsp;</td>
                     <td>&nbsp;</td>
                     <td>&nbsp;</td>
                     <td align="right"><div style="text-align:right;">
                         <asp:Button CssClass="govuk-button" ID="btnSave" runat="server" Text="OK" Enabled="False" ValidationGroup="valAddGlobalUser" />&nbsp;
                         <asp:Button CssClass="govuk-button govuk-button--secondary" ID="btnCancel" runat="server" Text="Cancel" />
                     </div></td>
                </tr>
            </table>
        </div> 
    </asp:Panel>
         </ContentTemplate>
        </asp:UpdatePanel>
        </div>
</asp:Content>

