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
    let tmenus = document.querySelector("menus-top");
    let bmenus = document.querySelector("menus-bot");
    let cmenus = document.querySelector("menus-cog");
    let uname = host.getAttribute("username");

    let template = importDoc.querySelector('#template-header');

    shadow.innerHTML =
	"<style>" +
	"@import 'https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css';" +
	"@import 'https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css';" +
	"@import '/tk/wc/lib/mtk.css';" +
	"</style>" +
	template.innerHTML;

    let topc = shadow.querySelector(".dtcc-topmenu-container")
    let botc = shadow.querySelector(".dtcc-botmenu-container")

    topc.innerHTML = tmenus.innerHTML;
    botc.innerHTML = bmenus.innerHTML;

    // BORADCAST CLICK CALLBACKS ON MENU ITEMS
    let links = shadow.querySelectorAll("a");

    for (i=0; i< links.length; i++) {
	links[i].addEventListener("click", function () {
	    let lid = this.getAttribute("id");
	    console.log('BROADCASTING mtkHeaderMenu', lid);
	    radio('mtkHeaderMenu').broadcast(lid);
	});
    }

    $(document).ready(function() {
	$('dropdown-toggle').dropdown()
    });

    shadow.querySelector(".dtcc-user-name").innerHTML = uname;

    // BROADCAST SEARCH EVENTS
    let search = shadow.querySelector(".dtcc-search-field");

    addEvent(search, "keydown", function(ev) {
        if(ev.keyCode == 13){
	    console.log('BROADCASTING mtkHeaderSearch', search.value);
	    radio('mtkHeaderSearch').broadcast(search.value);
	}
    });

    xx = shadow;

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

////////////////////////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////////////////////////
var Header = document.registerElement('mtk-header', {
    prototype: Header
});

////////////////////////////////////////////////////////////////////////////////////
//// TEMPORARY HERE
////////////////////////////////////////////////////////////////////////////////////
function addEvent(element, eventName, callback) {
    if (element.addEventListener) {
        element.addEventListener(eventName, callback, false);
    } else if (element.attachEvent) {
        element.attachEvent("on" + eventName, callback);
    }
}

