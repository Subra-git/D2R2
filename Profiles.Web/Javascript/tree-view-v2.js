const TREE_DESCRIPTIONS = {
    OPEN_BRANCHES: 'Open all branches of tree view component',
    CLOSE_BRANCHES: 'Close all branches of tree view component',
    BRANCHES_NOW_OPEN: 'All tree view component branches are now open',
    BRANCHES_NOW_CLOSED: 'All tree view component branches are now closed'
};

const SELECTION_DISPLAY = {
    REMOVE_SELECTION: 'Remove selection',
    REMOVE_SPECIFIC: 'Remove {0} selection'
};

class TreeViewController {
    constructor(treeViewId, config = {}) {
        if (!treeViewId) {
            throw new Error('TreeViewController requires a valid treeViewId');
        }
        this.treeViewId = treeViewId;
        this.config = {
            selectionMode: 'single',
            toggleId: null,
            selectionDisplayId: null,
            ...config
        };
        this.hasHandledBack = false;
        this.toggleInitialised = false;

        // Initialise the node state map
        this.nodeStateMap = new Map();

        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', () => this.initialise());
        } else {
            this.initialise();
        }
    }

    syncNodeStateFromServer() {
        const treeView = this.getTreeView();
        if (!treeView) return;
        
        this.nodeStateMap.clear();
        const checkedNodes = treeView.get_checkedNodes();
        checkedNodes.forEach(node => {
            const identifier = this.getUniqueIdentifier(node);
            this.nodeStateMap.set(identifier, {
                checked: true,
                selected: false,
                value: node.get_value()
            });
        });

        // Handle selected nodes
        const selectedNodes = treeView.get_selectedNodes();
        selectedNodes.forEach(node => {
            const identifier = this.getUniqueIdentifier(node);
            const existingState = this.nodeStateMap.get(identifier) || { checked: false, selected: false, value: '' };
            this.nodeStateMap.set(identifier, {
                ...existingState,
                selected: true,
                value: node.get_value()
            });
        });
    }

    initialise() {
        this.handleBackNavigation();
        this.setupTreeToggles();
        this.syncNodeStateFromServer();
        this.initialiseInitialSelection();
        this.initialiseRemoveButton();
        this.applyAriaLevels();
        this.initialiseAnnoucement();
    }

    initialiseAfterPartialPostback() {
        this.setupToggleEvent();
        this.syncNodeStateFromServer();
        this.applyAriaLevels();
    }

    initialiseRemoveButton() {
        if (!this.config.selectionDisplayId) return;

        const removeButton = document.getElementById(`${this.config.selectionDisplayId}_removeSelectionButton`);
        if (removeButton) {
            removeButton.addEventListener('click', () => this.handleRemoveSelection());
        }
    }

    initialiseInitialSelection() {
        if (this.config.selectionMode !== 'single' || !this.config.selectionDisplayId) return;

        const treeView = this.getTreeView();
        if (!treeView) return;

        const checkedNode = treeView.get_checkedNodes()[0];
        if (checkedNode) {
            this.updateSelectionDisplay(checkedNode);
        }
    }

    initialiseAnnoucement() {
        if (this.config.selectionDisplayId) return;

        const announcement = document.createElement('div');
        announcement.id = 'selectionAnnouncement';
        announcement.className = 'govuk-visually-hidden';
        announcement.setAttribute('role', 'status');
        announcement.setAttribute('aria-live', 'polite');
        document.body.append(announcement);
    }

    setupTreeToggles() {
        if (this.toggleInitialised) return;

        const toggleButton = this.config.toggleId ? document.getElementById(`${this.config.toggleId}_treeButton`) : null;

        if (toggleButton) {
            const hiddenField = document.getElementById(`${this.config.toggleId}_toggleStateHidden`);
            let isTreeExpanded = false;

            if (hiddenField) {
                isTreeExpanded = hiddenField.value === 'true';
            }

            toggleButton.setAttribute('aria-expanded', isTreeExpanded);
            toggleButton.setAttribute('aria-label', isTreeExpanded ? TREE_DESCRIPTIONS.CLOSE_BRANCHES : TREE_DESCRIPTIONS.OPEN_BRANCHES);
            this.setupToggleEvent();

            if (hiddenField) {
                hiddenField.value = isTreeExpanded.toString();
            }

            const liveRegionId = `${this.config.toggleId}_treeStatus`;
            let liveRegion = document.getElementById(liveRegionId);
            if (!liveRegion) {
                liveRegion = document.createElement('div');
                liveRegion.id = liveRegionId;
                liveRegion.className = 'sr-only';
                liveRegion.setAttribute('role', 'status');
                liveRegion.setAttribute('aria-live', 'polite');
                toggleButton.parentNode.insertBefore(liveRegion, toggleButton.nextSibling); // Insert after the button
            }
        }

        this.toggleInitialised = true;
    }

    setupToggleEvent() {
        const toggleButton = this.config.toggleId ? document.getElementById(`${this.config.toggleId}_treeButton`) : null;
        toggleButton.addEventListener('click', (e) => this.handleToggleClick(e.currentTarget));
    }

    handleRemoveSelection() {
        const treeView = this.getTreeView();
        if (!treeView) return;

        const hasCheckedNodes = treeView.get_checkedNodes().length > 0;
        const announcement = document.getElementById(`${this.config.selectionDisplayId}_selectionAnnouncement`);

        if (hasCheckedNodes) {
            this.clearNodes();
            this.updateSelectionDisplay(null);
            
            if (announcement) {
                announcement.textContent = '';
                setTimeout(() => {
                    announcement.textContent = 'Selection cleared'; 
                }, 100); 
            }
        } else {
            const lblSelectNode = document.getElementById(`${this.treeViewId}_lblSelectNode`);
            if (lblSelectNode) {
                lblSelectNode.textContent = 'There is no selection to remove';
            }
        }
    }

    handleToggleClick(button) {
        const hiddenField = document.getElementById(`${this.config.toggleId}_toggleStateHidden`);
        if (hiddenField) {
            const isTreeExpanded = hiddenField.value === 'true';
            // Toggle the state
            const newState = !isTreeExpanded;
            hiddenField.value = newState.toString();

            this.updateButtonState(button, newState);

            if (newState) {
                this.expandAllNodes();
            } else {
                this.collapseAllNodes();
            }
        }
    }

    updateButtonState(button, isExpanded) {
        button.setAttribute('aria-expanded', isExpanded);
        button.setAttribute('aria-label',
            isExpanded ? TREE_DESCRIPTIONS.CLOSE_BRANCHES : TREE_DESCRIPTIONS.OPEN_BRANCHES
        );

        const liveRegion = document.getElementById(`${this.config.toggleId}_treeStatus`);
        if (liveRegion) {
            liveRegion.textContent = isExpanded ? TREE_DESCRIPTIONS.BRANCHES_NOW_OPEN : TREE_DESCRIPTIONS.BRANCHES_NOW_CLOSED;
        }
    }

    updateSelectionDisplay(node) {
        if (!this.config.selectionDisplayId) return;

        const selectedText = node?.get_text() || '';
        const isChecked = node?.get_checked() || false;
        this.setSelectedText(selectedText, isChecked)

        this.removeButtonLabel(isChecked, selectedText);
    }

    setSelectedText(selectedText, checked) {
        const containerEl = document.getElementById(`${this.config.selectionDisplayId}_selectedTextContainer`);
        const valueEl = document.getElementById(`${this.config.selectionDisplayId}_selectedTextValue`);
        const removeButton = document.getElementById(`${this.config.selectionDisplayId}_removeSelectionButton`);
        
        if (!containerEl || !valueEl || !removeButton) return;

        containerEl.style.display = checked ? 'block' : 'none';
        valueEl.textContent = checked ? selectedText : '';
    }

    removeButtonLabel(checked, selectedText) {
        const removeButton = document.getElementById(`${this.config.selectionDisplayId}_removeSelectionButton`);

        if (!removeButton) return;

        if (checked) {
            removeButton.setAttribute('aria-label', SELECTION_DISPLAY.REMOVE_SPECIFIC.replace('{0}', selectedText));
        } else {
            removeButton.setAttribute('aria-label', SELECTION_DISPLAY.REMOVE_SELECTION);
        }
    }

    handleBackNavigation() {
        window.addEventListener('pageshow', (event) => {
            const isBackNavigation =
                event.persisted ||
                (window.performance?.getEntriesByType("navigation")[0]?.type === "back_forward") ||
                (window.performance?.navigation?.type === 2);

            if (!this.hasHandledBack && isBackNavigation) {
                this.nodeStateMap.clear();
                const treeView = this.getTreeView();
                if (treeView) {
                    __doPostBack(this.treeViewId, '');
                    this.hasHandledBack = true;
                }
            }
        });
    }

    getTreeView() {
        return $find(this.treeViewId);
    }

    handleSingleSelection(node, tree) {
        const identifier = this.getUniqueIdentifier(node);

        // Get the previous state of the current node or initialise a default state
        const previousState = this.nodeStateMap.get(identifier) || { checked: false, selected: false, value: node.get_value() };

        // Find the currently selected node in the map (if any)
        var currentlySelectedNodeId = [...this.nodeStateMap.entries()]
            .find(([, state]) => state.selected)?.[0];

        if (!currentlySelectedNodeId) {
            var treeView = $find(this.treeViewId);

            if (treeView) {
                var selNode = treeView.get_selectedNode();

                if (selNode) {
                    currentlySelectedNodeId = this.getUniqueIdentifier(selNode);
                }
            }
        }

        if (!currentlySelectedNodeId) {
            // No previously selected node
            node.set_selected(true);
            node.set_checked(true);
            this.updateNodeState(node, true, true);
        } else if (currentlySelectedNodeId !== identifier) {
            // A different node was selected before
            // Deselect the previously selected node
            const previousNodeState = this.nodeStateMap.get(currentlySelectedNodeId);

            if (previousNodeState) {
                const previousNode = tree.findNodeByValue(previousNodeState.value);
                
                if (previousNode) {
                    previousNode.set_selected(false);
                    previousNode.set_checked(false);
                    this.updateNodeState(previousNode, false, false);
                }
            }

            // Select the current node
            node.set_selected(true);
            node.set_checked(true);
            this.updateNodeState(node, true, true);
        } else {
            // Toggling the selection state of the same node
            const newCheckedState = !previousState.checked;
            node.set_checked(newCheckedState);
            this.updateNodeState(node, newCheckedState, true);
        }

        // Update the selected display
        this.updateSelectionDisplay(node);
    }

    handleMultipleSelection(node, tree) {
        const identifier = this.getUniqueIdentifier(node);
        const previousState = this.nodeStateMap.get(identifier) || { checked: false, selected: false, value: node.get_value() };

        if (!previousState.checked) {
            node.set_selected(true);
            node.set_checked(true);
            this.updateNodeState(node, true, true);
        } else {
            const newCheckedState = !previousState.checked;
            node.set_checked(newCheckedState);
            node.set_selected(true);
            this.updateNodeState(node, newCheckedState, true);
        }
    }

    handleNodeCheck(sender, eventArgs) {
        const node = eventArgs.get_node();
        if (!node) return;

        if (this.config.selectionMode === 'single') {
            this.handleSingleSelection(node, sender);
        } else {
            this.handleMultipleSelection(node, sender);
        }
    }

    handleNodeClicking(sender, eventArgs) {
        const node = eventArgs.get_node();
        if (!node) return;

        if (this.config.selectionMode === 'single') {
            this.handleSingleSelection(node, sender);
        } else {
            this.handleMultipleSelection(node, sender);
        }

        if (node.get_checkable() === false) {
            node.set_expanded(!node.get_expanded())
        }
    }

    expandAllNodes() {
        const treeView = this.getTreeView();
        if (!treeView) return;

        treeView.bulkUpdateWith(() => {
            this.expandAllNodesFunc(treeView);
        });
    }

    expandAllNodesFunc(treeView) {
        const nodes = treeView.get_allNodes();
        nodes.forEach(node => {
            if (node.get_nodes()) {
                node.expand();
            }
        });
    }

    collapseAllNodes() {
        const treeView = this.getTreeView();
        if (!treeView) return;

        treeView.bulkUpdateWith(() => {
            this.collapseAllNodesFunc(treeView);
        });
    }

    collapseAllNodesFunc(treeView) {
        const nodes = treeView.get_allNodes();
        nodes.forEach(node => {
            if (node.get_nodes()) {
                // when collapsing set the selected state to false as the focussed control could be out of view
                //node.set_selected(false);
                this.updateNodeState(node, node.get_checked(), false);
                node.collapse();
            }
        });
    }

    getUniqueIdentifier(node) {
        return `${node.get_value()}_${node.get_text()}`;
    }

    updateNodeState(node, checked, selected) {
        if (node) {
            const identifier = this.getUniqueIdentifier(node);
            this.nodeStateMap.set(identifier, {
                checked: checked,
                selected: selected,
                value: node.get_value()
            });
        }
    }

    clearNodes() {
        const treeView = this.getTreeView();
        if (!treeView) return;

        treeView.unselectAllNodes();
        treeView.uncheckAllNodes();
        this.nodeStateMap.clear();
    }

    applyAriaLevels() {
        const treeElement = document.getElementById(this.treeViewId);
        if (!treeElement) return;

        const allListItems = treeElement.getElementsByTagName('li');

        function calculateNestingLevel(element) {
            let level = 1;
            let parent = element.parentElement;

            while (parent) {
                if (parent.tagName.toLowerCase() === 'ul') {
                    const parentLi = parent.parentElement;
                    if (parentLi && parentLi.tagName.toLowerCase() === 'li') {
                        level++;
                    }
                }
                parent = parent.parentElement;
            }

            return level;
        }

        Array.from(allListItems).forEach(li => {
            const level = calculateNestingLevel(li);
            if (!li.hasAttribute('aria-level')) {
                li.setAttribute('aria-level', level.toString());
            }

            if (!li.hasAttribute('role')) {
                li.setAttribute('role', 'listitem');
            }
        });

        const allLists = treeElement.getElementsByTagName('ul');
        Array.from(allLists).forEach(ul => {
            if (!ul.hasAttribute('role')) {
                ul.setAttribute('role', 'list');
            }
        });
    }

    handleNodeExpandedOrCollapsed(sender, eventArgs) {

        const node = eventArgs.get_node();
        if (!node) return;

        //check if node is selected to prevent duplicate screen reader announcements for expanded status
        const expandedStatus = node.get_selected() ? '' : node.get_expanded() ? 'expanded' : 'collapsed';
        const checkedStatus = node.get_checkable() ? node.get_checked() ? 'checked' : ' not checked' : '';

        const announcementText = `${node.get_text()} ${checkedStatus} ${expandedStatus} `;

        let announcement = document.getElementById(`${this.config.selectionDisplayId}_selectionAnnouncement`);
        if (!announcement) {
            announcement = document.getElementById('selectionAnnouncement');
        };

        if (announcement) {
            announcement.textContent = announcementText;
            setTimeout(() => {
                announcement.textContent = '';
            }, 100);
        }

    }

}

