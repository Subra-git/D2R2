<%@ Control Language="VB" AutoEventWireup="false" Inherits="Profiles.Web.EditNoteUI" Codebehind="EditNoteUI.ascx.vb" %>

<%@ Register Src="Paginator.ascx" TagName="Paginator" TagPrefix="auc" %>
<%@ Register Src="~/PaginatorPageSize.ascx" TagPrefix="auc" TagName="PaginatorPageSize" %>
<asp:Panel ID="panNote" runat="server" Visible="true">
    <div class="collapsePanel">        
        <div>
            <div class="d-flex align-items-center">
                <asp:Label runat="server" CssClass="govuk-label me-2 mb-0 d-inline" ID="lblAddNote" ></asp:Label>
                <asp:Button ID="btnNewNote" runat="server" Text="Add" CausesValidation="false" CssClass="govuk-button govuk-button--secondary m-0"></asp:Button>
            </div>
            <div class="d-flex align-items-center">
                <asp:Label runat="server" CssClass="govuk-label me-2 mb-0 d-inline" ID="lblSelectNote"></asp:Label>
                <asp:Button ID="btnSelectNote" runat="server" Text="Select" CausesValidation="false" CssClass="govuk-button govuk-button--secondary m-0"/>
            </div>
        </div>

        <auc:PaginatorPageSize runat="server" id="PaginatorPageSize" PaginatorId="bottomPaginator" GridId="grdNotes" />

        <pwc:GridViewExternalPaging ID="grdNotes" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            Width="100%" AllowSorting="True" GridLines="None" CssClass="gridview" DefaultSortExpression="NoteTextPlainText"
            DataSourceID="dsNoteListBySection">
            <Columns>
                <asp:BoundField DataField="NoteText" SortExpression="NoteTextPlainText" ItemStyle-Width="500"
                    HeaderText="References" HtmlEncode="false" />

                <asp:BoundField DataField="QuestionReference" HeaderText="Question reference" SortExpression="QuestionReference"
                    ItemStyle-Width="200" />

                <asp:ButtonField CommandName="EditNote" Text="View" ItemStyle-HorizontalAlign="NotSet"
                    ItemStyle-VerticalAlign="NotSet" ItemStyle-Width="70" />

                 <asp:ButtonField CommandName="DeleteNote" Text="Delete" ItemStyle-HorizontalAlign="NotSet"
                    ItemStyle-VerticalAlign="NotSet" ItemStyle-Width="70" />
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

            <div class="collapsePanel">
                <asp:Label id="lblAddEditNoteTitle" AssociatedControlID="txtNote" CssClass="govuk-label fw-bold" runat="server"/>
                <div id="divAddEditNoteTitle" class="govuk-label fw-bold" runat="server"/>         
                <div class="d-flex align-items-center">
                    <asp:Label ID="lblNote" runat="server" Text="Select a reference: " CssClass="govuk-label me-2 mb-0 fw-bold"></asp:Label>
                    <asp:DropDownList ID="ddlNotes" CssClass="govuk-select" runat="server" DataSourceID="dsAvailableNoteList"
                     DataTextField="NoteTextPlainTextSlim" DataValueField="Id" AppendDataBoundItems="true" AutoPostBack="true" >
                    <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
                    </asp:DropDownList>
                </div>

                    <asp:TextBox runat="server" ID="txtNote" TextMode="MultiLine" Rows="6" Width="95%" Enabled="false" 
                    BackColor="White" BorderColor="Black" BorderWidth="1px" CssClass="HiddenInput"></asp:TextBox>
                    <span id="txtNoteSpan" runat="server" visible="false" class="govuk-label"></span>
                    <asp:RequiredFieldValidator ID="rfvNote" Display="Dynamic" runat="server" ControlToValidate="ddlNotes"
                                    ErrorMessage="Please select a reference" Text=" *" ToolTip="Please select a reference"
                                    Enabled="False"></asp:RequiredFieldValidator>
                    <asp:UpdatePanel ID="updShowNoteText" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false" >
                        <ContentTemplate>
                            <br />
                            <span runat="server" id="txtCurrentNoteSpan" class="govuk-label"></span>
                            <br />
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ddlNotes" EventName="SelectedIndexChanged" />
                        </Triggers>
                    </asp:UpdatePanel>                    
                    <csla:CslaDataSource ID="dsAvailableNoteList" runat="server" TypeAssemblyName="ProfilesLibrary"
                        TypeName="ProfilesLibrary.NoteList">
                    </csla:CslaDataSource>
                
                <div class="fw-bold govuk-label">
                    Question references:</div>
                <br />
                <p>
                    <asp:Panel ID="pnlQuestionReferences" runat="server" Visible="true">
                    </asp:Panel>
                </p>
                <table width="100%" class="question-references">
                    <tr>
                        <td style="height: 30px">                            
                            <asp:Panel runat="server" ID="pnlCheckUncheckAll">
                                <asp:Button ID="btnCheckAll" runat="server" Text="Tick all" CausesValidation="false" CssClass="govuk-button govuk-button--secondary" OnClientClick="tinyMCE.triggerSave(false,true);"/>&nbsp;<asp:Button
                                    ID="btnUncheckAll" runat="server" Text="Untick all" CausesValidation="false" CssClass="govuk-button govuk-button--secondary" OnClientClick="tinyMCE.triggerSave(false,true);"/>
                            </asp:Panel>
                        </td>
                        <td align="right">
                            <div style="text-align: right;">
                                <asp:Button ID="btnSaveNote" runat="server" Text="OK" CssClass="govuk-button" OnClientClick="tinyMCE.triggerSave(false,true);" />
                                <asp:Button ID="btnCancelNote" runat="server" Text="Cancel" CausesValidation="False" CssClass="govuk-button govuk-button--secondary"/>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </asp:Panel>
        <csla:CslaDataSource ID="dsNoteListBySection" runat="server" TypeAssemblyName="ProfilesLibrary"
            TypeName="ProfilesLibrary.ProfileNoteList">
        </csla:CslaDataSource>
    </div>
</asp:Panel>
