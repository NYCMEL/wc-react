(function(window, document, undefined) {
    // REFERS TO THE "IMPORTER", WHICH IS INDEX.HTML
    var thatDoc = document;

    // REFERS TO THE "IMPORTEE", WHICH IS PANEL.HTML
    var thisDoc =  (thatDoc._currentScript || thatDoc.currentScript).ownerDocument;

    // GETS CONTENT FROM <TEMPLATE>
    var template = thisDoc.querySelector("#template-panel").content;

    // CREATES AN OBJECT BASED IN THE HTML ELEMENT PROTOTYPE
    var Panel = Object.create(HTMLElement.prototype);

    // CREATES THE "WHO" ATTRIBUTE AND SETS A DEFAULT VALUE
    Panel.who = "World";

    // FIRES WHEN AN INSTANCE OF THE ELEMENT IS CREATED
    Panel.createdCallback = function() {
	console.group("Panel.createdCallback")

        // CREATES THE SHADOW ROOT
        var shadowRoot = this.createShadowRoot();

        // ADDS A TEMPLATE CLONE INTO SHADOW ROOT
        var clone = thatDoc.importNode(template, true);
        shadowRoot.appendChild(clone);

        // CACHES <STRONG> DOM QUERY
        this.strong = shadowRoot.querySelector("strong");

        // CHECKS IF THE "WHO" ATTRIBUTE HAS BEEN OVERWRITTEN
        if (this.hasAttribute("who")) {
	    var who = this.getAttribute("who");
	    this.setWho(who);
        }
        else {
	    this.setWho(this.who);
        }

	console.groupEnd()
    };

    // FIRES WHEN AN ATTRIBUTE WAS ADDED, REMOVED, OR UPDATED
    Panel.attributeChangedCallback = function(attr, oldVal, newVal) {
	console.group("Panel.attributeChangedCallback")

        if (attr === "who") {
	    this.setWho(newVal);
        }

	console.groupEnd();
    };

    // SETS NEW VALUE TO "WHO" ATTRIBUTE
    Panel.setWho = function(val) {
	console.group("Panel.setWho")

        this.who = val;

        // Sets "who" value into <strong>
        this.strong.textContent = this.who;

	console.groupEnd();
    };

    // REGISTERS <HELLO-WORLD> IN THE MAIN DOCUMENT
    window.MyElement = thatDoc.registerElement("hello-world", {
        prototype: Panel
    });
})(window, document);