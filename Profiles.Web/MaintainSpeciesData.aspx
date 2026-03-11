<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false" Inherits="Profiles.Web.MaintainSpeciesData" Title="Maintain species data" CodeBehind="MaintainSpeciesData.aspx.vb" %>
<%@ Register Src="~/Controls/TreeViewToggleButton.ascx" TagPrefix="uc" TagName="TreeViewToggleButton" %>
<%@ Register Src="~/Controls/TreeSelection.ascx" TagPrefix="uc" TagName="TreeSelection" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" runat="Server">
    
    <asp:UpdatePanel ID="MainUpdatePanel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

    <asp:HiddenField ID="hdnLastFocusedButton" runat="server" EnableViewState="true" />

    <script type="text/javascript" src="./Javascript/tree-view-v2.js"></script>
    <script type="text/javascript">
         const treeViewId = '<%= tvwSpecies.ClientID %>';
         const controller = getTreeViewController(treeViewId, { toggleId: '<%= speciesTreeToggle.ClientID %>', selectionDisplayId: '<%= treeSelection.ClientID %>' }); // Initialize the tree view controller

        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_endRequest(function (sender, args) {
            initialiseAfterPostback();
        });

        function initialiseAfterPostback() {
            controller.initialiseAfterPartialPostback();
            controller.initialiseInitialSelection();
            
            initialiseButtonHandlers();
            restoreFocus();
        }

        function initialiseButtonHandlers() {
            var removeButtonId = '<%= treeSelection.FindControl("removeSelectionButton").ClientID %>';
            const removeButton = document.getElementById(removeButtonId);
            if (removeButton) {
                const existingOnClick = removeButton.onclick;
                removeButton.onclick = function (e) {
                    handleRemoveButtonClick();
                    if (existingOnClick) {
                        return existingOnClick.call(this, e);
                    }
                    return true;
                };
            }
        }

        function handleRemoveButtonClick() {
            const removeButtonId = '<%= treeSelection.FindControl("removeSelectionButton").ClientID %>';
            const hiddenField = document.getElementById('<%= hdnLastFocusedButton.ClientID %>');
            hiddenField.value = removeButtonId;
            // Force the value to be included in the form submission
            if (typeof (__doPostBack) === 'function') {
                __doPostBack(hiddenField.id, this.id);
            }
        }

        window.addEventListener('load', initialiseButtonHandlers);

        function bespokeClientNodeChecked(sender, eventArgs) {
            clientNodeChecked(sender, eventArgs);
            const node = eventArgs.get_node();
            if (!node) return;

            hideError(node);
        }

        function bespokeClientNodeClicking(sender, eventArgs) {
            clientNodeChecked(sender, eventArgs);
            const node = eventArgs.get_node();
            if (!node) return;

            hideError(node);
        }

        function hideError(node) {
            if (node.get_checked()) {
                const label = document.getElementById('<%= lblSelectNode.ClientID %>');
                if (label) { 
                    label.style.display = 'none';
                    label.setAttribute('aria-hidden', 'true');
                }
            }
        }

        function restoreFocus() {
            const lastFocusedId = document.getElementById('<%= hdnLastFocusedButton.ClientID %>').value;
            if (lastFocusedId) {
                const button = document.getElementById(lastFocusedId);
                if (button) {
                    button.focus();
                }
            }
        }

        function storeFocusedButton(buttonId) {
            document.getElementById('<%= hdnLastFocusedButton.ClientID %>').value = buttonId;
        }

    </script>

    <div style="float: left; width: 100%;">
        Use this function to maintain the hierarchical species list that is utilised by
        the application.
        <br />
        <br />
    </div>
    <div style="width: 100%; float: left; margin-top: 10px;">
        <table width="100%">
            <tr>
                <td style="width: 65%;">

                    <div style="border-width: 1px; border-style: solid" class="rad-tree-view">
                        <uc:TreeViewToggleButton runat="server" ID="speciesTreeToggle" IsExpanded="True" />
                        
                        <telerik:RadTreeView ID="tvwSpecies" runat="server" CheckBoxes="True" EnableKeyboardNavigation="True" EnableAriaSupport="True"
                            AccessKey="S" DataFieldID="Id" DataFieldParentID="ParentId" Height="400px" AutoPostBack="False" 
                            OnClientNodeChecked="bespokeClientNodeChecked" OnClientNodeClicking="bespokeClientNodeClicking" OnClientNodeExpanded="clientNodeExpanded" OnClientNodeCollapsed="clientNodeCollapsed"
                            ShowLineImages="true" MultipleSelect="False" EnableTheming="False" TabIndex="0" aria-label="This is a single-select tree view. Only one item can be selected at a time.">
                        </telerik:RadTreeView>
                    </div>
                    <div class="govuk-!-padding-top-3">
                        <uc:TreeSelection runat="server" ID="treeSelection" UseServerClick="true" />
                    </div>
                    <asp:Button CssClass="govuk-button" ID="btnReorderDone" runat="server" Text="Done" CausesValidation="false" Width="200" Visible="false" />
                    
                </td>
                <td style="width: 15%; vertical-align: middle; display: flex; flex-direction: column; align-items: center; justify-content: center; min-height: 400px; padding-left: 20px" align="center">
                    <asp:ImageButton runat="server" ID="btnMoveSpeciesUp" ImageUrl="~/Images/UpArrow.gif"
                        ToolTip="Move the selected species up" visible="false" style="margin: 3px 0;" OnClientClick="storeFocusedButton(this.id); return true;" AlternateText="Move the selected species up"/>
                    <asp:ImageButton runat="server" ID="btnMoveSpeciesDown" ImageUrl="~/Images/DownArrow.gif"
                        ToolTip="Move the selected species down" visible="false" style="margin: 3px 0;" OnClientClick="storeFocusedButton(this.id); return true;" AlternateText="Move the selected species down"/>
                </td>
                <td style="width: 20%; text-align: center; vertical-align: top;" align="center">
                    <div class="govuk-button-group">
                        <asp:Button CssClass="govuk-button" ID="btnViewAuditTrail" runat="server" Text="View audit trail" CausesValidation="false"
                            PostBackUrl="SpeciesDataAuditTrail.aspx" Width="200" />
                        <br />
                        <br />
                        <asp:Button CssClass="govuk-button" ID="btnAdd" runat="server" Text="Add" CausesValidation="false" Width="200" /><br />
                        <br />
                        <asp:Button CssClass="govuk-button" ID="btnEditNameParent" runat="server" Text="Edit name/parent" CausesValidation="false" Width="200" /><br />
                        <br />
                        <asp:Button CssClass="govuk-button" ID="btnEditData" runat="server" Text="Edit data" CausesValidation="false" Width="200" /><br />
                        <br />
                        <asp:Button CssClass="govuk-button govuk-button--warning" ID="btnDelete" runat="server" Text="Delete" CausesValidation="false"
                            Width="200" /><br />
                        <br />
                        <asp:Button CssClass="govuk-button" ID="btnInactivate" runat="server" Text="Inactivate" CausesValidation="false"
                            Width="200" /><br />
                        <asp:Button CssClass="govuk-button" ID="btnReorderList" runat="server" Text="Reorder list" CausesValidation="false"
                            Width="200" /><br />
                        <br />
                    </div>
                </td>
            </tr>
        </table>

        <asp:Label ID="lblSelectNode" runat="server" CssClass="ErrorLabel"></asp:Label><br />
        <asp:ValidationSummary ID="valSumChangeValue" DisplayMode="BulletList" runat="server"
            HeaderText="The following errors have occurred:" CssClass="ErrorLabel" />
        <asp:Label ID="lblErrorMsg" CssClass="ErrorLabel" runat="server" EnableViewState="false" />
        <asp:Panel ID="pnlAmendSpeciesData" runat="server" Visible="False" Style="width: 98%">
            <asp:Label ID="lblPanelTitle" runat="server" />

            <div class="collapsePanel">
                <table width="100%">
                    <tr>
                        <td style="width: 15%">
                            <span class="fw-bold">Old name:</span>
                        </td>
                        <td style="width: 35%">
                            <asp:TextBox ID="txtOldName" runat="server" Style="width: 100%" Enabled="false" Visible="false" CssClass="govuk-input" />
                            <span id="txtOldNameSpan" runat="server" class="readonly-editor-trail"></span>
                        </td>
                        <td style="width: 15%">
                            <span class="fw-bold ms-2">New name:</span>
                            <asp:RequiredFieldValidator ID="valNewNameRequired" runat="server" ControlToValidate="txtNewName" CssClass="govuk-tag--red"
                                ErrorMessage="You need to provide a new name for this species" ToolTip="You need to provide a new name for this species">*</asp:RequiredFieldValidator>
                        </td>
                        <td style="width: 35%">
                            <asp:TextBox ID="txtNewName" runat="server" Style="width: 100%" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 15%">
                            <span class="fw-bold">Old parent:</span>
                        </td>
                        <td style="width: 35%">
                            <asp:TextBox ID="txtOldParent" runat="server" Style="width: 100%" Enabled="false" Visible="false" CssClass="govuk-input" />
                            <span id="txtOldParentSpan" runat="server" class="readonly-editor-trail"></span>
                        </td>
                        <td style="width: 15%">
                            <span class="fw-bold ms-2">New parent:</span>
                        </td>
                        <td style="width: 35%">
                            <asp:DropDownList ID="ddlNewParent" runat="server" AppendDataBoundItems="true" DataTextField="Value"
                                DataValueField="Key" AutoPostBack="True" Style="width: 97%" OnSelectedIndexChanged="DdlNewParent_SelectedIndexChanged" CssClass="govuk-select">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="valNewParent" runat="server" ErrorMessage="You must select a new parent for the species"
                                ToolTip="You must select a new parent for the species" ControlToValidate="ddlNewParent">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%">
                            <span class="fw-bold">Reason for change:</span>
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="txtReasonForChange" runat="server" TextMode="MultiLine" Width="98%"
                                Rows="6" MaxLength="255" CssClass="govuk-input"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="valReasonRequired" runat="server" ControlToValidate="txtReasonForChange"
                                ErrorMessage="You need to provide a reason for this change" ToolTip="You need to provide a reason for this change"
                                Text="*" CssClass="govuk-tag--red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="valMaxLength" runat="server" ControlToValidate="txtReasonForChange"
                                ValidationExpression="^(.|\255){0,255}$" ErrorMessage="The reason for change must be no longer than 255 characters"
                                ToolTip="The reason for change must be no longer than 255 characters" CssClass="govuk-input">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td />
                        <td>
                            <div align="right">
                                <asp:Button CssClass="govuk-button" ID="btnSave" runat="server" OnClick="btnSave_Click" OnClientClick="tinyMCE.triggerSave(false,true);" />
                                <asp:Button CssClass="govuk-button govuk-button--secondary" ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CausesValidation="false" />
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </asp:Panel>
    </div>
                    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>