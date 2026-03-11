<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="Accordion.ascx.vb" Inherits="Profiles.Web.Accordion" %>

<button type="button"
        runat="server"
        id="btnToggle"
        class="govuk-accordion__show-all"
        href="#"
        aria-expanded="false">
    <span class="govuk-accordion__section-toggle" data-nosnippet="">
        <span class="govuk-accordion__section-toggle-focus apha-font-size-19">
            <span class="govuk-accordion__section-toggle-text"><%= ButtonText %></span>
            <i id="speciesShowIcon" runat="server" class="govuk-accordion-nav__chevron govuk-accordion-nav__chevron--down"></i>
        </span>
    </span>
</button>