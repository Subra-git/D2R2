
<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false" Inherits="Profiles.Web.StaticReports" Title="General reports" Codebehind="StaticReports.aspx.vb" %>

<%@ Register Src="NavigationLinks.ascx" TagName="NavigationLinks" TagPrefix="nav" %>
<%@ Register Src="Paginator.ascx" TagName="Paginator" TagPrefix="auc" %>
<%@ Register Src="~/PaginatorPageSize.ascx" TagPrefix="auc" TagName="PaginatorPageSize" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" runat="Server">
    <asp:Literal runat="server" ID="litStaticReports">
    <div style="float:left">
        Below is the list of general reports that have been created for publication on this website. These reports have been generated from
        information held within the D2R2 Database. If you want a standard report on a specific disease (i.e. the summary prioritisation report,
        summary report or the Q&A) then these can be located via the search disease profiles link. If the report you are seeking is not one of
        these three and is not listed below then please contact us using the following email address:
        <a class="govuk-link" href='mailto:D2R2@defra.gov.uk'>D2R2@defra.gov.uk</a>
        <br /><br /> 
    </div>    
    </asp:Literal>

    <asp:Literal runat="server" ID="litGeneralReportHistory" Visible="false">
    <div style="float:left">
        Below is the list of published versions of this report. These reports have been generated from information held within the D2R2 Database.
       <br /><br /> 
    </div>
    </asp:Literal>

    <asp:Literal runat="server" ID="litUserManuals" Visible="false">
    <div style="float:left">
        Below is a list of manuals for using D2R2. Each manual has been tailored according to the particular privileges that you may have as
        a user of D2R2. Please click on the title of any of the manuals to open the document. If you have any general questions or 
        suggestions for improving the system, then you can contact us using the following email address: <a class="govuk-link" href='mailto:D2R2@defra.gov.uk'>D2R2@defra.gov.uk</a>.
        <br /><br /> 
        If you are experiencing any problems with the system, then you can contact the APHA ITU helpdesk at <a class="govuk-link" href='mailto:aphaservicedesk@apha.gov.uk'>aphaservicedesk@apha.gov.uk</a>.
        <br />
        <i>N.B. This service is not provided on UK Bank Holidays.</i>
       <br /><br /> 
    </div>
    </asp:Literal>

    <asp:Literal runat="server" ID="litHelpReportHistory" Visible="false">
    <div style="float:left">
        Below is a list of published versions of this user manual. These manuals have been created to help D2R2 users. 
        If you have any suggestions for improving the manual system, then you can contact us using the following email address: 
        <a class="govuk-link" href='mailto:D2R2@defra.gov.uk'>D2R2@defra.gov.uk</a>
       <br /><br /> 
    </div>
    </asp:Literal>
    <br />
    <div style="clear: both;">
    </div>

    <asp:UpdatePanel ID="updatePanelReport" runat="server">
        <ContentTemplate>
            <div class="row">
                <auc:PaginatorPageSize runat="server" id="PaginatorPageSize" PaginatorId="bottomPaginator" GridId="grdReports" />
            </div>
            <pwc:GridViewExternalPaging ID="grdReports" runat="server" DefaultSortExpression="Title" EmptyDataText="There are no reports to display."
                AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="gridview"
                GridLines="None" DataSourceID="dsStaticReportList" Width="100%" 
                aria-label="Click the link headers in this table to sort the table by that column in ascending or descending order">
                <Columns>
                    <asp:TemplateField HeaderText="Title" SortExpression="Title" >
                        <ItemStyle Width="300px" />
                        <ItemTemplate>
                            <asp:HyperLink ID="lnkViewStaticReportVersion" runat="server" NavigateUrl="#" Text='<%# Eval("Title") %>'></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Version" HeaderText="Version" SortExpression="VersionSortValue">
                        <ItemStyle/>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Public?" SortExpression="IsPublic">
                        <ItemStyle/>
                        <ItemTemplate>
                            <%#IIf(Boolean.Parse(Eval("IsPublic").ToString()), "Yes", "No")%></ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField ReadOnly="True" DataField="EffectiveDates" HeaderText="Effective dates"
                        SortExpression="EffectiveDateFrom">
                        <ItemStyle/>
                    </asp:BoundField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:HyperLink ID="lnkHistory" runat="server" Text='History'></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton 
                                CommandName="Delete"
                                runat="server" 
                                ID="lnkDeleteReport"
                                CommandArgument='<%#Eval("Id") %>'
                                OnClientClick="apha.confirmPrompt('Are you sure you want to delete this report?', this); return false">Delete</asp:LinkButton>

                             <asp:LinkButton 
                                CommandName="Delete"
                                runat="server" 
                                ID="lnkDeleteManual"
                                CommandArgument='<%#Eval("Id") %>'
                                OnClientClick="apha.confirmPrompt('Are you sure you want to delete this user manual?', this); return false">Delete</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton 
                                ID="lnkChangeAccess" 
                                runat="server" 
                                CommandName="changeaccess"
                                CommandArgument='<%#Eval("Id") %>'
                                Text="Make public" 
                                OnClientClick="apha.confirmPrompt('Are you sure you want to make this report public (this cannot be undone)?', this); return false"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <RowStyle CssClass="gridviewRow"></RowStyle>
                <HeaderStyle CssClass="gridviewHeader"></HeaderStyle>
                <AlternatingRowStyle CssClass="gridviewAltRow"></AlternatingRowStyle>
            </pwc:GridViewExternalPaging>
            <csla:CslaDataSource ID="dsStaticReportList" runat="server" TypeAssemblyName="ProfilesLibrary"
                TypeName="ProfilesLibrary.StaticReportList">
            </csla:CslaDataSource>
            <asp:Label ID="lblReportMessage" runat="server" CssClass="ErrorLabel" EnableViewState="False"></asp:Label>
            <br /> 
            <div class=" pb-4">
              <auc:Paginator runat="server" ID="bottomPaginator"></auc:Paginator>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" CssClass="govuk-button"></asp:Button><br />
    <br />
    <asp:Panel ID="pnlReportUpload" runat="server" Visible="False">
            <asp:Label ID="lblUpload" runat="server" Text="Upload a static report"></asp:Label>
        <div class="collapsePanel">
            <table width="100%">
                <tr>
                    <td style="width: 20%">
                        <asp:Label ID="lblFile" AssociatedControlID="filReport" runat="server" Text="Report file:"></asp:Label>
                    </td>
                    <td style="width: 80%">
                        <asp:FileUpload ID="filReport" CssClass="govuk-file-upload" runat="server"/>
                        <asp:RequiredFieldValidator ID="valFileRequired" Display="Dynamic" runat="server"
                            ControlToValidate="filReport" ErrorMessage="Please choose a file to upload" ToolTip="Please choose a file to upload"
                            Text=" *"></asp:RequiredFieldValidator>
                        <%--<asp:RegularExpressionValidator ID="valFileMustBePdf" runat="server" ErrorMessage="Please choose a PDF file to upload"
                          ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w.*))(\.pdf|\.PDF)$" ControlToValidate="filReport"></asp:RegularExpressionValidator>--%>
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
                            <asp:Button ID="btnSave" runat="server" Text="OK" OnClick="btnSave_Click" CssClass="govuk-button" />&nbsp;<asp:Button
                                ID="btnCancel" runat="server" Text="Cancel" CausesValidation="False" OnClick="btnCancel_Click" CssClass="govuk-button govuk-button--secondary"/></div>
                    </td>
                </tr>
            </table>
        </div>
    </asp:Panel>
</asp:Content>
