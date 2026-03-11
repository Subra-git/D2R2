<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false"
    CodeFile="Notes.aspx.vb" Inherits="Notes" Title="Profile references" %>

<%@ Register Src="ProfileSectionLinks.ascx" TagName="SectionLinks" TagPrefix="sec" %>
<asp:Content ID="navContent" ContentPlaceHolderID="cphNavigation" runat="Server">
    <sec:SectionLinks ID="ctlSectionLinks" runat="server" />
</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" runat="Server">
    <div style="float: left; width: 100%">
        <asp:UpdatePanel ID="updNotes" runat="server">
            <ContentTemplate>
                <div style="margin-bottom: 10px; width: 100%">
                    <asp:Label ID="lblNoteType" runat="server" Text="Select a reference type: "></asp:Label>
                    <asp:DropDownList ID="ddlNoteType" runat="server" CausesValidation="True" AutoPostBack="True"
                        DataSourceID="dsNoteTypeInfoList" DataTextField="PluralName" DataValueField="Id"
                        AppendDataBoundItems="true">
                        <asp:ListItem Text="Please select..." Value="0"></asp:ListItem>
                    </asp:DropDownList>
                    <csla:CslaDataSource ID="dsNoteTypeInfoList" runat="server" TypeAssemblyName="ProfilesLibrary"
                        TypeName="ProfilesLibrary.NoteTypeInfoList">
                    </csla:CslaDataSource>
                </div>
                <div class="ErrorLabel">
                     <asp:Literal ID="litError" runat="server" EnableViewState="false" ></asp:Literal>
                </div>                                                       
                <div id="divNoteHeader" class="collapsePanelHeader" runat="server" visible="false">
                </div>
                <asp:Panel runat="server" class="collapsePanel" ID="pnlNotes" Visible="false">
                      <asp:Panel runat="server" ID="pnlAddNote">
                        <asp:Label runat="server" ID="lblAddNote"></asp:Label>
                        <asp:Button ID="btnNewNote" runat="server" Text="Add"></asp:Button>
                        <br />
                        <br />
                    </asp:Panel>
                    <pwc:GridView ID="grdNotes" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                        Width="100%" AllowSorting="True" GridLines="None" CssClass="gridview" DefaultSortExpression="NoteText"
                        DataSourceID="dsNoteList" >
                        <Columns>
                            <asp:BoundField DataField="NoteText" SortExpression="NoteText" ItemStyle-Width="500"
                                HeaderText="References" />
                            <asp:BoundField DataField="QuestionReference" HeaderText="Question reference" SortExpression="QuestionReference"
                                ItemStyle-Width="200" />
                            <asp:ButtonField CommandName="EditNote" Text="Edit" ItemStyle-HorizontalAlign="NotSet"
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
                                <asp:ValidationSummary ID="valNoteSummary" DisplayMode="BulletList" runat="server"
                                    CssClass="ErrorLabel" />                                 
                            </p>
                            <p>
                                <asp:TextBox runat="server" ID="txtNote" TextMode="MultiLine" Rows="6" Width="95%"></asp:TextBox>
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
                                        <asp:Button ID="btnSaveNote" runat="server" Text="OK" />
                                        <asp:Button ID="btnCancelNote" runat="server" Text="Cancel" CausesValidation="False" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <csla:CslaDataSource ID="dsNoteList" runat="server" TypeAssemblyName="ProfilesLibrary"
                        TypeName="ProfilesLibrary.ProfileNoteList">
                    </csla:CslaDataSource>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
