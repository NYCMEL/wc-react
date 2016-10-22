/////////////////////////////////////////////////////////////////////////////////
//// Time-stamp: <2016-09-14 07:15:09 (melify)>
/////////////////////////////////////////////////////////////////////////////////
class MelifyIT extends HTMLElement {
    constructor() {
	super();
    };

    /////////////////////////////////////////////////////////////////////////////
    //// 
    /////////////////////////////////////////////////////////////////////////////
    connectedCallback() {
	console.group("MelifyIT.connectedCallback");

	this.id        = this.attributes.id.value;
	this.el        = document.getElementById(this.id);
	this.uic       = this.attributes.uiconfig.value;
	this.template  = `<h1>HELLO MEL</h1>`;
	this.innerHTML = this.template;

	this.classList.add("tk-component");
	console.log("id:", this.id);
	console.log("uic:", this.uic);

	this.configure(eval(this.uic));
	
	this.el.onclick = function (ev) {
	    console.log("PUBLISHED: melifyit-clicked", this.id, ev);
	    radio("melifyit-clicked").broadcast(ev, this.id);
	}

	console.groupEnd();
    };

    /////////////////////////////////////////////////////////////////////////////
    //// 
    /////////////////////////////////////////////////////////////////////////////
    configure(c) {
	console.group("MelifyIT.configure:", JSON.stringify(c));

	var style = this.el.style;
	style.background   = c.background;
	style.color        = c.color;
	style.borderRadius = c.borderRadius;
	style.border       = c.border;

	console.groupEnd();
    };

    /////////////////////////////////////////////////////////////////////////////
    //// el.get("background") > configure is your setter
    /////////////////////////////////////////////////////////////////////////////
    get(what) {
	console.group("MelifyIT.get:", what);
	console.groupEnd();
    }
}

window.customElements.define("melify-it", MelifyIT);

/////////////////////////////////////////////////////////////////////////////////
//// TEMPORARY LOCATION
/////////////////////////////////////////////////////////////////////////////////
var myconfig = {
    background   : "green",
    color        : "yellow",
    borderRadius : "10px",
    border       : "2px red dashed"
};
