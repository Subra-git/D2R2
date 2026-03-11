<%@ Control Language="VB" AutoEventWireup="false" CodeFile="SpeciesSelector.ascx.vb" Inherits="SpeciesSelector" %>
<%@ Register Assembly="RadTreeView.Net2" Namespace="Telerik.WebControls" TagPrefix="radT" %>

    <script type="text/javascript">
    
        document.onclick = CheckHideSpeciesDiv; 
        
        function AfterClientCheck(node)
        {
            if (node.Checked)
            {
                UncheckAncestorNodes(node);
                UncheckDescendentNodes(node);
            }
            
            var affectedSpecies = new Array();
            var speciesCount = 0;

            var allSpeciesNodes = node.TreeView.AllNodes;
            
            for (var currentSpecies = 0; currentSpecies < allSpeciesNodes.length; currentSpecies++)
            {
                if (allSpeciesNodes[currentSpecies].Checked)
                {
                    affectedSpecies[speciesCount] = allSpeciesNodes[currentSpecies].Text;
                    speciesCount++;
                }
            }
            affectedSpecies.sort();
            
            var speciesLabel = document.getElementById('<%=lblAffectedSpecies.ClientID %>');
            var speciesPanel = document.getElementById('<%=pnlAffectedSpecies.ClientID %>');
            var speciesFrame = document.getElementById('frmAffectedSpecies');
            
            if (affectedSpecies.length > 0)
            {
                ReplaceText(speciesLabel, affectedSpecies.join(", "));
            }
            else
            {
                ReplaceText(speciesLabel, "Any species");
            }
            
            //adjust the position of the dropdown div to account for the new size of the label
            speciesPanel.style.top = (GetElementPosition(speciesLabel).top + speciesLabel.offsetHeight) + 'px';
            speciesPanel.style.left = GetElementPosition(speciesLabel).left + 'px';
            speciesFrame.style.left = speciesPanel.offsetLeft + 'px';
            speciesFrame.style.top = speciesPanel.offsetTop + 'px';
        }
        
        //x-browser compatible, unlike .innerText
        function ReplaceText(element, text)
        {
            if (element.firstChild)
            {
                element.firstChild.nodeValue = text;
            }
            else
            {
                element.appendChild(document.createTextNode(text));
            }
        }
        
        function UncheckAncestorNodes(node)
        {
            if (node.Parent != null)
            {
                node.Parent.UnCheck();
                UncheckAncestorNodes(node.Parent);
            }
        }
        
        function UncheckDescendentNodes(node)
        {
            for (var currentNode = 0; currentNode < node.Nodes.length; currentNode++)
            {
                node.Nodes[currentNode].UnCheck();
                UncheckDescendentNodes(node.Nodes[currentNode]);
            }
        }
        
        // for calculation of the positioning of the dropdown div
        function GetElementPosition(element)
        {
            var offsetTrail = element;
            var offsetLeft = 0;
            var offsetTop = 0;
            while (offsetTrail)
            {
                offsetLeft += offsetTrail.offsetLeft;
                offsetTop += offsetTrail.offsetTop;
                offsetTrail = offsetTrail.offsetParent;
            }
            if (navigator.userAgent.indexOf('Mac') != -1 && typeof document.body.leftMargin != 'undefined')
            {
                offsetLeft += document.body.leftMargin;
                offsetTop += document.body.topMargin;
            }
            return {left:offsetLeft,top:offsetTop};
        }

        function ShowSpeciesDiv()
        {
            var speciesLabel = document.getElementById('<%=lblAffectedSpecies.ClientID %>');
            var speciesPanel = document.getElementById('<%=pnlAffectedSpecies.ClientID %>');
            var speciesFrame = document.getElementById('frmAffectedSpecies');

            speciesPanel.style.visibility = "visible";
            speciesPanel.style.top = (GetElementPosition(speciesLabel).top + speciesLabel.offsetHeight) + 'px';
            speciesPanel.style.left = GetElementPosition(speciesLabel).left + 'px';
            speciesPanel.style.display = "block";
            
            speciesFrame.style.display = "block";
            speciesFrame.style.backgroundColor = "black";
            speciesFrame.style.zIndex = speciesPanel.style.zIndex - 1;
            
            speciesFrame.style.width = speciesPanel.offsetWidth-5;
            speciesFrame.style.height = speciesPanel.offsetHeight-5;
            speciesFrame.style.left = speciesPanel.offsetLeft + 'px';
            speciesFrame.style.top = speciesPanel.offsetTop + 'px';
        }
        
        function CheckHideSpeciesDiv(e)
        {
            var speciesLabel = document.getElementById('<%=lblAffectedSpecies.ClientID %>');
            var speciesPanel = document.getElementById('<%=pnlAffectedSpecies.ClientID %>');
            var speciesFrame = document.getElementById('frmAffectedSpecies');
            var target = (e && e.target) || (event && event.srcElement);
            if (IsOutsideOfSpeciesPanel(target) && target != speciesLabel)
            {
                speciesFrame.style.display='none';
                speciesPanel.style.display='none';
            }
        } 
        
        function IsOutsideOfSpeciesPanel(target)
        {
            while (target.parentNode)
            { 
                if (target == document.getElementById('<%=pnlAffectedSpecies.ClientID %>'))
                { 
                    return false; 
                } 
                target = target.parentNode; 
            } 
            return true; 
        } 
        
    </script>
    
    <asp:Label ID="lblAffectedSpecies" runat="server" CssClass="HyperlinkStyle" onclick="ShowSpeciesDiv()">Any species</asp:Label>
    <asp:Panel ID="pnlAffectedSpecies" runat="server" Width="402px" CssClass="ContextMenuPanel" Style="position:absolute;top:0px;left:0px;visibility:hidden;display:none;z-index:10000">
        <radT:RadTreeView ID="tvwSpecies" runat="server" CheckBoxes="True" 
        Height="350px" Width="400px" AfterClientCheck="AfterClientCheck"></radT:RadTreeView>
    </asp:Panel>
    <div>
    <iframe ID="frmAffectedSpecies" scrolling="no" frameborder="0" 
    style="position:absolute;top:0px;left:0px;display:none;"></iframe>
</div>
