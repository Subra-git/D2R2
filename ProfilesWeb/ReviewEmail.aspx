<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false"
    CodeFile="ReviewEmail.aspx.vb" Inherits="ReviewEmail" Title="Review email" %>

<%@ Register Src="NavigationLinks.ascx" TagName="NavigationLinks" TagPrefix="nav" %>
<asp:Content ID="navContent" ContentPlaceHolderID="cphNavigation" runat="Server">
    <nav:NavigationLinks ID="ctlNavigationLinks" runat="server" />
</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" runat="Server">
    <div>
        This page is for testing purposes only and will not be accessible in the live
        environment. The grid below displays the list of users that will receive an email when the
        button is pressed. 
    </div>
    <br />
    <br />
    <pwc:GridView ID="grdEmail" runat="server" EmptyDataText="There are no emails to be sent."
        DataSourceID="dsEmailList" Width="50%" GridLines="None" CssClass="gridview" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="UserName" HeaderText="Username" ItemStyle-Width="300" />
            <asp:BoundField DataField="EmailAddress" HeaderText="Email" ItemStyle-Width="300" />
        </Columns>
        <HeaderStyle CssClass="gridviewHeader" />
        <RowStyle CssClass="gridviewRow" />
        <AlternatingRowStyle CssClass="gridviewAltRow" />
    </pwc:GridView>
    <csla:CslaDataSource ID="dsEmailList" runat="server" TypeAssemblyName="ProfilesReviewEmailLibrary"
        TypeName="VLA.Profiles.DataModels.Views.ReviewEmailUser">
    </csla:CslaDataSource>
    <br />
    <br />
    <asp:Button runat="server" ID="btnSendReviewEmails" Text="Send review reminder emails" />
    <act:ConfirmButtonExtender ID="cbeSendReviewEmails" runat="server" TargetControlID="btnSendReviewEmails"
        ConfirmText="Are you sure you wish to send the review emails?">
    </act:ConfirmButtonExtender>
    <br />
    <br />
    <asp:Label runat="server" ID="lblMessage"></asp:Label>
</asp:Content>
