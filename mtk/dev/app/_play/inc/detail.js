var detail = {
    /////////////////////////////////////////////////////////////////////////////
    //// Time-stamp: <2016-03-14 10:30:20 (melify)>
    /////////////////////////////////////////////////////////////////////////////
    init: function(options) {
	console.group("detail.init: " + tk.obj2str(options));
	
	console.groupEnd();
    },
    
    /////////////////////////////////////////////////////////////////////////////
    //// Time-stamp: <2015-12-06 21:31:16 (melify)>
    /////////////////////////////////////////////////////////////////////////////
    close: function() {
	console.group("detail.close");
	
	// FLIP SCREENS
	$("#home-menus", window.parent.document).slideToggle(300, function() {
	    $("#home-detail", window.parent.document).slideToggle(300);
	});

	console.groupEnd();
    }
};
