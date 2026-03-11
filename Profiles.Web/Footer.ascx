<%@ Control Language="VB" AutoEventWireup="false"
    Inherits="Profiles.Web.Footer" CodeBehind="Footer.ascx.vb" %>
<footer id="footer" class="footer pb-5">
    <div class="container">

        <div class="d-flex flex-wrap mt-2">
            <div class="app-back-to-top" data-module="app-back-to-top">
                <asp:Literal runat="server" ID="litBackToTop">
                       <a class="t-top govuk-link govuk-link--no-visited-state app-back-to-top__link" href="#top">
                        <svg role="presentation" 
                            focusable="false" 
                            class="app-back-to-top__icon" 
                            xmlns="http://www.w3.org/2000/svg" 
                            width="13" 
                            height="17" 
                            viewBox="0 0 13 17" 
                            alt="Back to top" 
                            title="Back to top">
                          <path fill="currentColor" d="M6.5 0L0 6.5 1.4 8l4-4v12.7h2V4l4.3 4L13 6.4z"></path>
                        </svg>Back to top
                      </a>
                </asp:Literal>
            </div>
        </div>

        <div class="d-flex flex-wrap">
            <div id="pnlUserAdmin" runat="server" class="col-4">
                <h3 class="mt-3 mb-3 pb-1 govuk-heading-m col-10 border-bottom">User Admin</h3>
                <ul class="list-unstyled col-4">
                    <asp:Literal runat="server" ID="litMaintainGlobalUsers">
                        <li>
                            <a class="app-subnav__link govuk-link govuk-link--no-visited-state govuk-link--no-underline" href="MaintainGlobalUsers.aspx">Global users</a>
                        </li>
                    </asp:Literal>

                    <asp:Literal runat="server" ID="litMaintainExternalUsers">
                        <li>
                            <a class="app-subnav__link govuk-link govuk-link--no-visited-state govuk-link--no-underline"  href="MaintainExternalUsers.aspx">External users</a>
                        </li>
                    </asp:Literal>
                </ul>
            </div>

            <div id="pnlCrossProfileAdmin" runat="server" class="col-4">
                <h3 class="mt-3 mb-3 pb-1 govuk-heading-m col-10  border-bottom">Cross Profile Admin</h3>
                <ul class="list-unstyled">
                    <asp:Literal runat="server" ID="litMaintainReferenceData">
                        <li>
                            <a class="app-subnav__link govuk-link govuk-link--no-visited-state govuk-link--no-underline"  href="MaintainReferenceData.aspx">Maintain reference data</a>
                        </li>
                    </asp:Literal>

                    <asp:Literal runat="server" ID="litPrioritisationVariables">
                        <li>
                            <a class="app-subnav__link govuk-link govuk-link--no-visited-state govuk-link--no-underline"  href="MaintainPrioritisationVariables.aspx">Maintain prioritisation variables</a>
                        </li>
                    </asp:Literal>

                    <asp:Literal runat="server" ID="litCrossCuttingIssueScores">
                        <li>
                            <a class="app-subnav__link govuk-link govuk-link--no-visited-state govuk-link--no-underline"  href="MaintainCrossCuttingIssueScores.aspx">Maintain cross-cutting issue scores</a>
                        </li>
                    </asp:Literal>
                </ul>
            </div>

            <div id="pnlHelpAndSupport" runat="server" class="col-4">
                <h3 class="mt-3 mb-3 pb-1 govuk-heading-m col-10  border-bottom">Help and Support</h3>
                <ul class="list-unstyled">
                    <asp:Literal runat="server" ID="litUserManuals">
                        <li>
                            <a class="app-subnav__link govuk-link govuk-link--no-visited-state govuk-link--no-underline"  href="StaticReports.aspx?UserManual=1">Help using D2R2</a>
                        </li>
                    </asp:Literal>

                    <li>
                        <asp:HyperLink
                            runat="server"
                            ID="qualityStatementLink"
                            CssClass="app-subnav__link govuk-link govuk-link--no-visited-state govuk-link--no-underline">
                            D2R2 Quality Statement
                        </asp:HyperLink>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</footer>
