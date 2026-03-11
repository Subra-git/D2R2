<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="TreeViewToggleButton.ascx.vb" Inherits="Profiles.Web.TreeViewToggleButton" %>

<button type="button" 
        class="radtreeview-tree-toggle govuk-!-margin-bottom-3"        
        runat="server" id="treeButton" tabindex="0">
    <span class="govuk-accordion__section-toggle-focus">
        <span class="govuk-accordion-nav__chevron" aria-hidden="true"></span>
        <span class="govuk-accordion__section-toggle-text radtreeview-toggle-text"></span>
    </span>
</button>

<input type="hidden" id="toggleStateHidden" runat="server" value="false" />
<div id="treeStatus" class="govuk-visually-hidden" role="status" aria-live="polite" runat="server"></div>