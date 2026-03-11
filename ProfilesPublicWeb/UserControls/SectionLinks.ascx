<%@ Control Language="VB" AutoEventWireup="false" CodeFile="SectionLinks.ascx.vb"
    Inherits="SectionLinks" %>
<h3>
    <a href="http://www.defra.gov.uk/animalh/diseases/vetsurveillance/index.htm">Veterinary
        surveillance </a>
</h3>
<h4>
    <a href="Home.aspx">Surveillance profiles</a>
</h4>
<asp:Repeater ID="rptSectionLinks" runat="server" DataSourceID="dsProfileSectionInfoList">
    <HeaderTemplate>
        <ul>
    </HeaderTemplate>
    <ItemTemplate>
        <li>
            <asp:LinkButton runat="Server" ID="lnkProfileSection" CommandName="GoSection" CommandArgument='<%#Eval("Id")%>'><%#Eval("SectionNumber")%>.&nbsp;<%#Eval("FormattedShortName")%></asp:LinkButton>
        </li>
    </ItemTemplate>
</asp:Repeater>
<br />
<csla:CslaDataSource ID="dsProfileSectionInfoList" runat="server" TypeAssemblyName="ProfilesLibrary"
    TypeName="ProfilesLibrary.ProfileSectionInfoList">
</csla:CslaDataSource>
