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
    let header = host.getAttribute("header");
    let footer  = host.getAttribute("footer");
    let collapsible = host.getAttribute("collapsible");

    let template = importDoc.querySelector('#template-panel');

    shadow.innerHTML =
	"<style>" +
	"@import 'https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css';" +
	"@import 'https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css';" +
	"@import '/tk/wc/lib/mtk.css';" +
	"</style>" +
	template.innerHTML;

    shadow.querySelector(".panel-body").innerHTML = content;
    shadow.querySelector(".panel-heading").setAttribute("id", id + "-header");
    shadow.querySelector(".panel-body").setAttribute("id", id + "-body");

    if (footer == null) {
	shadow.querySelector(".panel-footer").setAttribute("style", "display:none");
    } else {
	shadow.querySelector(".panel-footer").innerHTML = footer;
	shadow.querySelector(".panel-footer").setAttribute("id", id + "-footer");
    }

    if (collapsible == "true") {
	shadow.querySelector(".panel-heading").innerHTML = "<span class='fa-caret'><i class='fa fa-angle-down'></i></span> " + header;
	shadow.querySelector(".panel-heading").setAttribute("style", "cursor: pointer");
	shadow.querySelector(".panel-heading").addEventListener("click", function() {
	    host.toggle();
	});
    } else {
	shadow.querySelector(".panel-heading").innerHTML = header;
    }

    console.groupEnd();
};

////////////////////////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////////////////////////
Panel.toggle = function() {
    let handle = this;
    let shadow = this.shadowRoot;

    console.group("Panel.toggle");
    
    let fa = shadow.querySelector(".panel-heading .fa");
    
    if (fa.classList.contains("fa-angle-down")) {
	handle.close();
    } else {
	handle.open();
    }
    
    console.groupEnd();
};

////////////////////////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////////////////////////
Panel.open = function() {
    console.group("Panel.open");

    let id = this.getAttribute("id");

    console.log('BROADCASTING mtkPanelOpened', id);
    radio('mtkPanelOpened').broadcast(id);
    
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
Panel.close = function() {
    console.group("Panel.close");
    
    let id = this.getAttribute("id");

    console.log('BROADCASTING mtkPanelClosed', id);
    radio('mtkPanelClosed').broadcast(id);
    
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
Panel.configure = function(options) {
    console.group("Panel.close", options);

    for (var key in options) {
        console.log(">>>>>>>>>", key, options[key])

	switch(n) 
	{
	    case "header":
	    break;

	    case "content":
	    break;

	    case "footer":
	    break;
	}

    }

    console.groupEnd();
}    

////////////////////////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////////////////////////
var Panel = document.registerElement('mtk-panel', {
    prototype: Panel
});
