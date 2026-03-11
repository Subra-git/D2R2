<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false" CodeFile="EditProfileFurtherInformation.aspx.vb" Inherits="EditProfileFurtherInformation" title="View/edit profile" %>
<%@ Register Src="ProfileSectionLinks.ascx" TagName="SectionLinks" TagPrefix="sec" %>
<%@ Register Src="EditNoteUI.ascx" TagName="EditNoteUI" TagPrefix="note" %>

<asp:Content ID="navContent" ContentPlaceHolderID="cphNavigation" Runat="Server">
    <sec:SectionLinks ID="ctlSectionLinks" runat="server" />
</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" Runat="Server">

    <div style="height: 50px"> &nbsp;</div>
    
    <pwc:TabStrip ID="tabStrip" runat="server" >
			<pwc:TabItem IsActive="false" Text="SectionName" />
			<pwc:TabItem IsActive="false" Text="References" />
			<pwc:TabItem IsActive="true" Text="Further information" />
			<pwc:TabItem IsActive="false" Text="Review comments" />
			<pwc:TabItem IsActive="false" Text="Contributions" />
			<pwc:TabItem IsActive="false" Text="Revision dates" />
			<pwc:TabItem IsActive="false" Text="All Revision dates" />
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
</asp:Content>
