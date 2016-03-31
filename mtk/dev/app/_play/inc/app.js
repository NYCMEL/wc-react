var app = {
    name: null,
    env:  null,

    /////////////////////////////////////////////////////////////////////////////
    //// Time-stamp: <2015-12-06 21:32:36 (melify)>
    /////////////////////////////////////////////////////////////////////////////
    init: function(options) {
	console.group("app.init: " + tk.obj2str(options));
	
	app.name = options.app;
	app.env  = options.env;

	console.groupEnd();
    }
};
