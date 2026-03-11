class LongTextTinyMCEService {
	tinyMCEHelper = null;

	constructor(tinyMCEHelper) {
		this.tinyMCEHelper = tinyMCEHelper;
	}

	types = [
		{
			name: "ItalicsAndHyperLinks",
			value: (selector, height, ariaTitle, triggerReplication) => this.tinyMCEHelper.aphaVariableInput(selector, height, 'undo redo | formatselect | italic | link', 'link paste', 'em,a[href|target|title],p,br,i', ariaTitle, triggerReplication)
		},
		{
			name: "ItalicsHyperlinksBullets",
			value: (selector, height, ariaTitle, triggerReplication) => this.tinyMCEHelper.aphaVariableInput(selector, height, 'undo redo | formatselect | italic bullist | link', 'link lists paste', 'em,ol,ul,li,a[href|target|title],p,br,i', ariaTitle, triggerReplication)
		},
		{
			name: "Default",
			value: (selector, height, ariaTitle, triggerReplication) => this.tinyMCEHelper.aphaVariableInput(selector, height, 'undo redo | formatselect | italic | link', 'link paste', 'em,a[href|target|title],p,br,i', ariaTitle, triggerReplication)
		},
	];

	init(editorType, selector, title, triggerReplication) {
		let mce = this.types.find(x => x.name === editorType);

		$(selector).attr("aria-label", title);

		if (mce == null && editorType !== null) throw `EditorFieldType ${editorType} not configured`;

		if (mce == null && editorType === "") mce = this.types.find(x => x.name === "Default");

		return mce.value(selector, 300, title, triggerReplication);
	}

	static create() {
		return new LongTextTinyMCEService(new TinyMCEHelper());
	}
}