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
    
    let id = this.getAttribute("id");
    let host = document.querySelector("#" + id);
    let shadow = host.createShadowRoot();
    let content = host.innerHTML;
    let heading = host.getAttribute("heading");
    let footer  = host.getAttribute("footer") || null;
    let collapsible = host.getAttribute("collapsible");

    let template = importDoc.querySelector('#template-panel');

    shadow.innerHTML =
	"<style>" +
	"@import 'https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css';" +
	"@import 'https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css';" +
	"@import '/tk/wc/lib/mtk.css';" +
	"</style>" +
	template.innerHTML;


    if (collapsible == "true") {
	shadow.querySelector(".panel-heading").innerHTML = "<span class='fa-caret'><i class='fa fa-angle-down'></i></span> " + heading;
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
    let handle = this;
    let shadow = this.shadowRoot;

    console.group("Panel.toggle");
    
    let fa = shadow.querySelector(".panel-heading .fa");
    
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
Panel.open = function(id) {
    console.group("Panel.open", id);

    if (typeof id === "undefined") {
	id = this.getAttribute("id");
    }

    console.log('BROADCASTING panelOpened', id);
    radio('panelOpened').broadcast(id);
    
    let shadow = this.shadowRoot;
    let fa = shadow.querySelector(".panel-heading .fa");
    
    fa.classList.remove("fa-angle-right");
    fa.classList.add("fa-angle-down");
    
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
    
    let shadow = this.shadowRoot;
    let fa = shadow.querySelector(".panel-heading .fa");

    fa.classList.remove("fa-angle-down");
    fa.classList.add("fa-angle-right");
    
    shadow.querySelector(".panel-body").setAttribute("style", "display:none");

    console.groupEnd();
}

////////////////////////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////////////////////////
var Panel = document.registerElement('mtk-panel', {
    prototype: Panel
});
