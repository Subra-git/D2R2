<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false" Inherits="Profiles.Web.Home" Title="D2R2" CodeBehind="Home.aspx.vb" %>

<%@ Register Src="NavigationLinks.ascx" TagName="NavigationLinks" TagPrefix="nav" %>
<%@ Register Src="SpeciesSelector.ascx" TagName="SpeciesSelector" TagPrefix="sps" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" runat="Server">
    <div class="home-page">
        <section class="col-lg-8 col-md-8 col-xs-12 float-start">
            <div class="pe-md-5">
                <p class="mb-4">D2R2 is a comprehensive, peer-reviewed animal disease database and risk ranking tool.
                    It is focused on the UK situation. Its standardised approach facilitates a transparent
                    mechanism for making policy decisions.</p>

                <div class="mb-4">
                    <h3 class="govuk-heading-m">Popular on D2R2</h3>
                </div>

                <div id="lstPopularPages" runat="server">
                    <div class="li-link-description mb-4" id="searchPage" runat="server">
                        <div class="col-8 float-start">
                            <asp:HyperLink class="apha-font-size-24 fw-bold govuk-link" runat="server" NavigateUrl="~/Search.aspx" Text="Search Disease Profiles" />
                            <p class="apha-font-size-19">Find information about diseases and the species they affect.</p>
                        </div>

                        <div class="justify-content-end d-flex align-items-center h-100">
                            <div class="home-page-chevron">
                                <asp:HyperLink NavigateUrl="~/Search.aspx" runat="server">
                                        <asp:Image runat="server" ImageUrl="./Images/normal_chevron_u3.svg" AlternateText="Search disease profiles" title="Search disease profiles"/>
                                </asp:HyperLink>
                            </div>
                        </div>
                    </div>

                    <div class="li-link-description mb-4" id="diseaseRankingLink" runat="server">
                        <div class="col-8 float-start">
                            <asp:HyperLink class="apha-font-size-24 fw-bold govuk-link" runat="server" NavigateUrl="~/DiseaseRanking.aspx" Text="Disease Ranking Report" />
                            <p class="apha-font-size-19">View Disease ranking report.</p>
                        </div>

                        <div class="justify-content-end d-flex align-items-center h-100">
                            <div class="home-page-chevron">
                                <asp:HyperLink NavigateUrl="~/DiseaseRanking.aspx" runat="server">
                                        <asp:Image runat="server" ImageUrl="./Images/normal_chevron_u3.svg" AlternateText="Disease ranking page" title="Disease ranking page"/>
                                </asp:HyperLink>
                            </div>
                        </div>
                    </div>

                    <div class="li-link-description mb-4" id="staticReportPage" runat="server">
                        <div class="col-8 float-start">
                            <asp:HyperLink class="apha-font-size-24 fw-bold govuk-link" runat="server" NavigateUrl="~/StaticReports.aspx" Text="General Reports" />
                            <p class="apha-font-size-19">View a list of reports.</p>
                        </div>

                        <div class="justify-content-end d-flex align-items-center h-100">
                            <div class="home-page-chevron">
                                <asp:HyperLink NavigateUrl="~/StaticReports.aspx" runat="server">
                                    <asp:Image runat="server" ImageUrl="./Images/normal_chevron_u3.svg" AlternateText="General Reports" title="General Reports"/>
                                </asp:HyperLink>
                            </div>
                        </div>
                    </div>

                    <div class="li-link-description mb-4" id="viewSpeciesDataPage" runat="server">
                        <div class="col-8 float-start">
                            <asp:HyperLink class="apha-font-size-24 fw-bold govuk-link" runat="server" NavigateUrl="~/ViewSpeciesData.aspx" Text="View Species Data" />
                            <p class="apha-font-size-19">Find information about specific species.</p>
                        </div>

                        <div class="justify-content-end d-flex align-items-center h-100">
                            <div class="home-page-chevron">
                                <asp:HyperLink NavigateUrl="~/ViewSpeciesData.aspx" runat="server">
                                    <asp:Image runat="server" ImageUrl="./Images/normal_chevron_u3.svg" AlternateText="View species data page" title="View species data page"/>
                                </asp:HyperLink>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="col-lg-4 col-md-4 col-xs-12 float-md-end">
            <div class="mb-3">
                <asp:Image runat="server" ID="Image1" ImageUrl="./Images/D2R2LogoSmall.png" BackColor="Transparent" Width="300" AlternateText="Image Describing D2R2" title="Image Describing D2R2" />
            </div>
            <div class="govuk-body">
                <h3 class="govuk-heading-m mt-4">Quick Links:</h3>
                <asp:HyperLink ID="helpPage" runat="server" class="apha-font-size-24 govuk-link" NavigateUrl="~/StaticReports.aspx?UserManual=1" Text="Help Using D2R2" /><br />
                <asp:HyperLink ID="maintainProfileVersionPage" class="apha-font-size-24 govuk-link" runat="server" NavigateUrl="~/CompareProfileVersions.aspx" Text="Compare Profile Versions" /><br />
                <asp:HyperLink ID="diseaseRankingFilterPage" class="apha-font-size-24 govuk-link" runat="server" NavigateUrl="~/EditDiseaseRankingFilters.aspx" Text="Create Disease Ranking Filter" /><br />
            </div>
        </section>
    </div>
</asp:Content>
