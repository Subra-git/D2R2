<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false" Inherits="Profiles.Web.DiseaseRanking" Title="Disease ranking" CodeBehind="DiseaseRanking.aspx.vb" %>

<%@ Register Src="NavigationLinks.ascx" TagName="NavigationLinks" TagPrefix="nav" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" runat="Server">

    <script language="javascript" type="text/javascript">      
    </script>

    <div>
        Please select which disease ranking report and scored RFI graphs you would like to view.<br />
        <br />
    </div>
    <div class="govuk-form-group">
                <csla:CslaDataSource ID="dsDiseaseReferenceTableInfoList" runat="server" TypeAssemblyName="ProfilesLibrary"
                    TypeName="ProfilesLibrary.DiseaseReferenceTableInfoList">
                </csla:CslaDataSource>
                <asp:DropDownList ID="ddlDiseaseRankingReport" 
                    runat="server" 
                    AutoPostBack="True"
                    DataSourceID="dsDiseaseReferenceTableInfoList"
                    DataTextField="Value" 
                    DataValueField="Key"
                    AppendDataBoundItems="true" 
                    CausesValidation="false"
                    CssClass="govuk-select">
                    <asp:ListItem>-- Select Disease Ranking Report --</asp:ListItem>
                    <asp:ListItem>Disease ranking report: Terrestrial diseases</asp:ListItem>
                    <asp:ListItem>Disease ranking report: Aquatic diseases</asp:ListItem>                    
                </asp:DropDownList>

                <asp:Button ID="btnEditFilters" Text="Edit Filters" runat="server" CssClass="govuk-button" />
    </div>
    <br />
    <br />
    <div>
        Please select which disease ranking report with ranked RFI graphs you would like to view.<br />
        <br />
    </div>
    <div class="govuk-form-group">
                <asp:DropDownList 
                    ID="ddlDiseaseRankingRFIReport" 
                    runat="server" 
                    AutoPostBack="True"
                    DataSourceID="dsDiseaseReferenceTableInfoList"
                    DataTextField="Value" 
                    DataValueField="Key"
                    AppendDataBoundItems="true" 
                    CausesValidation="false"
                    CssClass="govuk-select">
                    <asp:ListItem>-- Select Disease Ranking Report --</asp:ListItem>
                    <asp:ListItem>Disease ranking report: Terrestrial diseases</asp:ListItem>
                    <asp:ListItem>Disease ranking report: Aquatic diseases</asp:ListItem>  
                </asp:DropDownList>
                <asp:Button ID="btnEditRFIFilters" Text="Edit Filters" runat="server" CssClass="govuk-button" />
    </div>
</asp:Content>
