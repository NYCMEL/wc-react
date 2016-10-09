var xx, yy;

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
		var host = document.querySelector("#" + id);
		var shadow = host.createShadowRoot();

		var content = $("#" + id).html();
		var heading = $(this).attr("heading");
		var footer  = $(this).attr("footer");

		var template = importDoc.querySelector('#template-panel');
		xx = shadow;
		yy = template;
		
		shadow.innerHTML =
		    "<style>" +
		    "@import 'https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css';" +
		    "@import 'https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css';" +
		    "</style>" +
		    $(template).html()

		shadow.querySelector(".panel-heading").innerHTML = heading;
		shadow.querySelector(".panel-footer").innerHTML = footer;
		shadow.querySelector(".panel-body").innerHTML = content;

		// IF WE DON'T HAVE A FOOTER
		if (typeof footer === "undefined") {
		    $(shadow).find(".panel-footer").hide();
		}
	    }
	}
    })
});
