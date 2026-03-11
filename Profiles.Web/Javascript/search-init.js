(function () {
	let context = ((window.apha ??= {}).searchPage ??= {});

	context.searchPageLoadingPopup = (mpeProgressClientId) => {
		Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(beginRequest); 
		Sys.WebForms.PageRequestManager.getInstance().add_endRequest(endRequest);

		var ended = false;

		function beginRequest(sender, args) {
			ended = false;

			setTimeout(() => {
				if (ended) return;

				document.body.style.cursor = 'wait';

				$find(mpeProgressClientId).show();
			}, 500);
		}

		function endRequest(sender, args) {
			// hide the loading popup
			ended = true;

			$find(mpeProgressClientId).hide();
			document.body.style.cursor = 'auto';
		}
	}

	context.showVersions = (button) => {
		let $button = $(button),
			$parent = $button.parent(),
			$chev = $button.find("i"),
			$textElement = $button.find(".govuk-accordion__section-toggle-text");

		let $versionRepeaterContainer = (function findRepeater() {
			$parent = $parent.parent();

			let $element = $parent.find('.version-repeater-container');
			if ($element.length < 1) return findRepeater();

			return $element;
		})();

		let isShown = $versionRepeaterContainer.css('display') == 'block';

		if (isShown) {
			$versionRepeaterContainer.hide();
			$chev.addClass("govuk-accordion-nav__chevron--down");
			$textElement.html("Show previous versions");

			$button.attr("aria-expanded", false);
		} else {
			$versionRepeaterContainer.show();
			$chev.removeClass("govuk-accordion-nav__chevron--down");
			$textElement.html("Hide previous versions");

			$button.attr("aria-expanded", true);
		}

		setTimeout(() => $button.blur(), 500);
	}

	context.hideShowAdvanced = () => {
		let url = new URL(window.location.href);
		let advanced = url.searchParams.get("show-advanced-search") == "true";
		let $moreFiltersSection = $(".more-filters");

		$(".more-filters-button").html(advanced
			? "Hide filters"
			: "More filters");

		advanced
			? $moreFiltersSection.show()
			: $moreFiltersSection.hide();
	};

	context.showAdvancedFilters = (button) => {
		let url = new URL(window.location.href);
		let $moreFiltersSection = $(".more-filters");
		let isShown = $moreFiltersSection.css('display') == 'block';

		url.searchParams.set("show-advanced-search", !isShown);
		history.replaceState(history.state, '', url.href);

		context.hideShowAdvanced()

		setTimeout(() => $(button).blur(), 500);
	}

	context.showSearchResults = (button) => {
		let $button = $(button)
		// Find the closest parent element with class "d-flex"
		var parent = button.closest('.d-flex');
		// Find the next sibling element with class "govuk-accordion__section"
		var searchResultsSection = parent.nextElementSibling;

		var $chev = $button.find("i")

		// Toggle the visibility of the search results section
		if (searchResultsSection.style.display === 'none' || searchResultsSection.style.display === '') {
			searchResultsSection.style.display = 'block';

			$chev.removeClass("govuk-accordion-nav__chevron--down");

			button.setAttribute('aria-expanded', 'true');

			button.querySelector('.govuk-accordion__section-toggle-text').textContent = 'Hide criteria matches';
		} else {
			searchResultsSection.style.display = 'none';

			$chev.addClass("govuk-accordion-nav__chevron--down");

			button.setAttribute('aria-expanded', 'false');

			button.querySelector('.govuk-accordion__section-toggle-text').textContent = 'Show criteria matches';
		}

		setTimeout(() => $button.blur(), 500);
	}

})();


