function SpeciesSelectorBehaviour(lblAffectedSpecies) {
	this.AfterClientCheck = function (node, controller) {
		
		if (node.get_checked()) {
			UncheckAncestorNodes(node, controller);
			UncheckDescendentNodes(node, controller);
		}

		var affectedSpecies = new Array();
		var speciesCount = 0;
		var tree = node.get_treeView();

		var allSpeciesNodes = tree.get_allNodes();

		for (var currentSpecies = 0; currentSpecies < allSpeciesNodes.length; currentSpecies++) {
			const speciesNode = allSpeciesNodes[currentSpecies]
			if (speciesNode.get_checked()) {
				affectedSpecies[speciesCount] = speciesNode.get_text();
				speciesCount++;
			}
		}

		affectedSpecies.sort(function (a, b) {
			const nameA = StripHtmlTags(a);
			const nameB = StripHtmlTags(b);

			if (nameA < nameB) {
				return -1;
			}
			if (nameA > nameB) {
				return 1;
			}

			return 0;
		});


		var speciesLabel = document.getElementById(lblAffectedSpecies)//('<%=lblAffectedSpecies.ClientID %>');

		if (affectedSpecies.length > 0) {
			ReplaceText(speciesLabel, affectedSpecies.join(", "));
		}
		else {
			ReplaceText(speciesLabel, "Any species");
		}
	}

	function StripHtmlTags(val) {
		return val.replace(/<.*?>/g, "");
	}

	//x-browser compatible, unlike .innerText
	function ReplaceText(element, text) {

		if (element.firstChild) {
			element.innerHTML = text;
		}
		else {
			element.appendChild(document.createTextNode(text));
		}
	}

	function UncheckAncestorNodes(node, controller) {
		const level = node.get_level();
		if (level > 0) {
			const parent = node.get_parent();
			if (parent) {
				parent.set_checked(false);
				controller.updateNodeState(parent, false, false);
				UncheckAncestorNodes(parent, controller);
			}
		}
	}

	function UncheckDescendentNodes(node, controller) {
		const nodes = node.get_nodes();
		for (var currentNode = 0; currentNode < nodes.get_count(); currentNode++) {
			const loopNode = nodes.getNode(currentNode);
			loopNode.set_checked(false);
			controller.updateNodeState(loopNode, false, false);
			UncheckDescendentNodes(loopNode, controller);
		}
	}
}


showSpeciesSelector = (button) => {
	let $button = $(button),
		$parent = $button.parent(),
		$chev = $button.find("i"),
		$textElement = $button.find(".govuk-accordion__section-toggle-text");

	let $speciesSelectorContainer = (function findRepeater() {
		$parent = $parent.parent();

		let $element = $parent.find('.ContextMenuPanel');
		if ($element.length < 1) return findRepeater();

		return $element;
	})();

	let isShown = $speciesSelectorContainer.css('display') == 'block';

	if (isShown) {
		$speciesSelectorContainer.hide();
		$chev.addClass("govuk-accordion-nav__chevron--down");

		$button.attr("aria-expanded", false);
	} else {
		$speciesSelectorContainer.show();
		$chev.removeClass("govuk-accordion-nav__chevron--down");

		$button.attr("aria-expanded", true);
	}

	setTimeout(() => $button.blur(), 500);
}