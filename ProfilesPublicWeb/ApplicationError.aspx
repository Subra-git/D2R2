<%@ Page Language="VB" MasterPageFile="~/ProfilesPublicTemplate.master" AutoEventWireup="false" 
CodeFile="ApplicationError.aspx.vb" Inherits="ApplicationError" title="A problem occurred" %>

<%@ OutputCache CacheProfile="CacheInfrequentChanges" %>
<asp:Content ID="navContent" ContentPlaceHolderID="cphNavigation" runat="Server">
    <nav:NavigationLinks ID="navLinks" runat="server" />
</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" runat="Server">
    <div class="coldivleft">
        <p>
            A problem has occurred with the Surveillance Profiles web application which is preventing it from displaying the information
            you requested.
        </p>
        <div class="clearboth">
        </div>
    </div>
   </asp:Content>

