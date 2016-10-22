/////////////////////////////////////////////////////////////////////////////////
//// Time-stamp: <2016-09-14 09:01:12 (melify)>
/////////////////////////////////////////////////////////////////////////////////
class mtkComponent extends HTMLElement {
    constructor() {
	super();
    };

    /////////////////////////////////////////////////////////////////////////////
    //// 
    /////////////////////////////////////////////////////////////////////////////
    connectedCallback() {
	console.group("mtkComponent.connectedCallback");

	this.id        = this.attributes.id.value;
	this.el        = document.getElementById(this.id);
	this.uic       = this.attributes.uiconfig.value;
	this.name      = this.attributes.name.value;
	console.log(this.id, this.uic, this.name);

	var id = this.id;
	var ui = eval(this.uic);
	console.log(ui.id)

	$("#" + this.id).append("<" + this.name + " id='" + ui.id + "' uiconfig='" + this.uic + "'></" + this.name + ">");
	$("#" + id).removeAttr("id").removeAttr("uiconfig").removeAttr("name");

	console.log(this.el);

	console.groupEnd();
    };

    /////////////////////////////////////////////////////////////////////////////
    //// 
    /////////////////////////////////////////////////////////////////////////////
    configure(c) {
	console.group("mtkComponent.configure:", JSON.stringify(c));

	console.groupEnd();
    };

    /////////////////////////////////////////////////////////////////////////////
    //// el.get("background") > configure is your setter
    /////////////////////////////////////////////////////////////////////////////
    get(what) {
	console.group("mtkComponent.get:", what);

	console.groupEnd();
    }
}

window.customElements.define("mtk-component", mtkComponent);
