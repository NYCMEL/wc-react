var menus = {
    /////////////////////////////////////////////////////////////////////////////
    //// Time-stamp: <2016-03-14 10:30:12 (melify)>
    /////////////////////////////////////////////////////////////////////////////
    init: function(options) {
	console.group("menus.init");

	$("#menus a.component").on("click", function() {
	    var c = $(this).attr("component");
	    var f = $(this).attr("folder");

	    // EMPTY PRIOR IFRAME CONTENT FIRST
	    $("iframe").attr("src","");

	    $("#home-menus").fadeOut(300, function() {
		$("iframe").attr("src", tk.siteurl + "?page=detail&component=" + c + "&folder=" + f);

		$("#home-detail").fadeIn(300, function() {
		    $("html, body").animate({scrollTop:0}, "slow");
		});
	    });
	});

	console.groupEnd("menus.init");
    }
}
