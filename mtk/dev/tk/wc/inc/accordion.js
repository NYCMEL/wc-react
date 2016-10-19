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

    shadow.innerHTML =
	"<style>" +
	"@import 'https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css';" +
	"@import 'https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css';" +
	"@import '/tk/wc/inc/bootstrap.custom.css';" +
	"</style>" +
	template.innerHTML;

    console.groupEnd();
};

////////////////////////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////////////////////////
var Accordion = document.registerElement('mtk-accordion', {
    prototype: Accordion
});
