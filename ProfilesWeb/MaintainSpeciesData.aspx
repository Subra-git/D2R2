<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false"
    CodeFile="MaintainSpeciesData.aspx.vb" Inherits="MaintainSpeciesData" Title="Maintain species data" %>

<%@ Register Src="NavigationLinks.ascx" TagName="NavigationLinks" TagPrefix="nav" %>
<%@ Register Assembly="RadTreeView.Net2" Namespace="Telerik.WebControls" TagPrefix="radT" %>
<asp:Content ID="navContent" ContentPlaceHolderID="cphNavigation" runat="Server">
    <nav:NavigationLinks ID="ctlNavigationLinks" runat="server" />
</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" runat="Server">
    <div style="float: left; width:100%;">
        Use this function to maintain the hierarchical species list that is utilised by
        the application.
        <br />
        <br />
    </div>
    <div style="width: 100%; float: left; margin-top: 10px;">
        <table width="100%">
            <tr>
                <td style="width: 65%;">
                    <div style="border-width: 1px; border-style: solid">
                        <radT:RadTreeView ID="tvwSpecies" runat="server" CheckBoxes="False" TabIndex="1"
                            AccessKey="S" DataFieldID="Id" DataFieldParentID="ParentId" Height="200px">
                        </radT:RadTreeView>
                    </div>
                </td>
                <td style="width: 15%; text-align: left; vertical-align: middle; padding-left: 10px;"
                    align="center">
                    <asp:ImageButton runat="server" ID="btnMoveSpeciesUp" ImageUrl="~/Images/UpArrow.gif"
                        ToolTip="Move the selected species up" /><br />
                    <asp:ImageButton runat="server" ID="btnMoveSpeciesDown" ImageUrl="~/Images/DownArrow.gif"
                        ToolTip="Move the selected species down" />
                </td>
                <td style="width: 20%; text-align: center;" align="center">
                    <asp:Button ID="btnViewAuditTrail" runat="server" Text="View audit trail" CausesValidation="false"
                        PostBackUrl="SpeciesDataAuditTrail.aspx" Width="150" />
                    <br />
                    <br />
                    <asp:Button ID="btnAdd" runat="server" Text="Add" CausesValidation="false" Width="150" /><br />
                    <br />
                    <asp:Button ID="btnEditNameParent" runat="server" Text="Edit name/parent" CausesValidation="false" Width="150" /><br />
                    <br />
                    <asp:Button ID="btnEditData" runat="server" Text="Edit data" CausesValidation="false" Width="150" /><br />
                    <br />
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" CausesValidation="false"
                        Width="150" /><br />
                    <br />
                    <asp:Button ID="btnInactivate" runat="server" Text="Inactivate" CausesValidation="false"
                        Width="150" /><br />
                    <br />
                </td>
            </tr>
        </table>
        <br />
        <asp:Label ID="lblSelectNode" runat="server" CssClass="ErrorLabel"></asp:Label><br />
        <asp:ValidationSummary ID="valSumChangeValue" DisplayMode="BulletList" runat="server"
            HeaderText="The following errors have occurred:" CssClass="ErrorLabel" />
        <asp:Label ID="lblErrorMsg" CssClass="ErrorLabel" runat="server" EnableViewState="false"></asp:Label>
        <asp:Panel ID="pnlAmendSpeciesData" runat="server" Visible="False" Style="width: 98%">
            <div class="collapsePanelHeader">
                <asp:Label ID="lblPanelTitle" runat="server"></asp:Label></div>
            <div class="collapsePanel">
                <table width="100%">
                    <tr>
                        <td style="width: 15%">
                            Old name:
                        </td>
                        <td style="width: 35%">
                            <asp:TextBox ID="txtOldName" runat="server" Style="width: 95%" Enabled="false" />
                        </td>
                        <td style="width: 15%">
                            New name:
                        </td>
                        <td style="width: 35%">
                            <asp:TextBox ID="txtNewName" runat="server" Style="width: 95%" MaxLength="50" />
                            <asp:RequiredFieldValidator ID="valNewNameRequired" runat="server" ControlToValidate="txtNewName"
                                ErrorMessage="You need to provide a new name for this species" ToolTip="You need to provide a new name for this species">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="valNewNameMax" runat="server" ControlToValidate="txtNewName"
                                ValidationExpression="^(.|\50){0,50}$" ErrorMessage="The new species name must be no longer than 50 characters"
                                ToolTip="The new species name must be no longer than 50 characters">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 15%">
                            Old parent:
                        </td>
                        <td style="width: 35%">
                            <asp:TextBox ID="txtOldParent" runat="server" Style="width: 95%" Enabled="false" />
                        </td>
                        <td style="width: 15%">
                            New parent:
                        </td>
                        <td style="width: 35%">
                            <asp:DropDownList ID="ddlNewParent" runat="server" AppendDataBoundItems="true" DataTextField="Value"
                                DataValueField="Key" AutoPostBack="True" Style="width: 97%">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="valNewParent" runat="server" ErrorMessage="You must select a new parent for the species"
                                ToolTip="You must select a new parent for the species" ControlToValidate="ddlNewParent">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%">
                            Reason for change:
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="txtReasonForChange" runat="server" TextMode="MultiLine" Width="98%"
                                Rows="6" MaxLength="255"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="valReasonRequired" runat="server" ControlToValidate="txtReasonForChange"
                                ErrorMessage="You need to provide a reason for this change" ToolTip="You need to provide a reason for this change"
                                Text="*"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="valMaxLength" runat="server" ControlToValidate="txtReasonForChange"
                                ValidationExpression="^(.|\255){0,255}$" ErrorMessage="The reason for change must be no longer than 255 characters"
                                ToolTip="The reason for change must be no longer than 255 characters">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
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
    </div>
</asp:Content>
