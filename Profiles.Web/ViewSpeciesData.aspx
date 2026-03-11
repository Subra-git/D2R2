<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false" Inherits="Profiles.Web.ViewSpeciesData" Title="View species data" CodeBehind="ViewSpeciesData.aspx.vb" %>
<%@ Register Src="~/Controls/TreeViewToggleButton.ascx" TagPrefix="uc" TagName="TreeViewToggleButton" %>
<%@ Register Src="~/Controls/TreeSelection.ascx" TagPrefix="uc" TagName="TreeSelection" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" runat="Server">
    <script type="text/javascript" src="./Javascript/tree-view-v2.js"></script>
    <script type="text/javascript">
        const treeViewId = '<%= tvwSpecies.ClientID %>';
        getTreeViewController(treeViewId, { toggleId: '<%= speciesTreeToggle.ClientID %>', selectionDisplayId: '<%= treeSelection.ClientID %>' }); // Initialize the tree view controller

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
                label.style.display = 'none';
                label.setAttribute('aria-hidden', 'true');
            }
        }

    </script>
    <div style="float: left">
        This page details the species that are used by the D2R2 system. It is presented as a hierarchical list that groups species into groups; a profile can reference an individual species or an entire species group. Click on any species or species group to view the data that is associated with that species or group.
        <br />
        <br />
    </div>
    <div style="width: 100%; float: left; margin-top: 10px;">
        <div style="border-width: 1px; padding: 5px; border-style: solid; width:70%" class="rad-tree-view">
            <uc:TreeViewToggleButton runat="server" ID="speciesTreeToggle" IsExpanded="True" />
            <telerik:RadTreeView ID="tvwSpecies" runat="server" CheckBoxes="True" TabIndex="0"  EnableKeyboardNavigation="True" EnableAriaSupport="True"
                AccessKey="S" DataFieldID="Id" DataFieldParentID="ParentId" Width="100%" Height="400px" AutoPostBack="False"
                EnableTheming="false" ShowLineImages="true" MultipleSelect="False" OnClientNodeChecked="bespokeClientNodeChecked" 
                OnClientNodeClicking="bespokeClientNodeClicking" OnClientNodeExpanded="clientNodeExpanded" OnClientNodeCollapsed="clientNodeCollapsed"
                aria-label="This is a single-select tree view. Only one item can be selected at a time.">
            </telerik:RadTreeView>
        </div>
        <div class="govuk-!-padding-top-3">
            <uc:TreeSelection runat="server" ID="treeSelection"/>
        </div>
        <asp:Button CssClass="govuk-button" ID="btnViewData" runat="server" Text="View data" Width="150"/>
        <div>
            <asp:Label ID="lblSelectNode" runat="server" CssClass="ErrorLabel"></asp:Label>
        </div>
    </div>
</asp:Content>
