var BSModal = document.registerElement('bs-modal', {
    prototype: Object.create(HTMLElement.prototype, {
	createdCallback: {
            value: function() {
		var root = this.createShadowRoot();
		var template = document.querySelector('#template-modal');

		console.log(">>>", template);

		var clone = document.importNode(template.content, true);

		root.appendChild(clone);
            }
	}
    })
});
