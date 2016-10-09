var xx, yy;

// PANEL
var Panel = Object.create(HTMLElement.prototype);

////////////////////////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////////////////////////
Panel.createdCallback = function() {
    console.group("Panel.createdCallback");

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

    var template = importDoc.querySelector('#template-panel');
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
	shadow.querySelector(".panel-heading").innerHTML = "<span class='fa-caret'><i class='fa fa-caret-down'></i></span> " + heading;
	$(shadow.querySelector(".panel-heading")).css("cursor", "pointer");
	$(shadow.querySelector(".panel-heading")).on("click", function() {
	    host.toggle(id, shadow);
	});
    } else {
	shadow.querySelector(".panel-heading").innerHTML = heading;
    }

    shadow.querySelector(".panel-footer").innerHTML = footer;
    shadow.querySelector(".panel-body").innerHTML = content;

    $(shadow.querySelector(".panel-heading")).attr("id", id + "-heading");
    $(shadow.querySelector(".panel-body")).attr("id", id + "-body");
    $(shadow.querySelector(".panel-footer")).attr("id", id + "-footer");

    // IF WE DON'T HAVE A FOOTER
    if (typeof footer === "undefined") {
	$(shadow).find(".panel-footer").hide();
    }

    console.groupEnd();
};

////////////////////////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////////////////////////
Panel.toggle = function(id, shadow) {
    var handle = this;

    $(shadow.querySelector(".panel-body")).slideToggle(200, function() {
	console.group("Panel.toggle");

	var fa  = $(shadow.querySelector(".panel-heading .fa"));

	if (fa.hasClass("fa-caret-down")) {
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
Panel.open = function(id) {
    console.group("Panel.open", id);

    console.log('PUBLISHED panelOpened', id);
    $.publish('Panel', ['panelOpened', id]);
    
    var shadow = this.shadowRoot;
    var host = document.querySelector("#" + id);
    var fa   = shadow.querySelector(".fa");
    
    $(fa).removeClass("fa-caret-right").addClass("fa-caret-down")

    console.groupEnd();
}

////////////////////////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////////////////////////
Panel.close = function(id) {
    console.group("Panel.close", id);

    var host = document.querySelector("#" + id);
    var fa   = host.querySelector(".fa");

    console.log('PUBLISHED panelClosed', id);
    $.publish('Panel', ['panelClosed', id]);
    
    $(fa).removeClass("fa-caret-down").addClass("fa-caret-right")

    console.groupEnd();
}

////////////////////////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////////////////////////
var Panel = document.registerElement('bs-panel', {
    prototype: Panel
});
