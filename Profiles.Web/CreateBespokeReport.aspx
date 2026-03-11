<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false" Inherits="Profiles.Web.CreateBespokeReport" Title="Create Bespoke Report" CodeBehind="CreateBespokeReport.aspx.vb" %>
<%@ Register Src="~/Controls/TreeSelection.ascx" TagPrefix="uc" TagName="TreeSelection" %>
<%@ Register Src="~/Controls/TreeViewToggleButton.ascx" TagPrefix="uc" TagName="TreeViewToggleButton" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" runat="Server">
    <script type="text/javascript" src="Javascript/bespoke-report-templates.js"></script>
    <script type="text/javascript" src="./Javascript/tree-view-v2.js"></script>
    <script type="text/javascript" src="./Javascript/profiles.js"></script>
    <script type="text/javascript" src="./Javascript/create-bespoke-report.js"></script>

    <script type="text/javascript">

        initialiseCreateBespokeReportScript('<%= ProfileSectionInfo.ClientID %>', '<%= speciesTreeToggle.ClientID %>', '<%= treeSelection.ClientID %>');

    </script>

    <div class="mb-5">
        <%= IntroductoryText() %>
    </div>
    <div>
        <section>
            <div class="govuk-form-group mb-0">
                <label class="govuk-label d-inline" for="sort">
                    Use previously created template:
                </label>
                <asp:DropDownList
                    CssClass="govuk-select col-lg-6 col-sm-8"
                    ID="templatesDropdown"
                    runat="server"
                    AutoPostBack="True"
                    CausesValidation="false"
                    OnSelectedIndexChanged="templatesDropdown_SelectedIndexChanged">
                </asp:DropDownList>
                <% If isProfileEditor AndAlso SelectedReportTemplate IsNot Nothing %>
                <a id="show-edit-button" href="#" class="govuk-link mb-0 ms-4">
                    <img src="Images/edit-icon.svg" alt="Edit Title" title="Edit Title" class="me-2" />Edit title</a>
                <% End If %>
            </div>
        </section>
      
        <div class="govuk-button-group govuk-!-padding-top-5">
         <button type="submit" class="govuk-button govuk-button--secondary" data-module="govuk-button" data-action="exclude">
            Exclude guidance questions
        </button>
        <button type="submit" class="govuk-button govuk-button--secondary" data-module="govuk-button" data-action="include">
            Include guidance questions
        </button>
        </div>
        
        <div id="save-as-modal" class="modal" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content rounded-0">
                    <div class="modal-header">
                        <h5 class="modal-title">Save template as</h5>
                    </div>
                    <div class="modal-body">
                        <asp:TextBox ID="templateTitle" runat="server" MaxLength="255" CssClass="govuk-input" CausesValidation="true" placeholder="Template Title" aria-label="Template Title" />
                        <div class="row">
                            <act:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"
                                Enabled="True" TargetControlID="templateTitle"
                                FilterType="UppercaseLetters,LowercaseLetters,Custom"
                                ValidChars=" 1234567890"> <%--leave in the -space- in this string--%>
                            </act:FilteredTextBoxExtender>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                ControlToValidate="templateTitle"
                                ErrorMessage="Template title is a required field."
                                ForeColor="Red"
                                ValidationGroup="TemplateTitleGroup"
                                Display="Dynamic"
                                CssClass="mt-3">
                            </asp:RequiredFieldValidator>
                            <asp:CustomValidator ID="TitleExistsValidator"
                                runat="server"
                                ControlToValidate="templateTitle"
                                ErrorMessage="Template with that title already exists."
                                ClientValidationFunction="apha.bespokeReportsTemplates.validateNameDuplicate"
                                OnServerValidate="TitleExistsValidator_ServerValidate"
                                ValidationGroup="TemplateTitleGroup"
                                Display="Dynamic"
                                CssClass="mt-3"></asp:CustomValidator>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button runat="server"
                            ID="SaveTemplateAs"
                            Text="Save"
                            CssClass="govuk-button mb-0 me-2"
                            OnClick="SaveTemplateAs_Click"
                            ValidationGroup="TemplateTitleGroup" />
                        <button class="govuk-button govuk-button--secondary mb-0 trigger-close">Cancel</button>
                    </div>
                </div>
            </div>
        </div>

        <div id="edit-modal" class="modal" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content rounded-0">
                    <div class="modal-header">
                        <h5 class="modal-title">Edit title</h5>
                    </div>
                    <div class="modal-body">
                        <asp:TextBox ID="templateEditTitle" runat="server" MaxLength="255" CssClass="govuk-input" placeholder="Edit Template Title" aria-label="Edit Template Title" />
                        <div class="row">
                             <act:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"
                                Enabled="True" TargetControlID="templateEditTitle"
                                FilterType="UppercaseLetters,LowercaseLetters,Custom"
                                ValidChars=" 1234567890">  <%--leave in the -space- in this string--%>
                            </act:FilteredTextBoxExtender>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                runat="server"
                                ControlToValidate="templateEditTitle"
                                ErrorMessage="Template title is a required field."
                                ForeColor="Red"
                                ValidationGroup="EditTitleGroup"
                                Display="Dynamic"
                                CssClass="mt-3">
                            </asp:RequiredFieldValidator>

                            <asp:CustomValidator ID="CustomValidator1"
                                runat="server"
                                ControlToValidate="templateEditTitle"
                                ErrorMessage="Template with that title already exists."
                                ClientValidationFunction="apha.bespokeReportsTemplates.validateNameDuplicate"
                                OnServerValidate="TitleExistsValidator_ServerValidate"
                                ValidationGroup="EditTitleGroup"
                                Display="Dynamic"
                                CssClass="mt-3"></asp:CustomValidator>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button runat="server" ID="Button2" Text="Save" CssClass="govuk-button mb-0 me-2" OnClick="SaveTemplateTitle_Click" ValidationGroup="EditTitleGroup" />
                        <button class="govuk-button govuk-button--secondary mb-0 trigger-close">Cancel</button>
                    </div>
                </div>
            </div>
        </div>

        <div id="delete-modal" class="modal" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content rounded-0">
                    <div class="modal-header">
                        <h5 class="modal-title">Delete template</h5>
                    </div>
                    <div class="modal-body">
                        Are you sure you want to delete this template?
                    </div>
                    <div class="modal-footer">
                        <asp:Button runat="server"
                            ID="DeleteButton"
                            Text="Delete template"
                            CssClass="govuk-button govuk-button--warning mb-0 me-2"
                            OnClick="DeleteButton_Click" />
                        <button class="govuk-button govuk-button--secondary mb-0 trigger-close">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="">
                <% If errorMessage IsNot Nothing   %>
                <div class="small-notification-error text-danger" role="alert" aria-hidden="true">
                    <%= errorMessage %>
                </div>
                <% End If%>

                <div class="small-notification-success" style="visibility: hidden" aria-hidden="true" role="alert">
                </div>
            </div>
            <section class="float-start w-100">
                <table class="w-100">
                    <tr>
                        <td>
                            <div class="treeViewWrapper rad-tree-view">
                                <uc:TreeViewToggleButton runat="server" ID="speciesTreeToggle" IsExpanded="True" />
                                <telerik:RadTreeView ID="ProfileSectionInfo" runat="server" CheckBoxes="True" EnableKeyboardNavigation="True" EnableAriaSupport="True"
                                                     AccessKey="S" DataFieldID="Id" DataFieldParentID="ParentId" Height="400px" AutoPostBack="False" 
                                                     OnClientNodeChecked="bespokeClientNodeChecked" OnClientNodeClicking="bespokeClientNodeClicking" OnClientNodeExpanded="clientNodeExpanded" OnClientNodeCollapsed="clientNodeCollapsed"
                                                     ShowLineImages="true" MultipleSelect="False" EnableTheming="False" TabIndex="0" aria-label="This is a multiple-select tree view. Multiple items can be selected.">
                                </telerik:RadTreeView>
                            </div>
                            <div class="govuk-!-padding-top-3">
                                <uc:TreeSelection runat="server" ID="treeSelection"/>
                            </div>
                        </td>
                    </tr>
                </table>
            </section>
        </div>

        <div class="row">
            <div>
                <% If isProfileEditor %>
                    <div class="float-start">
                        <button id="show-save-as-button" class="govuk-button govuk-button--secondary mb-0 mt-3">Save template as</button>

                        <% If SelectedReportTemplate IsNot Nothing  %>
                        <asp:Button runat="server" ID="SaveTemplateButton" Text="Update template" CssClass="govuk-button govuk-button--secondary mb-0 mt-3" OnClick="SaveTemplate_Click" />
                        <% End If %>

                        <% If SelectedReportTemplate IsNot Nothing  %>
                        <button id="show-delete-button" class="govuk-button govuk-button--warning mb-0 mt-3">Delete template</button>
                        <% End If %>
                    </div>
                <% End If %>

                <div class="float-lg-end">
                    <asp:Button runat="server" ID="btnGenerateReport" Text="Generate bespoke report" CssClass="govuk-button mt-3 govuk-!-margin-left-5" CausesValidation="false" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
