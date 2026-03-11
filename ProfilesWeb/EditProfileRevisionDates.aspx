<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false"
    CodeFile="EditProfileRevisionDates.aspx.vb" Inherits="EditProfileRevisionDates"
    Title="View/edit profile" %>

<%@ Register Src="ProfileSectionLinks.ascx" TagName="SectionLinks" TagPrefix="sec" %>
<asp:Content ID="navContent" ContentPlaceHolderID="cphNavigation" runat="Server">
    <sec:SectionLinks ID="ctlSectionLinks" runat="server" />
</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" runat="Server">
    <table style="width: 100%">
        <tr>
            <td>
                <div align="right">
                    <asp:Button ID="btnSave" runat="server" Text="Save" />&nbsp;</div>
            </td>
        </tr>
    </table>
    &nbsp;
    <pwc:TabStrip ID="tabStrip" runat="server">
        <pwc:TabItem IsActive="false" Text="SectionName" />
        <pwc:TabItem IsActive="false" Text="References" />
        <pwc:TabItem IsActive="false" Text="Further information" />
        <pwc:TabItem IsActive="false" Text="Review comments" />
        <pwc:TabItem IsActive="false" Text="Contributions" />
        <pwc:TabItem IsActive="true" Text="Revision dates" />
        <pwc:TabItem IsActive="false" Text="All Revision dates" />
    </pwc:TabStrip>
    <div class="TabBody">
        <!-- revision dates-->
        <asp:Panel ID="panRevDates" runat="server" Visible="true">
            <div class="collapsePanelHeader">
                Revision dates</div>
            <div class="collapsePanel">
                <asp:ValidationSummary ID="valSummaryRevisionDates" DisplayMode="BulletList" runat="server"
                    HeaderText="The following errors have occurred:" CssClass="ErrorLabel" />
                <asp:Label ID="lblErrorDesc" runat="server" CssClass="ErrorLabel" EnableViewState="false"></asp:Label>
                <br />
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblAuthorReviewFreq" runat="server" Text="Author review frequency:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlAuthorReviewFreq" runat="server" DataSourceID="dsRevisionDates"
                                DataTextField="Value" DataValueField="Key" AppendDataBoundItems="true">
                                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
                            </asp:DropDownList>
                            <asp:Label ID="lblItemAuthorReviewFreq" runat="server" Width="130px" Style="border-style: solid;
                                border-width: 1px; background-color: White"></asp:Label>
                        </td>
                        <td>
                            &nbsp;&nbsp;&nbsp;
                        </td>
                        <td>
                            <asp:Label ID="lblNextAuthorReview" runat="server" Text="Next author review:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblItemNextAuthorReview" runat="server" Width="130px" Style="display: block;
                                border-style: solid; border-width: 1px; background-color: White"></asp:Label>
                            <asp:TextBox ID="txtNextAuthorReview" runat="server"></asp:TextBox>&nbsp;
                            <asp:Image ID="ImgCalNextAuthorReview" ImageUrl="~/Images/Calendar.gif" runat="server" />
                            <act:CalendarExtender runat="server" ID="CalNextAuthorReview" CssClass="ProfilesCalendar"
                                TargetControlID="txtNextAuthorReview" Format="d MMMM yyyy" PopupButtonID="ImgCalNextAuthorReview">
                            </act:CalendarExtender>
                        </td>
                        <td>
                            <pwc:DateValidator ID="valNextAuthorReview" ControlToValidate="txtNextAuthorReview"
                                runat="server" ErrorMessage="Next author review date must be a valid date"
                                ToolTip="Please enter a valid date" Display="Dynamic">*</pwc:DateValidator>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblVAReviewFreq" runat="server" Text="VA review frequency:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlVAReviewFreq" runat="server" DataSourceID="dsRevisionDates"
                                DataTextField="Value" DataValueField="Key" AppendDataBoundItems="True">
                                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
                            </asp:DropDownList>
                            <asp:Label ID="lblItemVAReviewFreq" runat="server" Width="130px" Style="border-style: solid;
                                border-width: 1px; background-color: White"></asp:Label>
                        </td>
                        <td>
                            &nbsp;&nbsp;&nbsp;
                        </td>
                        <td>
                            <asp:Label ID="lblNextVAReview" runat="server" Text="Next VA review:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblItemNextVAReview" runat="server" Width="130px" Style="display: block;
                                border-style: solid; border-width: 1px; background-color: White"></asp:Label>
                            <asp:TextBox ID="txtNextVAReview" runat="server"></asp:TextBox>&nbsp;
                            <asp:Image ID="ImgCalNextVAReview" ImageUrl="~/Images/Calendar.gif" runat="server" />
                            <act:CalendarExtender runat="server" ID="CalNextVAReview" CssClass="ProfilesCalendar"
                                TargetControlID="txtNextVAReview" Format="d MMMM yyyy" PopupButtonID="ImgCalNextVAReview">
                            </act:CalendarExtender>
                        </td>
                        <td>
                            <pwc:DateValidator ID="valNextVAReview" ControlToValidate="txtNextVAReview"
                                runat="server" ErrorMessage="Next VA review date must be a valid date"
                                ToolTip="Please enter a valid date" Display="Dynamic">*</pwc:DateValidator>                         
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblPolicyReviewFreq" runat="server" Text="Policy review frequency:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlPolicyReviewFreq" runat="server" DataSourceID="dsRevisionDates"
                                DataTextField="Value" DataValueField="Key" AppendDataBoundItems="True">
                                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
                            </asp:DropDownList>
                            <asp:Label ID="lblItemPolicyReviewFreq" runat="server" Width="130px" Style="border-style: solid;
                                border-width: 1px; background-color: White"></asp:Label>
                        </td>
                        <td>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                        <td>
                            <asp:Label ID="lblNextPolicyReview" runat="server" Text="Next policy review:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblItemNextPolicyReview" runat="server" Width="130px" Style="border-style: solid;
                                border-width: 1px; background-color: White"></asp:Label>
                            <asp:TextBox ID="txtNextPolicyReview" runat="server"></asp:TextBox>&nbsp;
                            <asp:Image ID="ImgCalNextPolReview" ImageUrl="~/Images/Calendar.gif" runat="server" />
                            <act:CalendarExtender runat="server" ID="CalNextPolicyReview" CssClass="ProfilesCalendar"
                                TargetControlID="txtNextPolicyReview" Format="d MMMM yyyy" PopupButtonID="ImgCalNextPolReview">
                            </act:CalendarExtender>
                        </td>
                        <td>
                            <pwc:DateValidator ID="valNextPolicyReview" ControlToValidate="txtNextPolicyReview"
                                runat="server" ErrorMessage="Next policy review date must be a valid date" ToolTip="Please enter a valid date"
                                Display="Dynamic">*</pwc:DateValidator>                        
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblAuthorReviewStatus" runat="server" Text="Author review status:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlAuthorReviewStatus" runat="server" DataSourceID="dsRevisionStatus"
                                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="true">
                                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
                            </asp:DropDownList>
                            <asp:Label ID="lblItemAuthorReviewStatus" runat="server" Width="130px" Style="border-style: solid;
                                border-width: 1px; background-color: White"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblVAReviewStatus" runat="server" Text="VA review status:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlVAReviewStatus" runat="server" DataSourceID="dsRevisionStatus"
                                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True">
                                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
                            </asp:DropDownList>                            
                            <asp:Label ID="lblItemVAReviewStatus" runat="server" Width="130px" Style="border-style: solid;
                                border-width: 1px; background-color: White"></asp:Label>                       
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblPolicyReviewStatus" runat="server" Text="Policy review status:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlPolicyReviewStatus" runat="server" DataSourceID="dsRevisionStatus"
                                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True">
                                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
                            </asp:DropDownList>
                            <asp:Label ID="lblItemPolicyReviewStatus" runat="server" Width="130px" Style="border-style: solid;
                                border-width: 1px; background-color: White"></asp:Label>                            
                        </td>
                    </tr>
                </table>
                <br />
                <csla:CslaDataSource ID="dsRevisionDates" runat="server" TypeAssemblyName="ProfilesLibrary"
                    TypeName="ProfilesLibrary.SectionReviewFrequencyList">
                </csla:CslaDataSource>
                <csla:CslaDataSource ID="dsRevisionStatus" runat="server" TypeAssemblyName="ProfilesLibrary"
                    TypeName="ProfilesLibrary.SectionReviewStatusTypeList">
                </csla:CslaDataSource>
            </div>
        </asp:Panel>
    </div>
    <table style="width: 100%">
        <tr>
            <td>
                <div align="right">
                    <asp:Button ID="btnSave2" runat="server" Text="Save" />&nbsp;</div>
            </td>
        </tr>
    </table>
</asp:Content>
