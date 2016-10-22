(function() {
    Polymer({
        is: "mtk-panel",
        properties: {
            bgc: {
		type: String,
		observer: "bgcChanged"
            }
        },
        ready: function() {
            var helloDiv = Polymer.dom(this.root).querySelector(".hello");
            $(helloDiv).toggleClass("red");
        },
        toggleClass: function(e) {
            var helloDiv = Polymer.dom(this.root).querySelector(".hello");
            $(helloDiv).toggleClass("red");
        },
        bgcChanged: function() {
            var helloDiv = Polymer.dom(this.root).querySelector(".hello");
            helloDiv.style.backgroundColor = this.bgc;
        }
    });
})();
