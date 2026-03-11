<%@ Control Language="VB" AutoEventWireup="false" Inherits="Profiles.Web.AffectedSpeciesSelector" Codebehind="AffectedSpeciesSelector.ascx.vb" %>
<%@ Register Assembly="RadTreeView.Net2" Namespace="Telerik.Web.UI" TagPrefix="radT" %>
<%@ Register Src="~/Controls/TreeViewToggleButton.ascx" TagPrefix="uc" TagName="TreeViewToggleButton" %>

<script type="text/javascript" src="./Javascript/tree-view-v2.js"></script>
<script type="text/javascript">

        function tvwProfiledSpecies_OnClientLoad(sender)
        {
            SetProfiledSpeciesSelectedText(sender);
        }

        function tvwOtherAffectedSpecies_OnClientLoad(sender)
        {
            SetOtherAffectedSpeciesSelectedText(sender);
        }

        function SetProfiledSpeciesSelectedText(sender)
        {
            SetSelectedActiveNodesText(sender, "<%= profiledSpeciesSelected.ClientID %>");
        }

        function SetOtherAffectedSpeciesSelectedText(sender)
        {
            SetSelectedActiveNodesText(sender, "<%= otherAffectedSpeciesSelected.ClientID %>");
        }

        function SetSelectedActiveNodesText(sender, elementId)
        {
            let element = $('#' + elementId);
            element.text("");

            let checkedNodes = sender.get_checkedNodes();

            let selectedActiveNodes = GetSelectedActiveNodes(checkedNodes);

            element.text(selectedActiveNodes.sort());
        }

        function GetSelectedActiveNodes(checkNodes)
        {
            let selectedActiveNodes = [];

            if (checkNodes.length > 0)
            {
                let currentNode;
                for (currentNode = 0; currentNode < checkNodes.length; currentNode++)
                {
                    if (checkNodes[currentNode].get_checked()
                        && checkNodes[currentNode].get_category() != 'Inactive'
                        && checkNodes[currentNode].get_enabled())
                    {
                        selectedActiveNodes.push(checkNodes[currentNode].get_text());
                    }
                }
            }

            return selectedActiveNodes;
        }


        function tvwProfiledSpecies_AfterClientToggle(sender, args)
        {
            const tvwOtherAffectedSpecies = $find("<%= tvwOtherAffectedSpecies.ClientID %>");
            const node = args.get_node();
            if (!node) return;

            ClientExpandedOrCollapsed(sender, args, node);
            ToggleNode(node, tvwOtherAffectedSpecies);
        }
    
        function tvwOtherAffectedSpecies_AfterClientToggle(sender, args)
        {
            const tvwProfiledSpecies = $find("<%=tvwProfiledSpecies.ClientID %>");
            const node = args.get_node();
            if (!node) return;

            ClientExpandedOrCollapsed(sender, args, node);
            ToggleNode(node, tvwProfiledSpecies);
        }

        function ClientExpandedOrCollapsed(sender, args, node) {

            const isExpanded = node.get_expanded();

            if (isExpanded) {
                clientNodeExpanded(sender, args);
            } else {
                clientNodeCollapsed(sender, args);
            }
        }

        function ToggleNode(node, oppositeTree)
        {
            const eventReferenceExpanded = oppositeTree.OnClientNodeExpanded;
            const eventReferenceCollapsed = oppositeTree.OnClientNodeCollapsed;

            oppositeTree.OnClientNodeExpanded = null;
            oppositeTree.OnClientNodeCollapsed = null;

            const oppositeNode = oppositeTree.findNodeByValue(node.get_value());
            if (!oppositeNode) return;              

            const oppositeNodeEnabled = oppositeNode.get_enabled();
            if (!oppositeNodeEnabled) {
                oppositeNode.enable();
            }

            oppositeNode.toggle();

            if (!oppositeNodeEnabled) {
                oppositeNode.disable();
            }
          
            oppositeTree.OnClientNodeExpanded = eventReferenceExpanded;
            oppositeTree.OnClientNodeCollapsed = eventReferenceCollapsed;
        }

        function tvwProfiledSpecies_OnClientNodeClicking(sender, args)
        {
            clientNodeClicking(sender, args);
            tvwProfiledSpecies_OnClientNodeChecked(sender, args);
        }

        function tvwOtherAffectedSpecies_OnClientNodeClicking(sender, args) {
            clientNodeClicking(sender, args);
            tvwOtherAffectedSpecies_OnClientNodeChecked(sender, args);
        }

        function tvwProfiledSpecies_OnClientNodeChecked(sender, args)
        {
            const node = args.get_node();
            if (!node) return; 

            // if a profiled species has been unchecked, display the warning message
            if (!node.get_checked())
            {
                 var pnlWarning = document.getElementById('pnlWarning');
                 if (pnlWarning)
                 {
                    pnlWarning.style.visibility = 'visible'; 
                    pnlWarning.style.display = 'block'; 
                 }
            }
            
            const tvwOtherAffectedSpecies = $find("<%= tvwOtherAffectedSpecies.ClientID %>");
            AdjustTreesOnCheck(node, tvwOtherAffectedSpecies.findNodeByValue(node.get_value()));

            SetProfiledSpeciesSelectedText(sender);
            SetOtherAffectedSpeciesSelectedText(tvwOtherAffectedSpecies);

            var validator = document.getElementById("<%= valProfiledSpecies.ClientID %>");

            ValidatorValidate(validator);
            ValidatorUpdateIsValid();

            const tvwProfiledSpecies = $find("<%= tvwProfiledSpecies.ClientID %>");
            if (tvwProfiledSpecies.get_checkedNodes().length > 0)
            {
                const summary = $("[id$='valSummary']");
                if (!summary) return;

                summary.hide();
            }
        }

        function tvwOtherAffectedSpecies_OnClientNodeChecked(sender, args)
        {
            const node = args.get_node();
            if (!node) return; 

            const tvwProfiledSpecies = $find("<%=tvwProfiledSpecies.ClientID %>");
            AdjustTreesOnCheck(node, tvwProfiledSpecies.findNodeByValue(node.get_value()));

            SetProfiledSpeciesSelectedText(tvwProfiledSpecies);
            SetOtherAffectedSpeciesSelectedText(sender);
        }
        
        function AdjustTreesOnCheck(checkNode, oppositeNode)
        {
            if (checkNode.get_checked())
            {
                oppositeNode.disable();
            }
            else
            {
                oppositeNode.enable();
            }
            
            if (checkNode.get_allNodes().length > 0)
            {
                //If the node has any children UpdateAllChildren runs for all children
                UpdateAllChildren(checkNode.get_allNodes(), oppositeNode.get_allNodes(), checkNode.get_checked());
            } 
            else 
            {
                //If the node has no children disable it if it's inactive
                if(checkNode.Category == 'Inactive')
                {
                    checkNode.disable();
                    oppositeNode.disable();
                }
            }
        }
        

        function UpdateAllChildren(checkNodes, oppositeNodes, checked)
        {
            var currentNode;
            for (currentNode = 0; currentNode < checkNodes.length; currentNode++)
            {
                //If parent node is checked
                if (checked)
                {
                    checkNodes[currentNode].enable();
                    oppositeNodes[currentNode].enable();

                    //Test whether the current node is active and check the checkbox if it is
                    if (checkNodes[currentNode].get_category() != 'Inactive')
                    {
                        checkNodes[currentNode].check();
                    }

                    oppositeNodes[currentNode].uncheck();

                    checkNodes[currentNode].disable();
                    oppositeNodes[currentNode].disable();
                }
                else
                {
                    //Test whether the current node is active and enable if it is
                    if(checkNodes[currentNode].get_category() != 'Inactive')
                    {
                        checkNodes[currentNode].enable();
                        oppositeNodes[currentNode].enable();
                    }
                    checkNodes[currentNode].uncheck(); 
                }

                //If current node has other children, then recursively call UpdateAllChildren
                if (checkNodes[currentNode].get_allNodes().length > 0) 
                {
                    UpdateAllChildren(checkNodes[currentNode].get_allNodes(), oppositeNodes[currentNode].get_allNodes(), checked);
                } 
            }
        } 
       
       function valProfiledSpecies_Validate(sender, args)
       {
           
           var tvwProfiledSpecies = $find("<%=tvwProfiledSpecies.ClientID %>");

           if (tvwProfiledSpecies.get_checkedNodes().length > 0) {
               args.IsValid = true;
               return;
           }

           args.IsValid = false;
       }

    // Initialize the tree view controller
    const profiledSpeciesTreeViewId = '<%= tvwProfiledSpecies.ClientID %>';
    const otherAffectedSpeciesTreeViewId = '<%= tvwOtherAffectedSpecies.ClientID %>';

    const profileTree = getTreeViewController(profiledSpeciesTreeViewId, { toggleId: '<%= profiledSpeciesTreeToggle.ClientID %>', selectionMode: 'multiple' });
    const otherTree = getTreeViewController(otherAffectedSpeciesTreeViewId, { toggleId: '<%= otherAffectedSpeciesTreeToggle.ClientID%>', selectionMode: 'multiple' });

    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_endRequest(function (sender, args) {
        initialiseAfterPostback();
    });

    function initialiseAfterPostback() {
        profileTree.initialiseAfterPartialPostback();
        otherTree.initialiseAfterPartialPostback();
    }

