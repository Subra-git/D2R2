<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false" CodeFile="SessionTimeout.aspx.vb" Inherits="SessionTimeout" title="Session timeout" %>
<%@ Register Src="NavigationLinks.ascx" TagName="NavigationLinks" TagPrefix="nav" %>

<asp:Content ID="navContent" ContentPlaceHolderID="cphNavigation" Runat="Server">
    <nav:NavigationLinks ID="ctlNavigationLinks" runat="server" />
</asp:Content>

<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" Runat="Server">
<div style="float:left">
        Your application session has expired. This means that if you were entering data, you may have 
        lost the information that you entered since you last saved your work. In order to prevent this 
        happening in future, press the Save button at regular intervals. In order to continue using the 
        system, select a link from the navigation menu on the left.

</div> 
</asp:Content>

