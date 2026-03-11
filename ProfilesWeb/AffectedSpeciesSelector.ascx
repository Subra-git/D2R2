<%@ Control Language="VB" AutoEventWireup="false" CodeFile="AffectedSpeciesSelector.ascx.vb" Inherits="AffectedSpeciesSelector" %>
<%@ Register Assembly="RadTreeView.Net2" Namespace="Telerik.WebControls" TagPrefix="radT" %>

<script language="javascript" type="text/javascript">
    <!--        
        function tvwProfiledSpecies_AfterClientToggle(node)
        {
            var tvwOtherAffectedSpecies = <%=tvwOtherAffectedSpecies.ClientID %>;
            ToggleNode(node, tvwOtherAffectedSpecies);
        }
    
        function tvwOtherAffectedSpecies_AfterClientToggle(node)
        {
            var tvwProfiledSpecies = <%=tvwProfiledSpecies.ClientID %>;
            ToggleNode(node, tvwProfiledSpecies);
        }
        
        function ToggleNode(node, oppositeTree)
        {
            var eventReference = oppositeTree.AfterClientToggle;
            oppositeTree.AfterClientToggle = null;
            
            var oppositeNode = oppositeTree.FindNodeByValue(node.Value);
            var oppositeNodeEnabled = oppositeNode.Enabled;
            if (!oppositeNodeEnabled)
            {
                oppositeNode.Enable();
            }
            oppositeNode.Toggle();
            if (!oppositeNodeEnabled)
            {
                oppositeNode.Disable();
            }
            
            oppositeTree.AfterClientToggle = eventReference;
        }
        
        function tvwProfiledSpecies_AfterClientCheck(node)
        {
            // if a profiled species has been unchecked, display the warning message
            if (!node.Checked)
            {
                 var pnlWarning = document.getElementById('pnlWarning');
                 if (pnlWarning)
                 {
                    pnlWarning.style.visibility = 'visible'; 
                    pnlWarning.style.display = 'block'; 
                 }
            }
            
            var tvwOtherAffectedSpecies = <%=tvwOtherAffectedSpecies.ClientID %>;
            AdjustTreesOnCheck(node, tvwOtherAffectedSpecies.FindNodeByValue(node.Value));
        }

        function tvwOtherAffectedSpecies_AfterClientCheck(node)
        {
            var tvwProfiledSpecies = <%=tvwProfiledSpecies.ClientID %>;
            AdjustTreesOnCheck(node, tvwProfiledSpecies.FindNodeByValue(node.Value));
        }
        
        function AdjustTreesOnCheck(checkNode, oppositeNode)
        {
            if (checkNode.Checked)
            {
                oppositeNode.Disable();
            }
            else
            {
                oppositeNode.Enable();
            }
            
            if (checkNode.Nodes.length > 0) 
            {
                //If the node has any children UpdateAllChildren runs for all children
                UpdateAllChildren(checkNode.Nodes, oppositeNode.Nodes, checkNode.Checked);
            } 
            else 
            {
                //If the node has no children disable it if it's inactive
                if(checkNode.Category == 'Inactive')
                {
                    checkNode.Disable();
                    oppositeNode.Disable();
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
                    checkNodes[currentNode].Disable();
                    oppositeNodes[currentNode].Disable();
                    //Test whether the current node is active and check the checkbox if it is
                    if(checkNodes[currentNode].Category != 'Inactive')
                    {
                        checkNodes[currentNode].Check(); 
                    }
                    oppositeNodes[currentNode].UnCheck();
                }
                else
                {
                    //Test whether the current node is active and enable if it is
                    if(checkNodes[currentNode].Category != 'Inactive')
                    {
                        checkNodes[currentNode].Enable();
                        oppositeNodes[currentNode].Enable();
                    }
                    checkNodes[currentNode].UnCheck(); 
                } 
                //If current node has other children, then recursively call UpdateAllChildren
                if (checkNodes[currentNode].Nodes.length > 0) 
                {
                    UpdateAllChildren(checkNodes[currentNode].Nodes, oppositeNodes[currentNode].Nodes, checked);
                } 
            }
        } 
       
       function valProfiledSpecies_Validate(sender, args)
       {
            var tvwProfiledSpecies = <%=tvwProfiledSpecies.ClientID %>;
            var nodes = tvwProfiledSpecies.AllNodes;
            for (currentNode = 0; currentNode < nodes.length; currentNode++)
            {
                if (nodes[currentNode].Checked)
                {
                    args.IsValid = true;
                    return;
                }   
            }
           args.IsValid = false;
       } 
    //-->
   </script>
   
   <table style="width: 100%">
        <asp:Literal runat="server" ID="litWarning">
            <tr>
                <td colspan="3"><div id="pnlWarning" style="visibility:hidden;display:none;" class="ErrorLabel">Warning: removing profiled species from a profile will remove all of the data associated with that species from the profile.</div></td> 
            </tr>
        </asp:Literal> 
        <tr> 
            <td style="width:50%;">Profiled species: <asp:CustomValidator runat="server" ID="valProfiledSpecies" Height="26px" EnableClientScript="true" ValidateEmptyText="true" ErrorMessage="You must specify at least one profiled species" ToolTip="Please select at least one profiled species" ClientValidationFunction="valProfiledSpecies_Validate">*</asp:CustomValidator></td>
            <td style="width:20px;" />
            <td style="width:50%;vertical-align:bottom;">Other affected species:</td>
         </tr>
         <tr>
            <td>
                <div style="border-width:1px;border-style:solid;">
                    <radT:RadTreeView ID="tvwProfiledSpecies" runat="server" CheckBoxes="True" AfterClientCheck="tvwProfiledSpecies_AfterClientCheck" AfterClientToggle="tvwProfiledSpecies_AfterClientToggle" style="overflow:hidden;" />
                </div>
            </td>
            <td style="width:20px;" />
            <td>
                <div style="border-width:1px;border-style:solid">
                    <radT:RadTreeView ID="tvwOtherAffectedSpecies" runat="server" CheckBoxes="True" AfterClientCheck="tvwOtherAffectedSpecies_AfterClientCheck" AfterClientToggle="tvwOtherAffectedSpecies_AfterClientToggle" style="overflow:hidden;" />
                </div>
            </td>
        </tr>
    </table>