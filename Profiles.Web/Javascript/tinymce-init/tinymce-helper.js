class TinyMCEHelper {
	multiLineEditorInit(selector, height, styling, ariaLabel) {
		this.#cleanUp(selector);

		styling = styling || ''

		let validElements = 'em,ol,ul,li,a[href|target|title],p,br,i';

		let baseOptions = this.#baseOptions(selector, height, validElements, ariaLabel);

		let specificOptions = {
			menubar: false,
			statusbar: false,
			plugins: 'link lists paste',
			toolbar: 'undo redo | italic | bullist | link',
			link_context_toolbar: true,
			setup: (editor) => {
				baseOptions.setup(editor);
			}
		};

		let options = { ...baseOptions, ...specificOptions };

		tinymce.init(options);
	}

	linkOnlyEditorInit(selector, height, styling, ariaLabel) {
		this.#cleanUp(selector);

		styling = styling || ''

		let validElements = "a[href|target|title],p,br";

		let baseOptions = this.#baseOptions(selector, height, validElements, ariaLabel);

		let specificOptions = {
			menubar: false,
			statusbar: false,
			plugins: 'link',
			toolbar: 'undo redo | link',
			link_context_toolbar: true,
			setup: (editor) => {
				baseOptions.setup(editor);

				editor.on('keydown', (e) => {
					if ((e.key == "i" || e.key == "I") && (e.ctrlKey || e.metaKey)) {
						e.preventDefault();

						editor.execCommand("italic", false, null);
					}
				});
			}
		};

		let options = { ...baseOptions, ...specificOptions };

		tinymce.init(options);
	}

	inlineEditorWithoutDivInit(selector, height, styling, ariaLabel) {
		this.#cleanUp(selector);

		styling = styling || ''

		let validElements = 'em,i';

		let baseOptions = this.#baseOptions(selector, height, validElements, ariaLabel);


		let specificOptions = {
			menubar: false,
			statusbar: false,
			toolbar: 'undo redo | italic',
			link_context_toolbar: false,
			content_style: styling,
			setup: (editor) => {
				baseOptions.setup(editor);

				editor.on('keydown', (e) => {
					this.#checkMaxChars(e, editor);
				});
			}
		};

		let options = { ...baseOptions, ...specificOptions };

		tinymce.init(options);
	}

	inlineEditorInit(selector, textinputid, ariaLabel) {
		let validElements = 'em,i';

		let baseOptions = this.#baseOptions(selector, null, validElements, ariaLabel);

		tinymce.init({
			selector: selector,
			menubar: false,
			inline: true,
			toolbar: 'undo redo | italic',
			skin: 'tinymce-5',
			setup: (editor) => {
				baseOptions.setup(editor);

				editor.on('keydown', (e) => {
					this.#checkMaxChars(e, editor);
				});
			}
		});

		this.#copyToDiv(textinputid);
	}

	aphaVariableInput(selector, height, toolbar, plugins, validElements, ariaLabel, triggerReplication) {
		this.#cleanUp(selector);

		let baseOptions = this.#baseOptions(selector, height, validElements, ariaLabel, triggerReplication);

		let specificOptions =
		{
			menubar: false,
			statusbar: false,
			plugins: plugins,
			toolbar: toolbar,
			link_context_toolbar: true,
			contextmenu: false,
			setup: (editor) => {
				baseOptions.setup(editor);
			},
		}

		let options = { ...baseOptions, ...specificOptions };

		tinymce.init(options);
	}

	#baseOptions(selector, height, validElements, ariaLabel, triggerReplication) {
		return {
			skin: "tinymce-5",
			selector: selector,
			height: height,
			valid_elements: validElements,
			iframe_aria_text: ariaLabel,
			width: "100%",
			setup: (editor) => {
				editor.on('paste', (e) => {
					this.#onPaste(e, editor, validElements);
				});

				if (triggerReplication == 'true') {
					editor.on("blur", (e) => {
						triggerPropertyChangedEventServerSide();
					});
				};

				editor.on('keydown', (e) => {
					if ((e.key == "b" || e.key == "B") && (e.ctrlKey || e.metaKey)) {
						e.preventDefault();

						editor.execCommand("bold", false, null);
					}
					if ((e.key == "u" || e.key == "U") && (e.ctrlKey || e.metaKey)) {
						e.preventDefault();

						editor.execCommand("underline", false, null);
					}
				})
			},
		}
	}

	#copyToDiv(textbox) {
		document.getElementById('divProfileTitle').innerHTML = document.getElementById(textbox).value;
	}

	#cleanUp(selector) {
		tinyMCE.remove(selector);
	}

	#checkMaxChars(e, editor) {
		var maxPermittedChars = 255;
		let text = editor.bodyElement == null ? editor.contentDocument.body.innerText : editor.bodyElement.innerText;
		var inputLength = text.length;

		if (e.keyCode == 13) {
			e.preventDefault();
		}

		if (inputLength > maxPermittedChars + 1) {
			if (e.keyCode != 8 && e.keyCode != 46) {
				e.preventDefault();
				e.stopPropagation();
			}
		}
	}

	#convertBulletsToList(text) {
		let bullets = ["·", "•"]
		if (!this.#includesList(text, bullets)) return text

		const lines = text.split('\n');

		let bulletLines = [];
		let normalLines = [];

		lines.forEach(line => {
			if (this.#startsWithList(line, bullets)) {
				bulletLines.push(`<li>${line.trim().slice(1).trim()}</li>`);
			} else if (line.trim() !== '') {
				normalLines.push(line.trim());
			}
		});

		return `<ul> ${bulletLines.join('')} </ul> ${normalLines.join('<br />')}`;
	}

	#onPaste(e, editor, validElements) {
		let clipboardData = e.clipboardData || window.clipboardData;
		let pastedData = clipboardData.getData("Text");

		let clipboardArray = $.makeArray(clipboardData.items);

		let html = clipboardArray.find(x => x.type == "text/html");
		let hasUl = !validElements || (validElements && validElements.split(',').includes("ul"));

		if (html == null) {
			let text = hasUl
				? this.#convertBulletsToList(pastedData)
				: this.#removeNonAsciAndProcessLineBreaks(pastedData)

			editor.execCommand('mceInsertContent', false, text);

			e.preventDefault();
		} else if (html && !hasUl) {
			html.getAsString((e) => {
				let text = this.#removeNonAsciAndProcessLineBreaks(e)

				editor.execCommand('mceInsertContent', false, text);
			});

			e.preventDefault();
		}
	}

	#removeNonAsciAndProcessLineBreaks(text) {
		return text
			.replace(/[^\x00-\x7F\s]+/g, "") //remove non ascii
			.replace(/(?:\r\n|\r|\n)/g, '<br />'); //convert line breaks to br
	}
	
	#includesList(text, strList) {
		let res = false;
		strList.forEach((x) => {
			if (text.includes(x)) {
				res = true;
				return;
			}
		});

		return res;
	}

	#startsWithList(text, strList) {
		let res = false;
		strList.forEach((x) => {
			if (text.trim().startsWith(x)) {
				res = true;
				return;
			}
		});

		return res;
	}
}