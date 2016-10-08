try {
    // SOMEHOW THIS DOES NOT WORK
    var importDoc = document.currentScript.ownerDocumentdocument.currentScript === document._currentScript ? document.currentScript.ownerDocument: document._currentScript.ownerDocument;
} catch(e) {
    var importDoc = document.currentScript.ownerDocument;
}

// Modal
XModal = document.registerElement('bs-modal', {
    prototype: Object.create(HTMLElement.prototype, {
	createdCallback: {
	    value: function() {
		// jQuery creates an extra looking for CSS display value
		if (!this.parentNode) {
		    return false;
		}

		var scripts = 
		    "<script src='http://localhost/tk/jquery/scripts/jquery.min.js' type='text/javascript' media='all'></script>" +
		    "<script src='http://localhost/tk/inc/bootstrap.min.js' type='text/javascript' media='all'></script>" +
		    "<style>" +
		    "@import 'http://localhost/GitHub/bootstrap/dist/css/bootstrap.min.css'" + 
		    "</style>";

		var template = importDoc.querySelector('#x-modal');
		var modal = template.content.cloneNode(true);
		var heading = modal.querySelector('.modal-header');
		var attrs = this.attributes;
		var options = {};

		this.classList.add('modal');
		this.setAttribute('role', 'modal');

		for (var i = 0; i < attrs.length; i++) {
		    var name = attrs[i].name.toLowerCase();
		    var value = attrs[i].value;

		    if (name === 'title') {
			var elmTitle = modal.querySelector('.modal-title');
			elmTitle.textContent = value;
			heading.classList.remove('x-modal-no-title');

		    } else if (name === 'close' && value === 'false') {
			heading.querySelector('.close').classList.add('hide');

		    } else if (/backdrop|keyboard|show/i.test(name)) {
			if (/true|false/i.test(value)) {
			    value = (value === 'true');
			}

			options[name] = value;
		    }
		}

		// Content
		modal.querySelector('.modal-body').innerHTML = this.innerHTML;
		this.innerHTML = '';

		if (0) {
		    var root = this.createShadowRoot();
		    root.appendChild(modal);
		} else {
		    this.appendChild(modal);
		}
		
		$(this).modal(options);
	    }
	},
	attributeChangedCallback: {
	    value: function(name, oldValue, value) {
		var $elm = $(this);
		var bsModal = $elm.data('bs.modal');
		var option= {};
		var action;

		if (name === 'title') {
		    this.querySelector('.modal-title').textContent = value;

		    action = (value === null) ? 'add' : 'remove';
		    this.querySelector('.modal-header').classList[action]('x-modal-no-title');

		} else if (name === 'close') {
		    action = (value === 'false') ? 'add' : 'remove';
		    this.querySelector('.close').classList[action]('hide');

		} else if (/backdrop|keyboard|show/i.test(name)) {
		    if (/true|false/i.test(value)) {
			value = (value === 'true');
		    }

		    option[name] = value;
		    $elm.modal($.extend(bsModal.options, option));
		}
	    }
	}
    })
});
