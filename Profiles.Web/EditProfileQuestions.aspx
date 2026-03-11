<%@ Page Language="VB" MasterPageFile="~/NestedProfileQuestions.master" AutoEventWireup="false" EnableEventValidation="false" Inherits="Profiles.Web.EditProfileQuestions" CodeBehind="EditProfileQuestions.aspx.vb" MaintainScrollPositionOnPostback="false" %>

<%@ Register TagPrefix="pwc" Namespace="Profiles.WebControls.ProfilesWeb.Controls" Assembly="Profiles.WebControls" %>
<%@ Register Src="~/SectionPagination.ascx" TagPrefix="pag" TagName="SectionPagination" %>
<%@ Register Src="SavePrompt.ascx" TagName="SavePrompt" TagPrefix="uc" %>

<asp:Content runat="server" ID="NestedProfileContent" ContentPlaceHolderID="NestedProfileContent">
    <uc:SavePrompt ID="savePrompt" runat="server" />

    <script type="text/javascript" src="Javascript/edit-profile-questions.js"></script>
    <script type="text/javascript" src="Javascript/species-selector.js"></script>
    <script type="text/javascript">
        var lastSelectedIndex; //Keeps a track of the last index of a relevance dropdown in case user cancels onchange action
        var refreshPanel = true; //Keeps track of whether the per-species or repeating question panel should update the whole page or not
        function HideAndClearIrrelevantQuestions() {
            tinyMCE.triggerSave(false, true);

            document.getElementById('<%=btnHiddenRefresh.ClientId %>').click();
        }
    </script>
    <script type="text/javascript" src="Javascript/tab-manager.js"></script>
    <script type="text/javascript" src="Javascript/panel-manager.js"></script>
    <asp:HiddenField runat="server" ID="hfPosition" Value="" />
    <script type="text/javascript">
        $(function () {
            var positionField = $("#<%=hfPosition.ClientID%>");
            window.onscroll = function () {
                var position = $(window).scrollTop();
                positionField.val(position);
            };
        });

        function pageLoad() {
            var positionField = $("#<%=hfPosition.ClientID%>");
            var position = parseInt(positionField.val());
            if (!isNaN(position)) {
                $(window).scrollTop(position);
            }
        };

        function validateAndSaveNote() {
            tinyMCE.triggerSave(false, true);

            const isValid = Page_ClientValidate('Modal');

            if (isValid) {
                __doPostBack('<%= btnSaveNote.UniqueID %>', '');
                return false;
            } else {
	            var popupPosition = document.getElementById("addSelectReference");
	            popupPosition.style.top = "150px"

	            var popupContainer = document.getElementById("popupContainer");
	            popupContainer.style.height = "100%";
            
                return false;
            }
        }

        function cancelClick() {
            document.getElementById('<%= btnCancel.ClientID %>').click();
            return true;
        }
    </script>
    <div class="col-md-12">
        <div class="govuk-frontend-supported">
            <div class="popupContainer" id="popupContainer">
                <div class="add-references" id="addSelectReference">
                <asp:Panel ID="pnlAddNote" runat="server" Style="display: block; width: 100%">
                    <asp:UpdatePanel ID="updAddNote" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                        <ContentTemplate>
                            <div class="collapsePanelHeader">
                                <div class="float-start">
                                    <img src="Images/crowncopyright.png" alt="small logo" class="small-logo" />
                                </div>
                                <div class="float-end right-align">
                                    <input type="image" src="Images/close.png" class="close-button" alt="close dialog (cancel)" onclick="return cancelClick();" />
                                </div>
                            </div>
                            <asp:Panel ID="pnlAddNoteHeader" runat="server" CssClass="referencePanelHeader">
                                <asp:Label runat="server" ID="lblTitle"></asp:Label>
                            </asp:Panel>
                            <div class="collapsePanel pb-0 mb-0">
                                <table width="100%">
                                    <tr>
                                        <td>
                                            <asp:ValidationSummary ID="valModalSummary" DisplayMode="BulletList" runat="server"
                                                HeaderText="The following errors have occurred:" CssClass="ErrorLabel" ValidationGroup="Modal" />
                                            <p>
                                                <asp:Label ID="lblPopupError" runat="server" CssClass="ErrorLabel"></asp:Label>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblNoteAction" runat="server" Text="Please choose an action: "></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:DropDownList ID="ddlNoteAction" runat="server" AutoPostBack="true" onchange="tinyMCE.triggerSave(false,true);" CssClass="govuk-select">
                                                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Add a reference" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="Select a reference" Value="2"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvNoteAction" Display="Dynamic" runat="server" ControlToValidate="ddlNoteAction"
                                                ErrorMessage="Please select an action" Text=" *" ToolTip="Please select an action"
                                                ValidationGroup="Modal" Enabled="False"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblNoteType" runat="server" Text="Please choose a reference type: "
                                                Visible="false"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:DropDownList ID="ddlNoteType" runat="server" DataSourceID="dsNoteTypeInfoList"
                                                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="true" AutoPostBack="true"
                                                Visible="false" onchange="tinyMCE.triggerSave(false,true);" CssClass="govuk-select mb-3">
                                                <asp:ListItem Text="Please select..." Value="" />
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvNoteType" Display="Dynamic" runat="server" ControlToValidate="ddlNoteType"
                                                ErrorMessage="Please select a reference type" Text=" *" ToolTip="Please select a reference type"
                                                ValidationGroup="Modal" Enabled="False"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox runat="server" ID="txtNote" TextMode="MultiLine" Rows="6" Width="100%" Visible="false"
                                                BackColor="White"
                                                BorderColor="Black"
                                                BorderWidth="1px"></asp:TextBox>

                                            <asp:RequiredFieldValidator ID="rfvNoteText" Display="Dynamic" runat="server" ControlToValidate="txtNote"
                                                ErrorMessage="Please enter the reference text" Text=" *" ToolTip="Please enter the reference text"
                                                ValidationGroup="Modal" Enabled="False" Visible="true"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblNote" runat="server" Text="Select a reference: " Visible="false"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:DropDownList ID="ddlNotes" runat="server" DataSourceID="dsAvailableNoteList"
                                                DataTextField="NoteTextPlainTextSlim" DataValueField="Id" AppendDataBoundItems="true"
                                                AutoPostBack="true" Visible="false" CssClass="govuk-select mb-3">
                                                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
                                            </asp:DropDownList>

                                            <asp:Label runat="server" ID="lblCurrentNote"
                                                BackColor="White" BorderColor="Black" BorderWidth="1px" CssClass="read-only-current-note"></asp:Label>

                                            <asp:RequiredFieldValidator ID="rfvNote" Display="Dynamic" runat="server" ControlToValidate="ddlNotes"
                                                ErrorMessage="Please select a reference" Text=" *" ToolTip="Please select a reference"
                                                ValidationGroup="Modal" Enabled="False"></asp:RequiredFieldValidator>

                                            <csla:CslaDataSource ID="dsAvailableNoteList" runat="server" TypeAssemblyName="ProfilesLibrary"
                                                TypeName="ProfilesLibrary.NoteList">
                                            </csla:CslaDataSource>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="govuk-accordion">
                                                <pwcp:SelectSpeciesOptionPicker ID="popupQuestionReferencePicker" TabIndex="0" runat="server" ResultLabelText="Apply this reference also to: " AriaLabelText="This is a checkbox list for selecting one or more sections within this question that you wish to apply the above reference as well." />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div align="right" class="mb-3">
                                                <asp:Button ID="btnSaveNote"
                                                    runat="server"
                                                    Text="Save"
                                                    UseSubmitBehavior="false"
                                                    CausesValidation="true"
                                                    ValidationGroup="Modal"
                                                    CssClass="govuk-button mb-0"
                                                    OnClientClick="return validateAndSaveNote();" />

                                                <button class="govuk-button govuk-button--secondary mb-0" onclick="return cancelClick();">Cancel</button>
                                                <!-- some oddness with this page. The btnCancel button always causes validation, the only way to get around it seems to be for a client button
                                                    above to call the JS to postback and for the main button to be hidden -->
                                                <button runat="server" id="btnCancel" onserverclick="btnCancel_Click" class="govuk-visually-hidden">Cancel</button>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <csla:CslaDataSource ID="dsNoteTypeInfoList" runat="server" TypeAssemblyName="ProfilesLibrary"
                                TypeName="ProfilesLibrary.NoteTypeInfoList">
                            </csla:CslaDataSource>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ddlNoteAction" EventName="SelectedIndexChanged" />
                            <asp:AsyncPostBackTrigger ControlID="ddlNoteType" EventName="SelectedIndexChanged" />
                            <asp:AsyncPostBackTrigger ControlID="btnSaveNote" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </asp:Panel>
            </div>
            </div>
            <div class="ErrorLabel" style="clear: both;">
                &nbsp;
            </div>
            <table style="width: 100%">
                <tr>
                    <td>
                        <pwc:InvalidReasonList ID="ctlInvalidReasonList" runat="server" />
                        &nbsp;
                    </td>
                    <td style="width: 1%; vertical-align: bottom">
                        <div class="govuk-button-group align-right-bottom">
                            <asp:HiddenField ID="hidProfileVersionId" runat="server" />
                            <asp:HiddenField ID="hidProfileSectionId" runat="server" />
                            <asp:Button ID="btnHiddenRefresh" runat="server" Text="Save" Style="display: none;" />
                            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="govuk-button" />
                            <asp:Button ID="btnValidateSection" runat="server" Text="Validate" CssClass="govuk-button" />
                            <asp:Button
                                ID="btnClearSection"
                                runat="server" Text="Clear"
                                CssClass="govuk-button govuk-button--secondary"
                                OnClientClick="apha.confirmPrompt('Are you sure you want to clear all the data from this section?', this); return false;" />
                            <asp:Button ID="btnPrintSection" runat="server" Text="Print" CssClass="govuk-button govuk-button--secondary" />
                        </div>
                    </td>
                </tr>
            </table>
            &nbsp;
            <div class="TabControl">
                <pwc:TabStrip ID="tabStrip" runat="server">
                    <pwc:TabItem IsActive="true" Text="SectionName" />
                    <pwc:TabItem IsActive="false" Text="References" />
                    <pwc:TabItem IsActive="false" Text="Further information" />
                    <pwc:TabItem IsActive="false" Text="Review comments" />
                    <pwc:TabItem IsActive="false" Text="All Revision dates" />
                    <pwc:TabItem IsActive="false" Text="Contributions" />
                </pwc:TabStrip>
            </div>

            <div class="TabBody">
                <div class="govuk-frontend-supported QuestionsPanelSpacer">
                    <asp:UpdatePanel runat="server" ID="updError" RenderMode="Inline" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Label ID="lblErrorDesc" runat="server" EnableViewState="false" CssClass="ErrorLabel"></asp:Label>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <p style="display: none;">
                        <asp:LinkButton ID="lnkExpandAll" runat="server" Style="font-size: 80%;">Expand all</asp:LinkButton>
                        <asp:LinkButton ID="lnkCollapseAll" runat="server" Style="font-size: 80%;">Collapse all</asp:LinkButton>
                    </p>
                    <div class="govuk-accordion" data-module="govuk-accordion" id="accordion-default">
                        <div class="govuk-accordion__controls">
                            <button type="button" class="govuk-accordion__show-all show-all-handle" aria-expanded="false" onclick="togglePanelState('<%= lnkExpandAll.ClientID %>', '<%= lnkCollapseAll.ClientID %>', '<%= expandAllTitle.ClientID%>', '<%= expandAllChevron.ClientID%>');">
                                <span class="govuk-accordion-nav__chevron govuk-accordion-nav__chevron--down" id="expandAllChevron" runat="server"></span>
                                <span class="govuk-accordion__show-all-text apha-font-size-19" id="expandAllTitle" runat="server">Show all sections</span></button>
                        </div>
                        <asp:PlaceHolder ID="plhQuestion" runat="server"></asp:PlaceHolder>
                    </div>
                </div>
            </div>
            <table style="width: 100%">
                <tr>
                    <td>&nbsp;
                    </td>
                    <td style="width: 100%">
                        <div align="right">
                            <asp:Button ID="btnSave2" runat="server" Text="Save" CssClass="govuk-button" />
                            <asp:Button ID="btnValidateSection2" runat="server" Text="Validate" CssClass="govuk-button" />
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="SectionPaginationAdjuster">
        <pag:SectionPagination runat="server" ID="SectionPagination" />
    </div>

    <div class="d-inline-block">
        <br />
        <asp:Label ID="lblStatement" runat="server" CssClass="govuk-label" Text="The content in a number of questions constitutes static information, or is no 
            longer deemed critical, and, to minimise the resource requirements of D2R2, is not scheduled to be updated. Please see the D2R2 quality statement 
            for a list of these questions." />
    </div>
</asp:Content>

