<%@ Page Title="" Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false"
    CodeFile="DiseaseReviews.aspx.vb" Inherits="DiseaseReviews" %>

<%@ Register Src="NavigationLinks.ascx" TagName="NavigationLinks" TagPrefix="nav" %>
<%@ Register Assembly="RadTreeView.Net2" Namespace="Telerik.WebControls" TagPrefix="radT" %>
<asp:Content ID="navContent" ContentPlaceHolderID="cphNavigation" runat="Server">
    <nav:NavigationLinks ID="NavigationLinks1" runat="server" />
    <style type="text/css">
        .setDisplay
        {
            display: inline-table;
        }
        .ui-datepicker
        {
            width: 180px !important;
        }
        .ui-datepicker-title
        {
            font-size: 0.8em !important;
        }
        .calendericon
        {
            background: url(images/Calendar.gif) no-repeat right;
        }
    </style>
</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" runat="Server">
    <form id="diseasereviewsfrm" autocomplete="off">
    <div>
        <table>
            <tr>
                <td>
                    FROM
                </td>
                <td>
                    <asp:TextBox ID="txtFromDate" runat="server" Width="180px" CssClass="calendericon"
                        autocomplete="off" TabIndex="2"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rdFromDate" runat="server" ControlToValidate="txtFromDate"
                        ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
                <td>
                    TO
                </td>
                <td>
                    <asp:TextBox ID="txtToData" runat="server" Width="180px" CssClass="calendericon"
                        autocomplete="off" TabIndex="5"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rdTodate" runat="server" ControlToValidate="txtToData"
                        ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;&nbsp;&nbsp;
                </td>
                <td>
                    <asp:Button runat="server" ID="btnSubmit" Text="Generate report" TabIndex="20" />
                </td>
            </tr>
            <tr>
                <td>
                    Author
                </td>
                <td colspan="4">
                    <asp:TextBox runat="server" ID="txtAuthor" Width="410px" autocomplete="off" TabIndex="8"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Description
                </td>
                <td colspan="4">
                    <asp:TextBox runat="server" ID="txtDescription" Width="410px" autocomplete="off" TabIndex="12"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="vertical-align: middle;">
                    Select
                </td>
                <td colspan="4">
                    <asp:RadioButtonList ID="rdbtnSelect" runat="server" RepeatDirection="Horizontal" TabIndex="16">
                        <asp:ListItem Value="0" Selected="True">All Profiles</asp:ListItem>
                        <asp:ListItem Value="1">Published</asp:ListItem>
                        <asp:ListItem Value="2">Draft</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
        </table>
    </div>
    <link href="Css/jquery-ui.css" rel="stylesheet" type="text/css" />

    <script src="Javascript/jquery-1.10.2.js" type="text/javascript"></script>

    <script src="Javascript/jquery-ui.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(function() {
            $("#ctl00_cphMain_txtFromDate").datepicker({
                dateFormat: 'dd/mm/yy'
            });
            $("#ctl00_cphMain_txtToData").datepicker({
                dateFormat: 'dd/mm/yy'
            });
        });
        
    </script>

    </form>
</asp:Content>
