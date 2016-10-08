try {
    // SOMEHOW THIS DOES NOT WORK
    var importDoc = document.currentScript.ownerDocumentdocument.currentScript === document._currentScript ? document.currentScript.ownerDocument: document._currentScript.ownerDocument;
} catch(e) {
    var importDoc = document.currentScript.ownerDocument;
}

// Modal
Panel = document.registerElement('bs-panel', {
    prototype: Object.create(HTMLElement.prototype, {
	createdCallback: {
	    value: function() {
		// jQuery creates an extra looking for CSS display value
		if (!this.parentNode) {
		    return false;
		}

		var shadow = document.querySelector('#template-panel').createShadowRoot();
		shadow.appendChild(template.content);
	    }
	}
    })
});
