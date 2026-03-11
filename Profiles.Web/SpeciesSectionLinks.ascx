<%@ Control Language="VB" AutoEventWireup="false"
    Inherits="Profiles.Web.SpeciesSectionLinks" CodeBehind="SpeciesSectionLinks.ascx.vb" %>
<nav class="app-subnav">
    <ul class="app-subnav__section">
        <asp:Repeater ID="rptSectionLinks" runat="server" DataSourceID="dsSpeciesSectionInfoList">
            <ItemTemplate>
                <li id="liWrapper" runat="server">
                    <asp:LinkButton CssClass="app-subnav__link govuk-link govuk-link--no-visited-state govuk-link--no-underline" runat="Server" ID="lnkSpeciesSection" CommandName="GoSection" CommandArgument='<%#Eval("SectionId")%>'><%#Eval("SectionNumber")%>.&nbsp;<%#Eval("SectionShortName")%></asp:LinkButton>
                </li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
</nav>
<br />
<csla:CslaDataSource ID="dsSpeciesSectionInfoList" runat="server" TypeAssemblyName="ProfilesLibrary"
    TypeName="ProfilesLibrary.SpeciesInfoList">
</csla:CslaDataSource>
