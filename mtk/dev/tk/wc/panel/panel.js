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
    
    var id = this.getAttribute("id");
    var host = document.querySelector("#" + id);
    var shadow = host.createShadowRoot();

    var content = host.innerHTML;
    var heading = host.getAttribute("heading");
    var footer  = host.getAttribute("footer") || null;
    var collapsible = host.getAttribute("collapsible");

    var template = importDoc.querySelector('#template-panel');

    shadow.innerHTML =
	"<style>" +
	"@import 'https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css';" +
	"@import 'https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css';" +
	"@import 'inc/bootstrap.custom.css';" +
	"</style>" +
	template.innerHTML;

    if (collapsible == "true") {
	shadow.querySelector(".panel-heading").innerHTML = "<span class='fa-caret'><i class='fa fa-caret-down'></i></span> " + heading;
	shadow.querySelector(".panel-heading").setAttribute("style", "cursor: pointer");
	shadow.querySelector(".panel-heading").addEventListener("click", function() {
	    host.toggle(id);
	});
    } else {
	shadow.querySelector(".panel-heading").innerHTML = heading;
    }

    if (footer == null) {
	shadow.querySelector(".panel-footer").setAttribute("style", "display:none");
    } else {
	shadow.querySelector(".panel-footer").innerHTML = footer;
	shadow.querySelector(".panel-footer").setAttribute("id", id + "-footer");
    }
    shadow.querySelector(".panel-body").innerHTML = content;
    shadow.querySelector(".panel-heading").setAttribute("id", id + "-heading");
    shadow.querySelector(".panel-body").setAttribute("id", id + "-body");

    console.groupEnd();
};

////////////////////////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////////////////////////
Panel.toggle = function(id) {
    var handle = this;
    var shadow = this.shadowRoot;

    console.group("Panel.toggle");
    
    var fa = shadow.querySelector(".panel-heading .fa");
    
    if (fa.classList.contains("fa-caret-down")) {
	handle.close(id);
    } else {
	handle.open(id);
    }
    
    console.groupEnd();
};

////////////////////////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////////////////////////
Panel.open = function(id) {
    console.group("Panel.open", id);

    if (typeof id === "undefined") {
	id = this.getAttribute("id");
    }

    console.log('BROADCASTING panelOpened', id);
    radio('panelOpened').broadcast(id);
    
    var shadow = this.shadowRoot;
    var fa = shadow.querySelector(".panel-heading .fa");
    
    fa.classList.remove("fa-caret-right");
    fa.classList.add("fa-caret-down");
    
    shadow.querySelector(".panel-body").setAttribute("style", "display:block");

    console.groupEnd();
}

////////////////////////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////////////////////////
Panel.close = function(id) {
    console.group("Panel.close", id);
    
    if (typeof id === "undefined") {
	id = this.getAttribute("id");
    }

    console.log('BROADCASTING panelClosed', id);
    radio('panelClosed').broadcast(id);
    
    var shadow = this.shadowRoot;
    var fa = shadow.querySelector(".panel-heading .fa");

    fa.classList.remove("fa-caret-down");
    fa.classList.add("fa-caret-right");
    
    shadow.querySelector(".panel-body").setAttribute("style", "display:none");

    console.groupEnd();
}

////////////////////////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////////////////////////
var Panel = document.registerElement('mtk-panel', {
    prototype: Panel
});
