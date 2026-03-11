<%@ Page Title="View species data" Language="VB" MasterPageFile="~/ProfilesPublicTemplate.master"
    AutoEventWireup="false" CodeFile="ViewSpecies.aspx.vb" Inherits="ViewSpecies" %>

<%@ OutputCache CacheProfile="CacheInfrequentChanges" %>
<asp:Content ID="navContent" ContentPlaceHolderID="cphNavigation" runat="Server">
    <nav:NavigationLinks ID="navLinks" runat="server" />
</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" runat="Server">
    <p>
    This page details the species that are used by the Profiles system. It is presented 
    as a hierarchical list that groups species into groups; a profile can reference an 
    individual species or an entire species group. There are four top-level groups: 
    Mammals, Birds, Reptiles and Amphibians; select any of these to view the complete 
    species hierarchy within that group. Select the species to view the associated data.
    </p>
    <br /><br />
    <asp:Literal ID="litRootSpecies" runat="server" />
    <asp:Literal ID="litSpeciesList" runat="server" />
</asp:Content>
