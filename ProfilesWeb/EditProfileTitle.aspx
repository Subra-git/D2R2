<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false" CodeFile="EditProfileTitle.aspx.vb" Inherits="EditProfileTitle" title="Edit profile title" %>
<%@ Register Src="NavigationLinks.ascx" TagName="NavigationLinks" TagPrefix="nav" %>

<asp:Content ID="navContent" ContentPlaceHolderID="cphNavigation" Runat="Server">
    <nav:NavigationLinks ID="ctlNavigationLinks" runat="server" />
</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" Runat="Server">

    <div style="float:left">
        <!--Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. 
        Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. 
        Duis euismod nulla vel mauris. Ut non leo.-->
        <br /><br />
    </div>
    
    <div style="width:100%;float:left;margin-top:10px;">
                    
        <asp:UpdatePanel ID="udpTitle" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
            <ContentTemplate>
            <table style="width:100%">
                <tr>
                    <td>Profile title:</td>
                    <td style="width:75%">
                        <asp:TextBox ID="txtProfileTitle" runat="server" Width="90%" MaxLength="255"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="valTitleRequired" runat="server" ControlToValidate="txtProfileTitle" ErrorMessage="You must enter a profile title" ToolTip="Please enter a title">*</asp:RequiredFieldValidator>
                    </td>
                    <td style="height:46px">
                        <asp:Button ID="btnSave" runat="server" Text="Save" Width="64px" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Label ID="lblError" runat="server" width="495px" height="25px" CssClass="ErrorLabel"></asp:Label>
                    </td>
                </tr>
            </table>
            </ContentTemplate>
        </asp:UpdatePanel>
        
     </div>
     
</asp:Content>

