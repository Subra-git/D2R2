<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false"
    CodeFile="ManageProfile.aspx.vb" Inherits="ManageProfile" Title="Manage profile" %>

<%@ Register Src="NavigationLinks.ascx" TagName="NavigationLinks" TagPrefix="uc1" %>
<%@ Register TagPrefix="pwc" Namespace="Profiles.WebControls.ProfilesWeb.Controls" Assembly="Profiles.WebControls" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphNavigation" runat="Server">
    <uc1:NavigationLinks ID="NavigationLinks1" runat="server" />
</asp:Content>
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
                    <asp:Label ID="lblScenarioTitle" runat="server" />
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
                    <asp:LinkButton ID="lnkAllowPublicAccess" Text="Allow public access" runat="server" />
                    <act:ConfirmButtonExtender ID="cbeAllowPublicAccess" runat="server" TargetControlID="lnkAllowPublicAccess"
                                ConfirmText="Are you sure you want to make this profile version public (this cannot be undone)?" />
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
                  DataTextField="Name" DataValueField="Id" AutoPostBack="true" AppendDataBoundItems="true">
                    <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
                  </asp:DropDownList>                                        
                </td>            
            </tr>
            <tr>
                <td colspan="2" style="text-align: left">
                    <div>
                        <asp:HyperLink ID="lnkProfileProperties" runat="server" NavigateUrl="~/ProfileProperties.aspx">Edit properties</asp:HyperLink>
                    </div>
                    <div>
                        <asp:HyperLink ID="lnkMaintainContributors" runat="server" NavigateUrl="~/MaintainContributors.aspx">Maintain contributors and reviewers</asp:HyperLink>
                    </div>
                    <div>
                        <asp:HyperLink ID="lnkViewContributorsReport" runat="server" Target="_Blank">View contributions report</asp:HyperLink>
                    </div>
                    <div>
                        <asp:LinkButton ID="lnkNewDraftVersion" runat="server">Create new draft version</asp:LinkButton>
                        <act:ConfirmButtonExtender ID="cbeNewDraft" runat="server" TargetControlID="lnkNewDraftVersion"
                            ConfirmText="Are you sure you wish to create a new draft version?">
                        </act:ConfirmButtonExtender>
                    </div>
                    <div>
                        <asp:LinkButton ID="lnkDelete" runat="server">Delete current version</asp:LinkButton>
                        <act:ConfirmButtonExtender runat="server" ID="cbeDelete" TargetControlID="lnkDelete"
                            ConfirmText="Are you sure you wish to delete this profile version?">
                        </act:ConfirmButtonExtender>
                    </div>
                    <div>
                        <asp:HyperLink ID="lnkClone" runat="server" NavigateUrl="~/ProfileProperties.aspx">Clone new profile</asp:HyperLink>
                    </div>
                    <div>
                        <asp:HyperLink ID="lnkCloneScenario" runat="server" NavigateUrl="~/ProfileProperties.aspx">Clone new scenario</asp:HyperLink>
                    </div>
                    <div>
                        <asp:LinkButton ID="lnkPublishPublic" runat="server">Publish (public)</asp:LinkButton>
                        <act:ConfirmButtonExtender ID="cbePublishPublic" runat="server" TargetControlID="lnkPublishPublic"
                            ConfirmText="Are you sure you wish to publish this profile and make it public (this cannot be undone)?">
                        </act:ConfirmButtonExtender>
                    </div>
                    <div>
                        <asp:LinkButton ID="lnkPublish" runat="server">Publish (Defranet only)</asp:LinkButton>
                        <act:ConfirmButtonExtender ID="cbePublish" runat="server" TargetControlID="lnkPublish"
                            ConfirmText="Are you sure you wish to publish this profile but not make it public?">
                        </act:ConfirmButtonExtender>
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
        
        <asp:Label ID="lblError" runat="server" CssClass="ErrorLabel"></asp:Label>
    </div>
</asp:Content>
