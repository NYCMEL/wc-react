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
    var show = this.getAttribute("show") || 0;
    var mode = this.getAttribute("mode") || "single";
    var host = document.querySelector("#" + id);
    var content = host.innerHTML;

    host.innerHTML = "<style>@import '/tk/wc/lib/mtk.css';</style>" + content;

    let panels = host.querySelectorAll("mtk-panel")

    for (i=0; i< panels.length; i++) {
	let pid = panels[i].getAttribute("id");
	console.log(">>>>>>>>>>>", i, pid);
	
	if (show != i) {
	    try {
		document.querySelector("#" + pid).close();
	    }
	    catch(e) {
		console.error(e.name + ' > ' + e.message);
	    }
	}
    }

    // SUBSCRIBE TO PANEL EVENTS
    if (mode == "single") {
	radio('mtkPanelOpened').subscribe(function(eid) {
	    for (i=0; i< panels.length; i++) {
		let pid = panels[i].getAttribute("id");
		
		if (pid != eid) {
		    document.querySelector("#" + pid).close();
		}
	    }
	});
    }

    console.groupEnd();
};

////////////////////////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////////////////////////
Accordion.single = function(action, eid) {
    console.group("Accordion.single:", action, eid);
    
    console.groupEnd();
}

////////////////////////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////////////////////////
var Accordion = document.registerElement('mtk-accordion', {
    prototype: Accordion
});
