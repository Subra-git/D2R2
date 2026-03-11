<%@ Page Language="VB" MasterPageFile="~/NestedProfileQuestions.master" AutoEventWireup="false" Inherits="Profiles.Web.EditProfileFurtherInformation" title="View/edit profile" Codebehind="EditProfileFurtherInformation.aspx.vb" %>
<%@ Register Src="ProfileSectionLinks.ascx" TagName="SectionLinks" TagPrefix="sec" %>
<%@ Register Src="EditNoteUI.ascx" TagName="EditNoteUI" TagPrefix="note" %>
<%@ Register Src="~/SectionPagination.ascx" TagPrefix="pag" TagName="SectionPagination" %>

<asp:Content ID="NestedProfileContent" ContentPlaceHolderID="NestedProfileContent" Runat="Server">

    <div style="height: 50px"> &nbsp;</div>
    
    <pwc:TabStrip ID="tabStrip" runat="server" >
			<pwc:TabItem IsActive="false" Text="SectionName" />
			<pwc:TabItem IsActive="false" Text="References" />
			<pwc:TabItem IsActive="true" Text="Further information" />
			<pwc:TabItem IsActive="false" Text="Review comments" />
			<pwc:TabItem IsActive="false" Text="All Revision dates" />
			<pwc:TabItem IsActive="false" Text="Contributions" />
    </pwc:TabStrip>
    
    <div class="TabBody">
        <asp:UpdatePanel runat="server" ID="panFurtherInfo"  >
            <ContentTemplate>            
                <!-- sources of further information -->              
                   <asp:ValidationSummary id="valNoteErrorSummary" DisplayMode="BulletList" runat="server" HeaderText="The following errors have occurred:" CssClass="ErrorLabel"/> 
                    <p><asp:Label ID="lblNoteError" runat="server" cssClass="ErrorLabel" EnableViewState="false"></asp:Label></p>
              
              <note:EditNoteUI ID="ctlEditNoteUI" runat="server" NoteType="SourceOfFurtherInformation" />                            
            </ContentTemplate>
        </asp:UpdatePanel>
     </div>         
    <div class="SectionPaginationAdjuster">
        <pag:SectionPagination runat="server" ID="SectionPagination" />
    </div>
</asp:Content>
