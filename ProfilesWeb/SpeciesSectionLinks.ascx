<%@ Control Language="VB" AutoEventWireup="false" CodeFile="SpeciesSectionLinks.ascx.vb"
    Inherits="SpeciesSectionLinks" %>
<ul>
    <li>
        <asp:LinkButton runat="Server" ID="lnkHome">D2R2 home</asp:LinkButton>&nbsp;
    </li>
    <asp:Repeater ID="rptSectionLinks" runat="server" DataSourceID="dsSpeciesSectionInfoList">
        <ItemTemplate>
            <li>
                <asp:LinkButton runat="Server" ID="lnkSpeciesSection" CommandName="GoSection" CommandArgument='<%#Eval("SectionId")%>'><%#Eval("SectionNumber")%>.&nbsp;<%#Eval("SectionShortName")%></asp:LinkButton>
            </li>
        </ItemTemplate>
    </asp:Repeater>
</ul>
<br />
<csla:CslaDataSource ID="dsSpeciesSectionInfoList" runat="server" TypeAssemblyName="ProfilesLibrary"
    TypeName="ProfilesLibrary.SpeciesInfoList">
</csla:CslaDataSource>
