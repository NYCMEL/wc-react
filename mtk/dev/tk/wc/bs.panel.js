var xx;

try {
    // SOMEHOW THIS DOES NOT WORK
    var importDoc = document.currentScript.ownerDocumentdocument.currentScript === document._currentScript ? document.currentScript.ownerDocument: document._currentScript.ownerDocument;
} catch(e) {
    var importDoc = document.currentScript.ownerDocument;
}

// PANEL
Panel = document.registerElement('bs-panel', {
    prototype: Object.create(HTMLElement.prototype, {
	createdCallback: {
	    value: function() {
		// jQuery creates an extra looking for CSS display value
		if (!this.parentNode) {
		    return false;
		}
		
		var template = importDoc.querySelector("#template-panel");
		var shadow = this.createShadowRoot();
		console.log(">>>", template)

		shadow.innerHTML =
		    "<style>" +
		    "@import 'http://localhost/GitHub/bootstrap/dist/css/bootstrap.min.css'" + 
		    "</style>" +
		    $(template).html();
	    }
	}
    })
});
