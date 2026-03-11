<%@ Page Language="VB" MasterPageFile="~/ProfilesPublicTemplate.master" AutoEventWireup="false"
    CodeFile="ProfileReports.aspx.vb" Inherits="ProfileReports" Title="Untitled Page" %>
<%@ OutputCache CacheProfile="CacheInfrequentChanges" %>

<asp:Content ID="navContent" ContentPlaceHolderID="cphNavigation" runat="Server">
    <nav:NavigationLinks ID="navLinks" runat="server" />
</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" runat="Server">
    <asp:Repeater ID="rptReportsList" runat="server" DataSourceID="dsProfileVersionReportList">
        <HeaderTemplate>
            <ul>
        </HeaderTemplate>
        <ItemTemplate>
            <li><a target="_blank" href="ShowProfileReport.aspx?ProfileReportId=<%# Eval("Id") %>&amp;ProfileVersionId=<%# Eval("ProfileVersionId") %>"><%# Eval("DisplayName") %>&nbsp;(PDF <%#Profiles.WebControls.Profiles.WebControls.CommonUtils.FormatFileSize(CInt(Eval("FileSize")))%>)</a></li>
        </ItemTemplate>
        <FooterTemplate>
            </ul>
        </FooterTemplate>
    </asp:Repeater>
    <csla:CslaDataSource ID="dsProfileVersionReportList" runat="server" TypeAssemblyName="ProfilesLibrary"
        TypeName="ProfilesLibrary.ProfileVersionReportInfo">
    </csla:CslaDataSource>
</asp:Content>
