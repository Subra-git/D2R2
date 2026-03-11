(() => {
	let context = ((window.apha ??= {}).savePrompt ??= {});

	context.confirmPrompt = async (url) => {
		let canContinue = await apha.modal.confirm.create('Changes made to the profile will not be saved. Do you want to continue?');

		if (canContinue) {
			continueToUrl(url);
		} else {
			remainOnPage();
		}
	}

	function continueToUrl(url) {
		location.href = url
	}

	function remainOnPage() {
		let url = new URL(window.location.href);

		url.searchParams.set("timestamp", Date.now() * 10000);//set a param so when page refreshes we don't resubmit postback

		history.replaceState(history.state, '', url.href);
	}

	let attachConfirms = () => {
		let triggerConfirmPostBack = (element, exteranl) => {
			let itemUrl = new URL(element.href);
			let itemPathname = itemUrl.pathname;

			let path = exteranl ? itemUrl.href : itemPathname;

			__doPostBack('btnConfirmHook', path);

			return false;
		};

		$(".navigation-links a, footer a, div[role='navigation'] a, .profiles-header a")
			.filter((i, el) => el.id !== "menu-button")
			.each((i, el) => $(el).click(() => triggerConfirmPostBack(el)));

		$(".profile-header-home-link").each((i, el) => $(el).click(() => triggerConfirmPostBack(el, true)));
	};

	$(document).ready(attachConfirms);
})();