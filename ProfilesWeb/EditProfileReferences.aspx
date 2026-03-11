<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false"
    CodeFile="EditProfileReferences.aspx.vb" Inherits="EditProfileReferences" Title="View/edit profile" %>

<%@ Register Src="ProfileSectionLinks.ascx" TagName="SectionLinks" TagPrefix="sec" %>
<%@ Register Src="EditNoteUI.ascx" TagName="EditNoteUI" TagPrefix="note" %>
<asp:Content ID="navContent" ContentPlaceHolderID="cphNavigation" runat="Server">
    <sec:SectionLinks ID="ctlSectionLinks" runat="server" />
</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" runat="Server">
    <div style="height: 50px">
        &nbsp;</div>
    <pwc:TabStrip ID="tabStrip" runat="server">
        <pwc:TabItem IsActive="false" Text="SectionName" />
        <pwc:TabItem IsActive="true" Text="References" />
        <pwc:TabItem IsActive="false" Text="Further information" />
        <pwc:TabItem IsActive="false" Text="Review comments" />
        <pwc:TabItem IsActive="false" Text="Contributions" />
        <pwc:TabItem IsActive="false" Text="Revision dates" />        
        <pwc:TabItem IsActive="false" Text="All Revision dates" />
    </pwc:TabStrip>
    <div class="TabBody">
        <asp:UpdatePanel runat="server" ID="panReferences" >
            <ContentTemplate>
                <br />
                <asp:ValidationSummary ID="valNoteSummary" DisplayMode="BulletList" runat="server"
                    HeaderText="The following errors have occurred:" CssClass="ErrorLabel" />
                <p>
                    <asp:Label ID="lblNoteError" runat="server" CssClass="ErrorLabel" EnableViewState="false"></asp:Label></p>
                <!-- scientific paper references -->
                
                <note:EditNoteUI ID="ctlEditNoteUISciRef" runat="server" NoteType="ScientificPaperReference" />
                <!-- legislative references -->
                               
                <note:EditNoteUI ID="ctlEditNoteUILegRef" runat="server" NoteType="LegislativeReference" />
            </ContentTemplate>
            </asp:UpdatePanel>
    </div>
</asp:Content>
