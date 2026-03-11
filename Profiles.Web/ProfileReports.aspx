<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false" Inherits="Profiles.Web.ProfileReports" Title="Untitled Page" CodeBehind="ProfileReports.aspx.vb" %>

<%@ Register Src="LongTaskUI.ascx" TagName="LongTaskUI" TagPrefix="ltu" %>
<%@ Register Src="NavigationLinks.ascx" TagName="NavigationLinks" TagPrefix="nav" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" runat="Server">
    <div ID="introText" runat="server" style="float:left" >
        Access disease profiles from this page. You can request permission to view disease scenarios or disease profiles still in draft form by contacting the D2R2 team at 
        <a class="govuk-link" href='mailto:D2R2@defra.gov.uk'>D2R2@defra.gov.uk</a>
        <br /><br />
    </div>   
    <div style="width: 100%; float: left; margin-top: 10px;" id="profileReportsDiv">
        <asp:UpdatePanel runat="server" ID="updMain" UpdateMode="Always">
            <ContentTemplate>
                <asp:GridView ID="grdProfileReportList" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    DataSourceID="dsProfileVersionReportInfoList" Width="100%" AllowSorting="True" GridLines="None" CssClass="gridview"
                    aria-label="This table displays reports for this disease profile, click the title link header to sort the reports alphabetically">
                    <Columns>
                        <asp:TemplateField HeaderText="Title" SortExpression="DisplayName">
                            <ItemStyle Width="300px" />
                            <ItemTemplate>
                                <asp:HyperLink ID="lnkEditProfileVersion" runat="server" NavigateUrl="#"
                                    Text='<%# Eval("DisplayName") %>'></asp:HyperLink>

                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkRegenerateReport" runat="server" CommandArgument='<%#Eval("Id") %>' CommandName="RegenerateReport">Regenerate report</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>

                    <HeaderStyle CssClass="gridviewHeader" />
                    <RowStyle CssClass="gridviewRow" />
                    <AlternatingRowStyle CssClass="gridviewAltRow" />
                </asp:GridView>
                <br />
                    <asp:Button ID="BtnCreateBespokeReport" runat="server" Text="Create bespoke report" CssClass="govuk-button" />
                <br />
                <br />
                <asp:HyperLink ID="lnkBrowseProfile" CssClass="govuk-link" runat="server">Browse disease profile</asp:HyperLink>


                <csla:CslaDataSource ID="dsProfileVersionReportInfoList" runat="server" TypeAssemblyName="ProfilesLibrary" TypeName="ProfilesLibrary.ProfileVersionReportInfoList">
                </csla:CslaDataSource>
                <br />
                <asp:Literal ID="lblMsg" runat="server"></asp:Literal>
                <ltu:LongTaskUI ID="ltuRegenerate" runat="server" />
            </ContentTemplate>
        </asp:UpdatePanel>

    </div>
</asp:Content>

