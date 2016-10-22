/////////////////////////////////////////////////////////////////////////////////
//// Time-stamp: <2016-09-14 10:42:21 (melify)>
/////////////////////////////////////////////////////////////////////////////////
class Panel extends HTMLElement {
    constructor() {
	super();
    };

    /////////////////////////////////////////////////////////////////////////////
    //// 
    /////////////////////////////////////////////////////////////////////////////
    connectedCallback() {
	console.group("Panel.connectedCallback");

	this.id        = this.attributes.id.value;
	this.el        = document.getElementById(this.id);
	this.uic       = this.attributes.uiconfig.value;
	this.template  = `
	    <div class="panel panel-default">
	    <div class="panel-heading">
	    <span class="icons" style="display:none">
	    <i class="fa fa-angle-right"></i>
	    <i class="fa fa-angle-down"></i>
	    </span>
	    <span class="title">XXXPANEL-HEADING</span></div>
	    <div class="panel-body"><img src="http://tk-samples.melify.com/tk/img/common/loading.3.gif" /></div>
	    </div>
	    `;

	this.innerHTML = this.template;

	this.configure(eval(this.uic))

	console.groupEnd();
    };

    /////////////////////////////////////////////////////////////////////////////
    //// 
    /////////////////////////////////////////////////////////////////////////////
    configure(c) {
	console.group("Panel.configure:", JSON.stringify(c));

	$("#" + this.id + " .panel-heading .title").html(c.title);
	
	if (typeof c.url !== "undefined") {
	    $("#" + this.id + " .panel-body").load(location.protocol + "//" + location.host + c.url);
	}

	var id = this.id;

	if (c.expandable) {
	    $("#" + id + " .panel-heading .icons .fa").hide();

	    //this.toggle()

	    $("#" + id + " .panel-heading .icons").show();
	    $("#" + id + " .panel-heading").css("cursor", "pointer").on("click", function(ev) {
		$("#" + id + " .panel-body").slideToggle(0);

		console.log("PUBLISHED: mtk-panel-clicked", id, $("#" + id + " .panel-body").is(":visible"), ev);
		radio("mtk-panel-clicked").broadcast(ev, id);
	    });
	}

	$("#" + id + " .panel-body").css("height", c.height);

	if (c.closed) {
	    $("#" + id + " .panel-body").hide();
	}

	console.groupEnd();
    };

    /////////////////////////////////////////////////////////////////////////////
    //// 
    /////////////////////////////////////////////////////////////////////////////
    toggle() {
	console.group("Panel.toggle");
	
	var id = this.id;

	if ($("#" + id + " .panel-body").is(":visible")) {
	    $("#" + id + " .panel-heading .icons .fa-angle-right").hide();
	    $("#" + id + " .panel-heading .icons .fa-angle-down").show();
	} else {
	    $("#" + id + " .panel-heading .icons .fa-angle-down").hide();
	    $("#" + id + " .panel-heading .icons .fa-angle-right").show();
	}

	console.groupEnd();
    }
}

window.customElements.define("mtk-panel", Panel);

