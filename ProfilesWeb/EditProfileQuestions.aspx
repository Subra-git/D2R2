<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false"
    CodeFile="EditProfileQuestions.aspx.vb" Inherits="EditProfileQuestions" %>

<%@ Register Src="ProfileSectionLinks.ascx" TagName="SectionLinks" TagPrefix="sec" %>
<%@ Register TagPrefix="pwc" Namespace="Profiles.WebControls.ProfilesWeb.Controls" Assembly="Profiles.WebControls" %>
<asp:Content ID="navContent" ContentPlaceHolderID="cphNavigation" runat="Server">
    <sec:SectionLinks ID="ctlSectionLinks" runat="server" />
</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" runat="Server">

    <script type="text/javascript">
        var lastSelectedIndex; //Keeps a track of the last index of a relevance dropdown in case user cancels onchange action
        var refreshPanel; //Keeps track of whether the per-species or repeating question panel should update the whole page or not
        function HideAndClearIrrelevantQuestions() {
            document.getElementById('<%=btnHiddenRefresh.ClientId %>').click();
        }
    </script>

    <asp:Panel ID="pnlAddNote" runat="server" Width="500px" Style="display: none">
        <asp:UpdatePanel ID="updAddNote" runat="server">
            <ContentTemplate>
                <asp:Panel ID="pnlAddNoteHeader" runat="server" CssClass="collapsePanelHeader">
                    <asp:Label runat="server" ID="lblTitle"></asp:Label></asp:Panel>
                <div class="collapsePanel">
                    <table width="100%">
                        <tr>
                            <td>
                                <asp:ValidationSummary ID="valModalSummary" DisplayMode="BulletList" runat="server"
                                    HeaderText="The following errors have occurred:" CssClass="ErrorLabel" ValidationGroup="Modal" />
                                <p>
                                    <asp:Label ID="lblPopupError" runat="server" CssClass="ErrorLabel"></asp:Label></p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblNoteAction" runat="server" Text="Please choose an action: "></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="ddlNoteAction" runat="server" AutoPostBack="true">
                                    <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
                                    <asp:ListItem Text="Add a reference" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Select a reference" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvNoteAction" Display="Dynamic" runat="server" ControlToValidate="ddlNoteAction"
                                    ErrorMessage="Please select an action" Text=" *" ToolTip="Please select an action"
                                    ValidationGroup="Modal" Enabled="False"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblNoteType" runat="server" Text="Please choose a reference type: "
                                    Visible="false"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="ddlNoteType" runat="server" DataSourceID="dsNoteTypeInfoList"
                                    DataTextField="Name" DataValueField="Id" AppendDataBoundItems="true" AutoPostBack="true"
                                    Visible="false">
                                    <asp:ListItem Text="Please select..." Value="" />
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvNoteType" Display="Dynamic" runat="server" ControlToValidate="ddlNoteType"
                                    ErrorMessage="Please select a reference type" Text=" *" ToolTip="Please select a reference type"
                                    ValidationGroup="Modal" Enabled="False"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>                                
                                <asp:TextBox runat="server" ID="txtNote" TextMode="MultiLine" Rows="6" Width="95%"
                                    Visible="false" BackColor="White" BorderColor="Black" BorderWidth="1px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvNoteText" Display="Dynamic" runat="server" ControlToValidate="txtNote"
                                    ErrorMessage="Please enter the reference text" Text=" *" ToolTip="Please enter the reference text"
                                    ValidationGroup="Modal" Enabled="False" Visible="true"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblNote" runat="server" Text="Select a reference: " Visible="false"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="ddlNotes" runat="server" DataSourceID="dsAvailableNoteList"
                                    DataTextField="NoteTextSlim" DataValueField="Id" AppendDataBoundItems="true"
                                    AutoPostBack="true" Visible="false">
                                    <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
                                </asp:DropDownList>
                                <br /><br />
                                <asp:TextBox runat="server" ID="txtCurrentNote" TextMode="MultiLine" Rows="6" Width="95%"
                                    Enabled="false" BackColor="White" BorderColor="Black" BorderWidth="1px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvNote" Display="Dynamic" runat="server" ControlToValidate="ddlNotes"
                                    ErrorMessage="Please select a reference" Text=" *" ToolTip="Please select a reference"
                                    ValidationGroup="Modal" Enabled="False"></asp:RequiredFieldValidator>
                                <csla:CslaDataSource ID="dsAvailableNoteList" runat="server" TypeAssemblyName="ProfilesLibrary"
                                    TypeName="ProfilesLibrary.NoteList">
                                </csla:CslaDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <pwc:PopupOptionPicker ID="popupQuestionReferencePicker" runat="server" ResultLabelText="Apply this reference also to: " />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                                <div align="right">
                                    <asp:Button ID="btnSaveNote" runat="server" Text="Save" UseSubmitBehavior="False"
                                        CausesValidation="true" ValidationGroup="Modal" />
                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" UseSubmitBehavior="False"
                                        CausesValidation="false" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <csla:CslaDataSource ID="dsNoteTypeInfoList" runat="server" TypeAssemblyName="ProfilesLibrary"
                    TypeName="ProfilesLibrary.NoteTypeInfoList">
                </csla:CslaDataSource>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    <act:ModalPopupExtender ID="mpeAddNote" runat="server" TargetControlID="pnlAddNote"
        PopupControlID="pnlAddNote" BackgroundCssClass="modalBackgroundClear" />
    <div class="ErrorLabel" style="clear: both;">
        &nbsp;</div>
    <table style="width: 100%">
        <tr>
            <td>
                <pwc:InvalidReasonList ID="ctlInvalidReasonList" runat="server" />
                &nbsp;
            </td>
            <td style="width: 260px">
                <div align="right">
                    <asp:HiddenField ID="hidProfileVersionId" runat="server" />
                    <asp:HiddenField ID="hidProfileSectionId" runat="server" />
                    <asp:Button ID="btnHiddenRefresh" runat="server" Text="Save" Style="display: none;" />
                    <asp:Button ID="btnSave" runat="server" Text="Save" />
                    <asp:Button ID="btnValidateSection" runat="server" Text="Validate" />
                    <asp:Button ID="btnClearSection" runat="server" Text="Clear" />
                    <act:ConfirmButtonExtender runat="server" ID="cbeClearSection" TargetControlID="btnClearSection"
                        ConfirmText="Are you sure you want to clear all the data from this section?" />
                    <asp:Button ID="btnPrintSection" runat="server" Text="Print" />
                </div>
            </td>
        </tr>
    </table>
    &nbsp;
    <pwc:TabStrip ID="tabStrip" runat="server">
        <pwc:TabItem IsActive="true" Text="SectionName" />
        <pwc:TabItem IsActive="false" Text="References" />
        <pwc:TabItem IsActive="false" Text="Further information" />
        <pwc:TabItem IsActive="false" Text="Review comments" />
        <pwc:TabItem IsActive="false" Text="Contributions" />
        <pwc:TabItem IsActive="false" Text="Revision dates" />
        <pwc:TabItem IsActive="false" Text="All Revision dates" />
    </pwc:TabStrip>
    <div class="TabBody">
        <asp:UpdatePanel runat="server" ID="updError" RenderMode="Inline" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Label ID="lblErrorDesc" runat="server" EnableViewState="false" CssClass="ErrorLabel"></asp:Label>
            </ContentTemplate>
        </asp:UpdatePanel>
        <p>
            <asp:ImageButton ID="imgExpandAll" runat="server" AlternateText="Expand all" ImageUrl="~/Images/ExpandPanel.gif" />
            <asp:LinkButton ID="lnkExpandAll" runat="server" Style="font-size: 80%;">Expand all</asp:LinkButton>
            |
            <asp:ImageButton ID="imgCollapseAll" runat="server" AlternateText="Collapse all"
                ImageUrl="~/Images/CollapsePanel.gif" />
            <asp:LinkButton ID="lnkCollapseAll" runat="server" Style="font-size: 80%;">Collapse all</asp:LinkButton></p>
        <asp:PlaceHolder ID="plhQuestion" runat="server" Visible="false"></asp:PlaceHolder>
    </div>
    <table style="width: 100%">
        <tr>
            <td>
                &nbsp;
            </td>
            <td style="width: 170px">
                <div align="right">
                    <asp:Button ID="btnSave2" runat="server" Text="Save" />
                    <asp:Button ID="btnValidateSection2" runat="server" Text="Validate" />
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
