var xx, yy;

// MODAL
var Modal = Object.create(HTMLElement.prototype);

////////////////////////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////////////////////////
Modal.createdCallback = function() {
    console.group("Modal.createdCallback");

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
    var collapsible = $(this).attr("collapsible");

    var template = importDoc.querySelector('#template-modal');
    xx = host;
    yy = template;
    
    shadow.innerHTML =
	"<style>" +
	"@import 'https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css';" +
	"@import 'https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css';" +
	"@import 'bootstrap.custom.css';" +
	"</style>" +
	$(template).html();

    if (collapsible == "true") {
	shadow.querySelector(".modal-heading").innerHTML = "<span class='fa-caret'><i class='fa fa-caret-down'></i></span> " + heading;
	$(shadow.querySelector(".modal-heading")).css("cursor", "pointer");
	$(shadow.querySelector(".modal-heading")).on("click", function() {
	    host.toggle(id);
	});
    } else {
	shadow.querySelector(".modal-heading").innerHTML = heading;
    }

    shadow.querySelector(".modal-footer").innerHTML = footer;
    shadow.querySelector(".modal-body").innerHTML = content;

    $(shadow.querySelector(".modal-heading")).attr("id", id + "-heading");
    $(shadow.querySelector(".modal-body")).attr("id", id + "-body");
    $(shadow.querySelector(".modal-footer")).attr("id", id + "-footer");

    // IF WE DON'T HAVE A FOOTER
    if (typeof footer === "undefined") {
	$(shadow).find(".modal-footer").hide();
    }

    console.groupEnd();
};

////////////////////////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////////////////////////
Modal.toggle = function(id) {
    var handle = this;
    var shadow = this.shadowRoot;

    $(shadow.querySelector(".modal-body")).slideToggle(200, function() {
	console.group("Modal.toggle");
	
	var fa = shadow.querySelector(".modal-heading .fa");

	if ($(fa).hasClass("fa-caret-down")) {
	    handle.close(id);
	} else {
	    handle.open(id);
	}

	console.groupEnd();
    });
};

////////////////////////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////////////////////////
Modal.open = function(id) {
    console.group("Modal.open", id);

    if (typeof id === "undefined") {
	id = $(this).attr("id");
    }

    console.log('PUBLISHED modalOpened', id);
    $.publish('Modal', ['modalOpened', id]);
    
    var shadow = this.shadowRoot;
    var fa = shadow.querySelector(".modal-heading .fa");
    
    $(fa).removeClass("fa-caret-right").addClass("fa-caret-down")
    $(shadow.querySelector(".modal-body")).show();

    console.groupEnd();
}

////////////////////////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////////////////////////
Modal.close = function(id) {
    console.group("Modal.close", id);
    
    if (typeof id === "undefined") {
	id = $(this).attr("id");
    }

    console.log('PUBLISHED modalClosed', id);
    $.publish('Modal', ['modalClosed', id]);
    
    var shadow = this.shadowRoot;
    var fa = shadow.querySelector(".modal-heading .fa");

    $(fa).removeClass("fa-caret-down").addClass("fa-caret-right")
    $(shadow.querySelector(".modal-body")).hide();

    console.groupEnd();
}

////////////////////////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////////////////////////
var Modal = document.registerElement('mtk-modal', {
    prototype: Modal
});
