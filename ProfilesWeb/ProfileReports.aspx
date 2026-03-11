<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false" CodeFile="ProfileReports.aspx.vb" Inherits="ProfileReports" title="Untitled Page" %>

<%@ Register Src="LongTaskUI.ascx" TagName="LongTaskUI" TagPrefix="ltu" %>
<%@ Register Src="NavigationLinks.ascx" TagName="NavigationLinks" TagPrefix="nav" %>

<asp:Content ID="navContent" ContentPlaceHolderID="cphNavigation" Runat="Server">
 <nav:NavigationLinks ID="ctlNavigationLinks" runat="server" />
</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" Runat="Server">
    <div style="width:100%;float:left;margin-top:10px;">
        <asp:UpdatePanel runat="server" ID="updMain" UpdateMode="Always">
            <ContentTemplate>
                <p><asp:HyperLink ID="lnkBrowseProfile" runat="server">Browse profile</asp:HyperLink></p>
                <asp:GridView ID="grdProfileReportList" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                DataSourceID="dsProfileVersionReportInfoList" Width="100%" AllowSorting="True" GridLines="None" CssClass="gridview">
                    <Columns>
                        <asp:TemplateField HeaderText="Title" SortExpression="DisplayName">
                            <ItemStyle Width="300px" />
                            <ItemTemplate>
                                    <asp:HyperLink ID="lnkEditProfileVersion" runat="server"  NavigateUrl="#"
                                    Text='<%# Eval("DisplayName") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkRegenerateReport" runat="server" CommandArgument='<%#Eval("Id") %>' CommandName="RegenerateReport">Regenerate report</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle CssClass="gridviewHeader" />
                    <RowStyle CssClass="gridviewRow" />
                    <AlternatingRowStyle CssClass="gridviewAltRow" />
                </asp:GridView>
                <csla:CslaDataSource ID="dsProfileVersionReportInfoList" runat="server" TypeAssemblyName="ProfilesLibrary" TypeName="ProfilesLibrary.ProfileVersionReportInfoList">
                </csla:CslaDataSource>
               <br /> 
                <asp:Literal ID="lblMsg" runat="server"></asp:Literal>
                <ltu:LongTaskUI ID="ltuRegenerate" runat="server" />                
            </ContentTemplate>
        </asp:UpdatePanel>
        
    </div>
</asp:Content>

