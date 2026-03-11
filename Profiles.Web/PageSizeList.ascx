<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="PageSizeList.ascx.vb" Inherits="Profiles.Web.PageSizeList" %>

<div class="mt-2 mb-2">
    <div class="float-end">
        <asp:Label runat="server" AssociatedControlID="ddlPagSize" Text="Items per page:" CssClass="me-2 govuk-label d-inline" />
        <asp:DropDownList
            class="me-1 govuk-select"
            ID="ddlPagSize"
            runat="server"
            AutoPostBack="True"
            CausesValidation="false"
            OnSelectedIndexChanged="ddlPagSize_SelectedIndexChanged"
            Style="min-width: auto;">
        </asp:DropDownList>
    </div>
</div>
