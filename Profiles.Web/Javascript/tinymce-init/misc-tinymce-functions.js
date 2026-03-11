class MiscTinyMceFunctions {
	static copyToInput(textbox, savebutton) {
		const SINGLELINELIMIT = 255
		try {
			document.getElementById(textbox).value = tinymce.get('divProfileTitle').getContent();
			let inputValue = document.getElementById(textbox).value;
			let plainText;
			if (inputValue.length > SINGLELINELIMIT) {
				let html = inputValue;
				let div = document.createElement("div");
				div.innerHTML = html;
				plainText = div.textContent || div.innerText || "";
				plainText = plainText.slice(0, SINGLELINELIMIT);
				document.getElementById('divProfileTitle').innerHTML = plainText;
				tinymce.activeEditor.selection.select(document.getElementById('divProfileTitle'), true);
				tinymce.activeEditor.selection.collapse(false);
				tinymce.activeEditor.focus();
			}
		}
		catch (ex) {
			document.getElementById(textbox).value = "";
		}
		if (document.getElementById(textbox).value == "") {
			document.getElementById(savebutton).style.visibility = "hidden";
		}
		else {
			document.getElementById(savebutton).style.visibility = "visible";
		}

		return Page_ClientValidate();
	}
}

