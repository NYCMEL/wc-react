var panelconf;

/////////////////////////////////////////////////////////////////////////////////
//// Time-stamp: <2016-09-18 19:21:03 (melify)>
/////////////////////////////////////////////////////////////////////////////////
class Accordion extends HTMLElement {
    constructor() {
	super();
    };

    /////////////////////////////////////////////////////////////////////////////
    //// 
    /////////////////////////////////////////////////////////////////////////////
    connectedCallback() {
	console.group("Accordion.connectedCallback");

	this.id  = this.attributes.id.value;
	this.el  = document.getElementById(this.id);
	this.uic = this.attributes.uiconfig.value;

	this.configure(eval(this.uic))

	console.groupEnd();
    };

    /////////////////////////////////////////////////////////////////////////////
    //// 
    /////////////////////////////////////////////////////////////////////////////
    clicked(ev, id) {
	console.group("Accordion.clicked:", id);

	var par = $("#" + id).parent();

	par.find(".panel-body").hide();

	$("#" + id + " .panel-body").show();
	
	console.groupEnd();
    };
    
    /////////////////////////////////////////////////////////////////////////////
    //// 
    /////////////////////////////////////////////////////////////////////////////
    configure(c) {
	console.group("Accordion.configure:", JSON.stringify(c));

	var id = this.id;

	for (var key in c.panels) {
            console.log(">>>>>>", c.panels[key].id)

	    panelconf = c.panels[key];

	    $("#" + id).append("<mtk-panel id='" + c.panels[key].id + "' uiconfig='panelconf'></mtk-panel>");
	}

	$("#" + id + " .panel").css("margin-bottom", 0);

	if (c.mode == "single") {
	    radio("mtk-panel-clicked").subscribe(this.clicked)
	}

	console.groupEnd();
    };

    /////////////////////////////////////////////////////////////////////////////
    //// 
    /////////////////////////////////////////////////////////////////////////////
    toggle() {
	console.group("Accordion.toggle");
	
	console.groupEnd();
    }
}

window.customElements.define("mtk-accordion", Accordion);

