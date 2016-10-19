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
    var content = host.innerHTML;

    host.innerHTML = "<style>@import '/tk/wc/lib/mtk.css';</style>" + content;
    xx = host;

    let panels = host.querySelectorAll("mtk-panel")

    for (i=0; i< panels.length; i++) {
	let pid = panels[i].getAttribute("id");
        console.log(">>>", pid, i, panels[i]);

	document.querySelector("#" + pid).close();
    }

    console.groupEnd();
};

////////////////////////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////////////////////////
var Accordion = document.registerElement('mtk-accordion', {
    prototype: Accordion
});
