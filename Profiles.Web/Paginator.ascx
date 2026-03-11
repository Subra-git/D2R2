<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="Paginator.ascx.vb" Inherits="Profiles.Web.Paginator" %>

<div class="d-none">
    <asp:LinkButton ID="PagerFirst" runat="server" OnClick="PagerFirst_Click" Text="1" aria-label="Go to first page"  />
    <asp:LinkButton ID="PagerLast" runat="server" OnClick="PagerLast_Click" aria-label="Go to last page"/>
    <asp:LinkButton ID="PagerNextNext" runat="server" OnClick="PagerNextNext_Click" aria-label="Go forward two pages"/>
    <asp:LinkButton ID="PagerPrevPrev" runat="server" OnClick="PagerPrevPrev_Click" aria-label="Go back two pages"/>
    <asp:LinkButton ID="PagerPrev" runat="server" OnClick="PagerPrev_Click" aria-label="Previous page"/>
    <asp:LinkButton ID="PagerNext" runat="server" OnClick="PagerNext_Click" Text="Next" aria-label="Next page"/>
</div>

<nav class="govuk-pagination justify-content-center" role="navigation" aria-label="Pagination">
    <% If CurrentPage <> 1 %>
        <div class="govuk-pagination__prev">
            <a class="govuk-link govuk-pagination__link" href="javascript:void(0)" onclick="<%= PagerPrev.ClientID %>.click()" rel="prev">
                <svg class="govuk-pagination__icon govuk-pagination__icon--prev" xmlns="http://www.w3.org/2000/svg" height="13" width="15" aria-hidden="true" focusable="false" viewBox="0 0 15 13">
                    <path d="m6.5938-0.0078125-6.7266 6.7266 6.7441 6.4062 1.377-1.449-4.1856-3.9768h12.896v-2h-12.984l4.2931-4.293-1.414-1.414z"></path>
                </svg>
                <span class="govuk-pagination__link-title">Previous<span class="govuk-visually-hidden"> page</span></span>
            </a>
        </div>
    <% End If%>

    <ul class="govuk-pagination__list">
        <% If CurrentPage <> 1 And TotalPages > 4 And CurrentPage - 2 > 1 %>
            <li class="govuk-pagination__item">
                <a class="govuk-link govuk-pagination__link" href="javascript:void(0)" onclick="<%= PagerFirst.ClientID %>.click()" aria-label="Page 1">1
                </a>
            </li>
            <% If  CurrentPage - 3 > 1 %>
                <li class="govuk-pagination__item govuk-pagination__item--ellipses">⋯</li>
            <% End If%>
        <% End If%>

        <% If TotalPages > 0 %>
            <% If CurrentPage - 2 >= 1Then %>
                <li class="govuk-pagination__item">
                    <a class="govuk-link govuk-pagination__link" href="javascript:void(0)" onclick="<%= PagerPrevPrev.ClientID %>.click()" aria-label="Page <%= CurrentPage - 2 %>"><%= CurrentPage - 2 %>
                    </a>
                </li>
            <% End If%>

            <% If CurrentPage > 1 %>
                <li class="govuk-pagination__item">
                    <a class="govuk-link govuk-pagination__link" href="javascript:void(0)" onclick="<%= PagerPrev.ClientID %>.click()" aria-label="Page <%= CurrentPage - 1 %>"><%= CurrentPage - 1 %>
                        </a>
                </li>
            <% End If%>

            <li class="govuk-pagination__item govuk-pagination__item--current">
                <a class="govuk-link govuk-pagination__link" href="#" aria-label="Page <%= CurrentPage %>" aria-current="page"><%= CurrentPage %>
                </a>
            </li>

            <% If CurrentPage < TotalPages Then %>
                <li class="govuk-pagination__item">
                    <a class="govuk-link govuk-pagination__link" href="javascript:void(0)" onclick="<%= PagerNext.ClientID %>.click()" aria-label="Page <%= CurrentPage + 1 %>"><%= CurrentPage + 1  %>
                    </a>
                </li>
            <% End If%>

            <% If CurrentPage + 2 <= TotalPages And TotalPages > 2 Then %>
                <li class="govuk-pagination__item">
                    <a class="govuk-link govuk-pagination__link" href="javascript:void(0)" onclick="<%= PagerNextNext.ClientID %>.click()" aria-label="Page <%= CurrentPage + 2 %>"><%= CurrentPage + 2 %>
                    </a>
                </li>
            <% End If%>

            <% If CurrentPage + 2 < TotalPages And TotalPages > 4 %>
                    <% If CurrentPage + 3 < TotalPages %>
                        <li class="govuk-pagination__item govuk-pagination__item--ellipses">⋯</li>
                    <% End If%>
                <li class="govuk-pagination__item">
                    <a class="govuk-link govuk-pagination__link" href="javascript:void(0)" onclick="<%= PagerLast.ClientID %>.click()" aria-label="Page <%= TotalPages %>"><%= TotalPages %>
                    </a>
                </li>
            <% End If%>
        <% End If%>
    </ul>
  
    <% If CurrentPage <> TotalPages And TotalPages > 0 %>
        <div class="govuk-pagination__next">
            <a class="govuk-link govuk-pagination__link" href="javascript:void(0)" onclick="<%= PagerNext.ClientID %>.click()" rel="next">
                <span class="govuk-pagination__link-title">Next<span class="govuk-visually-hidden"> page</span></span>
                <svg class="govuk-pagination__icon govuk-pagination__icon--next" xmlns="http://www.w3.org/2000/svg" height="13" width="15" aria-hidden="true" focusable="false" viewBox="0 0 15 13">
                    <path d="m8.107-0.0078125-1.4136 1.414 4.2926 4.293h-12.986v2h12.896l-4.1855 3.9766 1.377 1.4492 6.7441-6.4062-6.7246-6.7266z"></path>
                </svg>
            </a>
        </div>
    <% End If%>
</nav>
