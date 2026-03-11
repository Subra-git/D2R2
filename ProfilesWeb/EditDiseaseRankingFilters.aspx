<%@ Page Title="" Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false"
    CodeFile="EditDiseaseRankingFilters.aspx.vb" Inherits="EditDiseaseRankingFilters" %>

<%@ Register Src="NavigationLinks.ascx" TagName="NavigationLinks" TagPrefix="nav" %>
<%@ Register Src="SpeciesSelector.ascx" TagName="SpeciesSelector" TagPrefix="sps" %>
<%@ Register Assembly="RadTreeView.Net2" Namespace="Telerik.WebControls" TagPrefix="radT" %>
<asp:Content ID="navContent" ContentPlaceHolderID="cphNavigation" runat="Server">
    <nav:NavigationLinks ID="ctlNavigationLinks" runat="server" />
    <style type="text/css">
        .setDisplay
        {
            display: inline-table;
        }
    </style>
</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" runat="Server">
    <div style="float: right;">
        <a href="DiseaseRanking.aspx" style="text-decoration: none;">< Back</a></div>
    <div>
        Please press the button to create the disease filter report.
        <br />
        <br />
    </div>
    <div style="display: none;">
        <asp:Button runat="server" Text="Disease ranking report: Aquatic diseases" ID="btnDiseaseRankingFish" />
        <br />
        <asp:Button runat="server" Text="Disease ranking report: Terrestrial diseases" ID="btnDiseaseRankingTerrestrial" />
    </div>
    <asp:Button runat="server" Text="Create new filter" ID="btnFilter" /><br />
    <br />
    <asp:DropDownList ID="drpDiseaseRanking" runat="server" AutoPostBack="True" CausesValidation="false">
        <%--<asp:ListItem Value="0" Selected="True">Select Filter</asp:ListItem>
        <asp:ListItem Value="1">Aquatic diseases</asp:ListItem>
        <asp:ListItem Value="2">Terrestrial diseases</asp:ListItem>--%>
    </asp:DropDownList>
    <br />
    <br />
    <asp:Panel ID="pnlSelectionFilterArea" runat="server" Visible="false">
        <asp:TextBox ID="txtDiseaseText" runat="server" Width="40%" MaxLength="130" />
        <asp:RequiredFieldValidator ID="valDiseaseTextRequired" Display="Dynamic" runat="server"
            ControlToValidate="txtDiseaseText" ErrorMessage="Please enter report a title" ToolTip="Please enter a report title"
            Text=" *Please enter a report title" ValidationGroup="valDiseaseGroup"></asp:RequiredFieldValidator>
        <br />
        <sps:SpeciesSelector runat="server" ID="spsSelector" />
        <br />
        <div>
            <asp:RadioButtonList ID="rdBtnFirst" runat="server" RepeatDirection="Horizontal"
                CssClass="setDisplay">
                <asp:ListItem Value="endemic diseases">endemic diseases</asp:ListItem>
                <asp:ListItem Value="exotic diseases">exotic diseases</asp:ListItem>
                <asp:ListItem Value="both">both</asp:ListItem>
            </asp:RadioButtonList>
            <asp:RequiredFieldValidator ID="valFirstRequired" Display="Dynamic" runat="server"
                ControlToValidate="rdBtnFirst" ErrorMessage="Please select disease" ToolTip="Please select disease"
                Text=" *" ValidationGroup="valDiseaseGroup"></asp:RequiredFieldValidator>
            <br />
            <asp:RadioButtonList ID="rdBtnSecond" runat="server" RepeatDirection="Horizontal"
                CssClass="setDisplay">
                <asp:ListItem Value="zoonotic">zoonotic</asp:ListItem>
                <asp:ListItem Value="non-zoonotic">non-zoonotic</asp:ListItem>
                <asp:ListItem Value="both">both</asp:ListItem>
            </asp:RadioButtonList>
            <asp:RequiredFieldValidator ID="valSecondRequired" Display="Dynamic" runat="server"
                ControlToValidate="rdBtnSecond" ErrorMessage="Please select disease" ToolTip="Please select disease"
                Text=" *" ValidationGroup="valDiseaseGroup"></asp:RequiredFieldValidator>
            <br />
            <asp:RadioButtonList ID="rdBtnThird" runat="server" RepeatDirection="Horizontal"
                CssClass="setDisplay">
                <asp:ListItem Value="notifiable">notifiable</asp:ListItem>
                <asp:ListItem Value="non-notifiable">non-notifiable</asp:ListItem>
                <asp:ListItem Value="both">both</asp:ListItem>
            </asp:RadioButtonList>
            <asp:RequiredFieldValidator ID="valThirdRequired" Display="Dynamic" runat="server"
                ControlToValidate="rdBtnThird" ErrorMessage="Please select disease" ToolTip="Please select disease"
                Text=" *" ValidationGroup="valDiseaseGroup"></asp:RequiredFieldValidator>
            <br />
            <asp:RadioButtonList ID="rdBtnFourth" runat="server" RepeatDirection="Horizontal"
                CssClass="setDisplay" AutoPostBack="True">
                <asp:ListItem Value="infectious">infectious</asp:ListItem>
                <asp:ListItem Value="non-infectious">non-infectious</asp:ListItem>
                <asp:ListItem Value="both">both</asp:ListItem>
            </asp:RadioButtonList>
            <asp:RequiredFieldValidator ID="valFourthRequired" Display="Dynamic" runat="server"
                ControlToValidate="rdBtnFourth" ErrorMessage="Please select disease" ToolTip="Please select disease"
                Text=" *" ValidationGroup="valDiseaseGroup"></asp:RequiredFieldValidator>
            <br />
            <asp:CheckBoxList ID="chkLstTypes" runat="server" RepeatDirection="Horizontal" CssClass="styled setDisplay">
                <asp:ListItem Value="bacteria">bacteria</asp:ListItem>
                <asp:ListItem Value="virus">virus</asp:ListItem>
                <asp:ListItem Value="fungus">fungus</asp:ListItem>
                <asp:ListItem Value="parasite">parasite</asp:ListItem>
                <asp:ListItem Value="other transmissible agent">other transmissible agent</asp:ListItem>
            </asp:CheckBoxList>
            <asp:CustomValidator ID="ctmLstTypeRequired" runat="server" EnableClientScript="true"
                ErrorMessage="Please select disease" Text=" *" ClientValidationFunction="ValidateCheckBoxList"
                ValidationGroup="valDiseaseGroup">
            </asp:CustomValidator>
        </div>
        <br />
        <div>
            <asp:Button runat="server" Text="Save filter" ID="btnSaveFilter" ValidationGroup="valDiseaseGroup" />&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button runat="server" Text="Delete filter" ID="btnDeleteFilter" OnClientClick="if ( !confirm('Are you sure you want to delete this filter?')) return false;" />
        </div>
    </asp:Panel>
    <br />
    <asp:Label runat="server" ID="lblErrorMsg" Text=""></asp:Label>
    <asp:HiddenField runat="server" ID="hfFNum" Value="0" />
    <script type="text/javascript">
        function ValidateCheckBoxList(sender, args) {

            var RdList = document.getElementById("<%=rdBtnFourth.ClientID %>");

            var radioboxes = RdList.getElementsByTagName("input");
            var isValid = false;
            for (var i = 0; i < radioboxes.length; i++) {
                if (radioboxes[i].value == "non-infectious" && radioboxes[i].checked == true) {
                    isValid = true;
                    break;
                }
            }

            if (isValid == false) {

                var checkBoxList = document.getElementById("<%=chkLstTypes.ClientID %>");
                var checkboxes = checkBoxList.getElementsByTagName("input");

                for (var i = 0; i < checkboxes.length; i++) {
                    if (checkboxes[i].checked) {
                        isValid = true;
                        break;
                    }
                }
            }
            args.IsValid = isValid;
        }
    </script>

</asp:Content>
