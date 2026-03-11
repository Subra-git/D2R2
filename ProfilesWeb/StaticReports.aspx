<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false"
    CodeFile="StaticReports.aspx.vb" Inherits="StaticReports" Title="Reports" %>

<%@ Register Src="NavigationLinks.ascx" TagName="NavigationLinks" TagPrefix="nav" %>
<asp:Content ID="navContent" ContentPlaceHolderID="cphNavigation" runat="Server">
    <nav:NavigationLinks ID="ctlNavigationLinks" runat="server" />
</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" runat="Server">
    <asp:Literal runat="server" ID="litStaticReports">
    <div style="float:left">
        Below is the list of reports that have been drafted and peer-reviewed for publication on this website. 
        These reports have been generated from information held within the D2R2 Database. If the report you are seeking is 
        not listed below then please contact us using the following email address:  
        <a href='mailto:D2R2@defra.gsi.gov.uk'>D2R2@defra.gsi.gov.uk</a>
        <br /><br /> 
    </div>    
    </asp:Literal>
    <asp:Literal runat="server" ID="litUserManuals" Visible="false">
    <div style="float:left">
        Below is a list of manuals for using the Surveillance Profiles application. 
        Each manual has been tailored according to the particular privileges that you may have as a user of the Surveillance Profiles 
        system. Please click on the title of any of the manuals to open the document. 
        If you have any general questions or suggestions for improving the system, then you can contact us using the following 
        email address: <a href='mailto:D2R2@defra.gsi.gov.uk'>D2R2@defra.gsi.gov.uk</a>
        <br /><br /> 
        If you are experiencing any problems with the system, then ‘you can contact the APHA ITU helpdesk on <b>0870 240 0469</b>, 
        then option 3 (service desk).
        <br />
        <i>N.B. This service is not provided on UK Bank Holidays.</i>
       <br /><br /> 
    </div>
    </asp:Literal>
    <br />
    <div style="clear: both;">
    </div>
    </div>
    <asp:UpdatePanel ID="updatePanelReport" runat="server">
        <ContentTemplate>
            <pwc:GridView ID="grdReports" runat="server" DefaultSortExpression="Title" EmptyDataText="There are no reports to display."
                AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="gridview"
                GridLines="None" DataSourceID="dsStaticReportList" Width="100%">
                <Columns>
                    <asp:TemplateField HeaderText="Title" SortExpression="Title">
                        <ItemStyle Width="300px" />
                        <ItemTemplate>
                            <asp:HyperLink ID="lnkViewStaticReportVersion" runat="server" NavigateUrl="#" Text='<%# Eval("Title") %>'></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Version" HeaderText="Version" SortExpression="VersionSortValue">
                        <ItemStyle Width="0px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Public?" SortExpression="IsPublic">
                        <ItemTemplate>
                            <%#IIf(Boolean.Parse(Eval("IsPublic").ToString()), "Yes", "No")%></ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField ReadOnly="True" DataField="EffectiveDates" HeaderText="Effective dates"
                        SortExpression="EffectiveDateFrom"></asp:BoundField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:HyperLink ID="lnkHistory" runat="server" Text='History'></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton CommandName="Delete" runat="server" ID="lnkDelete" CommandArgument='<%#Eval("Id") %>'>Delete</asp:LinkButton>
                            <act:ConfirmButtonExtender ID="cbeDelete" runat="server" TargetControlID="lnkDelete"
                                ConfirmText="Are you sure you want to delete this report?" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkChangeAccess" runat="server" CommandName="changeaccess" CommandArgument='<%#Eval("Id") %>'
                                Text="Make public" />
                            <act:ConfirmButtonExtender ID="cbeChangeAccess" runat="server" TargetControlID="lnkChangeAccess"
                                ConfirmText="Are you sure you want to make this report public (this cannot be undone)?" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <RowStyle CssClass="gridviewRow"></RowStyle>
                <HeaderStyle CssClass="gridviewHeader"></HeaderStyle>
                <AlternatingRowStyle CssClass="gridviewAltRow"></AlternatingRowStyle>
            </pwc:GridView>
            <csla:CslaDataSource ID="dsStaticReportList" runat="server" TypeAssemblyName="ProfilesLibrary"
                TypeName="ProfilesLibrary.StaticReportList">
            </csla:CslaDataSource>
            <asp:Label ID="lblReportMessage" runat="server" CssClass="ErrorLabel" EnableViewState="False"></asp:Label>
            <br />
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click"></asp:Button><br />
    <br />
    <asp:Panel ID="pnlReportUpload" runat="server" Visible="False">
        <div class="collapsePanelHeader">
            <asp:Label ID="lblUpload" runat="server" Text="Upload a static report"></asp:Label></div>
        <div class="collapsePanel">
            <table width="100%">
                <tr>
                    <td style="width: 20%">
                        <asp:Label ID="lblFile" runat="server" Text="Report file:"></asp:Label>
                    </td>
                    <td style="width: 80%">
                        <asp:FileUpload ID="filReport" runat="server" Width="450px" />
                        <asp:RequiredFieldValidator ID="valFileRequired" Display="Dynamic" runat="server"
                            ControlToValidate="filReport" ErrorMessage="Please choose a file to upload" ToolTip="Please choose a file to upload"
                            Text=" *"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="valFileMustBePdf" runat="server" ErrorMessage="Please choose a PDF file to upload"
                            ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w.*))(\.pdf|\.PDF)$" ControlToValidate="filReport"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td style="height: 30px">
                        &nbsp;
                    </td>
                    <td>
                        <asp:CheckBox ID="cbPublic" Text="Make report public (this cannot be undone)" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td style="height: 30px">
                        &nbsp;
                    </td>
                    <td align="right">
                        <div style="text-align: right;">
                            <asp:Button ID="btnSave" runat="server" Text="OK" OnClick="btnSave_Click" />&nbsp;<asp:Button
                                ID="btnCancel" runat="server" Text="Cancel" CausesValidation="False" OnClick="btnCancel_Click" /></div>
                    </td>
                </tr>
            </table>
        </div>
    </asp:Panel>
    <div>
        <br />
        <a href="PDF/DataQualityStatement_D2R2.pdf" id="PDFlink" style="color: Blue">D2R2 Quality
            Statement</a>
    </div>
</asp:Content>
