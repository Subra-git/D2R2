var treeViewId;
var treeSelection;
var controller;

function initialiseCreateBespokeReportScript(_treeViewId, _speciesTreeToggle, _treeSelection) {
    treeViewId = _treeViewId;
    treeSelection = _treeSelection;
    controller = getTreeViewController(treeViewId, { toggleId: _speciesTreeToggle, selectionMode: 'multiple', selectionDisplayId: _treeSelection });
}
function bespokeClientNodeChecked(sender, eventArgs) {
    clientNodeChecked(sender, eventArgs);
    const node = eventArgs.get_node();
    if (!node) return;

    if (node.get_checked()) {
        handleNodeChecked(node, controller);
    } else {
        handleNodeUnchecked(node, controller);
    }
}

function bespokeClientNodeClicking(sender, eventArgs) {
    clientNodeClicking(sender, eventArgs);
    const node = eventArgs.get_node();
    if (!node) return;

    const newCheckedState = node.get_checked();
    if (newCheckedState) {
        handleNodeChecked(node, controller);
    } else {
        handleNodeUnchecked(node, controller);
    }
}

function updateAllChildren(node, controller) {
    // Get all nodes under this node using get_allNodes
    const checked = node.get_checked();
    const allNodes = node.get_allNodes();
    if (!allNodes || allNodes.length === 0) return;

    // Update all child nodes in one go
    for (let i = 0; i < allNodes.length; i++) {
        allNodes[i].set_checked(checked);
        controller.updateNodeState(allNodes[i], allNodes[i].get_checked(), allNodes[i].get_selected());
    }
}

function updateParentNode(node, controller) {
    // Handle root level nodes (level 0)
    if (node.get_level() === 0) {
        // Maintain checked state and sync with controller
        if (node.get_checked()) {
            node.set_checked(true);
            controller.updateNodeState(node, true, false);
        } else {
            node.set_checked(false);
            controller.updateNodeState(node, false, false);
        }
        return;
    }

    const parent = node.get_parent();

    // Handle non-root nodes 
    if (node.get_checked()) {

        // Set parent checked and sync with controller
        parent.set_checked(true);
        controller.updateNodeState(parent, true, false);

    } else {

        // Set parent unchecked if all children of parent node are unchecked
        const childNodes = parent.get_nodes();

        const anyChildChecked = isAnyChildNodeChecked(childNodes);

        if (!anyChildChecked) {
            parent.set_checked(false);
            controller.updateNodeState(parent, false, false);
        }

    }

    // Recursively update ancestors if not at root
    if (parent.get_level() !== 0) {
        updateParentNode(parent, controller);
    }

}

function handleNodeChecked(node, controller) {
    // Update all children using get_allNodes
    updateAllChildren(node, controller);

    // Update parent chain
    updateParentNode(node, controller);

    updateSelectionDisplay(node, controller);
}

function handleNodeUnchecked(node, controller) {
    // Update all children using get_allNodes
    updateAllChildren(node, controller);

    // Update parent chain
    updateParentNode(node, controller);

    updateSelectionDisplay(node, controller);
}

function updateSelectionDisplay(node, controller) {
    const tree = $find(controller.treeViewId);

    if (!tree) return;

    const displayContainer = document.getElementById(treeSelection + '_selectedTextContainer');
    const displayValue = document.getElementById(treeSelection + '_selectedTextValue');
    if (!displayContainer || !displayValue) return;
    const selectedTexts = [];
    const rootNodes = tree.get_nodes();

    for (let i = 0; i < rootNodes.get_count(); i++) {
        const rootNode = rootNodes.getNode(i);
        processNodeForDisplay(rootNode, selectedTexts);
    }

    displayContainer.style.display = selectedTexts.length > 0 ? 'block' : 'none';
    displayValue.textContent = selectedTexts.join(', ');
}

function processNodeForDisplay(node, selectedTexts) {
    const childNodes = node.get_nodes();

    if (!childNodes || childNodes.get_count() === 0) {
        if (node.get_checked()) {
            selectedTexts.push(node.get_text());
        }
        return;
    }

    const anyChildChecked = isAnyChildNodeChecked(childNodes);

    const allChildrenChecked = Array.from({ length: childNodes.get_count() }, (_, i) =>
        childNodes.getNode(i)).every(child => child.get_checked());

    if (node.get_level() !== 0 && (allChildrenChecked || (!anyChildChecked && node.get_checked()))) {
        selectedTexts.push(node.get_text());
    } else if (anyChildChecked) {
        for (let i = 0; i < childNodes.get_count(); i++) {
            processNodeForDisplay(childNodes.getNode(i), selectedTexts);
        }
    }
}

function isAnyChildNodeChecked(childNodes) {
    return Array.from({ length: childNodes.get_count() }, (_, i) =>
        childNodes.getNode(i)).some(child => child.get_checked());
}

document.addEventListener('DOMContentLoaded', () => {
    const buttonGroup = document.querySelector('.govuk-button-group');
    if (!buttonGroup) return;

    buttonGroup.addEventListener('click', (e) => {
        if (!e.target.matches('.govuk-button')) return;
        e.preventDefault();

        const tree = $find(treeViewId);
        const checked = e.target.dataset.action !== 'exclude';

        const nodes = tree.get_nodes();
        for (let i = 0; i < nodes.get_count(); i++) {
            updateAllChildrenGuidanceQuestions(nodes.getNode(i), controller, checked);
        }

        var actionedMessage = 'Included all guidance questions'
        if (e.target.dataset.action === 'exclude') {
            actionedMessage = 'Excluded all guidance questions'
        }

        apha.profiles.updateAnnouncement(actionedMessage);
        updateSelectionDisplay(null, controller);
    });

    const removeButton = document.getElementById(treeSelection + '_removeSelectionButton');
    removeButton.addEventListener('click', () => this.handleRemoveSelection());

    updateSelectionDisplay(null, controller);
});

function handleRemoveSelection() {
    controller.clearNodes();
    controller.setSelectedText('', false, treeSelection);
}

function updateParentNodeGuidanceQuestions(node, controller, checkedState) {
    const parent = node.get_parent();
    if (!parent) return;

    if (checkedState) {
        parent.set_checked(true);
        controller.updateNodeState(parent, true, false);
    } else {
        if (!hasCheckedChild(parent)) {
            parent.set_checked(false);
            controller.updateNodeState(parent, false, false);
        }
    }

    if (parent.get_level() !== 0) {
        updateParentNode(parent, controller);
    }
}

function updateAllChildrenGuidanceQuestions(node, controller, checked) {
    const allNodes = node.get_allNodes();
    if (!allNodes?.length) return;

    allNodes.forEach(loopNode => {
        const guidanceAttribute = loopNode.get_attributes().getAttribute("data-is-guidance");
        if (!guidanceAttribute) return;

        if (loopNode._parent.get_checked() == true) {
            loopNode.set_checked(checked);

            updateParentNodeGuidanceQuestions(loopNode, controller, checked);

            controller.updateNodeState(loopNode, checked, loopNode.get_selected());
        }
    });
}

function hasCheckedChild(node) {

    var childChecked = false;

    var children = node.get_nodes();
    children.forEach(childNode => {
        if (childNode.get_checked()) {
            childChecked = true;
        }
    });

    return childChecked;
}