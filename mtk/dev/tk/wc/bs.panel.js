var xx, yy;

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
		
		var id = $(this).attr("id");
		var content = $("#" + id).html();
		var host = document.querySelector("#" + id);
		var shadow = host.createShadowRoot();

		var template = importDoc.querySelector('#template-panel');
		xx = shadow;
		yy = template;
		
		shadow.innerHTML =
		    "<style>" +
		    "@import 'https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css';" +
		    "@import 'https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css';" +
		    "</style>" +
		    $(template).html()

		xx.querySelector(".panel-heading").innerHTML = $(this).attr("heading");
		xx.querySelector(".panel-footer").innerHTML = $(this).attr("footer");
		xx.querySelector(".panel-body").innerHTML = content;
	    }
	}
    })
});
