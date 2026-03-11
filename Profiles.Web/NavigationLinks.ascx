
<%@ Control Language="VB" AutoEventWireup="false"
    Inherits="Profiles.Web.NavigationLinks" CodeBehind="NavigationLinks.ascx.vb" %>

<div class="navigation-links mb-2">
    <nav class="d-flex flex-wrap">

        <div class="col-4">
            <h1 class="mt-3 mb-3 govuk-heading-m">Disease Profiles</h1>

            <ul class="list-unstyled">

                <asp:Literal runat="server" ID="litProfileSearch">
            <li>
                <a class="govuk-link govuk-link--no-visited-state govuk-link--no-underline " href="Search.aspx">Search disease profiles</a></li>
                </asp:Literal>

                <asp:Literal runat="server" ID="litCreateProfile">
            <li>
                <a class="govuk-link govuk-link--no-visited-state govuk-link--no-underline" href="ProfileProperties.aspx">Create profile</a>
            </li>
                </asp:Literal>

                <asp:Literal runat="server" ID="litCompareProfileVersions">
            <li>
                <a class="govuk-link govuk-link--no-visited-state govuk-link--no-underline" href="CompareProfileVersions.aspx">Compare profile versions</a>
            </li>
                </asp:Literal>

                <asp:Literal runat="server" ID="litReviewTiming">
            <li>
                <a class="app-subnav__link govuk-link govuk-link--no-visited-state govuk-link--no-underline" href="DiseaseReviews.aspx">Review Timings</a>
            </li>
                </asp:Literal>
            </ul>
        </div>
        <div class="col-4">
            <h1 class="mt-3 mb-3 govuk-heading-m">Reports</h1>

            <ul class="list-unstyled">
            <li>
                <a runat="server" ID="litStaticReports" class="govuk-link govuk-link--no-visited-state govuk-link--no-underline" href="StaticReports.aspx">General reports</a>
            </li>

                <asp:Literal runat="server" ID="litUserGuidance">
            <li>
                <a class="govuk-link govuk-link--no-visited-state govuk-link--no-underline" href="EditUserGuidance.aspx">Questions and guidance reports</a>
            </li>
                </asp:Literal>

                <li runat="server" id="diseaseRankingLink">
                    <a class="govuk-link govuk-link--no-visited-state govuk-link--no-underline" href="DiseaseRanking.aspx">Disease ranking report</a>
                </li>

            </ul>
        </div>

        <div class="col-4">
            <h1 class="mt-3 mb-3 govuk-heading-m">Species Data</h1>

            <ul class="list-unstyled">
                <asp:Literal runat="server" ID="litViewSpeciesData">
            <li>
                <a class="govuk-link govuk-link--no-visited-state govuk-link--no-underline" href="ViewSpeciesData.aspx">View species data</a>
            </li>
                </asp:Literal>


                <asp:Literal runat="server" ID="litMaintainSpeciesData">
            <li>
                <a class="govuk-link govuk-link--no-visited-state govuk-link--no-underline" href="MaintainSpeciesData.aspx">Maintain species data</a>
            </li>
                </asp:Literal>
            </ul>
        </div>
    </nav>
</div>
