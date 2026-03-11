<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false" CodeFile="ProfileProperties.aspx.vb" Inherits="ProfileProperties" title="Profile properties" %>
<%@ Register Src="NavigationLinks.ascx" TagName="NavigationLinks" TagPrefix="nav" %>
<%@ Register Src="AffectedSpeciesSelector.ascx" TagName="AffectedSpeciesSelector" TagPrefix="afs" %>

<asp:Content ID="navContent" ContentPlaceHolderID="cphNavigation" Runat="Server">
    <nav:NavigationLinks ID="ctlNavigationLinks" runat="server" />
</asp:Content>

<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" Runat="Server">
    
    <asp:Panel ID="pnlInfo" runat="server" style="float:left">
        Use this function to create a brand new Surveillance Profile. Provide a title for the profile and then select at 
        least one species or species-group that is affected by the disease, condition or issue being profiled.
        <br /><br />
        Please carefully consider the species or species-groups affected, as the selection made here will dictate what 
        information can be captured for the profile. Only select species-groups when you are confident that the disease, 
        condition or issue being profiled impacts all the species in that group in the same manner.
        <br /><br />
    </asp:Panel>
    
    <div style="width:100%;float:left;margin-top:10px;">           
        <table style="width:100%">
            <tr>
                <td colspan="3">                            
                    <div align="right">
                        <asp:HyperLink ID="lnkManageProfile" runat="server" visible="false">Manage profile</asp:HyperLink>
                    </div>
                    <asp:Panel ID="pnlClone" Visible="false" runat="server">
                        <asp:Label ID="lblClone" runat="server" Text="The new profile will be cloned from: " Font-Bold="True"></asp:Label>
                    </asp:Panel>
                    <div><asp:ValidationSummary 
                          id="valSummary" 
                          DisplayMode="BulletList" 
                          runat="server"
                          HeaderText="The following errors have occurred:"
                          CssClass="ErrorLabel"/>
                    </div>
                    <div>
                        <asp:Label ID="lblError" runat="server" CssClass="ErrorLabel"></asp:Label>
                    </div>
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="lblTitle" runat="server">Profile title:</asp:Label></td>
                <td style="width:75%">
                    <asp:TextBox ID="txtTitle" runat="server" Width="90%" MaxLength="255"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="valTitleRequired" runat="server" ControlToValidate="txtTitle" ErrorMessage="You must enter a title" ToolTip="Please enter a title">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:Button ID="btnUpdate" runat="server" Text="Save" Width="64px" />
                </td>
            </tr>
        </table>      
        <afs:AffectedSpeciesSelector ID="ctlAffectedSpeciesSelector" runat="server" />
     </div>
</asp:Content>