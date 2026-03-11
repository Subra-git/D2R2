<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="ConfirmDialog.ascx.vb" Inherits="Profiles.Web.ConfirmDialog" %>

<div id="confirmModal" runat="server" class="modal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content rounded-0 mx-auto ">
            <div class="modal-header">
                <h5 class="modal-title"><%= HeaderText %></h5>
            </div>
            <div class="modal-body">
                <%= ContentText() %>
            </div>
            <div class="modal-footer">
                <asp:Button runat="server"
                    ID="ok"
                    CssClass="govuk-button mb-0 me-2 ok-button"
                    OnClick="ok_Click" />

                <button class="govuk-button govuk-button--secondary mb-0 trigger-close cancel-button">Cancel</button>
            </div>
        </div>
    </div>
</div>
