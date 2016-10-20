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
    let lbl = this.getAttribute("label");
    let host = document.querySelector("#" + id);
    let shadow = host.createShadowRoot();
    let template = importDoc.querySelector('#template-dropdown');

    shadow.innerHTML =
	"<style>" +
	"@import 'https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css';" +
	"@import '/tk/wc/lib/mtk.dropdown.css';" +
	"</style>" +
	template.innerHTML;

    // CHANGE THE LABEL
    shadow.querySelector(".dropdown-btn").innerHTML = lbl;
    
    let dropdown = document.querySelector("#" + id);
    dropdown.addEventListener("click", function (ev) {
	let dropdown = shadow.querySelector(".dropdown-content");
	dropdown.classList.toggle("show");
    });

    console.groupEnd();
};

////////////////////////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////////////////////////
var Dropdown = document.registerElement('mtk-dropdown', {
    prototype: Dropdown
});
