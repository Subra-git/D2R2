<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false"
    CodeFile="MaintainReferenceData.aspx.vb" Inherits="MaintainReferenceData" Title="Maintain reference data" %>

<%@ Register Src="NavigationLinks.ascx" TagName="NavigationLinks" TagPrefix="nav" %>
<asp:Content ID="navContent" ContentPlaceHolderID="cphNavigation" runat="Server">
    <nav:NavigationLinks ID="ctlNavigationLinks" runat="server" />
</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" runat="Server">
    <div style="float: left; width:100%">
        Use this function to maintain specific reference data that is utilised by the application.
        <br />
        <br />
    </div>
    <div style="width: 100%; float: left; margin-top: 10px;">
        <asp:UpdatePanel runat="server" ID="pnlUpdate">
            <ContentTemplate>
                Choose a reference table:
                <asp:DropDownList ID="ddlReferenceTable" runat="server" AutoPostBack="True" DataSourceID="dsReferenceTableInfoList"
                    DataTextField="Value" DataValueField="Key" AppendDataBoundItems="true" CausesValidation="false">
                    <asp:ListItem Text="Please select..." Selected="True" Enabled="true" Value=""></asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                <pwc:GridView ID="grdReferenceValueList" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    DataSourceID="dsReferenceValueInfoList" Width="100%" AllowSorting="True" GridLines="None"
                    CssClass="gridview">
                    <Columns>
                        <asp:TemplateField HeaderText="Value" SortExpression="Value">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lnkValue" CommandArgument='<% # Eval("Id") %>'
                                    CommandName="EditReferenceData" Text='<% # Eval("Value").ToString() & IIf(CBool(Eval("IsActive")), String.Empty, " (Inactive)").ToString() %>'
                                    Enabled='<% # (IIf(CBool(Eval("IsActive")), "True", "False")) %>' CausesValidation="false"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="EffectiveDates" HeaderText="Effective dates" SortExpression="EffectiveDateFrom" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton CommandName='<% # IIf(CBool(Eval("IsActive")), IIf(CBool(Eval("IsInUse")), "InactivateReferenceData", "DeleteReferenceData").ToString(), String.Empty) %>'
                                    runat="server" ID="lnkDelete" CommandArgument='<% # Eval("Id") %>' Text='<% # IIf(CBool(Eval("IsActive")), IIf(CBool(Eval("IsInUse")), "Inactivate", "Delete").ToString(), "") %>'
                                    CausesValidation="false"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle CssClass="gridviewHeader" />
                    <RowStyle CssClass="gridviewRow" />
                    <AlternatingRowStyle CssClass="gridviewAltRow" />
                </pwc:GridView>
                <csla:CslaDataSource ID="dsReferenceValueInfoList" runat="server" TypeAssemblyName="ProfilesLibrary"
                    TypeName="ProfilesLibrary.ReferenceValueInfoList">
                </csla:CslaDataSource>
                <csla:CslaDataSource ID="dsReferenceTableInfoList" runat="server" TypeAssemblyName="ProfilesLibrary"
                    TypeName="ProfilesLibrary.ReferenceTableInfoList">
                </csla:CslaDataSource>
                <div>
                    &nbsp;</div>
                <br />
                <asp:Button ID="btnAddReferenceValue" runat="server" Text="Add reference value" Visible="false"
                    OnClick="btnAddReferenceValue_Click" CausesValidation="false" />
                <asp:Button ID="btnViewAuditTrail" runat="server" Text="View audit trail" Visible="false"
                    CausesValidation="false" />
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
                                    Old value:
                                </td>
                                <td style="width: 80%">
                                    <asp:TextBox ID="txtOldValue" runat="server" Width="90%" Enabled="false"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    New value:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtNewValue" runat="server" Width="90%" MaxLength="255"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="valNewValueRequired" runat="server" ControlToValidate="txtNewValue"
                                        ErrorMessage="You need to provide a new value" ToolTip="You need to provide a new value"
                                        Text="*"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Reason for change:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtReasonForChange" runat="server" Width="90%" TextMode="MultiLine"
                                        Rows="6" MaxLength="255"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="valReasonRequired" runat="server" ControlToValidate="txtReasonForChange"
                                        ErrorMessage="You need to provide a reason for this change" ToolTip="You need to provide a reason for this change"
                                        Text="*"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <div align="right">
                                        <asp:Button ID="btnSave" runat="server" />
                                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click"
                                            CausesValidation="false" />
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
