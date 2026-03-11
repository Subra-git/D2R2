<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false"
    CodeFile="MaintainPrioritisationVariables.aspx.vb" Inherits="MaintainPrioritisationVariables"
    Title="Maintain profile prioritisation variables" %>

<%@ Register Src="NavigationLinks.ascx" TagName="NavigationLinks" TagPrefix="nav" %>
<%@ Register Src="LongTaskUI.ascx" TagName="LongTaskUI" TagPrefix="ltu" %>
<asp:Content ID="navContent" ContentPlaceHolderID="cphNavigation" runat="Server">
    <nav:NavigationLinks ID="ctlNavigationLinks" runat="server" />
</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" runat="Server">
    <div style="float:left; width:100%">
        Use this function to maintain the weightings and scores associated with prioritisation
        criteria. Please note, if you make and confirm changes to this information, this
        will trigger an automatic re-calculation of all prioritisation scores of published
        profiles. Do not use this function for the purpose of developing “what-if” scenarios;
        a separate spreadsheet exists, outside of this application, which has been developed
        for this purpose.
        <br />
        <br />
    </div>
    <div style="clear:both" />
    <asp:UpdatePanel ID="updatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
        <ContentTemplate>
            <div class="collapsePanelHeader">
                Draft prioritisation</div>
            <div class="collapsePanel">
                Calculate prioritisation scores for draft profiles
                <asp:Button ID="btnCalculateDraftPrioritisation" runat="server" Text="Go" />
                <ltu:LongTaskUI ID="ltuCalculate" runat="server" />
                <div>
                    <asp:Label ID="lblMsg" runat="server" CssClass="ErrorLabel" EnableViewState="false" /></div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="updatePanelPrioritisation" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="btnUpdate" />
            <asp:PostBackTrigger ControlID="btnSaveCriterion" />
            <asp:PostBackTrigger ControlID="btnExportScoreData" />
            <asp:PostBackTrigger ControlID="btnExportAll" />
        </Triggers>
        <ContentTemplate>
            &nbsp;
            <div align="right">
                <asp:Button ID="btnUpdate" runat="server" Text="Update" CausesValidation="true" ValidationGroup="RankingRange"></asp:Button><br />
                <asp:Label ID="lblError" runat="server" CssClass="ErrorLabel" EnableViewState="False"></asp:Label><br />
            </div>
            <div class="collapsePanelHeader">
                Edit ranking range</div>
            <div class="collapsePanel">
                <asp:ValidationSummary ID="valsumRankingRange" runat="server" ValidationGroup="RankingRange" />
                <table>
                    <tbody>
                        <tr>
                            <td>
                                Lower bound:
                            </td>
                            <td>
                                <asp:TextBox ID="txtLowerBound" runat="server" CausesValidation="True" MaxLength="3"
                                    Width="50px" ValidationGroup="RankingRange"></asp:TextBox>
                            </td>
                            <td style="width: 16px">
                                <asp:RangeValidator ID="rvalLowerBound" runat="server" Type="Integer" ControlToValidate="txtLowerBound"
                                    ErrorMessage="Lower bound must be a positive integer" MaximumValue="998" MinimumValue="0"
                                    ToolTip="Lower bound must be a positive integer" ValidationGroup="RankingRange">*</asp:RangeValidator>
                            </td>
                            <td>
                                <asp:CompareValidator ID="cvalLowerRankingRange" runat="server" Type="Integer" ControlToValidate="txtLowerBound"
                                    ErrorMessage="Lower bound must be a positive integer that is lower than upper bound"
                                    ToolTip="Lower bound must be less than upper bound" ControlToCompare="txtUpperBound"
                                    Operator="LessThan" ValidationGroup="RankingRange">*</asp:CompareValidator>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqvalLowerBound" runat="server" ControlToValidate="txtLowerBound"
                                    ErrorMessage="Lower bound cannot be blank" ToolTip="Lower bound cannot be blank"
                                    ValidationGroup="RankingRange">*</asp:RequiredFieldValidator>
                            </td>
                            <td>
                                Upper bound
                            </td>
                            <td>
                                <asp:TextBox ID="txtUpperBound" runat="server" CausesValidation="True" MaxLength="3"
                                    Width="50px" ValidationGroup="RankingRange"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RangeValidator ID="rvalUpperBound" runat="server" Type="Integer" ControlToValidate="txtUpperBound"
                                    ErrorMessage="Upper bound must be a positive integer" MaximumValue="999" MinimumValue="1"
                                    ToolTip="Upper bound must be a positive integer" ValidationGroup="RankingRange">*</asp:RangeValidator>
                            </td>
                            <td>
                                <asp:CompareValidator ID="cvalUpperRankingRange" runat="server" Type="Integer" ControlToValidate="txtUpperBound"
                                    ErrorMessage="Upper bound must be a positive integer that is greater than lower bound"
                                    ToolTip="Upper bound must be greater than lower bound" ControlToCompare="txtLowerBound"
                                    Operator="GreaterThan" ValidationGroup="RankingRange">*</asp:CompareValidator>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqvalUpperBound" runat="server" ControlToValidate="txtUpperBound"
                                    ErrorMessage="Upper bound cannot be blank" ToolTip="Upper bound cannot be blank"
                                    ValidationGroup="RankingRange">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div style="margin-top: 10px; float: left; width: 100%; height: 407px;">
                <div style="margin-top: 10px; margin-bottom: 10px; width: 100%">
                    <asp:Label ID="lblPrioritisationCategory" runat="server" Text="Prioritisation category"></asp:Label>
                    <asp:DropDownList ID="ddlPrioritisationCategories" runat="server" CausesValidation="True"
                        AutoPostBack="True" DataSourceID="dsPrioritisationCategories" DataTextField="Name"
                        DataValueField="Id" AppendDataBoundItems="true">
                        <asp:ListItem Text="Please select..." Value="0"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="btnPrint" runat="server" Width="176px" Text="Print category variables"
                        Enabled="False"></asp:Button>
                    &nbsp;
                    <asp:Button ID="btnExportScoreData" runat="server" Width="176px" Text="Export score data"
                        Enabled="False"></asp:Button>
                    &nbsp;
                    <asp:Button ID="btnExportAll" runat="server" Width="300px" 
                        Text="Export normalised scores (all categories)" />                    
                    <csla:CslaDataSource ID="dsPrioritisationCategories" runat="server" TypeAssemblyName="ProfilesLibrary"
                        TypeName="ProfilesLibrary.ProfilePrioritisationCategoryList">
                    </csla:CslaDataSource>
                </div>
                <asp:GridView ID="grdCategoryCriterion" runat="server" Width="100%" DataSourceID="dsPrioritisationCriterionList"
                    AllowPaging="True" AllowSorting="False" AutoGenerateColumns="False" CssClass="gridview"
                    GridLines="None" PagerSettings-Mode="NextPreviousFirstLast" PageSize="10">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkName" CommandArgument='<%# Eval("Id") %>' CommandName="LoadCriterionValues"
                                    runat="server" Text='<%# Eval("CodeAndName") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Weight" HeaderText="Weighting" />
                    </Columns>
                    <HeaderStyle CssClass="gridviewHeader" />
                    <RowStyle CssClass="gridviewRow" />
                    <AlternatingRowStyle CssClass="gridviewAltRow" />
                </asp:GridView>
                <csla:CslaDataSource ID="dsPrioritisationCriterionList" runat="server" TypeAssemblyName="ProfilesLibrary"
                    TypeName="ProfilesLibrary.ProfilePrioritisationCriterionList">
                </csla:CslaDataSource>
            </div>
            &nbsp;
            <asp:Panel ID="pnlCriterionValues" runat="server" Width="100%" Visible="false">
                <div class="collapsePanelHeader">
                    <asp:Label ID="lblCriterionCode" runat="server"></asp:Label>
                    <asp:Label ID="lblCriterionIdHidden" runat="server" Visible="False"></asp:Label>
                </div>
                <div class="collapsePanel">
                    <asp:ValidationSummary ID="valSummCriterionEdit" runat="server" ValidationGroup="Criterion" />
                    <table style="width: 100%">
                        <tbody>
                            <tr>
                                <td>
                                    Criterion name:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCriterionName" runat="server" CausesValidation="True" Width="95%"
                                        TextMode="MultiLine" Rows="3" ValidationGroup="Criterion"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="valCriterionNameReq" ControlToValidate="txtCriterionName"
                                        runat="server" ErrorMessage="You must enter criterion text" ToolTip="Please enter criterion text or press cancel"
                                        ValidationGroup="Criterion">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="valCriterionNameMaxLength" runat="server" ControlToValidate="txtCriterionName"
                                        ValidationExpression="^(.|\255){0,255}$" ErrorMessage="The criterion text must be no longer than 255 characters"
                                        ToolTip="The criterion text must be no longer than 255 characters" ValidationGroup="Criterion">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Weighting:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCriterionWeight" runat="server" CausesValidation="True" MaxLength="3"
                                        Width="50px" ValidationGroup="Criterion"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RangeValidator ID="rvalCriterionWeighting" runat="server" Type="Integer" ControlToValidate="txtCriterionWeight"
                                        ErrorMessage="Criterion weight must be a positive integer" MaximumValue="999"
                                        MinimumValue="1" ToolTip="Criterion weight must be a positive integer" ValidationGroup="Criterion">*</asp:RangeValidator>
                                    <asp:RequiredFieldValidator ID="valCriterionWeightingReq" ControlToValidate="txtCriterionWeight"
                                        runat="server" ErrorMessage="You must enter a weighting" ToolTip="Please enter weighting or press cancel"
                                        ValidationGroup="Criterion">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <asp:GridView ID="grdCriterionValues" runat="server" Width="100%" DataSourceID="dsPrioritisationCriterionValueList"
                        AllowPaging="True" AllowSorting="False" AutoGenerateColumns="False" CssClass="gridview"
                        GridLines="None" DataKeyNames="Id">
                        <Columns>
                            <asp:BoundField ReadOnly="True" DataField="Id" Visible="False" HeaderText="Id"></asp:BoundField>
                            <asp:BoundField ReadOnly="True" DataField="Value" HeaderText="Value"></asp:BoundField>
                            <asp:TemplateField HeaderText="Score">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtScore" runat="server" CausesValidation="True" MaxLength="3" Width="50px"
                                        Text='<%# Eval("Score") %>' ValidationGroup="Criterion"></asp:TextBox>
                                    <asp:RangeValidator ID="rvalCriterionValueScore" runat="server" Type="Integer" ControlToValidate="txtScore"
                                        ErrorMessage='<%# Eval("Value").ToString() +" score must be a positive integer" %>'
                                        MaximumValue="999" MinimumValue="0" ToolTip="Criterion value score must be a positive integer" ValidationGroup="Criterion">*</asp:RangeValidator>
                                    <asp:RequiredFieldValidator ID="valScoreReq" ControlToValidate="txtScore" runat="server"
                                        ErrorMessage='<%# "Please enter a score for " + Eval("Value").ToString() %>'
                                        ToolTip="Please enter a score for each value or press cancel" ValidationGroup="Criterion">*</asp:RequiredFieldValidator>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <RowStyle CssClass="gridviewRow"></RowStyle>
                        <HeaderStyle CssClass="gridviewHeader"></HeaderStyle>
                        <AlternatingRowStyle CssClass="gridviewAltRow"></AlternatingRowStyle>
                    </asp:GridView>
                    <csla:CslaDataSource ID="dsPrioritisationCriterionValueList" runat="server" TypeAssemblyName="ProfilesLibrary"
                        TypeName="ProfilesLibrary.ProfilePrioritisationCriterionValueList">
                    </csla:CslaDataSource>
                    &nbsp;
                    <div align="right">
                        <asp:Button ID="btnSaveCriterion" OnClick="btnSaveCriterion_Click" runat="server"
                            Text="OK" ValidationGroup="Criterion"></asp:Button>
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
