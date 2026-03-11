<%@ Control Language="VB" AutoEventWireup="false" CodeFile="EditNoteUI.ascx.vb" Inherits="EditNoteUI" %>

<asp:Panel ID="panNote" runat="server" Visible="true">
    <div id="divNoteHeader" class="collapsePanelHeader" runat="server">
    </div>
    <div class="collapsePanel">        
        <div><asp:Label runat="server" ID="lblAddNote" ></asp:Label>
        <asp:Button ID="btnNewNote" runat="server" Text="Add" CausesValidation="false" ></asp:Button></div>
        <div><asp:Label runat="server" ID="lblSelectNote"></asp:Label>
        <asp:Button ID="btnSelectNote" runat="server" Text="Select" CausesValidation="false" /></div>
        <br />
        <br />
        <pwc:GridView ID="grdNotes" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            Width="100%" AllowSorting="True" GridLines="None" CssClass="gridview" DefaultSortExpression="NoteText"
            DataSourceID="dsNoteListBySection">
            <Columns>
                <asp:BoundField DataField="NoteText" SortExpression="NoteText" ItemStyle-Width="500"
                    HeaderText="References" />
                <asp:BoundField DataField="QuestionReference" HeaderText="Question reference" SortExpression="QuestionReference"
                    ItemStyle-Width="200" />
                <asp:ButtonField CommandName="EditNote" Text="View" ItemStyle-HorizontalAlign="NotSet"
                    ItemStyle-VerticalAlign="NotSet" ItemStyle-Width="70" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton CommandName="DeleteNote" runat="server" ID="lnkDeleteNote">Delete</asp:LinkButton>
                        <act:ConfirmButtonExtender ID="cbeDelete" runat="server" TargetControlID="lnkDeleteNote" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="gridviewHeader" />
            <RowStyle CssClass="gridviewRow" />
            <AlternatingRowStyle CssClass="gridviewAltRow" />
        </pwc:GridView>
        <br />
        <asp:Panel ID="pnlNote" runat="server" Visible="false">
            <div id="divAddEditNoteTitle" class="collapsePanelHeader" runat="server">
            </div>
            <div class="collapsePanel">
                <p>                    
                    <asp:Label ID="lblNote" runat="server" Text="Select a reference: "></asp:Label>
                    <asp:DropDownList ID="ddlNotes" runat="server" DataSourceID="dsAvailableNoteList"
                        DataTextField="NoteTextSlim" DataValueField="Id" AppendDataBoundItems="true" AutoPostBack="true" >
                        <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
                    </asp:DropDownList>                   
                    <asp:TextBox runat="server" ID="txtNote" TextMode="MultiLine" Rows="6" Width="95%" Enabled="false" 
                    BackColor="White" BorderColor="Black" BorderWidth="1px" ></asp:TextBox>                                                          
                    <asp:RequiredFieldValidator ID="rfvNote" Display="Dynamic" runat="server" ControlToValidate="ddlNotes"
                                    ErrorMessage="Please select a reference" Text=" *" ToolTip="Please select a reference"
                                    Enabled="False"></asp:RequiredFieldValidator>
                    <asp:UpdatePanel ID="updShowNoteText" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false" >
                        <ContentTemplate>
                            <br />
                            <asp:TextBox runat="server" ID="txtCurrentNote" TextMode="MultiLine" Rows="6" Width="95%" Enabled="false" 
                        BackColor="White" BorderColor="Black" BorderWidth="1px" ></asp:TextBox>                                                          
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ddlNotes" EventName="SelectedIndexChanged" />
                        </Triggers>
                    </asp:UpdatePanel>                    
                    <csla:CslaDataSource ID="dsAvailableNoteList" runat="server" TypeAssemblyName="ProfilesLibrary"
                        TypeName="ProfilesLibrary.NoteList">
                    </csla:CslaDataSource>
                </p>
                <div>
                    Question references:</div>
                <br />
                <p>
                    <asp:Panel ID="pnlQuestionReferences" runat="server" Visible="true">
                    </asp:Panel>
                </p>
                <table width="100%">
                    <tr>
                        <td style="height: 30px">                            
                            <asp:Panel runat="server" ID="pnlCheckUncheckAll">
                                <asp:Button ID="btnCheckAll" runat="server" Text="Tick all" CausesValidation="false" />&nbsp;<asp:Button
                                    ID="btnUncheckAll" runat="server" Text="Untick all" CausesValidation="false" />
                            </asp:Panel>
                        </td>
                        <td align="right">
                            <div style="text-align: right;">
                                <asp:Button ID="btnSaveNote" runat="server" Text="OK" />
                                <asp:Button ID="btnCancelNote" runat="server" Text="Cancel" CausesValidation="False" />
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
