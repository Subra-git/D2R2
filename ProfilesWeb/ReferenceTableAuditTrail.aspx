<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false" CodeFile="ReferenceTableAuditTrail.aspx.vb" Inherits="ReferenceTableAuditTrail" title="Reference table audit trail" %>
<%@ Register Src="NavigationLinks.ascx" TagName="NavigationLinks" TagPrefix="nav" %>

<asp:Content ID="navContent" ContentPlaceHolderID="cphNavigation" Runat="Server">
    <nav:NavigationLinks ID="ctlNavigationLinks" runat="server" />
</asp:Content>

<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" Runat="Server">
<table>
        <tr>
            <td align="right">                            
                <asp:HyperLink ID="lnkReferenceTable" runat="server">Maintain reference data</asp:HyperLink>
            </td>
        </tr>
    </table>  
    
    <div style="width:100%;float:left;margin-top:10px;">
        <asp:UpdatePanel runat="server" ID="pnlUpdate">
        <ContentTemplate>
                <pwc:GridView ID="grdAuditTrail" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
                DataSourceID="dsReferenceDataAuditTrailInfoList" Width="100%" GridLines="None" CssClass="gridview"
                DefaultSortExpression="DateOfChange" DefaultSortDirection="Descending">
                    <Columns>
                        <asp:BoundField DataField="OldValue" HeaderText="Old value" SortExpression="OldValue" />
                        <asp:BoundField DataField="NewValue" HeaderText="New value" SortExpression="NewValue" />
                        <asp:BoundField DataField="User" HeaderText="User" SortExpression="User" />
                        <asp:BoundField DataField="DateOfChange" HeaderText="Date of change" SortExpression="DateOfChange" DataFormatString="{0:d MMMM yyyy HH:mm}" />
                        <asp:ButtonField CommandName="ViewDetails" Text="View details" />
                    </Columns>
                    <HeaderStyle CssClass="gridviewHeader" />
                    <RowStyle CssClass="gridviewRow" />
                    <AlternatingRowStyle CssClass="gridviewAltRow" />
                </pwc:GridView>
               <csla:CslaDataSource ID="dsReferenceDataAuditTrailInfoList" runat="server" TypeAssemblyName="ProfilesLibrary" TypeName="ProfilesLibrary.ReferenceDataAuditTrailInfoList">
                </csla:CslaDataSource> 
                 <br /><br />
      <asp:Label ID="lblErrorMsg" cssClass="ErrorLabel" runat="server" Visible="False"></asp:Label>
    <div>&nbsp;</div>
    <asp:Panel ID="pnlAuditDetails" runat="server" Visible="False">
       <div class="collapsePanelHeader"><asp:Label ID="lblPanelTitle" runat="server"></asp:Label></div>  
       <div class="collapsePanel">
           <table width="100%">
               <tr>
                    <td style="width:20%">Old value: </td>
                    <td colspan="3"><asp:Textbox ID="txtOldValue" runat="server" style="width:95%"  Enabled="false"></asp:Textbox></td>
                </tr>
                <tr>
                    <td>New value:</td>
                    <td colspan="3"><asp:Textbox ID="txtNewValue" runat="server" style="width:95%" enabled="false"></asp:Textbox></td>
                </tr>  
                <tr>
                    <td style="width:20%"> Changed by:</td>
                    <td style="width:30%"><asp:Textbox ID="txtUser" runat="server" enabled="false"></asp:Textbox></td>
                    <td style="width:20%">Date of change:</td>
                    <td style="width:30%"><asp:Textbox ID="txtDateOfChange" runat="server" enabled="false"></asp:Textbox></td>
                </tr>
                <tr>
                    <td>Reason for change:</td>
                    <td colspan="3"><asp:Textbox ID="txtReasonForChange" runat="server" enabled="false" TextMode="MultiLine" style="width:95%" Rows="6"></asp:Textbox></td>
                </tr>  
            </table>
        </div> 
    </asp:Panel>
         </ContentTemplate>
        </asp:UpdatePanel>
        </div>
</asp:Content>

