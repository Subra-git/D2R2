<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false" Inherits="Profiles.Web.ReviewEmail" Title="Review email" Codebehind="ReviewEmail.aspx.vb" %>

<%@ Register Src="NavigationLinks.ascx" TagName="NavigationLinks" TagPrefix="nav" %>
<%@ Register Src="Paginator.ascx" TagName="Paginator" TagPrefix="auc" %>
<%@ Register Src="~/PaginatorPageSize.ascx" TagPrefix="auc" TagName="PaginatorPageSize" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" runat="Server">
    <div>
        This page is for testing purposes only and will not be accessible in the live
        environment. The grid below displays the list of users that will receive an email when the
        button is pressed. 
    </div>
    <br />
    <div class="row">
         <auc:PaginatorPageSize runat="server" ID="PaginatorPageSize" PaginatorId="bottomPaginator" GridId="grdEmail" />
    </div>
    <pwc:GridViewExternalPaging ID="grdEmail" runat="server" EmptyDataText="There are no emails to be sent."
        DataSourceID="dsEmailList" Width="50%" GridLines="None" CssClass="gridview" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="UserName" HeaderText="Username" ItemStyle-Width="300" />
            <asp:BoundField DataField="EmailAddress" HeaderText="Email" ItemStyle-Width="300" />
        </Columns>
        <HeaderStyle CssClass="gridviewHeader" />
        <RowStyle CssClass="gridviewRow" />
        <AlternatingRowStyle CssClass="gridviewAltRow" />
    </pwc:GridViewExternalPaging>
        <div class=" pb-4">
            <auc:Paginator runat="server" ID="bottomPaginator"></auc:Paginator>
        </div>
    <csla:CslaDataSource ID="dsEmailList" runat="server" TypeAssemblyName="ProfilesReviewEmailLibrary"
        TypeName="VLA.Profiles.DataModels.Views.ReviewEmailUser">
    </csla:CslaDataSource>
    <br />
    <br />
    <asp:Button 
        runat="server" 
        CssClass="govuk-button" 
        ID="btnSendReviewEmails" 
        Text="Send review reminder emails" 
        OnClientClick="apha.confirmPrompt('Are you sure you want to send the review emails?', this); return false;" />
    <br />
    <br />
    <asp:Label runat="server" ID="lblMessage"></asp:Label>
</asp:Content>
