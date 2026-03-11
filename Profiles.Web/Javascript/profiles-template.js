$(document).ready(() => {
	function HideShowBehaviour(itemSelector,
		clickSelector,
		onhide,
		onshow,
		onclick) {
		this.hidden = true;
		let $item = $(itemSelector);

		let hideShow = () => {
			this.hidden = !this.hidden;
			(this.hidden ? hide() : show());
		}

		let hide = () => {
			if (onhide) onhide(this);
			$item.hide();

			$item.attr("aria-hidden", true);

			$(clickSelector).parent().removeClass("active");
			$(clickSelector).attr("aria-expanded", false);

			this.hidden = true;
		}

		let show = () => {
			if (onshow) onshow(this);
			$item.show();

			$item.attr("aria-hidden", false);

			$(clickSelector).parent().addClass("active");
			$(clickSelector).attr("aria-expanded", true);

			this.hidden = false;
		}

		this.init = () => {
			$(itemSelector).click((event) => event.stopPropagation());

			$(document).click((e) => {
				let clickSelectorWithChildren = $
					.makeArray($(clickSelector).children())
					.concat([$(clickSelector)[0]]);

				let found = clickSelectorWithChildren.find((x) => $(x).is($(e.target))); //if click target IS click selector OR children, don't hide element
				if (found) return;

				hide();
			});

			$(clickSelector)[0].addEventListener('click', (event) => {
				hideShow();

				let isFromKeyboard = event.buttons == 1 || event.detail == 0;// any keydown event handling is disabled when NVDA screen reader is on

				setTimeout(() => {
					$(clickSelector).blur();
					if (isFromKeyboard) {
						$item.find("a:first").focus();
					}
				}, 250);

				if (onclick) onclick(this);

				return false;
			});
		};
	}

	function NavigationBehaviour() {
		let $arrow = $("#arrow-hook");

		let arrowDown = () => {
			$arrow.removeClass();
			$arrow.addClass("arrow down")
		}

		let arrowUp = () => {
			$arrow.removeClass();
			$arrow.addClass("arrow up")
		}

		let setArrow = (self) => (self.hidden ? arrowDown : arrowUp)();

		this.init = () => {
			new HideShowBehaviour(".header-navigation", "#menu-button", arrowDown, null, setArrow).init();
		}
	}

	new NavigationBehaviour().init();

	(function navigationActiveBehaviour() {
		$(".navigation-links a, .footer a")
			.filter((i, o) => o.href != "" && o.href != "#")//filter out anchor with no href
			.each((i, o) => {
				try {
					let current = document.location.pathname;
					let itemUrl = new URL(o.href);
					let itemPathname = itemUrl.pathname;

					$(o).removeClass("active");

					if (current.includes(itemPathname)) $(o).addClass("active");
				} catch (error) {
					console.log("An error occurred while processing navigation active behavior:", error);
				}
			});
	})();

	(function addCalendarAltText() {
		$("img")
			.toArray()
			.filter(x => x.alt == '' && x.src.includes("/Images/Calendar.gif"))
			.forEach(x => {
				let text = "This is an image of a calendar"
				x.alt = text;
				x.title = text;
			});
	})()

	$(".govuk-breadcrumbs").find("span:last").attr("aria-current", "page")
	$(".govuk-breadcrumbs").find("span:contains('>')").attr("aria-hidden", "true")

});

function triggerPropertyChangedEventServerSide() {
	tinyMCE.triggerSave(false, true);
	__doPostBack('DataReplicationFieldOnBlur')
}
