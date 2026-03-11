function togglePanelState(expandAll, collapseAll, titleClientId, chevronClientId) {
    var showAllImage;
    var showAllText;

    showAllText = document.getElementById(titleClientId || "expandAllTitle")
    showAllImage = document.getElementById(chevronClientId || "expandAllChevron")

    let on = showAllText.innerText == "Show all sections";

    if (on) {
        showAllImage.className = "govuk-accordion-nav__chevron govuk-accordion-nav__chevron";
        showAllText.innerText = "Hide all sections";
        document.getElementById(expandAll).click();
    }
    else {
        showAllImage.className = "govuk-accordion-nav__chevron govuk-accordion-nav__chevron--down";
		showAllText.innerText = "Show all sections";
        document.getElementById(collapseAll).click();
    }

    return true;
}

function collapsiblePanelKeyPressed(panel) {

    if (event.keyCode == 13) {
        event.preventDefault();

        panel.parentElement.parentElement.click();
    }
}

(function expandCollapseButtonAriaState() {
	$(document).ready(() => {
		let $expandButton = $(".show-all-handle");
		let text = $expandButton.find("span:last").html();

		let expanded = text != "Show all sections";

		$expandButton.attr("aria-expanded", expanded);
	});
})();