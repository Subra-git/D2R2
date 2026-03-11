<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false"
    CodeFile="DiseaseRanking.aspx.vb" Inherits="DiseaseRanking" Title="Disease ranking" %>

<%@ Register Src="NavigationLinks.ascx" TagName="NavigationLinks" TagPrefix="nav" %>
<asp:Content ID="navContent" ContentPlaceHolderID="cphNavigation" runat="Server">
    <nav:NavigationLinks ID="ctlNavigationLinks" runat="server" />
</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" runat="Server">

    <script language="javascript" type="text/javascript">      
    </script>

    <div>
        Please select which disease ranking report and scored RFI graphs you would like to view.<br />
        <br />
    </div>
    <table>
        <tr>
            <td>
                <csla:CslaDataSource ID="dsDiseaseReferenceTableInfoList" runat="server" TypeAssemblyName="ProfilesLibrary"
                    TypeName="ProfilesLibrary.DiseaseReferenceTableInfoList">
                </csla:CslaDataSource>
                <asp:DropDownList ID="ddlDiseaseRankingReport" runat="server" AutoPostBack="True"
                    DataSourceID="dsDiseaseReferenceTableInfoList" DataTextField="Value" DataValueField="Key"
                    AppendDataBoundItems="true" CausesValidation="false">
                    <asp:ListItem>-- Select Disease Ranking Report --</asp:ListItem>
                    <asp:ListItem>Disease ranking report: Terrestrial diseases</asp:ListItem>
                    <asp:ListItem>Disease ranking report: Aquatic diseases</asp:ListItem>                    
                </asp:DropDownList>
            </td>
            <td>
                <asp:Button ID="btnEditFilters" Text="Edit Filters" runat="server" />
            </td>
        </tr>
    </table>
    <br />
    <br />
    <div>
        Please select which disease ranking report with ranked RFI graphs you would like to view.<br />
        <br />
    </div>
    <table>
        <tr>
            <td>
                <asp:DropDownList ID="ddlDiseaseRankingRFIReport" runat="server" AutoPostBack="True"
                    DataSourceID="dsDiseaseReferenceTableInfoList" DataTextField="Value" DataValueField="Key"
                    AppendDataBoundItems="true" CausesValidation="false">
                    <asp:ListItem>-- Select Disease Ranking Report --</asp:ListItem>
                    <asp:ListItem>Disease ranking report: Terrestrial diseases</asp:ListItem>
                    <asp:ListItem>Disease ranking report: Aquatic diseases</asp:ListItem>  
                </asp:DropDownList>
            </td>
            <td>
                <asp:Button ID="btnEditRFIFilters" Text="Edit Filters" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>
