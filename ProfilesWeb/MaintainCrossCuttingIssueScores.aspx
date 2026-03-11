<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false"
    CodeFile="MaintainCrossCuttingIssueScores.aspx.vb" Inherits="MaintainCrossCuttingIssueScores"
    Title="Maintain cross-cutting issue scores" %>

<%@ Register Src="NavigationLinks.ascx" TagName="NavigationLinks" TagPrefix="nav" %>
<asp:Content ID="navContent" ContentPlaceHolderID="cphNavigation" runat="Server">
    <nav:NavigationLinks ID="ctlNavigationLinks" runat="server" />
</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" runat="Server">
    <div style="float:left; width:100%">
        Use this function to maintain the scores associated with cross-cutting issues. Please note, if you make and confirm changes to this information, this
        will trigger an automatic re-calculation of all cross-cutting issue scores.
        <br />
    </div>
    <div style="clear:both" />
    <asp:UpdatePanel ID="updatePanelPrioritisation" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="btnUpdate" />
            <asp:PostBackTrigger ControlID="btnSaveCriterion" />
        </Triggers>
        <ContentTemplate>
            &nbsp;
            <div align="right">
                <asp:Button ID="btnUpdate" runat="server" Text="Update"></asp:Button><br />
                <asp:Label ID="lblError" runat="server" CssClass="ErrorLabel" EnableViewState="False"></asp:Label><br />
            </div>
            <div style="float: left; width: 100%">
                <div style="margin-bottom: 10px; width: 100%">
                    <asp:Label ID="lblSpeciesPrioritisationCategory" runat="server" Text="Cross-cutting issue"></asp:Label>
                    <asp:DropDownList ID="ddlSpeciesPrioritisationCategories" runat="server" CausesValidation="True"
                        AutoPostBack="True" DataSourceID="dsSpeciesPrioritisationCategories" DataTextField="Name"
                        DataValueField="Id" AppendDataBoundItems="true">
                        <asp:ListItem Text="Please select..." Value="0"></asp:ListItem>
                    </asp:DropDownList>
                    <csla:CslaDataSource ID="dsSpeciesPrioritisationCategories" runat="server" TypeAssemblyName="ProfilesLibrary"
                        TypeName="ProfilesLibrary.SpeciesPrioritisationCategoryList">
                    </csla:CslaDataSource>
                </div>
                <asp:GridView ID="grdSpeciesCategoryCriterion" runat="server" Width="100%" DataSourceID="dsSpeciesPrioritisationCriterionList"
                    AllowPaging="True" AllowSorting="False" AutoGenerateColumns="False" CssClass="gridview"
                    GridLines="None" PagerSettings-Mode="NextPreviousFirstLast" PageSize="10">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkName" CommandArgument='<%# Eval("Id") %>' CommandName="LoadCriterionValues"
                                    runat="server" Text='<%# Eval("Name") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle CssClass="gridviewHeader" />
                    <RowStyle CssClass="gridviewRow" />
                    <AlternatingRowStyle CssClass="gridviewAltRow" />
                </asp:GridView>
                <csla:CslaDataSource ID="dsSpeciesPrioritisationCriterionList" runat="server" TypeAssemblyName="ProfilesLibrary"
                    TypeName="ProfilesLibrary.SpeciesPrioritisationCriterionList">
                </csla:CslaDataSource>
            </div>
            &nbsp;
            <asp:Panel ID="pnlSpeciesCriterionValues" runat="server" Width="100%" Visible="false">
                <div class="collapsePanelHeader">
                    <asp:Label ID="lblSpeciesCriterionCode" runat="server"></asp:Label>
                    <asp:Label ID="lblSpeciesCriterionIdHidden" runat="server" Visible="False"></asp:Label>
                </div>
                <div class="collapsePanel">
                    <asp:ValidationSummary ID="valSummCriterionEdit" runat="server" />
                    <asp:GridView ID="grdSpeciesCriterionValues" runat="server" Width="100%" DataSourceID="dsSpeciesPrioritisationCriterionValueList"
                        AllowPaging="True" AllowSorting="False" AutoGenerateColumns="False" CssClass="gridview"
                        GridLines="None" DataKeyNames="Id">
                        <Columns>
                            <asp:BoundField ReadOnly="True" DataField="Id" Visible="False" HeaderText="Id"></asp:BoundField>
                            <asp:BoundField ReadOnly="True" DataField="Value" HeaderText="Value"></asp:BoundField>
                            <asp:TemplateField HeaderText="Score">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtScore" runat="server" CausesValidation="True" MaxLength="3" Width="50px"
                                        Text='<%# Eval("Score") %>'></asp:TextBox>
                                    <asp:RangeValidator ID="rvalScore" runat="server" Type="Integer" ControlToValidate="txtScore"
                                        ErrorMessage="Score must be an integer between 0 and 100" MaximumValue="100"
                                        MinimumValue="0" ToolTip="Please enter a score between 0 and 100">*</asp:RangeValidator>
                                    <asp:RequiredFieldValidator ID="valScoreReq" ControlToValidate="txtScore" runat="server"
                                        ErrorMessage='<%# "Please enter a score for " + Eval("Value").ToString() %>'
                                        ToolTip="Please enter a score for each value or press cancel">*</asp:RequiredFieldValidator>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <RowStyle CssClass="gridviewRow"></RowStyle>
                        <HeaderStyle CssClass="gridviewHeader"></HeaderStyle>
                        <AlternatingRowStyle CssClass="gridviewAltRow"></AlternatingRowStyle>
                    </asp:GridView>
                    <csla:CslaDataSource ID="dsSpeciesPrioritisationCriterionValueList" runat="server"
                        TypeAssemblyName="ProfilesLibrary" TypeName="ProfilesLibrary.SpeciesPrioritisationCriterionValueList">
                    </csla:CslaDataSource>
                    &nbsp;
                    <div align="right">
                        <asp:Button ID="btnSaveCriterion" OnClick="btnSaveCriterion_Click" runat="server"
                            Text="OK"></asp:Button>
                        <asp:Button ID="btnCancelCriterion" OnClick="btnCancelCriterion_Click" runat="server"
                            Text="Cancel" CausesValidation="false"></asp:Button>
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div style="visibility: hidden" id="divPendingChanges" runat="server">
        <asp:Label ID="lblPendingChanges" runat="server" Text="You have pending changes. To save these changes, click the update button."
            ForeColor="Red"></asp:Label>
        <br />
    </div>
</asp:Content>
