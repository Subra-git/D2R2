<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false" CodeFile="MaintainGlobalUsers.aspx.vb" Inherits="MaintainGlobalUsers" title="Maintain global users" %>
<%@ Register Src="NavigationLinks.ascx" TagName="NavigationLinks" TagPrefix="nav" %>

<asp:Content ID="navContent" ContentPlaceHolderID="cphNavigation" Runat="Server">
    <nav:NavigationLinks ID="ctlNavigationLinks" runat="server" />
</asp:Content>

<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" Runat="Server">
    <div style="float:left">
        Use this function to grant either Profile editor or Policy profile user privileges to a Defra user. Profile editors have the highest level of 
        access to the system and should be regarded as administrators. Policy profile users have read-only access to all draft profiles.
        <br /><br />
    </div>
            
    <div style="width:100%;float:left;margin-top:10px;">
        <asp:UpdatePanel runat="server" ID="pnlUpdate">
        <ContentTemplate>
                <pwc:GridView ID="grdGlobalUsers" runat="server" AllowPaging="True" AutoGenerateColumns="False"
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
                            <asp:LinkButton CommandName="DeleteGlobalUser"   runat="server" ID="lnkDelete">Delete</asp:LinkButton>
                            <act:ConfirmButtonExtender ID="cbeDelete" runat="server" TargetControlID="lnkDelete" ConfirmText="Are you sure you want to delete this global user?" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle CssClass="gridviewHeader" />
                    <RowStyle CssClass="gridviewRow" />
                    <AlternatingRowStyle CssClass="gridviewAltRow" />
                </pwc:GridView>
               <csla:CslaDataSource ID="dsGlobalUserList" runat="server" TypeAssemblyName="ProfilesLibrary" TypeName="ProfilesLibrary.ProfileEditorList">
                </csla:CslaDataSource> 
           
  
    <div>&nbsp;</div>
    <asp:Button ID="btnAdd" runat="server" Text="Add"></asp:Button><br /><br />
    <asp:ValidationSummary  id="valSumUsername"  DisplayMode="BulletList"  runat="server" HeaderText="The following errors have occurred:" ValidationGroup="valUsernameGroup" cssClass="ErrorLabel"/>
    <asp:ValidationSummary id="valSumAdd"  DisplayMode="BulletList"  runat="server" HeaderText="The following errors have occurred:" ValidationGroup="valAddGlobalUser" cssClass="ErrorLabel"/>
<asp:Label ID="lblErrorMsg" cssClass="ErrorLabel" runat="server" Visible="False" EnableViewState="false"></asp:Label>
    <div>&nbsp;</div>
    <asp:Panel ID="pnlGlobalUser" runat="server" Visible="False">
       <div class="collapsePanelHeader"><asp:Label ID="lblPanelTitle" runat="server"></asp:Label></div>  
       <div class="collapsePanel">
           <table width="100%">
               <tr>
                    <td style="width:10%"><asp:Label ID="lblUserName" runat="server" Text="Username:" ></asp:Label></td>
                    <td style="width:40%"><asp:TextBox ID="txtUserName" runat="server" Width="200px" onkeypress="return noenter()" MaxLength="50"></asp:TextBox> 
                        <asp:RequiredFieldValidator ID="valUserNameRequired" display="Dynamic" runat="server" ControlToValidate="txtUserName" ErrorMessage="Please enter a username" ToolTip="Please enter a username" Text=" *" ValidationGroup="valUsernameGroup"></asp:RequiredFieldValidator> 
                        <asp:RegularExpressionValidator  ID="valUserNameFormat" runat="server" display="Dynamic"   ControlToValidate="txtUserName" Text=" *" ErrorMessage="Please enter a username in the following format: Domain\UserId" ToolTip="Please enter a username in the following format: Domain\UserId"  ValidationGroup="valUsernameGroup"></asp:RegularExpressionValidator>
                    </td>
                    <td style="width:10%"><asp:Label ID="lblRole" runat="server" Text="Role:" ></asp:Label></td>
                    <td style="width:40%">
                        <asp:DropDownList ID="ddlRole" runat="server" Width="200px">
                            <asp:ListItem Text="Please select..." Selected="True" Enabled="True" Value="" ></asp:ListItem>
                            <asp:ListItem Text="Profile editor" Selected="False" Enabled="True" Value="ProfileEditor" ></asp:ListItem>
                            <asp:ListItem Text="Policy profile user" Selected="False" Enabled="True" Value="PolicyProfileUser" ></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="valRole" display="Dynamic"  runat="server" ControlToValidate="ddlRole"  ErrorMessage="Please select a valid role" Text=" *" ToolTip="Please select a valid role" ValidationGroup="valAddGlobalUser"></asp:RequiredFieldValidator>
                    </td>
                </tr>  
                <tr>
                    <td>&nbsp;</td>
                    <td><asp:Button ID="btnLookup" runat="server" Text="Look up" ValidationGroup="valUsernameGroup" /></td>
                    <td style="width:10%">
                        <asp:Label ID="lblFullName" runat="server" Text="Full Name:" ></asp:Label>
                    </td>
                    <td style="width:40%">
                        <asp:TextBox ID="txtFullName" runat="server" Width="200px" onkeypress="return noenter()" MaxLength="100"></asp:TextBox> 
                        <asp:RequiredFieldValidator ID="valFullNameRequired" display="Dynamic"  runat="server" ControlToValidate="txtFullName"  Text=" *" ErrorMessage="Please enter a full name" ToolTip="Please enter a full name" ValidationGroup="valAddGlobalUser"></asp:RequiredFieldValidator>

                    </td>
                 </tr>
                 <tr>
                    <td>&nbsp;</td>
                    <td></td>
                    <td>
                        <asp:Label ID="lblOrganisation" runat="server" Text="Organisation:"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtOrganisation" runat="server"  Width="200px" onkeypress="return noenter()" MaxLength="100"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="valOrganisationRequired" runat="server" display="Dynamic"  ControlToValidate="txtOrganisation"  ErrorMessage="Please enter an organisation" ToolTip="Please enter an organisation" Text=" *" ValidationGroup="valAddGlobalUser"></asp:RequiredFieldValidator>
                    </td>
                 </tr>
                 <tr>
                     <td style="height: 30px">&nbsp;</td>
                     <td style="height: 30px">&nbsp;</td>
                     <td style="height: 30px">&nbsp;</td>
                     <td align="right"><div style="text-align:right;"><asp:Button ID="btnSave" runat="server" Text="OK" Enabled="False" ValidationGroup="valAddGlobalUser" />&nbsp;<asp:Button ID="btnCancel" runat="server" Text="Cancel" /></div></td>
                </tr>
            </table>
        </div> 
    </asp:Panel>
         </ContentTemplate>
        </asp:UpdatePanel>
        </div>
</asp:Content>

