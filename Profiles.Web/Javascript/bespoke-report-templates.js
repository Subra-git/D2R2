(function () {
	let context = ((window.apha ??= {}).bespokeReportsTemplates ??= {});

	context.validateNameDuplicate = function (sender, args) {
		let $options = $("#" + this.templatesDropdwnClientId + " option");

		var labels = $.map($options, option => option.label);

		args.IsValid = labels.includes(args.Value) == false;
	};

	context.init = function (templateTitleId, templatesDropdwnClientId) {
		this.templatesDropdwnClientId = templatesDropdwnClientId;

		$(document).ready(() => {
			setNotificationMessage();

			let $templateTitleEl = $("#" + templateTitleId);

			let $templateTitleOldValue = $templateTitleEl.val();

			apha.modal.initModalFor("#save-as-modal", "#show-save-as-button",
				() => {
					let preFilledTitle = $templateTitleEl.val() == "" ? "" : $templateTitleEl.val() + " Copy";
					$templateTitleEl.val(preFilledTitle)
				},
				() => {
					$templateTitleEl.val($templateTitleOldValue)
				});

			apha.modal.initModalFor("#edit-modal", "#show-edit-button");
			apha.modal.initModalFor("#delete-modal", "#show-delete-button");
		});
	};

	let setNotificationMessage = () => {
		let url = new URL(window.location.href);

		let message = url.searchParams.get('message');

		if (!message) return;

		let $messageContainer = $('.small-notification-success');

		if ($(".small-notification-error").length < 1) {
			let text = message == "TEMPLATESAVED" ? "Template saved"
				: message == "TEMPLATETITLESAVED" ? "Template title saved"
					: message == "TEMPLATEDELETED" ? "Template deleted"
						: "";

			$messageContainer.html(text);
			$messageContainer.css({ "visibility": "visible" });
			$messageContainer.attr({ "aria-hidden": false });
		}

		url.searchParams.delete('message');
		history.replaceState(history.state, '', url.href);

		setTimeout(() => {
			$messageContainer.attr({ "aria-hidden": true });
			$messageContainer.css({ "visibility": "hidden" })
		}, 4000);
	};
})();

