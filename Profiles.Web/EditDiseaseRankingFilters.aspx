<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false" Inherits="Profiles.Web.EditDiseaseRankingFilters" Title="Edit disease ranking filters"  Codebehind="EditDiseaseRankingFilters.aspx.vb" %>
<%@ Register TagPrefix="pwc" Namespace="Profiles.WebControls.ProfilesWeb.Controls" Assembly="Profiles.WebControls" %>
<%@ Register Src="NavigationLinks.ascx" TagName="NavigationLinks" TagPrefix="nav" %>
<%@ Register Src="SpeciesSelector.ascx" TagName="SpeciesSelector" TagPrefix="sps" %>
<%@ Register Src="~/Controls/Accordion.ascx" TagPrefix="auc" TagName="Accordion" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" runat="Server">
    <script type="text/javascript" src="Javascript/profiles.js"></script>

    <div style="float: right;">
        <a href="DiseaseRanking.aspx" class="govuk-link govuk-link--no-visited-state">< Back</a>
    </div>
    <div class="govuk-!-padding-bottom-5">
        Please press the button to create the disease filter report.
    </div>
    <div style="display: none;">
        <asp:Button runat="server" Text="Disease ranking report: Aquatic diseases" ID="btnDiseaseRankingFish" CssClass="govuk-button" />
        <br />
        <asp:Button runat="server" Text="Disease ranking report: Terrestrial diseases" ID="btnDiseaseRankingTerrestrial" CssClass="govuk-button" />
    </div>
    <asp:Button runat="server" Text="Create new filter" ID="btnFilter" CssClass="govuk-button" />
    <br />
    <asp:DropDownList ID="drpDiseaseRanking" runat="server" AutoPostBack="True" CausesValidation="false"
        DataTextField="NoteTextPlainTextSlim" DataValueField="Id" AppendDataBoundItems="true" CssClass="govuk-select">
        <%--<asp:ListItem Value="0" Selected="True">Select Filter</asp:ListItem>
        <asp:ListItem Value="1">Aquatic diseases</asp:ListItem>
        <asp:ListItem Value="2">Terrestrial diseases</asp:ListItem>--%>
    </asp:DropDownList>
    <br />
    <br />
    
    <asp:Panel ID="pnlSelectionFilterArea" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true" Visible="false">
        <div class="govuk-frontend-supported">
            <auc:Accordion runat="server" 
                ID="speciesFilterButton" 
                ButtonText="Show filter by species" 
                ShowText="Show filter by species" 
                HideText="Hide filter by species" 
                ContainerClass=".species-selector-container"
                ContainerId="species-selector-container"/>

            <div class="species-selector-container" style="display: none" id="species-selector-container">
                <sps:SpeciesSelector runat="server" ID="spsSelector" />
            </div>
        </div>
        
        <div id="divProfileTitle" class="govuk-!-margin-top-5" oninput="MiscTinyMceFunctions.copyToInput('<%= txtDiseaseText.ClientID %>','<%= btnSaveFilter.ClientID %>')" onblur="MiscTinyMceFunctions.copyToInput('<%= txtDiseaseText.ClientID %>','<%= btnSaveFilter.ClientID %>')"></div>
        <pwc:ValidatableHiddenField runat="server" id="txtDiseaseText"></pwc:ValidatableHiddenField>
        <asp:RequiredFieldValidator ID="valDiseaseTextRequired" Display="Dynamic" runat="server"
            ControlToValidate="txtDiseaseText" ErrorMessage="Please enter report a title" ToolTip="Please enter a report title"
            Text=" *Please enter a report title" ValidationGroup="valDiseaseGroup"></asp:RequiredFieldValidator>
        
        <div class="mb-3 govuk-!-padding-top-5">
            <div class="col-md-12 col-xs-12 col-sm-12">
                <div class="bg-gray-light d-inline-block">
                    <asp:Label ID="lblAffectedSpecies" runat="server" CssClass="any-species-button">Any species</asp:Label>
                </div>
            </div>
        </div>
        
        <div class="govuk-form-group">
            <hr class="govuk-section-break govuk-section-break--visible"/>
            <asp:RadioButtonList ID="rdBtnFirst" runat="server" RepeatDirection="Horizontal"
                CssClass="d-inline-flex m-2">
                <asp:ListItem Value="endemic diseases">endemic diseases</asp:ListItem>
                <asp:ListItem Value="exotic diseases">exotic diseases</asp:ListItem>
                <asp:ListItem Value="both">both</asp:ListItem>
            </asp:RadioButtonList>
            <asp:RequiredFieldValidator ID="valFirstRequired" Display="Dynamic" runat="server"
                ControlToValidate="rdBtnFirst" ErrorMessage="Please select disease" ToolTip="Please select disease"
                Text=" *" ValidationGroup="valDiseaseGroup"></asp:RequiredFieldValidator>
            <hr class="govuk-section-break govuk-section-break--visible"/>
            <asp:RadioButtonList ID="rdBtnSecond" runat="server" RepeatDirection="Horizontal"
                CssClass="d-inline-flex m-2">
                <asp:ListItem Value="zoonotic">zoonotic</asp:ListItem>
                <asp:ListItem Value="non-zoonotic">non-zoonotic</asp:ListItem>
                <asp:ListItem Value="both">both</asp:ListItem>
            </asp:RadioButtonList>
            <asp:RequiredFieldValidator ID="valSecondRequired" Display="Dynamic" runat="server"
                ControlToValidate="rdBtnSecond" ErrorMessage="Please select disease" ToolTip="Please select disease"
                Text=" *" ValidationGroup="valDiseaseGroup"></asp:RequiredFieldValidator>
            <hr class="govuk-section-break govuk-section-break--visible"/>
            <asp:RadioButtonList ID="rdBtnThird" runat="server" RepeatDirection="Horizontal"
                CssClass="d-inline-flex m-2">
                <asp:ListItem Value="notifiable">notifiable</asp:ListItem>
                <asp:ListItem Value="non-notifiable">non-notifiable</asp:ListItem>
                <asp:ListItem Value="both">both</asp:ListItem>
            </asp:RadioButtonList>
            <asp:RequiredFieldValidator ID="valThirdRequired" Display="Dynamic" runat="server"
                ControlToValidate="rdBtnThird" ErrorMessage="Please select disease" ToolTip="Please select disease"
                Text=" *" ValidationGroup="valDiseaseGroup"></asp:RequiredFieldValidator>
            <hr class="govuk-section-break govuk-section-break--visible"/>
            <asp:RadioButtonList ID="rdBtnFourth" runat="server" RepeatDirection="Horizontal"
                CssClass="d-inline-flex m-2" AutoPostBack="True">
                <asp:ListItem Value="infectious">infectious</asp:ListItem>
                <asp:ListItem Value="non-infectious">non-infectious</asp:ListItem>
                <asp:ListItem Value="both">both</asp:ListItem>
            </asp:RadioButtonList>
            <asp:RequiredFieldValidator ID="valFourthRequired" Display="Dynamic" runat="server"
                ControlToValidate="rdBtnFourth" ErrorMessage="Please select disease" ToolTip="Please select disease"
                Text=" *" ValidationGroup="valDiseaseGroup"></asp:RequiredFieldValidator>
            <hr class="govuk-section-break govuk-section-break--visible"/>
            <asp:CheckBoxList ID="chkLstTypes" runat="server" RepeatDirection="Horizontal" CssClass="styled d-inline-flex m-2">
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
            <hr class="govuk-section-break govuk-section-break--visible"/>
        </div>
        
        <br />
        <div class="govuk-button-group">
            <asp:Button runat="server" Text="Save filter" ID="btnSaveFilter" ValidationGroup="valDiseaseGroup" CssClass="govuk-button" />&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button 
                runat="server" 
                Text="Delete filter" 
                ID="btnDeleteFilter" 
                CssClass="govuk-button govuk-button--warning" 
                OnClientClick="apha.confirmPrompt('Are you sure you want to delete this filter?', this); return false" />
        </div>
    </asp:Panel>
    <br />
    <asp:Label runat="server" ID="lblErrorMsg" CssClass="govuk-error-message" Text=""></asp:Label>
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
