<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="TreeSelection.ascx.vb" Inherits="Profiles.Web.TreeSelection" %>

<script type="text/javascript" src="./Javascript/profiles.js"></script>

<div id="selectedTextContainer" class="govuk-!-padding-bottom-15" style="display: none;" runat="server">
    <span id="selectedText" class="govuk-body">Selected: <strong><span id="selectedTextValue" runat="server"></span></strong></span>
</div>
<button type="button" id="removeSelectionButton" class="govuk-button govuk-button--secondary" aria-label="Remove selection" runat="server" onserverclick="removeSelectionButton_Click">
    Remove selection
</button>
<div id="selectionAnnouncement" class="govuk-visually-hidden" role="status" aria-live="polite" runat="server"></div>
