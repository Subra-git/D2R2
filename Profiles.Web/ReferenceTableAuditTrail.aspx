<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false" Inherits="Profiles.Web.ReferenceTableAuditTrail" title="Reference table audit trail" Codebehind="ReferenceTableAuditTrail.aspx.vb" %>
<%@ Register Src="NavigationLinks.ascx" TagName="NavigationLinks" TagPrefix="nav" %>
<%@ Register Src="Paginator.ascx" TagName="Paginator" TagPrefix="auc" %>
<%@ Register Src="~/PaginatorPageSize.ascx" TagPrefix="auc" TagName="PaginatorPageSize" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" Runat="Server">
<table>
        <tr>
            <td align="right">                            
                <asp:HyperLink ID="lnkReferenceTable" CssClass="govuk-link" runat="server">Maintain reference data</asp:HyperLink>
            </td>
        </tr>
    </table>  
    
    <div style="width:100%;float:left;margin-top:10px;">
        <asp:UpdatePanel runat="server" ID="pnlUpdate">
        <ContentTemplate>
            <div class="row">
                 <auc:PaginatorPageSize runat="server" ID="PaginatorPageSize" PaginatorId="bottomPaginator" GridId="grdAuditTrail" />
            </div>
                <pwc:GridViewExternalPaging ID="grdAuditTrail" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
                DataSourceID="dsReferenceDataAuditTrailInfoList" Width="100%" GridLines="None" CssClass="gridview"
                DefaultSortExpression="DateOfChange" DefaultSortDirection="Descending">
                    <Columns>
                        <asp:BoundField DataField="OldValue" HeaderText="Old value" SortExpression="OldValuePlainText" HtmlEncode="false"/>
                        <asp:BoundField DataField="NewValue" HeaderText="New value" SortExpression="NewValuePlainText" HtmlEncode="false"/>
                        <asp:BoundField DataField="User" HeaderText="User" SortExpression="User" />
                        <asp:BoundField DataField="DateOfChange" HeaderText="Date of change" SortExpression="DateOfChange" DataFormatString="{0:d MMMM yyyy HH:mm}" />
                        <asp:ButtonField CommandName="ViewDetails" Text="View details" />
                    </Columns>
                    <HeaderStyle CssClass="gridviewHeader" />
                    <RowStyle CssClass="gridviewRow" />
                    <AlternatingRowStyle CssClass="gridviewAltRow" />
                </pwc:GridViewExternalPaging>
               <csla:CslaDataSource ID="dsReferenceDataAuditTrailInfoList" runat="server" TypeAssemblyName="ProfilesLibrary" TypeName="ProfilesLibrary.ReferenceDataAuditTrailInfoList">
                </csla:CslaDataSource> 
                 <br />
            <div class=" pb-4">
              <auc:Paginator runat="server" ID="bottomPaginator"></auc:Paginator>
            </div>            
            <br />
      <asp:Label ID="lblErrorMsg" cssClass="ErrorLabel" runat="server" Visible="False"></asp:Label>
    <div>&nbsp;</div>
    <asp:Panel ID="pnlAuditDetails" runat="server" Visible="False">
       <div class="collapsePanelHeader"><asp:Label ID="lblPanelTitle" runat="server"></asp:Label></div>  
       <div class="collapsePanel">
           <table width="100%">
               <tr>
                    <td style="width:20%"><span class="fw-bold">Old value: </span></td>
                    <td colspan="3"><asp:Textbox ID="txtOldValue" runat="server" style="width:95%"  Enabled="false" CssClass="hidden"></asp:Textbox>
                        <span runat="server" id="txtOldValueSpan">Text Old Value</span>
                    </td>
                </tr>
                <tr>
                    <td><span class="fw-bold">New value: </span></td>
                    <td colspan="3"><asp:Textbox ID="txtNewValue" runat="server" style="width:95%" enabled="false" CssClass="hidden"></asp:Textbox>
                        <span runat="server" id="txtNewValueSpan">Text New Value</span>
                    </td>
                </tr>  
                <tr>
                    <td style="width:20%"><span class="fw-bold"> Changed by: </span></td>
                    <td style="width:30%"><asp:Textbox ID="txtUser" runat="server" enabled="false" CssClass="hidden"></asp:Textbox>
                        <span runat="server" id="txtUserSpan">Changed By:</span>
                    </td>
                    <td style="width:20%"><span class="fw-bold">Date of change: </span></td>
                    <td style="width:30%"><asp:Textbox ID="txtDateOfChange" runat="server" enabled="false" CssClass="hidden"></asp:Textbox>
                        <span runat="server" id="txtDateOfChangeSpan">Date Changed</span>
                    </td>
                </tr>
                <tr>
                    <td><span class="fw-bold">Reason for change: </span></td>
                    <td colspan="3"><asp:Textbox ID="txtReasonForChange" runat="server" enabled="false" TextMode="MultiLine" style="width:95%" Rows="6" CssClass="hidden"></asp:Textbox>
                        <span runat="server" id="txtReasonForChangeSpan">Reason For Change</span>
                    </td>
                </tr>  
            </table>
        </div> 
    </asp:Panel>
         </ContentTemplate>
        </asp:UpdatePanel>
        </div>
</asp:Content>

