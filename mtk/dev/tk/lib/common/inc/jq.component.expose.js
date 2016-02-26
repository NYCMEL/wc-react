var jqComponentExpose = {
    /////////////////////////////////////////////////////////////////////////////
    //// Time-stamp: <2016-02-26 17:26:28 (melify)>
    /////////////////////////////////////////////////////////////////////////////
    init: function(options) {
	console.group("jqComponentExpose.init");

	var dt = new Date();
	var time = dt.getHours() + ":" + dt.getMinutes() + ":" + dt.getSeconds();
	
	if ($(".tk-slider").length == 0) {
	    $("body").append("<component class='tk-component tk-slider jq-component-expose' style=display:none><div id='time'></div><div id='tk-comps'></div><div id='content'></div></component>");
	}

	if (options.show == 1) {
	    $(".tk-slider #time").html("<div class=head>Page: <b>" + options.page + "</b></div>");

	    // EMPTY OUR CONTAINER
	    $("#tk-comps").empty();
	    $("#tk-comps").append("<table class='table'><thead><tr><th>#</th><th>COMPONENT</th><th>ID</th></tr></thead><tbody></tbody></table>");
	    
	    var cnt = 0;

	    var components = "";
	    jQuery(".tk-component").each(function() {
		cnt ++;

		var cl = $(this).attr('class').split(' ').pop();
		var id = $(this).attr('id');
		
		if (cl != "jq-component-expose") {
		    var tmp = cl.replace(/-/g,"::");
		    
		    var url = "<a href='/mtk/render?callback=jq::component::expose::show&comp=" + tmp + "::test'" + " target=" + cl + ">" + cl + "</a>";

		    $("#tk-comps table tbody").append("<tr><td>" + cnt + "</td><td>" + url + "</td>" + "<td>" + id  + "</td></tr>");

		    console.log(tmp);
		}
	    });
	}
	
	console.groupEnd();
	tk.load(".tk-slider #content", "/mtk/render?callback=" + options.callback + "&spage=" + options.page);
    },

    /////////////////////////////////////////////////////////////////////////////
    //// Time-stamp: <2014-03-12 11:33:52 (a527951)>
    /////////////////////////////////////////////////////////////////////////////
    toggle: function(options) {
	console.group("jqComponentExpose.toggle");

	jQuery('#actual').slideToggle();
	jQuery('#edit').slideToggle()

	jQuery(".edit-btn").toggle()
	jQuery(".cancel-btn").toggle()

	console.group();
    },

    /////////////////////////////////////////////////////////////////////////////
    //// Time-stamp: <2014-03-12 11:33:52 (a527951)>
    /////////////////////////////////////////////////////////////////////////////
    showme: function(options) {
	console.group("jqComponentExpose.showme");

	val = $("#edit-text").val();

	//console.log("/mtk/render?callback=jq::component::expose::showme&txt=" + escape(val));

	console.groupEnd();
	tk.load("#comp-display","/mtk/render?callback=jq::component::expose::showme&txt=" + escape(val), true);
    }
}