</script>
   
    <div>
        <asp:Literal runat="server" ID="litWarning">
            <div id="pnlWarning" style="visibility:hidden;display:none;" class="ErrorLabel" aria-label= "Warning: removing profiled species from a profile will remove all of the data associated with that species from the profile.">Warning: removing profiled species from a profile will remove all of the data associated with that species from the profile.</div>
         </asp:Literal> 
    </div>

    <div id="affectedspeciesselector">
        <div class="affectedspeciesselector-col">
                Profiled species: <asp:CustomValidator runat="server" ID="valProfiledSpecies" Height="26px"  EnableClientScript="true" ValidateEmptyText="true" ErrorMessage="You must specify at least one profiled species" ToolTip="Please select at least one profiled species" ClientValidationFunction="valProfiledSpecies_Validate">*</asp:CustomValidator>
                <div style="border-width:1px;border-style:solid;border-color:#bfc1c3;" class="rad-tree-view">
                    <uc:TreeViewToggleButton runat="server" ID="profiledSpeciesTreeToggle" IsExpanded="True" />
                    <telerik:RadTreeView ID="tvwProfiledSpecies" runat="server" style="height:400px;overflow:auto;" TabIndex="0"
                        AutoPostBack="False"
                        CheckBoxes="True" 
                        EnableKeyboardNavigation="True"
                        EnableAriaSupport="True" 
                        ShowLineImages="True" 
                        MultipleSelect="False" 
                        EnableTheming="False"
                        OnClientNodeClicking="tvwProfiledSpecies_OnClientNodeClicking"
                        OnClientNodeChecked ="tvwProfiledSpecies_OnClientNodeChecked" 
                        OnClientNodeExpanded ="tvwProfiledSpecies_AfterClientToggle" 
                        OnClientNodeCollapsed ="tvwProfiledSpecies_AfterClientToggle" 
                        OnClientLoad ="tvwProfiledSpecies_OnClientLoad" aria-label="This is a multiple-select tree view. Multiple items can be selected."/>
                </div>
                <div>Selected: <strong><span id="profiledSpeciesSelected" class="selected-species-text" runat="server"></span></strong></div>
        </div>
        <div class="affectedspeciesselector-col" >
                Other affected species:
                <div style="border-width:1px;border-style:solid;border-color:#bfc1c3;" class="rad-tree-view">
                    <uc:TreeViewToggleButton runat="server" ID="otherAffectedSpeciesTreeToggle" IsExpanded="True" />
                    <telerik:RadTreeView ID="tvwOtherAffectedSpecies" runat="server" style="height:400px;overflow:auto;" TabIndex="0" 
                        AutoPostBack="False"
                        CheckBoxes="True" 
                        EnableKeyboardNavigation="True"
                        EnableAriaSupport="True" 
                        ShowLineImages="True" 
                        MultipleSelect="False" 
                        EnableTheming="False"
                        OnClientNodeClicking="tvwOtherAffectedSpecies_OnClientNodeClicking"
                        OnClientNodeChecked="tvwOtherAffectedSpecies_OnClientNodeChecked" 
                        OnClientNodeExpanded="tvwOtherAffectedSpecies_AfterClientToggle" 
                        OnClientNodeCollapsed="tvwOtherAffectedSpecies_AfterClientToggle"
                        OnClientLoad ="tvwOtherAffectedSpecies_OnClientLoad" aria-label="This is a multiple-select tree view. Multiple items can be selected."/>
                </div>
                <div>Selected: <strong><span id="otherAffectedSpeciesSelected" runat="server"></span></strong></div>
        </div>
    </div>    

<div id="selectionAnnouncement" role="status"  aria-live="assertive" class="govuk-visually-hidden"></div>