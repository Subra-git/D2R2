<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false" Inherits="Profiles.Web.EditUserGuidance" Title="Edit questions and guidance" Codebehind="EditUserGuidance.aspx.vb" %>

<%@ Register Src="NavigationLinks.ascx" TagName="NavigationLinks" TagPrefix="nav" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" runat="Server">
    <div>
       <p>
            Use the buttons below to generate the user guidance reports.<br />
            <asp:Button runat="server" Text="Full profile guidance report" ID="btnUserGuidanceReport"  CssClass="govuk-button govuk-button--secondary"/>
            <asp:Button runat="server" Text="Summary profile guidance report" ID="btnSummaryProfileGuidanceReport"  CssClass="govuk-button govuk-button--secondary"/>
            <asp:Button runat="server" Text="SPR guidance report" ID="btnSummaryPrioritisationGuidanceReport"  CssClass="govuk-button govuk-button--secondary"/>
            <asp:Button runat="server" Text="Q&A sheet guidance report" ID="btnQAGuidanceReport" CssClass="govuk-button govuk-button--secondary" />
        </p>
    </div>
    <br />
    <div>
        Use this function to modify the user-guidance text that appears for each of the
        questions within the profile and/or to modify the question itself. N.B. Rich formatting,
        such as bold, underline or italics cannot be used.
        <br />
        <br />
    </div>
    <asp:UpdatePanel runat="server" ID="pnlGuidance" ChildrenAsTriggers="true">
        <ContentTemplate>
            <div style="width: 100%; float: left; background-color: white;" onload="load();">
                <table>
                    <tr>
                        <td>
                            Select a profile section:
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlProfileSection"
                                runat="server" 
                                AutoPostBack="true" 
                                DataSourceID="dsProfileSectionInfoList"
                                DataTextField="FormattedNumberredShortName"
                                DataValueField="Id" 
                                AppendDataBoundItems="true"
                                CssClass="govuk-select">
                                <asp:ListItem Text="Please select..." Value="none" />
                            </asp:DropDownList>
                            <csla:CslaDataSource ID="dsProfileSectionInfoList" runat="server" TypeAssemblyName="ProfilesLibrary"
                                TypeName="ProfilesLibrary.ProfileSectionMetadataList">
                            </csla:CslaDataSource>
                        </td>
                    </tr>
                </table>
                <p>
                    <asp:Label ID="lblErrorUserGuidance" runat="server" CssClass="ErrorLabel" EnableViewState="false"></asp:Label></p>
                <asp:GridView ID="grdQuestionList" runat="server" Width="100%" DataSourceID="dsProfileQuestionInfoList"
                    AllowPaging="False" AllowSorting="False" AutoGenerateColumns="False" CssClass="gridview"
                    GridLines="None">
                    <Columns>
                        <asp:BoundField DataField="QuestionNumber" HeaderText="Number"/>
                        <asp:BoundField DataField="Name" HeaderText="Question" HtmlEncode="false" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkName" CommandArgument='<%# Eval("Id") %>' CommandName="EditQuestion"
                                    runat="server" Text='Edit'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle CssClass="gridviewHeader" />
                    <RowStyle CssClass="gridviewRow" />
                    <AlternatingRowStyle CssClass="gridviewAltRow" />
                </asp:GridView>
                <asp:Panel ID="pnlUserGuidance" runat="server" Visible="false">
                    <asp:ValidationSummary ID="valUserGuidanceSummary" DisplayMode="BulletList" runat="server"
                    HeaderText="The following errors have occurred:" CssClass="ErrorLabel" ValidationGroup="valUserGuidanceSummary" />
                    <div class="collapsePanelHeader">
                        <asp:Label ID="lblQuestionName" runat="server"></asp:Label></div>
                    <div class="collapsePanel">
                        <p>
                            <asp:Label ID="lblEditName" runat="server" Text="Title:" /><br />
                            <asp:TextBox ID="txtEditName" runat="server" Width="100%" TextMode="MultiLine" Rows="3" />
                            <asp:RequiredFieldValidator ID="valEditNameReq" ControlToValidate="txtEditName" runat="server"
                                ErrorMessage="You must enter question text" ToolTip="Please enter question text or press cancel" ValidationGroup="valUserGuidanceSummary">*</asp:RequiredFieldValidator>
                        </p>
                        <p>
                            <asp:Label ID="lblEditNonTechnicalName" runat="server" Text="Non-technical title:" /><br />
                            <asp:TextBox ID="txtEditNonTechnicalName" runat="server" Width="95%" TextMode="MultiLine"
                                Rows="3" />
                            <asp:RequiredFieldValidator ID="valEditNonTechnicalNameReq" ControlToValidate="txtEditNonTechnicalName"
                                runat="server" ErrorMessage="You must enter non-techincal question text" ToolTip="Please enter non-technical question text or press cancel" ValidationGroup="valUserGuidanceSummary">*</asp:RequiredFieldValidator>
                        </p>
                        <p>
                            <asp:Label ID="lblEditGuidance" runat="server" Text="User guidance:" /><br />
                            <asp:TextBox runat="server" ID="txtUserGuidance" TextMode="MultiLine" Rows="24" Width="95%"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="valUserGuidance" runat="server" ControlToValidate="txtUserGuidance"
                                Height="26px" ErrorMessage="You must enter user guidance text or cancel" ToolTip="Please enter user guidance text or press cancel" ValidationGroup="valUserGuidanceSummary">*</asp:RequiredFieldValidator>
                        </p>
                        <p>
                            <button id="spellCheckButton" class="govuk-button" onclick="$('#' + '<%= spellUserGuidance.ClientID %>' + ' a')[0].click(); return false;">Spell check user guidance</button>
                        </p>
                        <p align="right">
                            <asp:Button ID="btnOK" runat="server" Text="OK" CssClass="govuk-button" OnClientClick="tinyMCE.triggerSave();" ValidationGroup="valUserGuidanceSummary" CausesValidation="true" />
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CausesValidation="False" CssClass="govuk-button govuk-button--secondary" />
                        </p>
                    </div>
                </asp:Panel>
                <br />
                <csla:CslaDataSource ID="dsProfileQuestionInfoList" runat="server" TypeAssemblyName="ProfilesLibrary"
                    TypeName="ProfilesLibrary.ProfileQuestionInfoList">
                </csla:CslaDataSource>
            </div>
            <asp:Label id="lblStatement" runat="server" CssClass="govuk-label" Text="The content in a number of questions constitutes static information, or is no 
                longer deemed critical, and, to minimise the resource requirements of D2R2, is not scheduled to be updated. Please see the D2R2 quality statement 
                for a list of these questions."/>

        </ContentTemplate>
    </asp:UpdatePanel>
    <br />

    <div class="d-none">
        <pwc:SpellCheck runat="server" ID="spellUserGuidance" IsClientID="true" />
    </div>
</asp:Content>
