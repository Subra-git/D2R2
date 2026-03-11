(function () {
	let context = ((window.apha ??= {}).modal ??= {});

	apha.confirmPrompt = async (message, button) => {
		let canContinue = await apha.modal.confirm.create(message);

		if (canContinue) {
			button.onclick = undefined;
			button.click();
		} else {
			return false;
		}

		return false;
	}

	context.initModalFor = (modalId, modalClickId, onShow, onClose, miscOptions) => {
		if (miscOptions && miscOptions.modalClasses) {
			$(modalId).find(".modal-dialog").addClass(miscOptions.modalClasses)
		}

		let close = () => {
			$(modalId).css("display", "none");

			$(modalId).attr("aria-hidden", true);

			if (onClose) onClose(this);
		};

		let show = () => {
			$(modalId).css("display", "block");

			$(modalId).attr("aria-hidden", false);

			$(modalId).find("input[type=text]:first").focus();

			if (onShow) onShow(this);
		}

		$(modalClickId).on("click", () => {
			show();
			return false;
		});

		$(modalId).find(".trigger-close").on("click", () => {
			close();

			return false;
		});

		return { show: show, close: close };
	};

	context.initConfirmFor = (modalId) => {
		let deferredResolve;

		let modal = context.initModalFor(modalId, "#")

		function resolvePromise(value) {
			modal.close();
			deferredResolve(value);
		}

		$(modalId).find(".ok-button").on("click", () => {
			resolvePromise(true);
			return false;
		});

		$(modalId).find(".cancel-button").on("click", () => {
			resolvePromise(false);
			return false;
		});

		let create = (text, options) => {
			modal = context.initModalFor(modalId, "#", null, null, options)

			$(modalId).find(".modal-body").html(text);

			return new Promise((resolve) => {
				modal.show();
				deferredResolve = resolve;
			});
		}

		return { create: create };
	}
})();

