<%@ Page Language="VB" MasterPageFile="~/NestedProfileQuestions.master" AutoEventWireup="false" Inherits="Profiles.Web.EditProfileContributions"
    Title="View/edit profile" CodeBehind="EditProfileContributions.aspx.vb" %>

<%@ Register Src="ProfileSectionLinks.ascx" TagName="SectionLinks" TagPrefix="sec" %>
<%@ Register Src="~/SectionPagination.ascx" TagPrefix="pag" TagName="SectionPagination" %>
<%@ Register Src="Paginator.ascx" TagName="Paginator" TagPrefix="auc" %>
<%@ Register Src="~/PaginatorPageSize.ascx" TagPrefix="auc" TagName="PaginatorPageSize" %>

<asp:Content ID="NestedProfileContent" ContentPlaceHolderID="NestedProfileContent" runat="Server">
    <div style="height: 50px">
        &nbsp;
    </div>
    <pwc:TabStrip ID="tabStrip" runat="server">
        <pwc:TabItem IsActive="false" Text="SectionName" />
        <pwc:TabItem IsActive="false" Text="References" />
        <pwc:TabItem IsActive="false" Text="Further information" />
        <pwc:TabItem IsActive="false" Text="Review comments" />
        <pwc:TabItem IsActive="false" Text="All Revision dates" />
        <pwc:TabItem IsActive="true" Text="Contributions" />
    </pwc:TabStrip>
    <div class="TabBody">
        <asp:UpdatePanel runat="server" ID="panContributions" UpdateMode="Conditional" ChildrenAsTriggers="true">
            <ContentTemplate>
                <asp:Panel ID="panSectionContributions" runat="server" Visible="true">
                    <div class="row">
                        <div class="mb-3 mt-3 d-flex justify-content-end align-items-center">
                              <auc:PaginatorPageSize runat="server" id="PaginatorPageSize" PaginatorId="bottomPaginator" GridId="grdContributions" />
                        </div>
                    </div>

                    <pwc:GridViewExternalPaging ID="grdContributions" runat="server" AllowPaging="True"
                        EmptyDataText="There are no contributions to display." AutoGenerateColumns="False"
                        DataSourceID="dsContributionsList" Width="100%" AllowSorting="True"
                        GridLines="None" CssClass="gridview" DefaultSortExpression="LastContributionDate DESC">
                        <Columns>
                            <asp:BoundField DataField="UserName" HeaderText="Username" SortExpression="UserName"
                                ItemStyle-Width="300" />
                            <asp:BoundField DataField="FullName" HeaderText="Full name" SortExpression="FullName"
                                ItemStyle-Width="300" />
                            <asp:BoundField DataField="OrganisationName" HeaderText="Organisation" SortExpression="OrganisationName"
                                ItemStyle-Width="200" />
                            <asp:BoundField 
                                DataField="LastContributionDate" 
                                HeaderText="Contribution date and time" 
                                SortExpression="LastContributionDate" 
                                DataFormatString="{0:dd/MM/yy HH:mm:ss}"
                                HtmlEncode="false" 
                                ItemStyle-Wrap="false"
                                ItemStyle-Width="350" />
                        </Columns>
                        <HeaderStyle CssClass="gridviewHeader" />
                        <RowStyle CssClass="gridviewRow" />
                        <AlternatingRowStyle CssClass="gridviewAltRow" />
                    </pwc:GridViewExternalPaging>

                    <div class="mt-2">
                        <auc:Paginator runat="server" ID="bottomPaginator"></auc:Paginator>
                    </div>

                    <csla:CslaDataSource ID="dsContributionsList" runat="server" TypeAssemblyName="ProfilesLibrary" TypeName="ProfilesLibrary.ProfileContributionInfoList">
                    </csla:CslaDataSource>
                </asp:Panel>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div class="SectionPaginationAdjuster">
        <pag:SectionPagination runat="server" ID="SectionPagination" />
    </div>
</asp:Content>
