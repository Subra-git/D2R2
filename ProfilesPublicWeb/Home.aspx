<%@ Page Language="VB" MasterPageFile="~/ProfilesPublicTemplate.master" AutoEventWireup="false"
    CodeFile="Home.aspx.vb" Inherits="Home" %>
<%@ OutputCache CacheProfile="CacheInfrequentChanges" %>
  
<asp:Content ID="navContent" ContentPlaceHolderID="cphNavigation" runat="Server">
    <nav:NavigationLinks ID="navLinks" runat="server" />
</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" runat="Server">
    <div class="coldivleft">
        <asp:Panel ID="pnlCurrentPageText" runat="server" Width="100%" Visible="true">
        <p>
            This page lists published profiles that have been drafted and independently checked by experts 
            to ensure their accuracy. Profiles are regularly revised and re-published in order to keep the information 
            as up-to-date as possible. You can view the content of published 
            profiles in PDF format by selecting the Reports link. New profiles are 
            constantly being developed and will be added to the published list as soon as they have been completed 
            and quality assured. Older versions of profiles can be accessed by selecting the History link. If you 
            identify any inaccuracies or have queries about any of the published profiles then please contact us using 
            the following email address: <a href='mailto:D2R2@defra.gsi.gov.uk'>
                D2R2@defra.gsi.gov.uk</a>
        </p>
        <p>
            Please feel free to contact us if you are experience specific problems, particularly if you are using alternative 
            browsing devices.
        </p>
        </asp:Panel>
        <asp:Panel ID="pnlHistoryPageText" runat="server" Width="100%" Visible="false">
        <p>
            This page lists any earlier published versions of the profile. The earliest versions of the profile may not be 
            included in this list if they were produced and subsequently superseded before Defra developed this public 
            Internet site for profiles. If you wish to see these earlier versions then please contact us using the following 
            email address:<a href='mailto:D2R2@defra.gsi.gov.uk'>
                D2R2@defra.gsi.gov.uk</a>
        </p>
        </asp:Panel>
        <div class="clearboth">
        </div>
    </div>
    
    <div id="main">
        <asp:GridView Width="100%" ID="grdProfiles" runat="server" AutoGenerateColumns="False" DataSourceID="dsProfileVersionList"
        EmptyDataText="There are no profiles to display.">
            <Columns>
                <asp:BoundField DataField="Title" HeaderText="Title" ReadOnly="True" SortExpression="Title" />
                <asp:BoundField DataField="Version" HeaderText="Version" ReadOnly="True" SortExpression="Version" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink ID="lnkReports" runat="server" Text="Reports" NavigateUrl='<%# "ProfileReports.aspx?ProfileVersionId=" & Eval("Id").ToString() %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField Visible="false">
                    <ItemTemplate>
                        <asp:HyperLink ID="lnkBrowse" runat="server" Text="Browse" NavigateUrl='<%# "ViewProfileData.aspx?ProfileVersionId=" & Eval("Id").ToString() %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink ID="lnkHistory" runat="server" Text="History" NavigateUrl='<%# "Home.aspx?HistoryId=" & Eval("ProfileId").ToString() %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink ID="lnkScenarios" runat="server" Text="Scenarios" NavigateUrl='<%# "Home.aspx?ScenarioId=" & Eval("ProfileId").ToString() %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <csla:CslaDataSource ID="dsProfileVersionList" runat="server" TypeAssemblyName="ProfilesLibrary"
            TypeName="ProfilesLibrary.ProfileVersionInfoList">
        </csla:CslaDataSource>
    </div>
</asp:Content>
