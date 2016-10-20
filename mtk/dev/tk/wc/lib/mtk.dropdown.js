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
    let template = importDoc.querySelector('#template-dropdown');

    shadow.innerHTML =
	"<style>" +
	"@import 'https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css';" +
	"@import '/tk/wc/lib/mtk.dropdown.css';" +
	"</style>" +
	template.innerHTML;

    console.groupEnd();
};

////////////////////////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////////////////////////
var Dropdown = document.registerElement('mtk-dropdown', {
    prototype: Dropdown
});
