(function () {
	let context = ((window.apha ??= {}).editProfileQuestions ??= {});

	context.setFrameFocus = function(id) {
		$(document).ready(() => {
			setTimeout(() => {
				let $p = $(`#${id}_ifr`).contents().find('body p');

				$p.attr("tabindex", -1);

				$p.focus();
				
				$p.removeAttr("tabindex");
			}, 300);
		});
	}

	context.affectsRelevance = (fieldInfo, refresh, cliendId) => {
		apha.modal.confirm.create("Changing the answer to this question may affect the relevancy of other parts of this section," +
			`any questions that become irrelevant will be cleared and hidden. Questions that may be affected are: <br> <br> <b>${fieldInfo}</b>. <br><br>Do you want to continue?`, { modalClasses: "modal-lg" })
			.then((okClicked) => {
				if (okClicked) {
					if (refresh) {
						refreshPanel = true;
					} else {
						HideAndClearIrrelevantQuestions();
					}
				} else {
					$('#' + cliendId)[0].options[lastSelectedIndex].selected = true;
					return false;
				}
			});
	}
})();


function showReferencePopup(dropdownId, oControl) {

	document.getElementById("popupContainer").style.display = "block";

	var popupPosition = document.getElementById("addSelectReference");
	popupPosition.style.top = popupPosition.offsetTop + oControl.scrollY + "px";

	var popupContainer = document.getElementById("popupContainer");
	popupContainer.style.height = document.documentElement.scrollHeight + "px";
	
	document.getElementById(dropdownId).focus();

}

function hideReferencePopup(popupId) {

	document.getElementById("popupContainer").style.display = "none";
	var popupPosition = document.getElementById("addSelectReference");
	popupPosition.style.top = "150px"

	var popupContainer = document.getElementById("popupContainer");
	popupContainer.style.height = "100%";

	return true;

}