<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false" CodeFile="Search.aspx.vb" Inherits="Search" title="This is D2R2" %>
<%@ Register Src="NavigationLinks.ascx" TagName="NavigationLinks" TagPrefix="nav" %>
<%@ Register Src="SpeciesSelector.ascx" TagName="SpeciesSelector" TagPrefix="sps" %>

<asp:Content ID="navContent" ContentPlaceHolderID="cphNavigation" Runat="Server">
    <nav:NavigationLinks ID="ctlNavigationLinks" runat="server" />
</asp:Content>

<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" Runat="Server">

<script type="text/javascript"> 
    
    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(beginRequest);
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(endRequest);    
            
            function beginRequest(sender, args){
                document.body.style.cursor='wait'; 
                // show the popup
                if (args.get_postBackElement().id.indexOf('<%=ctlResultList.ClientID %>__') == -1)
                {
                    $find('<%=mpeProgress.ClientID %>').show();  
                }  
                
            }

            function endRequest(sender, args) {
                //  hide the popup
                $find('<%=mpeProgress.ClientID %>').hide();
                document.body.style.cursor='auto';
            }
            
</script>

<div style="float:left">
        
        <div>
            <div>From this page you can access the disease profiles which have been published. If you want to see 
                 profiles that are still being drafted or if you want access to disease scenarios, you need to be 
                 given permission by the D2R2 team.</div>
            <div style="padding-left:15px; padding-top:8px; padding-bottom:8px;">                        
            <table width="100%">
            <tr>
                <td>
                    <asp:CheckBox ID="chkDisplayPublished" runat="server" Checked="true" Text="Display published versions" AutoPostBack="true" />            
                </td>
                <td>
                   <asp:CheckBox ID="chkDisplayDraft" runat="server" Text="Display draft versions" AutoPostBack="true" />            
                </td>
                <td>
                    <asp:CheckBox ID="chkDisplayScenarios" runat="server" Text="Display scenarios" AutoPostBack="true" />                                
                </td>
                <td>
                  <asp:CheckBox ID="chkDisplayMyProfiles" runat="server" Text="Display my own profiles only" AutoPostBack="true" />            
                </td>
            </tr>    
            </table>
            
            
            </div>
        </div>

<!--
        <div>
            <div></div>
            <div style="padding-left:30px; padding-top:8px; padding-bottom:8px;">                                       
         
            </div>
        </div>
        
        <div>
            <div>If you want access to scenarios, you also need permission from the D2R2 team.</div>
            <div style="padding-left:30px; padding-top:8px; padding-bottom:8px;">                                 
            
            </div>
        </div>
        
        <asp:Panel runat="server" ID="pnlMyProfiles"  >
            <div>If you just want access to your own profiles. </div>
            <div style="padding-left:30px; padding-top:8px; padding-bottom:8px;">                                          
          
            </div>
        </asp:Panel>
        -->
        <div>To contact us please email the D2R2 mail box: <a href="mailto:D2R2@defra.gsi.gov.uk">D2R2@defra.gsi.gov.uk</a></div>
        
</div>
     
  
    <div style="width:100%;float:left;margin-top:10px;">

        <asp:UpdatePanel ID="udpSearch" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
            <ContentTemplate>
                                            
                <div class="collapsePanelHeader">Search for profiles</div>  
                <div class="collapsePanel">
                    <table width="100%">
                        <tr>
                            <td>
                                Profile title beginning with:
                            </td>                            
                            <td width="70%" style="padding-bottom:10px;">
                                <pwc:AlphabetSelector ID="ctlLetterSelector" runat="server" />
                            </td>
                        </tr>                        
                        <tr>
                            <td>
                                 Profile title containing: 
                            </td>
                            <td width="70%">
                                <asp:TextBox ID="txtTitle" runat="server" Width="95%" MaxLength="255" />
                                <%--Single textbox submit IEBug workaround http://aspnet.4guysfromrolla.com/articles/060805-1.aspx --%>
                                <input id="txtDontUse" style="visibility:hidden;display:none;" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Current profile version affecting:
                            </td>
                            <td width="70%">
                                <sps:SpeciesSelector runat="server" ID="spsSelector" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div align="right">
                                    <asp:Button ID="btnSearch" runat="server" Text="Search" />
                                </div>
                            </td>
                        </tr>
                    </table>

                </div>                
        
                <pwc:SearchResultList ID="ctlResultList" runat="server" />
       
            </ContentTemplate>
        </asp:UpdatePanel>
        
    </div>
    
    <asp:Panel ID="pnlProgress" runat="server" Height="150px" Width="250px" style="text-align:center;display:none;">
            <asp:Panel ID="pnlProgressHeader" runat="server" CssClass="collapsePanelHeader">In progress...</asp:Panel>  
            <div class="collapsePanel" style="height:100px">
           <br /> 
                <asp:Image ID="imgProgress" runat="server" Height="55px" ImageUrl="Images/Progress.gif" ToolTip="In progress..." Visible="True" Enabled="False" Width="54px" ImageAlign="Middle" />
            </div>
        </asp:Panel>
        
        <act:ModalPopupExtender ID="mpeProgress" runat="server" TargetControlID="imgProgress" PopupControlID="pnlProgress" 
            BackgroundCssClass="modalBackground" 
            OkControlID="imgProgress"
            CancelControlID="imgProgress" 
             />
             
</asp:Content>

