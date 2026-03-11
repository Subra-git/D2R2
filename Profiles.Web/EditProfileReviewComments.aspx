<%@ Page Language="VB" MasterPageFile="~/NestedProfileQuestions.master" AutoEventWireup="false" Inherits="Profiles.Web.EditProfileReviewComments" title="View/edit profile" Codebehind="EditProfileReviewComments.aspx.vb" %>
<%@ Register Src="ProfileSectionLinks.ascx" TagName="SectionLinks" TagPrefix="sec" %>
<%@ Register Src="~/SectionPagination.ascx" TagPrefix="pag" TagName="SectionPagination" %>
<%@ Register Src="Paginator.ascx" TagName="Paginator" TagPrefix="auc" %>
<%@ Register Src="~/PaginatorPageSize.ascx" TagPrefix="auc" TagName="PaginatorPageSize" %>

<asp:Content ID="NestedProfileContent" ContentPlaceHolderID="NestedProfileContent" Runat="Server">

    <div style="height: 50px"> &nbsp;</div>
    
    <pwc:TabStrip ID="tabStrip" runat="server" >
			<pwc:TabItem IsActive="false" Text="SectionName" />
			<pwc:TabItem IsActive="false" Text="References" />
			<pwc:TabItem IsActive="false" Text="Further information" />
			<pwc:TabItem IsActive="true" Text="Review comments" />
			<pwc:TabItem IsActive="false" Text="All Revision dates" />
			<pwc:TabItem IsActive="false" Text="Contributions" />
    </pwc:TabStrip>
    
    <div class="TabBody">
        <asp:Panel runat="server" ID="panReviewComments">
            <ContentTemplate>
            <!-- review comments -->
                <div class="collapsePanel">
                    <br />
                    <asp:ValidationSummary id="valReviewCommentsSummary" DisplayMode="BulletList" runat="server" HeaderText="The following errors have occurred:" CssClass="ErrorLabel"/> 
                    <p><asp:Label ID="lblErrorReviewComments" runat="server" cssClass="ErrorLabel" EnableViewState="false"></asp:Label></p>
                    <div class="d-flex align-items-center">
                        <asp:Label runat="server" CssClass="mb-0 me-2 govuk-label" Id="lblAddReviewComments" Text="Add a review comment:"></asp:Label>
                        <asp:Button ID="btnNewReviewComment" runat="server" Text="Add" CssClass="govuk-button govuk-button--secondary m-0"></asp:Button>
                    </div>

                    <div class="row">
                          <auc:PaginatorPageSize runat="server" id="PaginatorPageSize" PaginatorId="bottomPaginator" GridId="grdReviewComments" />
                    </div>
                    <pwc:GridViewExternalPaging ID="grdReviewComments" runat="server" AllowPaging="True" EmptyDataText="There are no review comments to display." AutoGenerateColumns="False"
                        DataSourceID="dsReviewCommentList" Width="100%" GridLines="None" CssClass="gridview">
                        <Columns>
                            <asp:TemplateField HeaderText="Subject" ItemStyle-Width="50%">
                                <ItemTemplate>
                                    <div nowrap="nowrap">
                                        <asp:Label runat="server" Text='<%# IndentSubject(CInt(Eval("Level"))) %>' id="lblCommentIndent"></asp:Label>
                                        <asp:LinkButton ID="lnkViewComment" runat="server" Text='<%# FormatSubject(CStr(Eval("CommentSubject"))) %>' CommandName="ViewReviewComment"></asp:LinkButton>
                                        <asp:Label runat="server" Text="new!" cssClass="ErrorLabel" Id="lblCommentNew" Visible='<%# CDate(Eval("CommentDate")).AddDays(1) > Now() %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="CommentReference" HeaderText="Reference" SortExpression="CommentReference" ItemStyle-Width="15%"/> 
                            <asp:BoundField DataField="UserFullName" HeaderText="Reviewer" SortExpression="UserFullName" ItemStyle-Wrap="false" ItemStyle-Width="15%"/>
                            <asp:BoundField DataField="CommentDate" HeaderText="Date and time" SortExpression="CommentDate" DataFormatString="{0:dd/MM/yy HH:mm:ss}" HtmlEncode="false" ItemStyle-Wrap="false" ItemStyle-Width="20%"/>
                        </Columns>
                            <HeaderStyle CssClass="gridviewHeader" />
                            <RowStyle CssClass="gridviewRow" />
                            <AlternatingRowStyle CssClass="gridviewAltRow" />
                        </pwc:GridViewExternalPaging>
                        <div class="paginatorDiv pb-4">
                            <auc:Paginator runat="server" ID="bottomPaginator"></auc:Paginator>
                        </div>
                        <br />
                        <asp:Panel ID="pnlViewReviewComment" runat="server" Visible="false">
                            <div class="collapsePanelHeader"><asp:Label ID="lblViewPanelHeader" runat="server">View review comment</asp:Label></div>  
                            <div class="collapsePanel">
                                <p>
                                    Subject<br />
                                </p>
                                <div class="read-only-singleline-editor">
                                    <asp:Literal ID="litCommentSubject" runat="server"></asp:Literal> 
                                </div>
                                <br />

                                <p>
                                    Reference<br />
                                </p>
                                <div class="read-only-singleline-editor">
                                    <asp:Literal ID="litCommentReference" runat="server"></asp:Literal> 
                                </div>
                                <br />

                                <p>
                                    Comment<br />
                                </p>
                                    <div class="read-only-multiline-editor">
                                        <asp:Literal ID="litComment" Mode="Transform" runat="server"></asp:Literal>  
                                        
                                    </div>
                                    <br />

                                <div style="float:right" class="mt-top govuk-button-group">
                                    <asp:Button ID="btnReplyReviewComment" runat="server" Text="Reply" CausesValidation="False"  CssClass="govuk-button"/>
                                    <asp:Button ID="btnEditReviewComment" runat="server" Text="Edit"  CausesValidation="False"  CssClass="govuk-button"/>

                                    <asp:Button 
                                        ID="btnDeleteReviewComment"
                                        runat="server" 
                                        Text="Delete" 
                                        CausesValidation="False" 
                                        CssClass="govuk-button govuk-button--warning"
                                        OnClientClick="apha.confirmPrompt('Are you sure you want to delete this review comment?', this); return false;"/>

                                    <asp:Button ID="btnCloseReviewComment" runat="server" Text="Close" CausesValidation="False"  CssClass="govuk-button govuk-button--secondary"/>
                                </div>
                            </div>
                        </asp:Panel>
                        <asp:Panel ID="pnlReviewComment" runat="server" Visible="false">
                            <div class="collapsePanelHeader"><asp:Label ID="lblPanelHeader" runat="server" CssClass="govuk-label fw-bold">Add/edit review comment</asp:Label></div>  
                            <div class="collapsePanel" style="padding: 4px">
                                <div>
                                    <asp:Label ID="lblCommentSubject" runat="server" AssociatedControlID="txtCommentSubject" CssClass="govuk-label" style="display: inline-block">Subject</asp:Label>
                                    <asp:RequiredFieldValidator ID="valCommentSubject" runat="server" ControlToValidate="txtCommentSubject" CssClass="ErrorLabel" style="display: inline-block; margin-bottom: 0px;" height="26px" ErrorMessage="You must enter a subject or cancel" ToolTip="Please enter a subject or press cancel">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="valCommentSubjectMaxLength" runat="server" ControlToValidate="txtCommentSubject" CssClass="ErrorLabel" style="display: inline-block; margin-bottom: 0px;" height="26px" ValidationExpression="^(.|\255){0,255}$" ErrorMessage="A subject must be no longer than 255 characters" ToolTip="A subject must be no longer than 255 characters">*</asp:RegularExpressionValidator>
                                    <asp:TextBox runat="server" ID="txtCommentSubject" MaxLength="255" Width="95%" CssClass="govuk-input"></asp:TextBox>
                                </div>
                                <br />
                                <div>
                                    <asp:Label ID="lblCommentReference" runat="server" AssociatedControlID="txtCommentReference" CssClass="govuk-label" style="display: inline-block">Reference</asp:Label>
                                    <asp:RequiredFieldValidator ID="valCommentReference" runat="server" ControlToValidate="txtCommentReference" CssClass="ErrorLabel" style="display: inline-block; margin-bottom: 0px;" height="26px" ErrorMessage="You must enter a reference or cancel" ToolTip="Please enter a reference or press cancel">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="valCommentReferenceMaxLength" runat="server" ControlToValidate="txtCommentReference" CssClass="ErrorLabel" style="display: inline-block; margin-bottom: 0px;" height="26px" ValidationExpression="^(.|\255){0,255}$" ErrorMessage="A reference must be no longer than 255 characters" ToolTip="A reference must be no longer than 255 characters">*</asp:RegularExpressionValidator>
                                    <asp:TextBox runat="server" ID="txtCommentReference" MaxLength="255" Width="95%" CssClass="govuk-input"></asp:TextBox>
                                </div>
                                <br />
                                <div>
                                    <asp:Label ID="lblCommentComment" runat="server" AssociatedControlID="txtComment" CssClass="govuk-label" style="display: inline-block">Comment</asp:Label>
                                    <asp:RequiredFieldValidator ID="valComment" runat="server" ControlToValidate="txtComment" CssClass="ErrorLabel" style="display: inline-block; margin-bottom: 0px;" height="26px" ErrorMessage="You must enter a comment or cancel" ToolTip="Please enter a comment or press cancel">*</asp:RequiredFieldValidator>
                                    <asp:TextBox runat="server" ID="txtComment" TextMode="MultiLine" Rows="6" CssClass="ErrorLabel" Width="95%" style="position:relative; margin:0px;"></asp:TextBox>
                                </div>
                                <br />
                                <div>
                                     <pwc:SpellCheck runat="server" ID="spellUserGuidance" IsClientID="true"/>
                                </div>
                                <div style="text-align:right">
                                    <asp:Button ID="btnSaveReviewComment" runat="server" Text="OK" CssClass="govuk-button" OnClientClick="tinyMCE.triggerSave(false,true)"/>
                                    <asp:Button ID="btnCancelReviewComment" runat="server" Text="Cancel" CausesValidation="False" CssClass="govuk-button govuk-button--secondary"/>
                                </div>
                            </div>
                        </asp:Panel>
                        <csla:CslaDataSource ID="dsReviewCommentList" runat="server" TypeAssemblyName="ProfilesLibrary" TypeName="ProfilesLibrary.ProfileNoteList">
                        </csla:CslaDataSource>
                           
                </div>
             </ContentTemplate>
        </asp:Panel>
    </div>
    <div class="SectionPaginationAdjuster">
        <pag:SectionPagination runat="server" ID="SectionPagination" />
    </div>
</asp:Content>


