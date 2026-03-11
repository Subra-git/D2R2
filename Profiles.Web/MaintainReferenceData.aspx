<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false" Inherits="Profiles.Web.MaintainReferenceData" Title="Maintain reference data" Codebehind="MaintainReferenceData.aspx.vb"%>

<%@ Register Src="NavigationLinks.ascx" TagName="NavigationLinks" TagPrefix="nav" %>
<%@ Register Src="Paginator.ascx" TagName="Paginator" TagPrefix="auc" %>
<%@ Register Src="~/PaginatorPageSize.ascx" TagPrefix="auc" TagName="PaginatorPageSize" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" runat="Server">
    <div style="float: left; width:100%">
        Use this function to maintain specific reference data that is utilised by the application.
        <br />
        <br />
    </div>
    <div style="width: 100%; float: left; margin-top: 10px;">
        <asp:UpdatePanel runat="server" ID="pnlUpdate">
            <ContentTemplate>
                <div class="d-flex align-items-center">
                <asp:label AssociatedControlID="ddlReferenceTable" CssClass="govuk-label me-2 mb-0 d-inline" runat="server" Text="Choose a reference table:"/>
                <asp:DropDownList ID="ddlReferenceTable" CssClass="govuk-select m-0" runat="server" AutoPostBack="True" DataSourceID="dsReferenceTableInfoList"
                    DataTextField="Value" DataValueField="Key" AppendDataBoundItems="true" CausesValidation="false">
                    <asp:ListItem Text="Please select..." Selected="True" Enabled="true" Value=""></asp:ListItem>
                </asp:DropDownList>
                    </div>
                <br />
                <br />

                <div class="row">
                     <auc:PaginatorPageSize runat="server" ID="PaginatorPageSize" PaginatorId="bottomPaginator" GridId="grdReferenceValueList" />
                </div>
                <pwc:GridViewExternalPaging ID="grdReferenceValueList" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    DataSourceID="dsReferenceValueInfoList" Width="100%" AllowSorting="True" GridLines="None"
                    CssClass="gridview" DefaultSortExpression="ValuePlainText">
                    <Columns>
                        <asp:TemplateField HeaderText="Value" SortExpression="ValuePlainText">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lnkValue" CommandArgument='<% # Eval("Id") %>'
                                    CommandName="EditReferenceData" Text='<% # Eval("Value").ToString() & IIf(CBool(Eval("IsActive")), String.Empty, " (Inactive)").ToString() %>'
                                    Enabled='<% # (IIf(CBool(Eval("IsActive")), "True", "False")) %>' CausesValidation="false" CssClass="govuk-link"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="EffectiveDates" HeaderText="Effective dates" SortExpression="EffectiveDateFrom" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton CommandName='<% # IIf(CBool(Eval("IsActive")), IIf(CBool(Eval("IsInUse")), "InactivateReferenceData", "DeleteReferenceData").ToString(), String.Empty) %>'
                                    runat="server" ID="lnkDelete" CommandArgument='<% # Eval("Id") %>' Text='<% # IIf(CBool(Eval("IsActive")), IIf(CBool(Eval("IsInUse")), "Inactivate", "Delete").ToString(), "") %>'
                                    CausesValidation="false" CssClass="govuk-link"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle CssClass="gridviewHeader" />
                    <RowStyle CssClass="gridviewRow" />
                    <AlternatingRowStyle CssClass="gridviewAltRow" />
                </pwc:GridViewExternalPaging>
                <csla:CslaDataSource ID="dsReferenceValueInfoList" runat="server" TypeAssemblyName="ProfilesLibrary"
                    TypeName="ProfilesLibrary.ReferenceValueInfoList">
                </csla:CslaDataSource>
                <csla:CslaDataSource ID="dsReferenceTableInfoList" runat="server" TypeAssemblyName="ProfilesLibrary"
                    TypeName="ProfilesLibrary.ReferenceTableInfoList">
                </csla:CslaDataSource>
                <div>
                    &nbsp;</div>
            <div class=" pb-4">
              <auc:Paginator runat="server" ID="bottomPaginator"></auc:Paginator>
            </div>
                <asp:Button ID="btnAddReferenceValue" runat="server" Text="Add reference value" Visible="false"
                    OnClick="btnAddReferenceValue_Click" CausesValidation="false" CssClass="govuk-button" />
                <asp:Button ID="btnViewAuditTrail" runat="server" Text="View audit trail" Visible="false"
                    CausesValidation="false" CssClass="govuk-button" />
                <div>
                    &nbsp;</div>
                <asp:ValidationSummary ID="valSumChangeValue" DisplayMode="BulletList" runat="server"
                    HeaderText="The following errors have occurred:" CssClass="ErrorLabel" />
                <asp:Label ID="lblErrorMsg" CssClass="ErrorLabel" runat="server" EnableViewState="false"></asp:Label>
                <asp:Panel ID="pnlAmendReferenceValue" runat="server" Visible="False">
                    <div class="collapsePanelHeader">
                        <asp:Label ID="lblPanelTitle" runat="server"></asp:Label></div>
                    <div class="collapsePanel">
                        <table width="100%">
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="lblWarning" CssClass="ErrorLabel" runat="server" Visible="False" Text="Warning: existing profiles reference this entry"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 20%">
                                    <span class="fw-bold">
                                    Old value:
                                    </span>
                                </td>
                                <td style="width: 80%">
                                    <span id="txtOldValue2" width="90%" runat="server" htmlencode="true"></span>
                                    <asp:TextBox ID="txtOldValue" CssClass="govuk-label" runat="server" Width="90%" Enabled="false" HtmlEncode="true"></asp:TextBox>
                                </td>
                            </tr>
                            </br>
                            <tr>
                                <td style="vertical-align: top;">
                                    <span class="fw-bold">
                                    New value:
                                    </span>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtNewValue" CssClass="govuk-label" runat="server" Width="90%" MaxLength="255" Enabled="false"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="valNewValueRequired" runat="server" ControlToValidate="txtNewValue"
                                        ErrorMessage="You need to provide a new value" ToolTip="You need to provide a new value"
                                        Text="*"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="fw-bold">
                                        Reason for change:
                                    </span>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtReasonForChange" runat="server" Width="90%" TextMode="MultiLine"
                                        Rows="6" Enabled="false"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="valReasonRequired" runat="server" ControlToValidate="txtReasonForChange"
                                        ErrorMessage="You need to provide a reason for this change" ToolTip="You need to provide a reason for this change"
                                        Text="*"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <div align="right">
                                        <asp:Button ID="btnSave" runat="server" CssClass="govuk-button" OnClientClick="tinyMCE.triggerSave(false,true);" />
                                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click"
                                            CausesValidation="false" CssClass="govuk-button govuk-button--secondary" />
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
 
</asp:Content>
