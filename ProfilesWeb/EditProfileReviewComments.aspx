<%@ Page Language="VB" MasterPageFile="~/ProfilesTemplate.master" AutoEventWireup="false" CodeFile="EditProfileReviewComments.aspx.vb" Inherits="EditProfileReviewComments" title="View/edit profile" %>
<%@ Register Src="ProfileSectionLinks.ascx" TagName="SectionLinks" TagPrefix="sec" %>

<asp:Content ID="navContent" ContentPlaceHolderID="cphNavigation" Runat="Server">
    <sec:SectionLinks ID="ctlSectionLinks" runat="server" />
</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="cphMain" Runat="Server">

    <div style="height: 50px"> &nbsp;</div>
    
    <pwc:TabStrip ID="tabStrip" runat="server" >
			<pwc:TabItem IsActive="false" Text="SectionName" />
			<pwc:TabItem IsActive="false" Text="References" />
			<pwc:TabItem IsActive="false" Text="Further information" />
			<pwc:TabItem IsActive="true" Text="Review comments" />
			<pwc:TabItem IsActive="false" Text="Contributions" />
			<pwc:TabItem IsActive="false" Text="Revision dates" />
			<pwc:TabItem IsActive="false" Text="All Revision dates" />
    </pwc:TabStrip>
    
    <div class="TabBody">
        <asp:UpdatePanel runat="server" ID="panReviewComments" UpdateMode="Conditional" ChildrenAsTriggers="true">
            <ContentTemplate>
            <!-- review comments -->
                <div class="collapsePanelHeader">Review comments</div>  
                <div class="collapsePanel">
                    <br />
                    <asp:ValidationSummary id="valReviewCommentsSummary" DisplayMode="BulletList" runat="server" HeaderText="The following errors have occurred:" CssClass="ErrorLabel"/> 
                    <p><asp:Label ID="lblErrorReviewComments" runat="server" cssClass="ErrorLabel" EnableViewState="false"></asp:Label></p>
                        <asp:Label runat="server" Id="lblAddReviewComments" Text="Add a review comment:"></asp:Label>
                        <asp:Button ID="btnNewReviewComment" runat="server" Text="Add"></asp:Button>
                        <br />
                        <br />
                    <pwc:GridView ID="grdReviewComments" runat="server" AllowPaging="True" EmptyDataText="There are no review comments to display." AutoGenerateColumns="False"
                DataSourceID="dsReviewCommentList" Width="100%" GridLines="None" CssClass="gridview">
                        <Columns>
                            <asp:TemplateField HeaderText="Subject" ItemStyle-Width="65%">
                                <ItemTemplate>
                                    <div nowrap="nowrap">
                                        <asp:Label runat="server" Text='<%# IndentSubject(CInt(Eval("Level"))) %>' id="lblCommentIndent"></asp:Label>
                                        <asp:LinkButton ID="lnkViewComment" runat="server" Text='<%# FormatSubject(CStr(Eval("CommentSubject"))) %>' CommandName="ViewReviewComment"></asp:LinkButton>
                                        <asp:Label runat="server" Text="new!" cssClass="ErrorLabel" Id="lblCommentNew" Visible='<%# CDate(Eval("CommentDate")).AddDays(1) > Now() %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="CommentReference" HeaderText="Reference" SortExpression="CommentReference" /> 
                            <asp:BoundField DataField="UserFullName" HeaderText="Reviewer" SortExpression="UserFullName" ItemStyle-Wrap="false" />
                            <asp:BoundField DataField="CommentDate" HeaderText="Date" SortExpression="CommentDate" DataFormatString="{0:dd/MM/yy HH:mm:ss}" HtmlEncode="false" ItemStyle-Wrap="false" /> 
                        </Columns>
                            <HeaderStyle CssClass="gridviewHeader" />
                            <RowStyle CssClass="gridviewRow" />
                            <AlternatingRowStyle CssClass="gridviewAltRow" />
                        </pwc:GridView>
                        <br />
                        <asp:Panel ID="pnlViewReviewComment" runat="server" Visible="false">
                            <div class="collapsePanelHeader"><asp:Label ID="lblViewPanelHeader" runat="server">View review comment</asp:Label></div>  
                            <div class="collapsePanel">
                                <p>
                                    Subject<br />
                                    <asp:Literal ID="litCommentSubject" runat="server"></asp:Literal> 
                                </p>
                                <p>
                                    Reference<br />
                                    <asp:Literal ID="litCommentReference" runat="server"></asp:Literal> 
                                </p>
                                <p>
                                    Comment<br />
                                    <asp:Literal ID="litComment" runat="server"></asp:Literal> 
                                </p>
                                <p style="text-align:right">
                                    <asp:Button ID="btnReplyReviewComment" runat="server" Text="Reply" CausesValidation="False" />
                                    <asp:Button ID="btnEditReviewComment" runat="server" Text="Edit"  CausesValidation="False" />
                                    <asp:Button ID="btnDeleteReviewComment" runat="server" Text="Delete" CausesValidation="False" />
                                    <act:ConfirmButtonExtender ID="cbeDelete" runat="server" TargetControlID="btnDeleteReviewComment" ConfirmText="Are you sure you want to delete this review comment?" />
                                    <asp:Button ID="btnCloseReviewComment" runat="server" Text="Close" CausesValidation="False" />
                                </p>
                            </div>
                        </asp:Panel>
                        <asp:Panel ID="pnlReviewComment" runat="server" Visible="false">
                            <div class="collapsePanelHeader"><asp:Label ID="lblPanelHeader" runat="server">Add/edit review comment</asp:Label></div>  
                            <div class="collapsePanel">
                                <p>
                                    Subject<br />
                                    <asp:TextBox runat="server" ID="txtCommentSubject" MaxLength="255" Width="95%"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="valCommentSubject" runat="server" ControlToValidate="txtCommentSubject" height="26px" ErrorMessage="You must enter a subject or cancel" ToolTip="Please enter a subject or press cancel">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="valCommentSubjectMaxLength" runat="server" ControlToValidate="txtCommentSubject" height="26px" ValidationExpression="^(.|\255){0,255}$" ErrorMessage="A subject must be no longer than 255 characters" ToolTip="A subject must be no longer than 255 characters">*</asp:RegularExpressionValidator>
                                </p>
                                <p>
                                    Reference<br />
                                    <asp:TextBox runat="server" ID="txtCommentReference" MaxLength="255" Width="95%"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="valCommentReference" runat="server" ControlToValidate="txtCommentReference" height="26px" ErrorMessage="You must enter a reference or cancel" ToolTip="Please enter a reference or press cancel">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="valCommentReferenceMaxLength" runat="server" ControlToValidate="txtCommentReference" height="26px" ValidationExpression="^(.|\255){0,255}$" ErrorMessage="A reference must be no longer than 255 characters" ToolTip="A reference must be no longer than 255 characters">*</asp:RegularExpressionValidator>
                                </p>
                                <p>
                                    Comment<br />
                                    <asp:TextBox runat="server" ID="txtComment" TextMode="MultiLine" Rows="6" Width="95%" style="position:relative; margin:0px;"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="valComment" runat="server" ControlToValidate="txtComment" height="26px" ErrorMessage="You must enter a comment or cancel" ToolTip="Please enter a comment or press cancel">*</asp:RequiredFieldValidator>
                                </p>
                                <p>
                                     <pwc:SpellCheck runat="server" ID="spellUserGuidance" ControlToCheck="txtComment"/>
                                </p>
                                <p style="text-align:right">
                                    <asp:Button ID="btnSaveReviewComment" runat="server" Text="OK" />
                                    <asp:Button ID="btnCancelReviewComment" runat="server" Text="Cancel" CausesValidation="False" />
                                </p>
                            </div>
                        </asp:Panel>
                        <csla:CslaDataSource ID="dsReviewCommentList" runat="server" TypeAssemblyName="ProfilesLibrary" TypeName="ProfilesLibrary.ProfileNoteList">
                        </csla:CslaDataSource>
                           
                </div>
             </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>


