<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false" Inherits="Profiles.Web.Search" Title="Search disease profiles" CodeBehind="Search.aspx.vb" %>

<%@ Register Src="SpeciesSelector.ascx" TagName="SpeciesSelector" TagPrefix="sps" %>
<%@ Register Src="Paginator.ascx" TagName="Paginator" TagPrefix="auc" %>
<%@ Register Src="~/PageSizeList.ascx" TagPrefix="auc" TagName="PageSizeList" %>
<%@ Register Src="~/Controls/Accordion.ascx" TagPrefix="auc" TagName="Accordion" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" runat="Server">
    <script type="text/javascript" src="Javascript/search-init.js"></script>
    <script type="text/javascript" src="Javascript/profiles.js"></script>
    
    <script type="text/javascript"> 
        $(document).ready(() => {
            apha.searchPage.searchPageLoadingPopup('<%= mpeProgress.ClientID %>')
        });
    </script>
    <div class="search-page govuk-frontend-supported">
        <div>
            <div class="container">
                <div class="mb-5">
                    Access disease profiles from this page. 
                </div>
            </div>
        </div>

        <div class="mt-3 search-page-filters">
            <asp:UpdatePanel ID="udpSearch" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <section class="card thick-card p-3">
                        <div class="row">
                            <div class="mb-3 col-lg-6 col-xs-12 col-sm-12">
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="txtTitle" Text="Search for disease profiles" />

                                    <div class="input-group mb-1 mt-1">
                                        <asp:TextBox ID="txtTitle" runat="server" MaxLength="255" CssClass="govuk-input" />
                                        <a class="input-group-text govuk-element-focus" id="basic-addon2" href="#" onclick="<%= btnSearch.ClientID %>.click(); return false">
                                            <img src="Images/magnifying-glass.svg" width="20" height="20" title="Search profiles" />
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="mb-3">
                                <div class="col">
                                    View profiles beginning with
                                <div class="w-100 mt-1 alphabet-selector">
                                    <pwcs:AlphabetSelector ID="ctlLetterSelector" runat="server" />
                                </div>
                                </div>
                            </div>


                            <div class="govuk-checkboxes">
                                <div class="me-3 mb-2">
                                    <asp:CheckBox ID="chkDisplayPublished"
                                        class="govuk-checkboxes__item"
                                        runat="server"
                                        Checked="true"
                                        Text="Display published versions (content that has been independently reviewed)"
                                        AutoPostBack="true" />
                                </div>
                                <div class="mb-2">
                                    <asp:CheckBox
                                        ID="chkDisplayDraft"
                                        class="govuk-checkboxes__item"
                                        runat="server"
                                        Text="Display draft versions (the most up to date information available, although not yet independently reviewed)"
                                        AutoPostBack="true" />
                                </div>
                                <div class="mb-2">
                                    <asp:CheckBox
                                        ID="chkDisplayScenarios"
                                        class="govuk-checkboxes__item"
                                        runat="server"
                                        Text="Display scenarios (scenarios can differ radically to the current version of a disease profile, see Question 1.5 for context)"
                                        AutoPostBack="true" />
                                </div>
                                <div class="mb-2">
                                    <asp:CheckBox
                                        ID="chkDisplayMyProfiles"
                                        class="govuk-checkboxes__item"
                                        runat="server"
                                        Text="Display my own profiles only"
                                        AutoPostBack="true" />
                                </div>
                            </div>
                            <div class="d-block mt-3">
                                <auc:Accordion runat="server" 
                                    ID="speciesFilterButton" 
                                    ButtonText="Show filter by affected species" 
                                    ShowText="Show filter by affected species" 
                                    HideText="Hide filter by affected species" 
                                    ContainerClass=".species-selector-container"
                                    ContainerId="species-selector-container"/>

                                <div class="species-selector-container" style="display: none" id="species-selector-container">
                                    <sps:SpeciesSelector runat="server" ID="spsSelector" />
                                </div>
                                <div class="mb-3 govuk-!-padding-top-3">
                                    <div class="col-md-12 col-xs-12 col-sm-12">
                                        <asp:Label runat="server" Text="Currently selected:" />
                                        <div class="bg-gray-light d-inline-block">
                                            <asp:Label ID="lblAffectedSpecies" runat="server" CssClass="any-species-button">Any species</asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="mb-4">
                                <hr />
                                <div class="mt-4">
                                    <a class="govuk-body apha-font-size-19 govuk-link more-filters-button"
                                        href="#"
                                        style="text-decoration: underline"
                                        onclick="apha.searchPage.showAdvancedFilters(this); return false"></a>
                                </div>
                            </div>
                            <div class="more-filters" style="display:none">
                                <div class="govuk-form-group">
                                  <fieldset class="govuk-fieldset">
                                    <legend class="apha-font-size-19">
                                        Search for 
                                    </legend>
                                      <div class="govuk-radios">
                                           <div class="govuk-radios__item">
                                                <asp:RadioButton ID="rbExactWordOrPhase" runat="server" Text="this exact word or phrase" GroupName="wordSearchRadioGroup" Checked="true"/>
                                           </div>
                                          <div class="govuk-radios__item">
                                                <asp:RadioButton ID="rbExactAllWords" runat="server" Text="all these words" GroupName="wordSearchRadioGroup" Checked="false"/>
                                           </div>
                                      </div>
                                    </div>
                                  </fieldset>
                                
                            <div class="govuk-form-group">
                              <label class="govuk-label apha-font-size-19">
                                Appears in
                              </label>
                              
                                <asp:DropDownList title="search type" ID="ddlWordSearchType" runat="server" AutoPostBack="True" CausesValidation="false" CssClass="govuk-select apha-font-size-19" OnSelectedIndexChanged="ddlWordSearchType_SelectedIndexChanged"></asp:DropDownList>
                              
                                <asp:Panel runat="server" ID="pnlSectionSelection" Visible="false">

                                    <label class="govuk-label apha-font-size-19 mt-3">
                                        In section
                                    </label>
                                 
                                    <div class="govuk-checkboxes__item govuk-checkboxes--small">
                                            <asp:CheckBox runat="server" ID="chkUnselectSections" Text="Unselect all" AutoPostBack="true" OnCheckedChanged="chkUnselectSections_CheckedChanged"/>
                                    </div>
                                    <div class="govuk-checkboxes govuk-checkboxes--small">
                                        <div class="row">
                                            <asp:Repeater runat="server" ID="rptSections">
                                                <ItemTemplate>
                                                    <div class="col-xxl-4 col-xl-4 col-md-6 col-sm-12">
                                                        <div class="govuk-checkboxes__item">
                                                            <asp:CheckBox runat="server" ID="chkSection" Text='<%# Eval("Value") %>' />
                                                            <asp:HiddenField runat="server" ID="hdnSectionNumber" Value='<%# Eval("Key") %>' />
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                    </div>
                        </asp:Panel>
                            </div>
                        </div>
                            <div class="float-start">
                                    <asp:Button ID="btnSearch" runat="server" Text="Search profiles" CssClass="govuk-button mb-0" />
                             </div>
                    </section>

                    <section class="border-bottom">
                        <div class="d-flex mt-3 mb-3">
                            <span runat="server" id="spnResultsCount" class="govuk-!-font-size-16"></span>
                            <span class="govuk-!-font-size-16">&nbspdisease profile(s) found containing the search words (phrase) you entered</span>
                        </div>

                    </section>

                    <section class="row">
                        <div class="mb-2 mt-2 d-flex align-items-center">
                            <div class="col-lg-6 col-xs-6 col-sm-6 justify-content-star">
                                <label>Sort by:</label>
                                <asp:DropDownList title="sort by" runat="server" ID="ddlSortBy" OnSelectedIndexChanged="ddlSortBy_SelectedIndexChanged" AutoPostBack="true" CausesValidation="false" CssClass="govuk-select apha-font-size-19"></asp:DropDownList>
                            </div>

                            <div class="col-lg-6 col-xs-6 col-sm-6 d-flex d-flex align-items-end justify-content-end">
                                <auc:PageSizeList runat="server" ID="PaginatorPageSize" OnPageSizeChanged="PaginatorPageSize_PageSizeChanged" />
                            </div>
                        </div>
                    </section>

                    <section class="row g-0 p-0 m-0">
                        <asp:Repeater ID="rptProfileList" runat="server" OnItemDataBound="rptProfileList_DataBinding">
                            <ItemTemplate>
                                <div class="card card-body bg-0 p-2 mb-2">
                                    <div class="row g-0 p-0 m-0 align-items-center mb-2">
                                        <div class="col-auto me-5">
                                            <h3 class="fw-bold">
                                                <%# Eval("ProfileInfo.Title") %> 
                                            </h3>
                                        </div>



                                        <div class="col-auto">
                                            <div class="d-flex justify-content-end">
                                                <% If CanEditProfile %>
                                                <% If DisplayScenarios = False Then %>
                                                <div class="border-end me-2">
                                                    <a class="me-2 govuk-link govuk-link--no-visited-state" href="EditProfileTitle.aspx?ProfileId=<%# Eval("ProfileInfo.Id")%>">Edit Title</a>
                                                </div>
                                                <% End If %>

                                                <% If DisplayScenarios = True Then %>
                                                <div class="me-2">
                                                    <a class="me-2 govuk-link govuk-link--no-visited-state" href="EditProfileTitle.aspx?ProfileId=<%# Eval("ProfileInfo.Id")%>">Edit Title</a>
                                                </div>
                                                <% End If %>
                                                <% End If %>
                                                <% If DisplayScenarios = False Then %>
                                                <% If CanCreateProfile %>
                                                <div class="me-2">
                                                    <a class="govuk-link govuk-link--no-visited-state" href="ManageProfile.aspx?ProfileId=<%# Eval("ProfileInfo.Id")%>">Manage</a>
                                                </div>
                                                <% End If %>

                                                <% If CanGetContributionsReport %>
                                                <div class="border-start">
                                                    <a class="ms-2 govuk-link govuk-link--no-visited-state" href="ShowContributionReport.aspx?ProfileId=<%# Eval("ProfileInfo.Id")%>">Contributions</a>
                                                </div>
                                                <% End If %>
                                                <% End If %>
                                            </div>
                                        </div>
                                    </div>



                                    <asp:Repeater ID="scenarioRepeater" runat="server" OnItemDataBound="scenarioRepeater_ItemDataBound">
                                        <HeaderTemplate>
                                        </HeaderTemplate>
                                        <ItemTemplate>

                                            <div runat="server" id="searchResultsContainer" class="govuk-!-padding-bottom-3">
                                                <div class="d-flex align-items-center mb-1" runat="server">
                                                    <button type="button"
                                                        runat="server"
                                                        aria-controls="accordion-default-content-1"
                                                        class="govuk-accordion__show-all"
                                                        href="#"
                                                        onclick="apha.searchPage.showSearchResults(this); return false;"
                                                        aria-expanded="false">
                                                        <span class="govuk-accordion__section-toggle" data-nosnippet="">
                                                            <span class="govuk-accordion__section-toggle-focus apha-font-size-19">
                                                                <span class="govuk-accordion__section-toggle-text">Show criteria matches</span>
                                                                <i runat="server" class="govuk-accordion-nav__chevron govuk-accordion-nav__chevron--down"></i>
                                                            </span>
                                                        </span>

                                                    </button>
                                                </div>

                                                <div class="govuk-accordion__section" style="display: none;">
                                                    <p class="govuk-!-font-size-16"><%# Eval("SearchResultsString") %> </p>
                                                </div>

                                            </div>

                                            <%  Dim scenarioMargin As String = ""
                                                Dim startMargin As String = ""

                                                If DisplayScenarios = True Then
                                                    scenarioMargin = "mb-3"
                                                    startMargin = "ms-4"
                                                End If
                                            %>

                                            <div class="<%= scenarioMargin %>">
                                                <div class="d-flex">
                                                    <% If DisplayScenarios = True Then %>
                                                    <div class="col-8">
                                                        <h5 class="fw-bold">
                                                            <%# Eval("Scenario.ScenarioTitle") %> 
                                                        </h5>
                                                    </div>
                                                    <% End If %>

                                                    <% If DisplayScenarios = True Then %>
                                                    <div class="col-4">
                                                        <div class="d-flex justify-content-end">
                                                            <% If CanCreateProfile %>
                                                            <div class="me-2">
                                                                <a class="govuk-link govuk-link--no-visited-state" href="ManageProfile.aspx?ProfileId=<%# Eval("Scenario.Id")%>">Manage</a>
                                                            </div>
                                                            <% End If %>

                                                            <% If CanGetContributionsReport %>
                                                            <div class="border-start">
                                                                <a class="ms-2 govuk-link govuk-link--no-visited-state" href="ShowContributionReport.aspx?ProfileId=<%# Eval("Scenario.Id")%>">Contributions</a>
                                                            </div>
                                                            <% End If %>
                                                        </div>
                                                    </div>
                                                    <% End If %>
                                                </div>
                                                <% If DisplayPublished Then %>
                                                <div class="card card-body p-0 m-0 border-0 mb-1">
                                                    <div class="card card-body bg-light p-2 <%= startMargin %>">
                                                        <div>
                                                            <div class="col-auto">
                                                                <div class="d-flex align-items-center">
                                                                    <div class="fw-bold">
                                                                        <label>Published current version: </label>
                                                                        <%# Eval("PublishedVersionNumber") %>
                                                                    </div>
                                                                    <div class="ms-3 small">
                                                                        <span aria-label="Valid from"></span>
                                                                        <%# Eval("PublishedDates") %>
                                                                        <%# ShowPublic(Eval("PublishedVersion")) %>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="mt-2 mb-2 d-flex" runat="server" id="publishedVersionLinks">
                                                                <div class="me-2 border-end">
                                                                    <a runat="server" id="viewReportsLink" class="me-2 govuk-link govuk-link--no-visited-state">View reports
                                                                    </a>
                                                                </div>
                                                                <% If CanCreateProfile %>
                                                                <div class="me-2 border-end">
                                                                    <a class="me-2 govuk-link govuk-link--no-visited-state" href="ProfileProperties.aspx?CloneProfileVersionId=<%# Eval("PublishedVersion.Id")%>">Clone profile</a>
                                                                </div>
                                                                <% End If %>

                                                                <div class="me-2">
                                                                    <a class="govuk-link govuk-link--no-visited-state" href="EditProfileQuestions.aspx?ProfileVersionId=<%# Eval("PublishedVersion.Id")%>">Browse profile</a>
                                                                </div>

                                                                <% If CanCreateScenario %>
                                                                <div class="me-2 border-start">
                                                                    <a class="ms-2 govuk-link govuk-link--no-visited-state" href="ProfileProperties.aspx?CloneProfileVersionId=<%# Eval("PublishedVersion.Id")%>&Scenario=1">Clone scenario</a> <%--Scenario is always = 1 even in legacy--%>
                                                                </div>
                                                                <% End If %>
                                                            </div>

                                                            <div class="row mb-2" runat="server" id="profileStatus">
                                                                <span>Profile Status: <%# Eval("ProfileStatus") %></span>
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="d-flex align-items-center mb-1" runat="server" id="publishedVersionsContainer">
                                                                <button type="button"
                                                                    runat="server"
                                                                    aria-controls="accordion-default-content-1"
                                                                    class="govuk-accordion__show-all"
                                                                    href="#"
                                                                    onclick="apha.searchPage.showVersions(this); return false;"
                                                                    aria-expanded="false">
                                                                    <span class="govuk-accordion__section-toggle" data-nosnippet="">
                                                                        <span class="govuk-accordion__section-toggle-focus apha-font-size-19">
                                                                            <span class="govuk-accordion__section-toggle-text">Show previous versions</span>
                                                                            <i id="versionShowIcon" runat="server" class="govuk-accordion-nav__chevron govuk-accordion-nav__chevron--down"></i>
                                                                        </span>
                                                                    </span>

                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="ms-2">
                                                        <div class="version-repeater-container <%= startMargin %>" style="display: none">
                                                            <asp:Repeater ID="publishedVersionRepeater" runat="server">
                                                                <HeaderTemplate>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <div class="d-xl-flex border-bottom pb-2 pt-2">
                                                                        <div class="col-xl-6 col-lg-12 d-flex">
                                                                            <div class="col-3">
                                                                                Version <%# Eval("Version") %>
                                                                            </div>
                                                                            <div class="col-3">
                                                                                <%# Eval("Status") %>
                                                                            </div>

                                                                            <div class="col-auto">
                                                                                <span aria-label="Valid from"></span>
                                                                                <%# Eval("EffectiveDates") %>
                                                                                <%# ShowPublicValue(Eval("IsPublic")) %>
                                                                            </div>

                                                                        </div>
                                                                        <div class="col-xl-6 col-lg-12">
                                                                            <div class="col d-flex justify-content-xl-end">
                                                                                <div class="border-end me-2">
                                                                                    <a id="viewReportsLink" href="ProfileReports.aspx?ProfileVersionId=<%# Eval("Id")%>" class="me-2 govuk-link govuk-link--no-visited-state">View reports</a>
                                                                                </div>
                                                                                <% If CanCreateProfile %>
                                                                                <div class="border-end me-2">
                                                                                    <a class="me-2 govuk-link govuk-link--no-visited-state" href="ProfileProperties.aspx?CloneProfileVersionId=<%# Eval("Id")%>">Clone profile</a>
                                                                                </div>
                                                                                <% End If %>
                                                                                <div class="me-2">
                                                                                    <a class=" govuk-link govuk-link--no-visited-state" href="EditProfileQuestions.aspx?ProfileVersionId=<%# Eval("Id")%>">Browse profile</a>
                                                                                </div>
                                                                                <% If CanCreateScenario %>
                                                                                <div class="border-start">
                                                                                    <a class="ms-2 govuk-link govuk-link--no-visited-state" href="ProfileProperties.aspx?CloneProfileVersionId=<%# Eval("Id")%>&Scenario=1">Clone scenario</a>
                                                                                </div>
                                                                                <% End If %>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                        </div>
                                                    </div>
                                                </div>

                                                <% End If %>
                                                <% If DisplayDraft Then %>

                                                <div class="card card-body p-0 m-0 border-0">
                                                    <div class="card card-body bg-light p-2 <%= startMargin %>">
                                                        <div class="d-flex align-items-center">
                                                            <div class="fw-bold">
                                                                <label>Draft current version: </label>
                                                                <%# Eval("DraftVersionNumber") %>
                                                            </div>
                                                            <div class="ms-3 small">
                                                                <span aria-label="Valid from"></span>
                                                                <%# Eval("DraftDates") %>
                                                            </div>
                                                        </div>

                                                        <div class="mb-2" runat="server" ID="draftVersionLinks">
                                                            <div class="d-flex">
                                                                <% If CanCreateProfile %>
                                                                <div class="border-end me-2">
                                                                    <a class="me-2 govuk-link govuk-link--no-visited-state" href="ProfileProperties.aspx?CloneProfileVersionId=<%# Eval("DraftVersion.Id")%>">Clone profile</a>
                                                                </div>
                                                                <% End If %>
                                                                <div class="me-2">
                                                                    <a class="govuk-link govuk-link--no-visited-state" href="EditProfileQuestions.aspx?ProfileVersionId=<%# Eval("DraftVersion.Id")%>">Browse profile</a>
                                                                </div>
                                                                <% If CanCreateScenario %>
                                                                <div class="border-start me-2">
                                                                    <a class="ms-2 govuk-link govuk-link--no-visited-state" href="ProfileProperties.aspx?CloneProfileVersionId=<%# Eval("DraftVersion.Id")%>&Scenario=1">Clone scenario</a>
                                                                </div>
                                                                <% End If %>
                                                            </div>
                                                        </div>
                                                        <div class="row mb-2">
                                                            <div>
                                                                <span>Profile Status: <%# Eval("ScenarioProfileStatus") %></span>
                                                            </div>
                                                            <div>
                                                                <span><%# Eval("ProfileReviewStatus") %></span>
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="d-flex align-items-center mb-1" runat="server" id="draftVersionsContainer">
                                                                <button type="button"
                                                                    runat="server"
                                                                    aria-controls="accordion-default-content-1"
                                                                    class="govuk-accordion__show-all"
                                                                    href="#"
                                                                    onclick="apha.searchPage.showVersions(this); return false;"
                                                                    aria-expanded="false">
                                                                    <span class="govuk-accordion__section-toggle" data-nosnippet="">
                                                                        <span class="govuk-accordion__section-toggle-focus apha-font-size-19">
                                                                            <span id="draftVersionShowLabel" runat="server" class="govuk-accordion__section-toggle-text">Show previous versions</span>
                                                                            <i id="draftVersionIcon" runat="server" class="govuk-accordion-nav__chevron govuk-accordion-nav__chevron--down"></i>
                                                                        </span>
                                                                    </span>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="ms-2">
                                                        <div class="version-repeater-container <%= startMargin %>" style="display: none;">
                                                            <asp:Repeater ID="draftVersionRepeater" runat="server">
                                                                <HeaderTemplate>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <div class="d-xl-flex d-lg-flex border-bottom pb-2 pt-2">
                                                                        <div class="col-xl-6 col-lg-6 d-flex">
                                                                            <div class="col-3">
                                                                                Version <%# Eval("Version") %>
                                                                            </div>
                                                                            <div class="col-3">
                                                                                <%# Eval("Status") %>
                                                                            </div>

                                                                            <div class="col-auto">
                                                                                <span aria-label="Valid from"></span>
                                                                                <%# Eval("EffectiveDates") %>
                                                                                <%# ShowPublicValue(Eval("IsPublic")) %>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-xl-6 col-lg-7">
                                                                            <div class="col d-flex justify-content-xl-end">
                                                                                <% If CanCreateProfile %>
                                                                                <div class="border-end me-2">
                                                                                    <a class="me-2 govuk-link govuk-link--no-visited-state" href="ProfileProperties.aspx?CloneProfileVersionId=<%# Eval("Id")%>">Clone profile</a>
                                                                                </div>
                                                                                <% End If %>

                                                                                <div class="me-2">
                                                                                    <a class="govuk-link govuk-link--no-visited-state" href="EditProfileQuestions.aspx?ProfileVersionId=<%# Eval("Id")%>">Browse profile</a>
                                                                                </div>

                                                                                <% If CanCreateScenario %>
                                                                                <div class="border-start">
                                                                                    <a class="ms-2 govuk-link govuk-link--no-visited-state" href="ProfileProperties.aspx?CloneProfileVersionId=<%# Eval("Id")%>&Scenario=1">Clone scenario</a>
                                                                                </div>
                                                                                <% End If %>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                        </div>
                                                    </div>
                                                </div>
                                                <% End If %>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </section>

                    <div runat="server" id="noDataLabel">There are no profiles that match the selected criteria.</div>

                    <div>
                        <auc:Paginator runat="server" ID="bottomPaginator"></auc:Paginator>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        <asp:Panel ID="pnlProgress" runat="server" Height="150px" Width="250px" Style="text-align: center; display: none;">
            <asp:Panel ID="pnlProgressHeader" runat="server" CssClass="collapsePanelHeader">In progress...</asp:Panel>
            <div class="collapsePanel" style="height: 100px">
                <br />
                <asp:Image ID="imgProgress" runat="server" Height="55px" ImageUrl="Images/Progress2.gif" ToolTip="In progress..." Visible="True" Enabled="False" Width="54px" ImageAlign="Middle" />
            </div>
        </asp:Panel>

        <act:ModalPopupExtender ID="mpeProgress" runat="server" TargetControlID="imgProgress" PopupControlID="pnlProgress"
            BackgroundCssClass="modalBackground"
            OkControlID="imgProgress"
            CancelControlID="imgProgress" />
    </div>
</asp:Content>

