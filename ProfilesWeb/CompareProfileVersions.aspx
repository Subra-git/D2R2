<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false"
    CodeFile="CompareProfileVersions.aspx.vb" Inherits="CompareProfileVersions" Title="Compare profile versions" %>
<%@ Register Src="NavigationLinks.ascx" TagName="NavigationLinks" TagPrefix="nav" %>
<%@ Register Assembly="RadTreeView.Net2" Namespace="Telerik.WebControls" TagPrefix="radT" %>

<asp:Content ID="navContent" ContentPlaceHolderID="cphNavigation" runat="Server">
    <nav:NavigationLinks ID="ctlNavigationLinks" runat="server" />
</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" runat="Server">
    <script language="javascript" type="text/javascript">
    
        function tvwProfileVersions_AfterClientCheck(node)
        {
            var firstId = document.getElementById('FirstCheckedNodeId');
            var secondId = document.getElementById('SecondCheckedNodeId');
                      
            if (node.Checked)
            {
                if (firstId.value == '0' && secondId.value == '0')  // no nodes selected
                {
                    firstId.value = node.Value;
                }
                else if (firstId.value != '0' && secondId.value == '0')    // one node selected
                {
                    secondId.value = node.Value;
                }
                else if (firstId.value != '0' && secondId.value != '0')  // two nodes selected
                {
                    var tree = <%= tvwProfileVersions.ClientID %>;
                    var oldNode = tree.FindNodeByValue(secondId.value);
                    oldNode.UnCheck();
                    secondId.value = node.Value;   
                }              
            }
            else  // node is unchecked
            {
                if (node.Value == firstId.value && secondId.value == '0')   //one node selected
                {
                    firstId.value = '0';
                }
                else if (node.Value == firstId.value && secondId.value != '0')  // two nodes selected and the first is unselected
                {
                    firstId.value = secondId.value;
                    secondId.value = '0';
                }
                else if (node.Value == secondId.value)  // two nodes selected and the second is unselected
                {
                    secondId.value = '0';
                }
            }
           
            var firstLabel = <%=lblFirstCheckedVersion.ClientID%>;
            var secondLabel = <%=lblSecondCheckedVersion.ClientID%>;
              
            if (firstId.value != '0')
            {
                var tree = <%= tvwProfileVersions.ClientID %>;
                var firstVersionNode = tree.FindNodeByValue(firstId.value);
                var firstScenarioNode = firstVersionNode.Parent;
                var firstProfileNode = firstScenarioNode.Parent;
                
                if (firstScenarioNode.Text == 'Current situation')
                {
                    firstLabel.innerHTML = firstProfileNode.Text + ' - ' + firstVersionNode.Text ;    
                }
                else
                {
                    firstLabel.innerHTML = firstProfileNode.Text + ' (' + firstScenarioNode.Text + ') - ' + firstVersionNode.Text ;    
                }
                
                
                if (secondId.value != '0')
                {
                    var tree = <%= tvwProfileVersions.ClientID %>;
                    var secondVersionNode = tree.FindNodeByValue(secondId.value);
                    var secondScenarioNode = secondVersionNode.Parent;
                    var secondProfileNode = secondScenarioNode.Parent;
              
                    if (secondScenarioNode.Text == 'Current situation')
                    {
                        secondLabel.innerHTML = secondProfileNode.Text + ' - ' + secondVersionNode.Text; 
                    }                   
                    else
                    {
                        secondLabel.innerHTML = secondProfileNode.Text + ' (' + secondScenarioNode.Text + ') - ' + secondVersionNode.Text;
                    }
                    
                    var divCompare = document.getElementById('divCompare');
                    divCompare.style.display = 'inline';
                }
                else
                {
                    secondLabel.innerHTML = '';
                    var divCompare = document.getElementById('divCompare');
                    divCompare.style.display = 'none';
                }
            }
            else
            {
                firstLabel.innerHTML = '- No profile versions are selected -';
                secondLabel.innerHTML = '';
                var divCompare = document.getElementById('divCompare');
                divCompare.style.display = 'none';
            }
        }
        
        function ShowComparisonPdf()
        {
            var firstId = document.getElementById('FirstCheckedNodeId');
            var secondId = document.getElementById('SecondCheckedNodeId');
            winRef = window.open( 'ShowProfileVersionComparisonReport.aspx?ProfileVersionLeftId=' + firstId.value + '&ProfileVersionRightId=' + secondId.value )
        }
     </script>
  
    <input type="hidden" id="FirstCheckedNodeId" value="0"/>
    <input type="hidden" id="SecondCheckedNodeId" value="0"/>
  
    <div style="float: left">
        Use this page to compare the content of profiles. Select the profiles to be compared using the hierarchical list below; only two profiles can be compared. The comparison report will only detail the differences between the two selected profiles.
        <br />
        <br />
    </div>
    <br />
    <br />
    <div style="width:100%; float:left;" >
    <asp:Label runat="server" ID="lblHeader" Text="The following profile versions are selected: "></asp:Label><br /><br />
    </div>
    <table width="100%">
        <tr>
            <td style="width: 60%;">
                <div style="width: 100%; float: left;">
                    <asp:Label runat="server" ID="lblFirstCheckedVersion" Text="- No profile versions are selected -"></asp:Label><br />
                    <asp:Label runat="server" ID="lblSecondCheckedVersion"></asp:Label></div>
            </td>
            <td style="vertical-align: middle;" align="center">
                <div id="divCompare" style="display: none;">
                    <asp:Button runat="server" ID="btnCompare" Text="Compare" /></div>
            </td>
        </tr>
    </table>
    <div style="width: 100%; float: left; margin-top: 10px;">
        <table width="100%">
            <tr>
                <td>
                    <div style="border-width: 1px; border-style: solid">
                        <radT:RadTreeView ID="tvwProfileVersions" runat="server" CheckBoxes="True" TabIndex="1" Height="200px" AfterClientCheck="tvwProfileVersions_AfterClientCheck">
                        </radT:RadTreeView>
                    </div>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
