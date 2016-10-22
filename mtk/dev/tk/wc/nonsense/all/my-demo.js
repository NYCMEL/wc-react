var importDoc = document.currentScript.ownerDocument;
var template  = importDoc.getElementById('t');
var demoProto = Object.create(HTMLElement.prototype);

// LIFECYCLE CALLBACKS
demoProto.createdCallback = function() {
    console.group("demoProto.createdCallback");

    var clone = document.importNode(template.content, true);
    
    var shadow = this.createShadowRoot();
    shadow.appendChild(clone);
    
    this._attr = shadow.getElementById('attr');
    this._attr.innerHTML = this.getAttribute('demo');

    console.groupEnd();
};

demoProto.attachedCallback = function() {
    console.group("demoProto.attachedCallback");
    // ADD EVENT LISTENERS HERE
    console.groupEnd();
};

demoProto.detachedCallback = function() {
    console.group("demoProto.detachedCallback");
    // REMOVE EVENT LISTENERS HERE
    console.groupEnd();
};

demoProto.attributeChangedCallback = function(attr, oldVal, newVal) {
    console.group("demoProto.attributeChangedCallback");
    if (attr === 'demo') {
	this._attr.innerHTML = newVal;
    }
    console.groupEnd();
};

// methods
demoProto.talk = function() {
    console.group("demoProto.talk");
    alert('Howdy!');
    console.groupEnd();
};

document.registerElement('my-demo', {
    prototype: demoProto
});
