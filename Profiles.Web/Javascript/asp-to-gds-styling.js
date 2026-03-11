function aspRadioButtonListGdsStyling(tableId) {

    let table = document.getElementById(tableId);
    if (table) {
        $("#" + tableId + " tr").addClass("govuk-radios govuk-radios--inline")

        $("#" + tableId + " td").addClass("govuk-radios__item");
        $("#" + tableId + " td").css("width", "14rem");

        $("#" + tableId + " td input").addClass("govuk-radios__input")

        $("#" + tableId + " td label").addClass("govuk-label govuk-radios__label")
    }
}

function aspCheckboxListGdsStyling(tableId, isSmall = true) {

    let table = document.getElementById(tableId);
    if (table) {

        $("#" + tableId + " tr").addClass("govuk-checkboxes" + (isSmall ? " govuk-checkboxes--small" : ""));

        $("#" + tableId + " td").addClass("govuk-checkboxes__item checkbox-inline");

        $("#" + tableId + " td input").addClass("govuk-checkboxes__input")

        $("#" + tableId + " td label").addClass("govuk-label govuk-checkboxes__label")
    }
}
