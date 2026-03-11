<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false" Inherits="Profiles.Web.ManageProfile" Title="Manage profile" Codebehind="ManageProfile.aspx.vb" %>

<%@ Register TagPrefix="pwc" Namespace="Profiles.WebControls.ProfilesWeb.Controls" Assembly="Profiles.WebControls" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <div style="width: 100%; float: left">
        <table>
            <tr>
                <td style="width: 25%">
                    Profile title:
                </td>
                <td>
                    <asp:Label ID="lblProfileTitle" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 25%">
                    Scenario title:
                </td>
                <td>
                    <asp:Label ID="lblScenarioTitle" runat="server"/>
                </td>
            </tr>
            <tr>
                <td>
                    Latest published version (public):
                </td>
                <td>
                    <asp:Label ID="lblProfilePublicVersion" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Latest published version (Defranet only):
                </td>
                <td>
                    <asp:Label ID="lblProfilePublishedVersion" runat="server"></asp:Label>
                    <asp:LinkButton 
                        ID="lnkAllowPublicAccess" 
                        Text="Allow public access"
                        runat="server" 
                        CssClass="govuk-link"
                        OnClientClick="apha.confirmPrompt('Are you sure you want to make this profile version public (this cannot be undone)?', this); return false"/>
                </td>
            </tr>
            <tr>
                <td>
                    Latest draft version:
                </td>
                <td>
                    <asp:Label ID="lblProfileDraftVersion" runat="server"></asp:Label>
                </td>                       
            </tr>
            <tr>
                <td>
                    Profile status: 
                </td>
                <td>
                  <asp:DropDownList runat="server" ID="ddlProfileStatus" DataSourceID="dsProfileStatusTypes" 
                  DataTextField="Name" DataValueField="Id" AutoPostBack="true" AppendDataBoundItems="true" CssClass="govuk-select">
                    <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
                  </asp:DropDownList>                                        
                </td>            
            </tr>
            <tr>
                <td colspan="2" style="text-align: left">
                    <div>
                        <asp:HyperLink ID="lnkProfileProperties" runat="server" NavigateUrl="~/ProfileProperties.aspx" CssClass="govuk-link">Edit properties</asp:HyperLink>
                    </div>
                    <div>
                        <asp:HyperLink ID="lnkMaintainContributors" runat="server" NavigateUrl="~/MaintainContributors.aspx" CssClass="govuk-link">Maintain contributors and reviewers</asp:HyperLink>
                    </div>
                    <div>
                        <asp:HyperLink ID="lnkViewContributorsReport" runat="server" Target="_Blank" CssClass="govuk-link">View contributions report</asp:HyperLink>
                    </div>
                    <div>
                        <asp:LinkButton ID="lnkNewDraftVersion" 
                            runat="server" CssClass="govuk-link" OnClientClick="apha.confirmPrompt('Are you sure you want to create a new draft version?', this); return false">Create new draft version</asp:LinkButton>
                     
                    </div>
                    <div>
                        <asp:LinkButton ID="lnkDelete" runat="server" CssClass="govuk-link" OnClientClick="apha.confirmPrompt('Are you sure you want to delete this profile version?', this); return false;">Delete current version</asp:LinkButton>
                    </div>
                    <div>
                        <asp:HyperLink ID="lnkClone" runat="server" NavigateUrl="~/ProfileProperties.aspx" CssClass="govuk-link">Clone new profile</asp:HyperLink>
                    </div>
                    <div>
                        <asp:HyperLink ID="lnkCloneScenario" runat="server" NavigateUrl="~/ProfileProperties.aspx" CssClass="govuk-link">Clone new scenario</asp:HyperLink>
                    </div>
                    <div>
                        <asp:LinkButton 
                            ID="lnkPublishPublic" 
                            runat="server" 
                            CssClass="govuk-link" 
                            OnClientClick="apha.confirmPrompt('Are you sure you want to publish this profile and make it public (this cannot be undone)?', this); return false;">Publish (public)</asp:LinkButton>
                    </div>
                    <div>
                        <asp:LinkButton
                            ID="lnkPublish"
                            runat="server"
                            CssClass="govuk-link"
                            OnClientClick="apha.confirmPrompt('Are you sure you want to publish this profile but not make it public?', this); return false;">
                            Publish (Defranet only)
                        </asp:LinkButton>
                    </div>                  
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: left">
                    <pwc:InvalidReasonList ID="ctlInvalidReasonList" runat="server" />
                </td>
            </tr>
        </table>
        
         <csla:CslaDataSource ID="dsProfileStatusTypes" runat="server" TypeAssemblyName="ProfilesLibrary" TypeName="ProfilesLibrary.ProfileStatusTypeInfoList">
         </csla:CslaDataSource>
        
        <asp:Label ID="lblError" runat="server" CssClass="govuk-error-message"></asp:Label>
    </div>
</asp:Content>
