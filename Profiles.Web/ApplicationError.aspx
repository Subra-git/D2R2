<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false" Inherits="Profiles.Web.ApplicationError" title="Application error" Codebehind="ApplicationError.aspx.vb" %>
<%@ Register Src="NavigationLinks.ascx" TagName="NavigationLinks" TagPrefix="nav" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" Runat="Server">
    <div style="float:left">
        An error has occurred. Please contact the system administrator if this problem persists.
        <br />
        <br />
        <br />
        

        <asp:UpdatePanel ID="pnlUpdate" runat="server">
         <ContentTemplate>
        <asp:Panel  ID="pnlTechnicalDetails" runat="server" >
           <b>Technical details</b> <br />       
           <table width="100%">
                <tr>
                    <td style="width:25%">
                    User:                    
                    </td>
                    <td style="width:75%">
                        <asp:Label ID="lblUser" runat="server"></asp:Label>
                    </td>
    
                </tr>
                <tr>
                    <td style="width:25%">
                    Error type:                    
                    </td>
                    <td style="width:75%">
                        <asp:Label ID="lblErrorType" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width:25%">
                    Error location:                    
                    </td>
                    <td style="width:75%">
                        <asp:Label ID="lblErrorLocation" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width:25%">
                    Time of error:                    
                    </td>
                    <td style="width:75%">
                        <asp:Label ID="lblTime" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width:25%">
                    Details:                    
                    </td>
                    <td style="width:75%">
                        <asp:Label ID="lblErrorDetails" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel>
                <br />
        <br />
                <asp:Label ID="lblErrorLogged"  runat="server" CssClass="ErrorLabel" visible=false Text="Warning: a network problem has prevented this error from being recorded. Please contact the system administrator to report this problem."></asp:Label>

        </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

