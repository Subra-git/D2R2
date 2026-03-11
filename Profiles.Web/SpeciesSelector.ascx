<%@ Control Language="VB" AutoEventWireup="false" Inherits="Profiles.Web.SpeciesSelector" Codebehind="SpeciesSelector.ascx.vb" %>
<%@ Register Src="~/Controls/TreeSelection.ascx" TagPrefix="uc" TagName="TreeSelection" %>
<%@ Register Src="~/Controls/TreeViewToggleButton.ascx" TagPrefix="uc" TagName="TreeViewToggleButton" %>

    <script type="text/javascript" src="./Javascript/tree-view-v2.js"></script>
    <script type="text/javascript">
        const treeViewId = '<%= tvwSpecies.ClientID %>';
        const controller = getTreeViewController(treeViewId, { toggleId: '<%= speciesTreeToggle.ClientID %>', selectionMode: 'multiple' });

        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_endRequest(function (sender, args) {
            initialiseAfterPostback();
        });

        function initialiseAfterPostback() {
            controller.initialiseAfterPartialPostback();
        }
        
        function bespokeClientNodeChecked(sender, eventArgs) {
            clientNodeChecked(sender, eventArgs);
            const node = eventArgs.get_node();
            if (!node) return;

            speciesBehaviour.AfterClientCheck(node, controller);
        }

        function bespokeClientNodeClicking(sender, eventArgs) {
            clientNodeClicking(sender, eventArgs);
            const node = eventArgs.get_node();
            if (!node) return;

            speciesBehaviour.AfterClientCheck(node, controller);
        }

    </script>

<asp:Label ID="lblAffectedSpecies" runat="server" CssClass="any-species-button">Any species</asp:Label>
    <div class="treeViewWrapper rad-tree-view">
    <uc:TreeViewToggleButton runat="server" ID="speciesTreeToggle" IsExpanded="True" />
    <telerik:RadTreeView ID="tvwSpecies" runat="server" CheckBoxes="True" EnableKeyboardNavigation="True" EnableAriaSupport="True"
                            AccessKey="S" DataFieldID="Id" DataFieldParentID="ParentId" Height="300px" AutoPostBack="False"
                            OnClientNodeChecked="bespokeClientNodeChecked" OnClientNodeClicking="bespokeClientNodeClicking" OnClientNodeExpanded="clientNodeExpanded" OnClientNodeCollapsed="clientNodeCollapsed"
                            ShowLineImages="true" MultipleSelect="False" EnableTheming="False" TabIndex="0" aria-label="This is a multiple-select tree view. Multiple items can be selected.">
    </telerik:RadTreeView>
</div>
    