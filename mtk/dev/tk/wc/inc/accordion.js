// ACCORDION
var Accordion = Object.create(HTMLElement.prototype);

////////////////////////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////////////////////////
Accordion.createdCallback = function() {
    console.group("Accordion.createdCallback");

    // jQuery creates an extra looking for CSS display value
    if (!this.parentNode) {
	return false;
    }
    
    var id = this.getAttribute("id");
    var host = document.querySelector("#" + id);
    var shadow = host.createShadowRoot();

    var content = host.innerHTML;
    var heading = host.getAttribute("heading");
    var footer  = host.getAttribute("footer") || null;
    var collapsible = host.getAttribute("collapsible");

    var template = importDoc.querySelector('#template-accordion');

    shadow.innerHTML =
	"<style>" +
	"@import 'https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css';" +
	"@import 'https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css';" +
	"@import '/tk/wc/inc/bootstrap.custom.css';" +
	"</style>" +
	template.innerHTML;

    if (collapsible == "true") {
	shadow.querySelector(".accordion-heading").innerHTML = "<span class='fa-caret'><i class='fa fa-angle-down'></i></span> " + heading;
	shadow.querySelector(".accordion-heading").setAttribute("style", "cursor: pointer");
	shadow.querySelector(".accordion-heading").addEventListener("click", function() {
	    host.toggle(id);
	});
    } else {
	shadow.querySelector(".accordion-heading").innerHTML = heading;
    }

    if (footer == null) {
	shadow.querySelector(".accordion-footer").setAttribute("style", "display:none");
    } else {
	shadow.querySelector(".accordion-footer").innerHTML = footer;
	shadow.querySelector(".accordion-footer").setAttribute("id", id + "-footer");
    }
    shadow.querySelector(".accordion-body").innerHTML = content;
    shadow.querySelector(".accordion-heading").setAttribute("id", id + "-heading");
    shadow.querySelector(".accordion-body").setAttribute("id", id + "-body");

    console.groupEnd();
};

////////////////////////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////////////////////////
Accordion.toggle = function(id) {
    var handle = this;
    var shadow = this.shadowRoot;

    console.group("Accordion.toggle");
    
    var fa = shadow.querySelector(".accordion-heading .fa");
    
    if (fa.classList.contains("fa-angle-down")) {
	handle.close(id);
    } else {
	handle.open(id);
    }
    
    console.groupEnd();
};

////////////////////////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////////////////////////
Accordion.open = function(id) {
    console.group("Accordion.open", id);

    if (typeof id === "undefined") {
	id = this.getAttribute("id");
    }

    console.log('BROADCASTING accordionOpened', id);
    radio('accordionOpened').broadcast(id);
    
    var shadow = this.shadowRoot;
    var fa = shadow.querySelector(".accordion-heading .fa");
    
    fa.classList.remove("fa-angle-right");
    fa.classList.add("fa-angle-down");
    
    shadow.querySelector(".accordion-body").setAttribute("style", "display:block");

    console.groupEnd();
}

////////////////////////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////////////////////////
Accordion.close = function(id) {
    console.group("Accordion.close", id);
    
    if (typeof id === "undefined") {
	id = this.getAttribute("id");
    }

    console.log('BROADCASTING accordionClosed', id);
    radio('accordionClosed').broadcast(id);
    
    var shadow = this.shadowRoot;
    var fa = shadow.querySelector(".accordion-heading .fa");

    fa.classList.remove("fa-angle-down");
    fa.classList.add("fa-angle-right");
    
    shadow.querySelector(".accordion-body").setAttribute("style", "display:none");

    console.groupEnd();
}

////////////////////////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////////////////////////
var Accordion = document.registerElement('mtk-accordion', {
    prototype: Accordion
});
