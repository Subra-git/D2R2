<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false"
    CodeFile="Home.aspx.vb" Inherits="Home" Title="Welcome to D2R2" %>

<%@ Register Src="NavigationLinks.ascx" TagName="NavigationLinks" TagPrefix="nav" %>
<%@ Register Src="SpeciesSelector.ascx" TagName="SpeciesSelector" TagPrefix="sps" %>
<asp:Content ID="navContent" ContentPlaceHolderID="cphNavigation" runat="Server">
    <nav:NavigationLinks ID="ctlNavigationLinks" runat="server" />
</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" runat="Server">
    <div style="float: left">
        <div>
            D2R2 is a comprehensive database, with a number of useful functions:
        </div>
        <div style="padding-left: 30px;">
            <br />
            <asp:BulletedList ID="BulletedList1" runat="server">
                <asp:ListItem>Disease briefing;</asp:ListItem>
                <asp:ListItem>Decision support;</asp:ListItem>
                <asp:ListItem>Ranking; and</asp:ListItem>
                <asp:ListItem>Risk assessment.</asp:ListItem>
            </asp:BulletedList>
        </div>
        <div>
            The information provided by D2R2 is regularly updated and provides you with:</div>
        <div style="padding-left: 30px;">
            <br />
            <asp:BulletedList ID="BulletedList2" runat="server">
                <asp:ListItem>A standardised, peer-reviewed evidence base for policy development</asp:ListItem>
                <asp:ListItem>A transparent mechanism for making policy decisions</asp:ListItem>
                <asp:ListItem>A weighted method for ranking diseases and</asp:ListItem>
                <asp:ListItem>A standardised approach to disease risk assessment</asp:ListItem>
            </asp:BulletedList>
        </div>
        <div>
            To continue to the profiles search page please click <a href="Search.aspx">here</a>.</div>
        <div>
            <br />
            Contact us: <a href="mailto:D2R2@defra.gsi.gov.uk">D2R2@defra.gsi.gov.uk</a> if
            you have comments or problems.</div>
        <div>
            <br />
            <a href="PDF/DataQualityStatement_D2R2.pdf" id="PDFlink" style="color: Blue">D2R2 Quality
                Statement</a>
        </div>
    </div>
    <div style="float: right; margin-bottom: 20px;">
        <asp:Image runat="server" ID="Image1" ImageUrl="./Images/D2R2LogoSmall.jpg" BackColor="Transparent"
            ImageAlign="Right" />
    </div>
</asp:Content>
