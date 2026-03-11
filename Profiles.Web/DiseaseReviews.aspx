<%@ Page Title="" Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false" Inherits="Profiles.Web.DiseaseReviews" Codebehind="DiseaseReviews.aspx.vb" %>

<%@ Register Src="NavigationLinks.ascx" TagName="NavigationLinks" TagPrefix="nav" %>
<%@ Register Assembly="RadTreeView.Net2" Namespace="Telerik.WebControls" TagPrefix="radT" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" runat="Server">
    <form id="diseasereviewsfrm" autocomplete="off">
    <div>
        <table>
            <tr>
                <td>
                    FROM
                </td>
                <td>
                    <div class="d-flex align-items-center">
                        <asp:TextBox ID="txtFromDate" CssClass="govuk-input me-2 mb-0 d-inline" runat="server"></asp:TextBox>&nbsp;
                        <asp:Image ID="fromDateCalendarImage" CssClass="m-0 me-1" ImageUrl="~/Images/Calendar.gif" runat="server"/>
                        <act:CalendarExtender runat="server" ID="fromDateCalendar" CssClass="ProfilesCalendar"
                            TargetControlID="txtFromDate" Format="d MMMM yyyy" PopupButtonID="ImgCalNextAuthorReview">
                        </act:CalendarExtender>
                    </div>
                    <asp:RequiredFieldValidator ID="rdFromDate" runat="server" ControlToValidate="txtFromDate"
                        ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
                <td>
                    TO
                </td>
                <td>
                    <div class="d-flex align-items-center">
                        <asp:TextBox ID="txtToDate" CssClass="govuk-input me-2 mb-0 ms-1 d-inline" runat="server"></asp:TextBox>&nbsp;
                        <asp:Image ID="toDateCalendarImage" CssClass="m-0" ImageUrl="~/Images/Calendar.gif" runat="server" />
                        <act:CalendarExtender runat="server" ID="toDateCalendar" CssClass="ProfilesCalendar"
                            TargetControlID="txtToDate" Format="d MMMM yyyy" PopupButtonID="ImgCalNextAuthorReview">
                        </act:CalendarExtender>
                    </div>
                    <asp:RequiredFieldValidator ID="rdTodate" runat="server" ControlToValidate="txtToDate"
                        ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style1">
                    &nbsp;&nbsp;&nbsp;
                </td>
                <td>
                    <asp:Button runat="server" ID="btnSubmit" Text="Generate report" TabIndex="20" CssClass="govuk-button" />
                </td>
            </tr>
            <tr>
                <td>
                    Author
                </td>
                <td colspan="4">
                    <asp:DropDownList ID="dropDownListAuthors" CssClass="govuk-select" runat="server" Width="428px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    Description
                </td>
                <td colspan="4" class="auto-style2">
                    <asp:TextBox runat="server" ID="txtDescription" Width="422px" autocomplete="off" TabIndex="12"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    &nbsp;</td>
            </tr>
        </table>
    </div>
    <link href="Css/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="Javascript/jquery-1.10.2.js" type="text/javascript"></script>
    <script src="Javascript/jquery-ui.js" type="text/javascript"></script>
    </form>
</asp:Content>
