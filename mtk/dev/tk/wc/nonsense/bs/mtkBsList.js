(function() {
    var importDoc = document.currentScript.ownerDocument;
    var template = importDoc.getElementById("mtk-bs-list-template");
    
    var mtkBsList = Object.create(HTMLElement.prototype);
    
    // LIFECYCLE CALLBACKS
    mtkBsList.createdCallback = function() {
	console.group("mtkBsList.createdCallback");

	console.log("uiconf=", $("mtk-bs-list").attr("uiconf"))

	var clone = document.importNode(template.content, true);
	
	// SHADOW DOM
	var shadow = this.createShadowRoot();
	shadow.appendChild(clone);
	
	this._container = shadow.getElementById("demo-container");

	console.groupEnd();
    };
    
    mtkBsList.attachedCallback = function() {
	console.group("mtkBsList.attachedCallback");
	// ADD EVENT LISTENERS HERE
	console.groupEnd();
    };
    
    mtkBsList.detachedCallback = function() {
	console.group("mtkBsList.detachedCallback");
	// REMOVE EVENT LISTENERS HERE
	console.groupEnd();
    };
    
    mtkBsList.attributeChangedCallback = function(attr, oldVal, newVal) {
	console.group("mtkBsList.attributeChangedCallback");

	console.groupEnd();
    };
    
    document.registerElement("mtk-bs-list", {
	prototype: mtkBsList
    });
})();
