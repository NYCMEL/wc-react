// HEADER
var Header = Object.create(HTMLElement.prototype);

////////////////////////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////////////////////////
Header.createdCallback = function() {
    console.group("Header.createdCallback");

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

    let template = importDoc.querySelector('#template-header');

    shadow.innerHTML =
	"<style>" +
	"@import 'https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css';" +
	"@import 'https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css';" +
	"@import '/tk/wc/lib/mtk.css';" +
	"</style>" +
	template.innerHTML;

    shadow.querySelector(".header-body").setAttribute("style", "height:" + height);
    shadow.querySelector(".header-body").innerHTML = content;
    shadow.querySelector(".header-heading").setAttribute("id", id + "-header");
    shadow.querySelector(".header-body").setAttribute("id", id + "-body");

    if (footer == null) {
	shadow.querySelector(".header-footer").setAttribute("style", "display:none");
    } else {
	shadow.querySelector(".header-footer").innerHTML = footer;
	shadow.querySelector(".header-footer").setAttribute("id", id + "-footer");
    }

    if (collapsible == "true") {
	shadow.querySelector(".header-heading").innerHTML = "<span class='fa-caret'><i class='fa fa-angle-down'></i></span> <span class=the-header>" + header + "</span>";
	shadow.querySelector(".header-heading").setAttribute("style", "cursor: pointer");
	shadow.querySelector(".header-heading").addEventListener("click", function() {
	    host.toggle();
	});
    } else {
	shadow.querySelector(".header-heading").innerHTML = "<span class=the-header>" + header + "</span>";
    }

    console.groupEnd();
};

////////////////////////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////////////////////////
Header.toggle = function() {
    let handle = this;
    let shadow = this.shadowRoot;

    console.group("Header.toggle");
    
    let fa = shadow.querySelector(".header-heading .fa");
    
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
Header.open = function() {
    console.group("Header.open");

    let id = this.getAttribute("id");
    
    console.log('BROADCASTING mtkHeaderOpened', id);
    radio('mtkHeaderOpened').broadcast(id);
    
    let shadow = this.shadowRoot;
    let fa = shadow.querySelector(".header-heading .fa");
    
    fa.classList.remove("fa-angle-right");
    fa.classList.add("fa-angle-down");
    
    shadow.querySelector(".header-body").setAttribute("style", "display:block");

    console.groupEnd();
}

////////////////////////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////////////////////////
Header.close = function() {
    console.group("Header.close");
    
    let id = this.getAttribute("id");

    console.log('BROADCASTING mtkHeaderClosed', id);
    radio('mtkHeaderClosed').broadcast(id);
    
    let shadow = this.shadowRoot;
    let fa = shadow.querySelector(".header-heading .fa");

    fa.classList.remove("fa-angle-down");
    fa.classList.add("fa-angle-right");
    
    //shadow.querySelector(".header-body").setAttribute("style", "display:none");
    shadow.querySelector(".header-body").style.setProperty('display','none');
    console.groupEnd();
}

////////////////////////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////////////////////////
Header.configure = function(options) {
    console.group("Header.close", options);

    let id = this.getAttribute("id");
    let host = document.querySelector("#" + id);
    let shadow = host.shadowRoot;

    for (var key in options) {
        console.log(">>>>>>>>", key, options[key])

	switch(key) 
	{
	    case "header":
	    shadow.querySelector(".header-heading .the-header").innerHTML = options[key];
	    break;

	    case "content":
	    load(options[key], shadow.querySelector(".header-body"))
	    break;

	    case "footer":
	    shadow.querySelector(".header-footer").innerHTML = options[key];
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
var Header = document.registerElement('mtk-header', {
    prototype: Header
});
