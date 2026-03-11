<%@ Page Language="VB" MasterPageFile="~/ProfilesPublicTemplate.master" AutoEventWireup="false"
    CodeFile="StaticReports.aspx.vb" Inherits="StaticReports" Title="View reports" %>

<%@ OutputCache CacheProfile="CacheInfrequentChanges" %>
<asp:Content ID="navContent" ContentPlaceHolderID="cphNavigation" runat="Server">
    <nav:NavigationLinks ID="navLinks" runat="server" />
</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" runat="Server">
    <div class="coldivleft">
        <p>
            Below is the list of reports that have been drafted and peer-reviewed for publication on this website. 
            These reports have been generated from information held within the D2R2 Database. 
            If the report you are seeking is not listed below then please contact
            us using the following email address: <a href='mailto:D2R2@defra.gsi.gov.uk'>
                D2R2@defra.gsi.gov.uk</a>
        </p>
        <div class="clearboth">
        </div>
      <div style="padding-left: 1px">  
<asp:GridView ID="grdReports" runat="server" AutoGenerateColumns="False" 
        DataSourceID="dsStaticReportList" EmptyDataText="There are no reports to display.">
            <Columns>
                <asp:TemplateField HeaderText="Title">
                    <ItemTemplate>
                        <asp:HyperLink ID="lnkViewStaticReportVersion" runat="server" Target="_blank" Text='<%# Eval("Title") %>' NavigateUrl='<%# "ShowStaticReport.aspx?StaticReportVersionId=" & Eval("Id").ToString() %>'></asp:HyperLink>
                         (PDF <%#Profiles.WebControls.Profiles.WebControls.CommonUtils.FormatFileSize(CInt(Eval("FileSize")))%>)
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Version" HeaderText="Version" ReadOnly="True" />
                <asp:BoundField DataField="EffectiveDateFrom" HeaderText="Published" DataFormatString="{0:d}"
                    ReadOnly="True" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink ID="lnkHistory" runat="server" Text='History' NavigateUrl='<%# "StaticReports.aspx?StaticReportId=" & Eval("StaticReportId").ToString() %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        </div>
<csla:CslaDataSource ID="dsStaticReportList" runat="server" TypeAssemblyName="ProfilesLibrary" TypeName="ProfilesLibrary.StaticReportList">
        </csla:CslaDataSource>
    </div>
</asp:Content>
