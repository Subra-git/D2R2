<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false"
    CodeFile="EditProfileContributions.aspx.vb" Inherits="EditProfileContributions"
    Title="View/edit profile" %>

<%@ Register Src="ProfileSectionLinks.ascx" TagName="SectionLinks" TagPrefix="sec" %>
<asp:Content ID="navContent" ContentPlaceHolderID="cphNavigation" runat="Server">
    <sec:SectionLinks ID="ctlSectionLinks" runat="server" />
</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" runat="Server">
    <div style="height: 50px">
        &nbsp;</div>
    <pwc:TabStrip ID="tabStrip" runat="server">
        <pwc:TabItem IsActive="false" Text="SectionName" />
        <pwc:TabItem IsActive="false" Text="References" />
        <pwc:TabItem IsActive="false" Text="Further information" />
        <pwc:TabItem IsActive="false" Text="Review comments" />
        <pwc:TabItem IsActive="true" Text="Contributions" />
        <pwc:TabItem IsActive="false" Text="Revision dates" />
        <pwc:TabItem IsActive="false" Text="All Revision dates" />
    </pwc:TabStrip>
    <div class="TabBody">
        <asp:UpdatePanel runat="server" ID="panContributions" UpdateMode="Conditional" ChildrenAsTriggers="true">
            <ContentTemplate>
                <br />
                <br />
          
           <asp:Panel ID="panSectionContributions" runat="server" Visible="true">
                    <div class="collapsePanelHeader">Contributions</div>  
                    <div class="collapsePanel">
                <pwc:GridView ID="grdContributions" runat="server" AllowPaging="True"
                    EmptyDataText="There are no contributions to display." AutoGenerateColumns="False"
                    DataSourceID="dsContributionsList" Width="100%" AllowSorting="True"
                    GridLines="None" CssClass="gridview" DefaultSortExpression="LastContributionDate DESC" >
                    <Columns>
                        <asp:BoundField DataField="UserName" HeaderText="Username" SortExpression="UserName"
                            ItemStyle-Width="300" />
                        <asp:BoundField DataField="FullName" HeaderText="Full name" SortExpression="FullName"
                            ItemStyle-Width="300" />
                        <asp:BoundField DataField="OrganisationName" HeaderText="Organisation" SortExpression="OrganisationName"
                            ItemStyle-Width="200" />
                        <asp:BoundField DataField="LastContributionDate" HeaderText="Contribution date" SortExpression="LastContributionDate" DataFormatString="{0:dd/MM/yy HH:mm:ss}" HtmlEncode="false" ItemStyle-Wrap="false"
                            ItemStyle-Width="200" />
                    </Columns>
                    <HeaderStyle CssClass="gridviewHeader" />
                    <RowStyle CssClass="gridviewRow" />
                    <AlternatingRowStyle CssClass="gridviewAltRow" />            
                </pwc:GridView>
            <csla:CslaDataSource ID="dsContributionsList" runat="server" TypeAssemblyName="ProfilesLibrary" TypeName="ProfilesLibrary.ProfileContributionInfoList">
                        </csla:CslaDataSource>
            </div>
            </asp:Panel>
       
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
