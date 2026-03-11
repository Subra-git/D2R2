<%@ Page Language="VB" MasterPageFile="~/NestedProfileQuestions.master" AutoEventWireup="false" Inherits="Profiles.Web.Notes" Title="Profile references" Codebehind="Notes.aspx.vb" %>
<%@ Register Src="Paginator.ascx" TagName="Paginator" TagPrefix="auc" %>
<%@ Register Src="~/PaginatorPageSize.ascx" TagPrefix="auc" TagName="PaginatorPageSize" %>

<asp:Content ID="NestedProfileContent" ContentPlaceHolderID="NestedProfileContent" runat="Server">
   <script src="Javascript/edit-profile-questions.js"></script>
    <div style="float: left; width: 100%">
        <br />
        <asp:UpdatePanel ID="updNotes" runat="server">
            <ContentTemplate>
                <div style="margin-bottom: 10px; width: 100%">
                    <div class="d-flex align-items-center">
                    <asp:Label ID="lblNoteType" CssClass="govuk-label mb-0 me-2" AssociatedControlID="ddlNoteType" runat="server" Text="Select a reference type: "></asp:Label>
                    <asp:DropDownList ID="ddlNoteType" CssClass="govuk-select m-0" runat="server" CausesValidation="True" AutoPostBack="True"
                        DataSourceID="dsNoteTypeInfoList" DataTextField="PluralName" DataValueField="Id"
                        AppendDataBoundItems="true">
                        <asp:ListItem Text="Please select..." Value="0"></asp:ListItem>
                    </asp:DropDownList>
                    </div>
                    <csla:CslaDataSource ID="dsNoteTypeInfoList" runat="server" TypeAssemblyName="ProfilesLibrary"
                        TypeName="ProfilesLibrary.NoteTypeInfoList">
                    </csla:CslaDataSource>
                </div>
                <div class="ErrorLabel">
                     <asp:Literal ID="litError" runat="server" EnableViewState="false"></asp:Literal>
                </div>                                                       
                <div id="divNoteHeader" runat="server" visible="false">
                    <span ID="divNoteHeaderText" Class="referencePanelHeader" runat="server"/>
                </div>
                <asp:Panel runat="server" ID="pnlNotes" Visible="false">
                    <div class="row">
                        <div class="justify-content-end mt-2 mb-2">
                            <div class="float-start">
                                <asp:Panel runat="server" CssClass="d-flex align-items-center" ID="pnlAddNote">
                                    <asp:Label runat="server" CssClass="govuk-label me-2 mb-0" AssociatedControlID="btnNewNote" ID="lblAddNote"></asp:Label>
                                    <asp:Button ID="btnNewNote" runat="server" Text="Add" CssClass="govuk-button govuk-button--secondary m-0"></asp:Button>
                                    <br />
                                </asp:Panel>
                            </div>
                             <auc:PaginatorPageSize runat="server" ID="PaginatorPageSize" PaginatorId="bottomPaginator" GridId="grdNotes" />
                        </div>
                    </div>
                    <pwc:GridViewExternalPaging ID="grdNotes" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                        Width="100%" AllowSorting="True" GridLines="None" CssClass="gridview" aria-label="This table displays references for this disease profile, click the references link header to sort the references alphabetically, click the Question reference link header to sort the references by question" DefaultSortExpression="NoteTextPlainText"
                        DataSourceID="dsNoteList" >
                        <Columns>
                            <asp:BoundField DataField="NoteText" SortExpression="NoteTextPlainText"
                                HeaderText="References" HtmlEncode="false" ItemStyle-Width="60%" />
                            <asp:BoundField DataField="QuestionReference" HeaderText="Question reference" SortExpression="QuestionReference"
                                 ItemStyle-Width="30%" />
                            
                            <asp:ButtonField CommandName="EditNote" Text="Edit" ItemStyle-HorizontalAlign="NotSet"
                                ItemStyle-VerticalAlign="NotSet" ItemStyle-Width="5%"/>

                            <asp:ButtonField CommandName="DeleteNote" Text="Delete" ItemStyle-HorizontalAlign="NotSet"
                                ItemStyle-VerticalAlign="NotSet" ItemStyle-Width="5%"/>

                            
                           
                        </Columns>
                        <HeaderStyle CssClass="gridviewHeader" />
                        <RowStyle CssClass="gridviewRow" />
                        <AlternatingRowStyle CssClass="gridviewAltRow" />
                    </pwc:GridViewExternalPaging>
                    <br />
                    <div class=" pb-4">
                        <auc:Paginator runat="server" ID="bottomPaginator"></auc:Paginator>
                    </div>
                    <asp:Panel ID="pnlNote" runat="server" Visible="false">
                        <asp:Label CssClass="collapsePanelHeader-noPointer" id="labelAddEditNoteTitle" AssociatedControlID="txtNote" runat="server"/>
                        <div>
                            <p>
                                <asp:ValidationSummary ID="valNoteSummary" DisplayMode="BulletList" runat="server"
                                    CssClass="ErrorLabel" />                                 
                            </p>
                            <p>
                                <asp:TextBox runat="server" ID="txtNote" TextMode="MultiLine" Rows="6" Width="95%" Enabled="false" 
                                    BackColor="White" BorderColor="Black" BorderWidth="1px" CssClass="HiddenInput"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="valNote" runat="server" ControlToValidate="txtNote" ErrorMessage="You must enter the profile reference text or press cancel."
                                    Height="26px">*</asp:RequiredFieldValidator>
                                <asp:CustomValidator runat="server" ID="valCusNote" ControlToValidate="txtNote" EnableClientScript="false" ErrorMessage="An identical reference already exists on the master list.">*</asp:CustomValidator>
                            </p>
                        </div>
                        <table width="100%">
                            <tr>
                                <td style="height: 30px">
                                </td>
                                <td align="right">
                                    <div style="text-align: right;">
                                        <asp:Button ID="btnSaveNote" runat="server" Text="OK" cssclass="govuk-button" OnClientClick="tinyMCE.triggerSave(false,true)"/>
                                        <asp:Button ID="btnCancelNote" runat="server" Text="Cancel" CausesValidation="False" cssclass="govuk-button govuk-button--secondary"/>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <csla:CslaDataSource ID="dsNoteList" runat="server" TypeAssemblyName="ProfilesLibrary"
                        TypeName="ProfilesLibrary.ProfileNoteList">
                    </csla:CslaDataSource>
                </asp:Panel>
                </br>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
