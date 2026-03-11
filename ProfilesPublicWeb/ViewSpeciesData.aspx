<%@ Page Title="View species data" Language="VB" MasterPageFile="~/ProfilesPublicTemplate.master" AutoEventWireup="false" CodeFile="ViewSpeciesData.aspx.vb" Inherits="ViewSpeciesData" %>
<%@ OutputCache CacheProfile="CacheInfrequentChanges" %>

<asp:Content ID="navContent" ContentPlaceHolderID="cphNavigation" runat="Server">
    <nav:SectionLinks ID="sectionLinks" runat="server" />
</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" runat="Server">
    <h4><asp:Label ID="lblSectionName" runat="server" /></h4>
    <pwca:SectionPanel ID="pwcSection" runat="server" />
</asp:Content>

