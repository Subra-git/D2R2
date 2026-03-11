<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master"  AutoEventWireup="false" Inherits="Profiles.Web.ProfileProperties" Title="Profile properties" CodeBehind="ProfileProperties.aspx.vb" %>
<%@ Register TagPrefix="pwc" Namespace="Profiles.WebControls.ProfilesWeb.Controls" Assembly="Profiles.WebControls" %>
<%@ Register Src="NavigationLinks.ascx" TagName="NavigationLinks" TagPrefix="nav" %>
<%@ Register Src="AffectedSpeciesSelector.ascx" TagName="AffectedSpeciesSelector" TagPrefix="afs" %>


<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" runat="Server">

    <asp:UpdatePanel ID="MainUpdatePanel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

            <script type="text/javascript" src="./Javascript/profiles.js"></script>
            <script type="text/javascript">
                var prm = Sys.WebForms.PageRequestManager.getInstance();
                prm.add_beginRequest(BeginRequestHandler);

                function BeginRequestHandler(sender, args) {
                    tinymce.remove();
                }

            </script>

            <asp:Panel ID="pnlInfo" runat="server" Style="float: left">
                Use this function to create a brand new Surveillance Profile. Provide a title for the profile and then select at 
        least one species or species-group that is affected by the disease, condition or issue being profiled.
        <br />
                <br />
                Please carefully consider the species or species-groups affected, as the selection made here will dictate what 
        information can be captured for the profile. Only select species-groups when you are confident that the disease, 
        condition or issue being profiled impacts all the species in that group in the same manner.
        <br />
                <br />
            </asp:Panel>

            <div style="width: 100%; float: left; margin-top: 10px;">
                <div align="right">
                    <asp:HyperLink ID="lnkManageProfile" runat="server" Visible="false" CssClass="govuk-link">Manage profile</asp:HyperLink>
                </div>
                <asp:Panel ID="pnlClone" Visible="false" runat="server">
                    <asp:Label ID="lblClone" runat="server" Text="The new profile will be cloned from: " Font-Bold="True"></asp:Label>
                    <br />
                </asp:Panel>

                <table style="table-layout: fixed; width: 100%">
                    <tr>
                        <td>
                            <asp:Label ID="lblTitle" runat="server">Profile title:</asp:Label>
                            <asp:RequiredFieldValidator ID="valTitleRequired" runat="server" ControlToValidate="txtTitle" ErrorMessage="You must enter a title" ToolTip="Please enter a title" ValidationGroup="Update">*</asp:RequiredFieldValidator>
                        </td>

                        <td style="width: 75%">
                            <div id="divProfileTitle" class="govuk-input" oninput="MiscTinyMceFunctions.copyToInput('<%= txtTitle.ClientID %>','<%= btnUpdate.ClientID %>')" onblur="MiscTinyMceFunctions.copyToInput('<%= txtTitle.ClientID %>','<%= btnUpdate.ClientID %>')"></div>
                            <pwc:ValidatableHiddenField runat="server" id="txtTitle" ></pwc:ValidatableHiddenField>
                        </td>
                        <td></td>
                    </tr>

                </table>
                <div>
                    <asp:ValidationSummary
                        EnableClientScript="true"
                        ID="valSummary"
                        DisplayMode="BulletList"
                        runat="server"
                        HeaderText="The following errors have occurred:"
                        CssClass="ErrorLabel" ValidationGroup="Update"/>
                </div>
                <div>
                    <asp:Label ID="lblError" runat="server" CssClass="ErrorLabel"></asp:Label>
                </div>


                <afs:AffectedSpeciesSelector ID="ctlAffectedSpeciesSelector" runat="server" />
                <asp:Button ID="btnUpdate" runat="server" Text="Save" CssClass="govuk-button mt-4"  ValidationGroup="Update"/>
                <asp:Button ID="btnReset" runat="server" Text="Reset selections" aria-label="Reset selections" OnClientClick="Page_ClientValidate(''); return true;" CssClass="govuk-button govuk-button--secondary mt-4" CausesValidation="false" OnClick="btnReset_Click"/>
            </div>

            </ContentTemplate>
                </asp:UpdatePanel>
</asp:Content>