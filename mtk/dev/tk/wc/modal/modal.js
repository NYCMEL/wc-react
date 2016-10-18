// MODAL
var Modal = Object.create(HTMLElement.prototype);

////////////////////////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////////////////////////
Modal.createdCallback = function() {
    console.group("Modal.createdCallback");

    // jQuery creates an extra looking for CSS display value
    if (!this.parentNode) {
	return false;
    }
    
    var id = $(this).attr("id");
    var host = document.querySelector("#" + id);
    var shadow = host.createShadowRoot();

    var content = $("#" + id).html();
    var heading = $(this).attr("heading");
    var footer  = $(this).attr("footer");
    var collapsible = $(this).attr("collapsible");

    var template = importDoc.querySelector('#template-modal');
    
    shadow.innerHTML =
	"<style>" +
	"@import 'https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css';" +
	"@import 'https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css';" +
	"@import '/tk/wc/inc/bootstrap.custom.css';" +
	"</style>" +
	$(template).html();

    console.groupEnd();
};

////////////////////////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////////////////////////
var Modal = document.registerElement('mtk-modal', {
    prototype: Modal
});
