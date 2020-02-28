/**
 * Typeahead Component<BR>
 * <BR><BR><img src=../img/typeahead.png width=80% style="border:1px lime dashed;padding:20px">
 * <BR><BR><a href="../html/typeahead.html">DEMO</a>
 */
class Typeahead extends HTMLElement {
    constructor() {
        console.group("Typeahead.constructor")
	
        super();

        console.groupEnd();
    };
    
    /**
     * Set observable values here. When Changed, attributeChangedCallback is invoked
     * @observedAttributes
     */
    static get observedAttributes() {
        console.group("Typeahead.observedAttributes");

	this.observables = [];

        console.groupEnd();
        return this.observables;
    };

    /**
     * This function is called when this is attached to DOM
     * @connectedCallback. 
     */
    connectedCallback() {
        console.group("Typeahead.connectedCallback")
	
	let self = this;

	// FOR GENERAL RE-USE
	this.data = this.ids = this.names = null;

	// GET PROPERTIES AND INTERESTING ELEMENTS
	this._initialize();

	// REPLACE CONTENT IF NECESSARY WITH NEW STUFF
	this.innerHTML = `<input class="typeahead ${this.properties.class}" type="text" placeholder="${this.properties.placeholder}" autocomplete='off' />`;
	
	if (this.properties.url) {
	    this._load()
	}

	// SAVE
	this.input = this.querySelector("input");
	this.typeahead = self.querySelector(".typeahead");

	var typingTimer;
	var doneTypingInterval = this.properties.delay; // CHANGE TO SUITE

	$(this.typeahead).on("input", function () {
	    window.clearTimeout(typingTimer);
	    typingTimer = window.setTimeout(doneTyping, doneTypingInterval);
	});

	// DO WHATEVER AFTER USER STOPPED TYPING
	function doneTyping () {
	    $.getJSON("../cfg/states.json", null, function (data) {
		self.configure(data, "long", "short");
		$(self.input).focus();

		if ($(".tt-suggestion").length == 0 && $(self.input).val().length != 0) {
		    $(self.input).css({"border-bottom-color":"red", "color":"red"});
		} else {
		    $(self.input).css({"border-bottom-color":"steelblue", "color":"#333"});
		}
	    });
	}

	$(this.typeahead).on("keydown",function search(e) {
	    if(e.keyCode == 13) {
		let tmp = $(self.input).val();

		self._publish($(this).val(), self.data[self.ids[$(this).val()]]);
		let menu = self.querySelector(".tt-menu");
		menu.style.display = "none";
		e.preventDefault();

		$(self.input).css("border-bottom-color","steelblue");
	    }
	});

	// ADD STATS AND OTHER FINAL STUFF
	self._finalize();
	
        console.groupEnd();
    };

    /**
     * Publish all events
     * @_publish
     */
    _publish(name, value) {
	console.group("Typeahead.publish:", name, value);

	if (typeof value === 'undefined') {
	    value = "UNDEFINED";
	}

	wc.publish(this, "wc-typeahead", {
	    time: new Date().getTime(),
	    action: "selected",
	    id: this.id,
	    name: name,
	    value: value
	});

	console.groupEnd();
	return true;
    }

    /**
     * Invoked When component is removed. Usually with a .remove() function call
     * @disconnectedCallback
     */
    disconnectedCallback() {
        console.group("Typeahead.disconnectedCallback")

	/* CLEAN UP NOW */

        console.groupEnd();
    };

    /**
     * Called with .setAttribute(...) function call
     * @attributeChangedCallback
     */
    attributeChangedCallback(attr, oldval, newval) {
        console.group("Typeahead.attributeChangedCallback:", attr, oldval, newval);

	this.properties = this.properties || [];

	let obs = Typeahead.observedAttributes;

	for (let i = 0; i < obs.length; i++) {
	    if (newval) {
		this.properties[obs[i]] = newval;
	    }
	}
	
	// YOUR CODE FOR CHANGES GO HERE (MAYBE NULL FIRST TIME THROUGH)
	try {
	    switch(attr) 
	    {
		case "background":
		//this.style.background = newval;
		break;
	    }
	}
	catch(e) {
	    console.warn(e.name + ' > ' + e.message);
	}

        console.groupEnd();
    };

    /**
     * Stores DOM elements of interest for future use
     * @_fetchElements
     */
    _fetchElements() {
	console.group("Typeahead._fetchElements");
	
	this.dom = this.dom || [];
	this.dom.content = this.innerHTML;

	console.groupEnd();
    };

