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

    alert(id);

    console.groupEnd();
};

////////////////////////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////////////////////////
var Accordion = document.registerElement('mtk-accordion', {
    prototype: Accordion
});
