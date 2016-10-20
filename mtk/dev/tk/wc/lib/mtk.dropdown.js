// DROPDOWN
var Dropdown = Object.create(HTMLElement.prototype);

////////////////////////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////////////////////////
Dropdown.createdCallback = function() {
    console.group("Dropdown.createdCallback");

    // jQuery creates an extra looking for CSS display value
    if (!this.parentNode) {
	return false;
    }
    
    let id = this.getAttribute("id");
    let host = document.querySelector("#" + id);
    let shadow = host.createShadowRoot();
    let content = host.innerHTML;
    let header = host.getAttribute("header");
    let height = host.getAttribute("height") || "100%";
    let footer  = host.getAttribute("footer");
    let collapsible = host.getAttribute("collapsible");

    let template = importDoc.querySelector('#template-dropdown');

    shadow.innerHTML =
	"<style>" +
	"@import 'https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css';" +
	"@import 'https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css';" +
	"@import '/tk/wc/lib/mtk.css';" +
	"</style>" +
	template.innerHTML;

    shadow.querySelector(".dropdown-body").setAttribute("style", "height:" + height);
    shadow.querySelector(".dropdown-body").innerHTML = content;
    shadow.querySelector(".dropdown-heading").setAttribute("id", id + "-header");
    shadow.querySelector(".dropdown-body").setAttribute("id", id + "-body");

    if (footer == null) {
	shadow.querySelector(".dropdown-footer").setAttribute("style", "display:none");
    } else {
	shadow.querySelector(".dropdown-footer").innerHTML = footer;
	shadow.querySelector(".dropdown-footer").setAttribute("id", id + "-footer");
    }

    if (collapsible == "true") {
	shadow.querySelector(".dropdown-heading").innerHTML = "<span class='fa-caret'><i class='fa fa-angle-down'></i></span> <span class=the-header>" + header + "</span>";
	shadow.querySelector(".dropdown-heading").setAttribute("style", "cursor: pointer");
	shadow.querySelector(".dropdown-heading").addEventListener("click", function() {
	    host.toggle();
	});
    } else {
	shadow.querySelector(".dropdown-heading").innerHTML = "<span class=the-header>" + header + "</span>";
    }

    console.groupEnd();
};

////////////////////////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////////////////////////
Dropdown.toggle = function() {
    let handle = this;
    let shadow = this.shadowRoot;

    console.group("Dropdown.toggle");
    
    let fa = shadow.querySelector(".dropdown-heading .fa");
    
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
Dropdown.open = function() {
    console.group("Dropdown.open");

    let id = this.getAttribute("id");
    
    console.log('BROADCASTING mtkDropdownOpened', id);
    radio('mtkDropdownOpened').broadcast(id);
    
    let shadow = this.shadowRoot;
    let fa = shadow.querySelector(".dropdown-heading .fa");
    
    fa.classList.remove("fa-angle-right");
    fa.classList.add("fa-angle-down");
    
    shadow.querySelector(".dropdown-body").setAttribute("style", "display:block");

    console.groupEnd();
}

////////////////////////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////////////////////////
Dropdown.close = function() {
    console.group("Dropdown.close");
    
    let id = this.getAttribute("id");

    console.log('BROADCASTING mtkDropdownClosed', id);
    radio('mtkDropdownClosed').broadcast(id);
    
    let shadow = this.shadowRoot;
    let fa = shadow.querySelector(".dropdown-heading .fa");

    fa.classList.remove("fa-angle-down");
    fa.classList.add("fa-angle-right");
    
    //shadow.querySelector(".dropdown-body").setAttribute("style", "display:none");
    shadow.querySelector(".dropdown-body").style.setProperty('display','none');
    console.groupEnd();
}

////////////////////////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////////////////////////
Dropdown.configure = function(options) {
    console.group("Dropdown.close", options);

    let id = this.getAttribute("id");
    let host = document.querySelector("#" + id);
    let shadow = host.shadowRoot;

    for (var key in options) {
	switch(key) 
	{
	    case "header":
	    shadow.querySelector(".dropdown-heading .the-header").innerHTML = options[key];
	    break;

	    case "content":
	    load(options[key], shadow.querySelector(".dropdown-body"))
	    break;

	    case "footer":
	    shadow.querySelector(".dropdown-footer").innerHTML = options[key];
	    break;
	}

    }

    console.groupEnd();
}    

function load(url, element)
{
    req = new XMLHttpRequest();
    req.open("GET", url, false);
    req.send(null);

    element.innerHTML = req.responseText; 
}

////////////////////////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////////////////////////
var Dropdown = document.registerElement('mtk-dropdown', {
    prototype: Dropdown
});
