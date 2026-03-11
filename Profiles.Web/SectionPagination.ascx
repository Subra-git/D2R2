<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="SectionPagination.ascx.vb" Inherits="Profiles.Web.SectionPagination" %>
<nav class="govuk-pagination govuk-pagination--block" role="navigation" aria-label="Pagination">
    <div class="govuk-pagination__prev apha-font-size-19 float-start">
        <a class="govuk-link govuk-pagination__link" href="#" rel="prev" id="lnkPreviousSection" runat="server">
            <svg class="govuk-pagination__icon govuk-pagination__icon--prev" xmlns="http://www.w3.org/2000/svg" height="13" width="15" aria-hidden="true" focusable="false" viewBox="0 0 15 13">
                <path d="m6.5938-0.0078125-6.7266 6.7266 6.7441 6.4062 1.377-1.449-4.1856-3.9768h12.896v-2h-12.984l4.2931-4.293-1.414-1.414z"></path>
            </svg>
            <span class="govuk-pagination__link-title">Previous<span class="govuk-visually-hidden"> page</span>
            </span>
            <span class="govuk-visually-hidden">:</span>
            <span class="govuk-pagination__link-label ps-4" id="lblPreviousSection" runat="server">Previous section title</span>
        </a>
    </div>
    <div class="govuk-pagination__next apha-font-size-19 float-end">
        <a class="govuk-link govuk-pagination__link" href="#" rel="next" id="lnkNextSection" runat="server">
            <svg class="govuk-pagination__icon govuk-pagination__icon--next" xmlns="http://www.w3.org/2000/svg" height="13" width="15" aria-hidden="true" focusable="false" viewBox="0 0 15 13">
                <path d="m8.107-0.0078125-1.4136 1.414 4.2926 4.293h-12.986v2h12.896l-4.1855 3.9766 1.377 1.4492 6.7441-6.4062-6.7246-6.7266z"></path>
            </svg>
            <span class="govuk-pagination__link-title">Next<span class="govuk-visually-hidden"> page</span>
            </span>
            <span class="govuk-visually-hidden">:</span>
            <span class="govuk-pagination__link-label ps-4" id="lblNextSection" runat="server">Next section title</span>
        </a>
    </div>
</nav>
