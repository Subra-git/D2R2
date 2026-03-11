(function () {
    let context = ((window.apha ??= {}).profiles ??= {});
    context.toggleSection = (button, options = {}) => {
        const {
            showText = "Show previous versions",
            hideText = "Hide previous versions",
            containerClass = '.version-repeater-container'
        } = options;
        const $button = $(button);
        const $chev = $button.find("i");
        const $textElement = $button.find(".govuk-accordion__section-toggle-text");

        // Function to find the container with the given class
        const findContainer = ($el) => {
            const $parent = $el.parent();
            const $container = $parent.find(containerClass);
            return $container.length ? $container : findContainer($parent);
        };

        // Find the container related to the button
        const $container = findContainer($button);
        const isShown = $container.css('display') === 'block';

        // Toggle the container visibility
        $container.toggle(!isShown);

        // Toggle the chevron icon (keeping aria-hidden true as it's decorative)
        $chev.toggleClass("govuk-accordion-nav__chevron--down", !isShown);
        $chev.attr('aria-hidden', 'true');

        // Update the text of the button based on the visibility of the container
        $textElement.html(isShown ? showText : hideText);

        // Update the aria-expanded attribute of the button
        $button.attr("aria-expanded", !isShown);

        // Optional: Blur the button after a short delay (500ms)
        setTimeout(() => $button.blur(), 500);
    };

    context.updateAnnouncement = (message, options = {}) => {
        const {
            id = "aria-live-announcement",
            parentSelector = "body",
            role = "status",
            ariaLive = "polite"
        } = options;

        let $announcement = document.getElementById(id);
        
        // If the element doesn't exist, create it dynamically
        if (!$announcement) {
            $announcement = document.createElement("div");
            $announcement.id = id;
            $announcement.setAttribute("role", role);
            $announcement.setAttribute("aria-live", ariaLive);
            $announcement.style.position = "absolute";
            $announcement.style.width = "1px";
            $announcement.style.height = "1px";
            $announcement.style.overflow = "hidden";
            $announcement.style.clip = "rect(1px, 1px, 1px, 1px)";
            // Append to the specified parent
            document.querySelector(parentSelector).appendChild($announcement);
        }

        // Clear the announcement first to ensure screen readers pick up the change
        $announcement.textContent = "";
        setTimeout(() => {
            $announcement.textContent = message;
        }, 10);
    };

    context.setControlFocus = (controlId, options = {}) => {
        const {
            delay = 100,
        } = options;

        setTimeout(() => {
            const control = document.getElementById(controlId);
            if (control) {
                control.focus();
            }
        }, delay);
    };
})();