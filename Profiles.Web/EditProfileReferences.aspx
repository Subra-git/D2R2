<%@ Page Language="VB" MasterPageFile="~/NestedProfileQuestions.master" AutoEventWireup="false" Inherits="Profiles.Web.EditProfileReferences" Title="View/edit profile" CodeBehind="EditProfileReferences.aspx.vb" %>

<%@ Register Src="ProfileSectionLinks.ascx" TagName="SectionLinks" TagPrefix="sec" %>
<%@ Register Src="EditNoteUI.ascx" TagName="EditNoteUI" TagPrefix="note" %>
<%@ Register TagPrefix="pwc" Namespace="Profiles.WebControls" Assembly="Profiles.WebControls" %>
<%@ Register Src="~/SectionPagination.ascx" TagPrefix="pag" TagName="SectionPagination" %>

<asp:Content ID="NestedProfileContent" ContentPlaceHolderID="NestedProfileContent" runat="Server">
    <script type="text/javascript" src="Javascript/tab-manager.js"></script>
        
    <br />
    <br />
    <div class="TabControl">
        <pwc:TabStrip ID="tabStrip" runat="server">
            <pwc:TabItem IsActive="false" Text="SectionName" />
            <pwc:TabItem IsActive="true" Text="References" />
            <pwc:TabItem IsActive="false" Text="Further information" />
            <pwc:TabItem IsActive="false" Text="Review comments" />
            <pwc:TabItem IsActive="false" Text="All Revision dates" />
            <pwc:TabItem IsActive="false" Text="Contributions" />
        </pwc:TabStrip>
    </div>

    <div class="TabBody">
        <asp:UpdatePanel runat="server" ID="panReferences">
            <ContentTemplate>


                <asp:ValidationSummary ID="valNoteSummary" DisplayMode="BulletList" runat="server"
                    HeaderText="The following errors have occurred:" CssClass="ErrorLabel" />
                <p>
                    <asp:Label ID="lblNoteError" runat="server" CssClass="ErrorLabel" EnableViewState="false"></asp:Label>
                </p>
                <!-- scientific paper references -->

                <note:EditNoteUI ID="ctlEditNoteUISciRef" runat="server" NoteType="ScientificPaperReference" />
                <!-- legislative references -->

                <note:EditNoteUI ID="ctlEditNoteUILegRef" runat="server" NoteType="LegislativeReference" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div class="SectionPaginationAdjuster">
        <pag:SectionPagination runat="server" ID="SectionPagination" />
    </div>
</asp:Content>
