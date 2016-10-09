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
		
		var id = $(this).attr("id");
		var content = $("#" + id).html();
		var host = document.querySelector("#" + id);
		var shadow = host.createShadowRoot();

		//var template = importDoc.querySelector('#template-panel');
		//alert($(template).html());
		
		xx = host;
		
		shadow.innerHTML =
		    "<style>" +
		    "@import 'https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css';" +
		    "@import 'https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css';" +
		    "</style>" +
		    "<div class='panel panel-danger'>" +
		    "<div class='panel-heading'>" + $(this).attr("heading") + "</div>" +
		    "<div class='panel-body'>" + content + "</div>" +
		    "<div class='panel-footer'>" + $(this).attr("footer") + "</div>" +
		    "</div>"
	    }
	}
    })
});
