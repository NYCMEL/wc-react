var xx, yy;

// PANEL
var Panel = Object.create(HTMLElement.prototype);

////////////////////////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////////////////////////
Panel.createdCallback = function() {
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
	shadow.querySelector(".panel-heading").innerHTML = "<i class='fa fa-caret-down'></i> " + heading;
	$(shadow.querySelector(".panel-heading")).css("cursor", "pointer");
	$(shadow.querySelector(".panel-heading")).on("click", function() {
	    host.toggle(shadow);
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
};

////////////////////////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////////////////////////
Panel.toggle = function(shadow) {
    $(shadow.querySelector(".panel-body")).slideToggle("slow");
};

////////////////////////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////////////////////////
var Panel = document.registerElement('bs-panel', {
    prototype: Panel
});