    /**
     * Component attributes are _fetched and defaults are set if undefined
     * @_fetchAttributes
     * @param {string} [modal=true] mode for our typeahead
     */
    _fetchAttributes() {
	console.group("Typeahead._fetchAttributes");
	
	this.properties = {
	    cname	: "Typeahead",
	    author	: "Mel Heravi",
	    version	: "1.0",
	    url		: null,
	    show	: 5,
	    delay	: 500
	};
	
	// SAVE WIDGET SPECIFIC PROPERTIES
	this.propertiesW = [];

	// SAVE ALL OTHER PROPERTIES
	let attrs = wc.getAttributes(this)
	
 	for (var key in attrs) {
	    let attr = this.getAttribute(key) || this.properties.key;
	    this.properties[key]  = this.getAttribute(key);
	    this.propertiesW[key] = this.getAttribute(key);
	    console.log(key + ": " + attrs[key]);
	}

	// SET ALL INITIAL ATTRIBUTES
 	for (var key in this.properties) {
	    switch(key) 
	    {
		case "background":
		this.style.background = this.properties.background;
		break;
	    }
	}

	console.log("ATTRIBUTES: ", this.properties);

	console.groupEnd();
    };

    /**
     * Destroy the instance object and artifacts
     * @_destroy
     */
    destroy() {
	console.group("Typeahead.destroy:", this.id);

	// FREE ALL MEMORY
	// you should delete all created objects here

	// FREE POINTER
	delete this;

	// REMOVE ITEM FROM DOM
	this.parentNode.removeChild(this);

	console.groupEnd();
    };

    /**
     * configure the instance object and artifacts
     * @_configure
     */
    configure(data, name, value) {
	console.group("Typeahead.configure:", name, value);

	this.properties.name  = name;
	this.properties.value = value;

	this._process(data);

	// PROCESS ALL OPTIONS HERE

	console.groupEnd();
    };

    /**
     * SAVE DATA FOR ANALYTICS
     * @__initialize
     */
    _initialize() {
	console.group("Typeahead._initialize:", this.id);

	// FETCH ALL INTERESTING ELEMENTS
	this._fetchElements();

	// FETCH ALL ATTRIBUTES
	this._fetchAttributes();
	
	console.groupEnd();
    };

    /**
     * SAVE DATA FOR ANALYTICS
     * @__finalize
     */
    _finalize() {
	console.group("Typeahead._finalize:", this.id);

	this.classList.add("wc");

	// ADD ANALYTICS HERE
	wc.setStats(this, this.properties.cname, this.properties.version);
	
	// SHOW IT NOW (NO FLICKERS) 
	this.style.visibility = "visible";

	console.groupEnd();
    };

    /**
     * SAVE DATA FOR ANALYTICS
     * @_load
     */
    _load() {
	console.group("Typeahead._load:", this.id);
	
	let self  = this;

	$.getJSON(this.properties.url, null, function (data) {
	    self._process(data);
	}).fail(function(jqxhr, textStatus, error){
            var err = textStatus + ', ' + error;
            alert("Request Failed: " + err);
	});
	
	console.groupEnd();
    }

    /**
     * Process
     * @_process
     */
    _process(data) {
	console.group("Typeahead._process");
	
	let self  = this;
	var names = new Array();
	var ids   = new Array();

	let cnt = 0;
	$.each(data, function (index, item) {
	    self.data = data;
	    let n = eval("item." + self.properties.name);

	    names.push(n);
	    ids[n] = cnt++;
	});
	
	this.ids = ids;

	$(this.typeahead).typeahead({
	    hint: false,
	    highlight: true,
	    minLength: 1
	},{
	    limit: this.properties.show,
	    source: substringMatcher(names)
	});

	// DROPDOWN MENU
	let tt = self.querySelector(".tt-menu");
	
	var width = $(self).width();

	// MAKE THEM SAME SIZE AS INPUT
	tt.style.width = this.typeahead.style.width = width + "px";

	// BORDER WIDTH BASED ON FONT SIZE
	let bw = width.toString()[0];

	if (this.classList.contains("border-all")) {
	    // BORDER ALL
	    $(this.typeahead).css("border", bw + "px" + " #CCC solid");

	    $(this.typeahead).focus(function() {
		$(this.typeahead).css("border", bw + "px" + " steelblue solid");
	    });

	    $(this.typeahead).focusout(function() {
		$(this.typeahead).css("border-color", "#CCC");
	    });
	} else {
	    // DEFAULT
	    $(this.typeahead).css("border-bottom", bw + "px" + " #CCC solid");

	    $(this.typeahead).focus(function() {
		$(this.typeahead).css("border-bottom", bw + "px" + " steelblue solid");
	    });

	    $(this.typeahead).focusout(function() {
		$(this.typeahead).css("border-color", "#CCC");
	    });
	}

	console.groupEnd();
    }
}

window.customElements.define('wc-typeahead', Typeahead);

var substringMatcher = function(strs) {
    return function findMatches(q, cb) {
	var matches, substringRegex;

	// an array that will be populated with substring matches
	matches = [];

	// regex used to determine if a string contains the substring `q`
	substrRegex = new RegExp(q, 'i');

	// iterate through the pool of strings and for any string that
	// contains the substring `q`, add it to the `matches` array
	$.each(strs, function(i, str) {
	    if (substrRegex.test(str)) {
		matches.push(str);
	    }
	});

	cb(matches);
    };
};
