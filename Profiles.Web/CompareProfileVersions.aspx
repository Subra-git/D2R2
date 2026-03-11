<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false" Inherits="Profiles.Web.CompareProfileVersions" Title="Compare profile versions" CodeBehind="CompareProfileVersions.aspx.vb" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" runat="Server">
    <script type="text/javascript" src="./Javascript/tree-view-v2.js"></script>
    <script type="text/javascript" src="./Javascript/profiles.js"></script>
    <asp:UpdatePanel ID="MainUpdatePanel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <script type="text/javascript">
                var treeViewController;

                // Initial setup
                const treeViewId = '<%= tvwProfileVersions.ClientID %>';
                treeViewController = getTreeViewController(treeViewId, { selectionMode: 'multiple' });

                var prm = Sys.WebForms.PageRequestManager.getInstance();
                prm.add_endRequest(function (sender, args) {
                    initialiseAfterPostback();
                });

                function initialiseAfterPostback() {
                    const $firstId = $('#<%= FirstCheckedNodeId.ClientID %>');
                    const $secondId = $('#<%= SecondCheckedNodeId.ClientID %>');
                    const treeView = $find(treeViewId);

                    const controller = getTreeViewController(treeViewId, { selectionMode: 'multiple' });
                    controller.syncNodeStateFromServer();
                    controller.applyAriaLevels();
                    updateComparisonLabels(treeView, $firstId.val(), $secondId.val());

                    const firstVersionNode = treeView.findNodeByValue($firstId.val());
                    const secondVersionNode = treeView.findNodeByValue($secondId.val());

                    updateRemoveButtonLabel(firstVersionNode, secondVersionNode);
                    initialiseButtonHandlers();
                }

                function initializeTreeView() {
                    const treeViewId = '<%= tvwProfileVersions.ClientID %>';
                    const treeView = $find(treeViewId);

                    if (!treeView) {
                        setTimeout(initializeTreeView, 100);
                        return;
                    }

                    const $firstId = $('#<%= FirstCheckedNodeId.ClientID %>');
                    const $secondId = $('#<%= SecondCheckedNodeId.ClientID %>');
                    
                    updateComparisonLabels(treeView, $firstId.val(), $secondId.val());
                }

                function compareClientNodeChecked(sender, eventArgs) {
                    clientNodeChecked(sender, eventArgs);
                    const node = eventArgs.get_node();
                    if (!node) return;

                    const controller = getTreeViewController(sender.get_id());
                    const $firstId = $('#<%= FirstCheckedNodeId.ClientID %>');
                    const $secondId = $('#<%= SecondCheckedNodeId.ClientID %>');
                    const treeView = sender;

                    if (node.get_checked()) {
                        handleNodeChecked(node, $firstId, $secondId, treeView, controller);
                    } else {
                        handleNodeUnchecked(node, $firstId, $secondId, controller);
                    }

                    controller.updateNodeState(node, node.get_checked(), node.get_selected());
                    updateComparisonLabels(treeView, $firstId.val(), $secondId.val());
                    hideError($firstId.val(), $secondId.val());
                }

                function compareClientNodeClicking(sender, eventArgs) {
                    clientNodeClicking(sender, eventArgs);
                    const node = eventArgs.get_node();
                    if (!node) return;

                    const controller = getTreeViewController(sender.get_id());
                    const $firstId = $('#<%= FirstCheckedNodeId.ClientID %>');
                    const $secondId = $('#<%= SecondCheckedNodeId.ClientID %>');
                    const treeView = sender;
                    const newCheckedState = node.get_checked();

                    if (newCheckedState) {
                        handleNodeChecked(node, $firstId, $secondId, treeView, controller);
                    } else {
                        handleNodeUnchecked(node, $firstId, $secondId, controller);
                    }

                    controller.updateNodeState(node, node.get_checked(), node.get_selected());
                    updateComparisonLabels(treeView, $firstId.val(), $secondId.val());
                    hideError($firstId.val(), $secondId.val());
                }

                function handleNodeChecked(node, $firstId, $secondId, treeView, controller) {
                    if ($firstId.val() === '0' && $secondId.val() === '0') {
                        $firstId.val(node.get_value());
                    } else if ($firstId.val() !== '0' && $secondId.val() === '0') {
                        $secondId.val(node.get_value());
                    } else if ($firstId.val() !== '0' && $secondId.val() !== '0') {
                        const oldNode = treeView.findNodeByValue($secondId.val());
                        if (oldNode) {
                            oldNode.set_checked(false);
                            oldNode.set_selected(false);
                            controller.updateNodeState(oldNode, false, false);
                        }
                        $secondId.val(node.get_value());
                    }
                }

                function handleNodeUnchecked(node, $firstId, $secondId, controller) {
                    if (node.get_value() === $firstId.val() && $secondId.val() === '0') {
                        $firstId.val('0');
                        node.set_checked(false);
                        controller.updateNodeState(node, false, false);
                    } else if (node.get_value() === $firstId.val() && $secondId.val() !== '0') {
                        $firstId.val($secondId.val());
                        $secondId.val('0');
                    } else if (node.get_value() === $secondId.val()) {
                        $secondId.val('0');
                    }
                }

                function updateComparisonLabels(treeView, firstIdValue, secondIdValue) {
                    const $firstSelection = $('#firstSelection');
                    const $secondSelection = $('#secondSelection');
                    const $noSelection = $('#noSelection');
                    const $removeButton = $('#<%= RemoveSelectionButton.ClientID %>');

                    if (firstIdValue !== '0') {
                        const firstVersionNode = treeView.findNodeByValue(firstIdValue);
                        if (firstVersionNode) {
                            $firstSelection.html(formatNodeText(firstVersionNode));
                            $secondSelection.html('');
                            $noSelection.hide();

                            if (secondIdValue !== '0') {
                                const secondVersionNode = treeView.findNodeByValue(secondIdValue);
                                if (secondVersionNode) {
                                    $secondSelection.html(formatNodeText(secondVersionNode).trim());
                                    updateRemoveButtonLabel(firstVersionNode, secondVersionNode);
                                } else {
                                    updateRemoveButtonLabel(firstVersionNode);
                                }
                            } else {
                                updateRemoveButtonLabel(firstVersionNode);
                            }
                        }
                    } else {
                        $firstSelection.html('');
                        $secondSelection.html('');
                        $noSelection.show();
                        $removeButton.attr('aria-label', 'Remove selection');
                    }
                }

                function updateRemoveButtonLabel(firstNode, secondNode = null) {
                    const removeButton = document.getElementById('<%= RemoveSelectionButton.ClientID %>');
                    if (!removeButton) return;

                    if (secondNode) {
                        const firstText = formatNodeText(firstNode);
                        const secondText = formatNodeText(secondNode);
                        removeButton.setAttribute('aria-label', `Remove selected versions: ${firstText} and ${secondText}`);
                    } else if (firstNode) {
                        const firstText = formatNodeText(firstNode);
                        removeButton.setAttribute('aria-label', `Remove selected version: ${firstText}`);
                    } else {
                        removeButton.setAttribute('aria-label', 'Remove selection');
                    }
                }

                function formatNodeText(versionNode) {
                    const scenarioNode = versionNode.get_parent();
                    const profileNode = scenarioNode?.get_parent();

                    if (scenarioNode && profileNode) {
                        return `${profileNode.get_text()} - ${scenarioNode.get_text()} - ${versionNode.get_text()}`.trim();
                    }
                    return versionNode.get_text().trim();
                }

                function hideError(firstVal, secondVal) {
                    if (firstVal !== '0' && secondVal !== '0') {
                        $('.govuk-error-message').hide();
                    }
                }

                function initialiseButtonHandlers() {
                    const removeButton = document.getElementById('<%= RemoveSelectionButton.ClientID %>');
                    if (removeButton) {
                        removeButton.addEventListener('click', () => {
                            apha.profiles.updateAnnouncement('Selection cleared');
                        });
                    }
                }

                document.addEventListener('DOMContentLoaded', () => {
                    initialiseButtonHandlers();
                });

            </script>

            <div style="float: left">
                Use this page to compare the content of profiles. Select the profiles to be compared using the hierarchical list below; only two profiles can be compared. The comparison report will only detail the differences between the two selected profiles.
                <br />
                <br />
                To be able to view the most recent changes to a profile, select the earlier version of the profile first and then select the most recent version of the profile. 
                <br />
                <br />
            </div>

            <div style="width: 100%; float: left; margin-top: 10px;">
                <asp:UpdatePanel ID="SelectionPanel" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>

                        <asp:HiddenField id="FirstCheckedNodeId" value="0" runat="server"/>
                        <asp:HiddenField id="SecondCheckedNodeId" value="0" runat="server"/>

                        <div role="region" aria-label="Profile Version Comparison">
                            <span class="govuk-body govuk-!-font-weight-bold selection-label">Selected: </span>
                            <div id="selectionStatus" 
                                 role="status" 
                                 aria-live="polite" 
                                 aria-atomic="true">
                                <span class="govuk-body" id="noSelection">- No profile versions are selected -</span>
                                <div class="govuk-body govuk-!-margin-bottom-1" id="firstSelection"></div>
                                <div class="govuk-body" id="secondSelection"></div>
                            </div>
                        </div>
                        <div>
                            <asp:Button runat="server" 
                                ID="RemoveSelectionButton" 
                                Text="Remove selection" 
                                CssClass="govuk-button govuk-button--secondary" 
                                OnClick="RemoveSelectionButton_Click" 
                                aria-label="Remove selection" CausesValidation="false" TabIndex="0"/>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>

                <asp:UpdatePanel ID="TreePanel" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <table width="100%">
                            <tr>
                                <td>
                                    <div style="border-width: 1px; border-style: solid; border-color: #bfc1c3" class="rad-tree-view">
                                        <div>
                                            <button type="button" 
                                                    class="radtreeview-tree-toggle govuk-!-margin-bottom-3"        
                                                    runat="server" 
                                                    id="btnToggleAllButton"
                                                    onserverclick="btnToggleAll_Click">
                                                <span class="govuk-accordion__section-toggle-focus" tabindex="0" use="false">
                                                    <span class="govuk-accordion-nav__chevron" aria-hidden="true"></span>
                                                    <span runat="server" id="toggleText" class="govuk-accordion__section-toggle-text">Open all</span>
                                                </span>
                                            </button>
                                            <div id="treeStatus" class="govuk-visually-hidden" role="status" aria-live="polite" runat="server"></div>
                                        </div>
                                        <telerik:RadTreeView ID="tvwProfileVersions" runat="server" 
                                            CheckBoxes="True" 
                                            EnableKeyboardNavigation="True" 
                                            EnableAriaSupport="True"
                                            AccessKey="S" 
                                            DataFieldID="Id" 
                                            DataFieldParentID="ParentId" 
                                            Height="400px" 
                                            AutoPostBack="False" 
                                            OnClientNodeChecked="compareClientNodeChecked" 
                                            OnClientNodeClicking="compareClientNodeClicking"
                                            OnClientNodeExpanded="clientNodeExpanded" 
                                            OnClientNodeCollapsed="clientNodeCollapsed"
                                            ShowLineImages="true" 
                                            EnableTheming="False" 
                                            TabIndex="0"
                                            aria-label="This is a dual-select tree view. A maximum of two items can be selected at a time.">
                                        </telerik:RadTreeView>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>

                <asp:UpdatePanel ID="ComparePanel" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="govuk-!-padding-top-5">
                        <asp:Button runat="server" 
                            ID="btnCompare" 
                            Text="Compare" 
                            CssClass="govuk-button" 
                            OnClick="btnCompare_Click" 
                            aria-label="Compare profile versions"/>
                    </div>

                    <asp:CustomValidator ID="cvInput" runat="server"
                            ErrorMessage="error message"
                            OnServerValidate="CompareCustomValidator" 
                            Display="Dynamic" 
                            CssClass="govuk-error-message" 
                            ValidationGroup="CompareGroup">
                        Please select 2 disease profile versions to compare
                    </asp:CustomValidator>
                </ContentTemplate>
            </asp:UpdatePanel>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>