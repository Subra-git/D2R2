<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false" Inherits="Profiles.Web.EditProfileTitle" Title="Edit profile title" CodeBehind="EditProfileTitle.aspx.vb" %>

<%@ Register Src="NavigationLinks.ascx" TagName="NavigationLinks" TagPrefix="nav" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" runat="Server">

    <div style="float: left">
        <!--Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. 
        Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. 
        Duis euismod nulla vel mauris. Ut non leo.-->
        <br />
        <br />
    </div>

    <div style="width: 100%; float: left; margin-top: 10px;">
        <table style="table-layout: fixed; width: 100%">
            <tr>
                <td style="vertical-align: top;">Profile title:</td>

                <td style="width: 75%">
                    <div id="divProfileTitle" class="govuk-input" oninput="MiscTinyMceFunctions.copyToInput('<%= txtProfileTitle.ClientID %>','<%= btnSave.ClientID %>')"onblur="MiscTinyMceFunctions.copyToInput('<%= txtProfileTitle.ClientID %>','<%= btnSave.ClientID %>')">Enter Profile Title</div>
                    <asp:TextBox ID="txtProfileTitle" runat="server" Width="90%" MaxLength="255" CssClass="HiddenInput"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="valTitleRequired" runat="server" ControlToValidate="txtProfileTitle" ErrorMessage="You must enter a profile title" ToolTip="Please enter a title" >You must enter a profile title</asp:RequiredFieldValidator>
                </td>
                <td style="height: 46px; vertical-align: top;">
                    <asp:Button ID="btnSave" runat="server" Text="Save" Width="64px" CssClass="govuk-button" OnClientClick="MiscTinyMceFunctions.copyToInput('<%= txtProfileTitle.ClientID %>','<%= btnSave.ClientID %>')" />
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label ID="lblError" runat="server" Width="495px" Height="25px" CssClass="ErrorLabel"></asp:Label>
                </td>
            </tr>
        </table>
    </div>

</asp:Content>