// Global registry and helper functions
window.TreeViewRegistry = window.TreeViewRegistry || new Map();

function getTreeViewController(treeViewId, config) {
    if (!treeViewId) {
        console.error('TreeViewController requires a valid treeViewId');
        return null;
    }

    if (!window.TreeViewRegistry.has(treeViewId)) {
        window.TreeViewRegistry.set(treeViewId, new TreeViewController(treeViewId, config));
    }
    return window.TreeViewRegistry.get(treeViewId);
}

function clientNodeChecked(sender, eventArgs) {
    if (!sender || !eventArgs) return;
    const controller = getTreeViewController(sender.get_id());
    if (controller) {
        controller.handleNodeCheck(sender, eventArgs);
    }
}

function clientNodeClicking(sender, eventArgs) {
    if (!sender || !eventArgs) return;
    const controller = getTreeViewController(sender.get_id());
    if (controller) {
        controller.handleNodeClicking(sender, eventArgs);
    }
}

function clientNodeExpanded(sender, eventArgs) {
    if (!sender || !eventArgs) return;
    const controller = getTreeViewController(sender.get_id());
    if (controller) {
        controller.handleNodeExpandedOrCollapsed(sender, eventArgs);
    }

}

function clientNodeCollapsed(sender, eventArgs) {
    if (!sender || !eventArgs) return;
    const controller = getTreeViewController(sender.get_id());
    if (controller) {
        controller.handleNodeExpandedOrCollapsed(sender, eventArgs);
    }
}