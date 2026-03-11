
function goRight() {
    const element = document.getElementById("TabHeaderDiv");
    element.scrollLeft += 100;
}

function goLeft() {
    const element = document.getElementById("TabHeaderDiv");
    element.scrollLeft -= 100;
}

function tabKeyPressed(tabTitle) {
    if (event.keyCode == 13) {
        event.preventDefault();

        __doPostBack('tabStrip', tabTitle)
    }
}

function TabButtonsShowHide() {
    const element = document.getElementById("TabHeaderDiv");
    const tabButtons = document.getElementById("TabButtonsDiv");
    if (element.scrollWidth > element.clientWidth) {
        if (tabButtons != null) {
            tabButtons.className = "TabButtons";
            if (element.getElementsByClassName("ActiveTab").length > 0) {
                element.getElementsByClassName("ActiveTab")[0].scrollIntoView();
            }
        }
    } else {
        if (tabButtons != null) {
            tabButtons.className = "HideTabButtons";
        }
    }
}