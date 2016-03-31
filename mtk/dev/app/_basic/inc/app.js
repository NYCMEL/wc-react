var app = {
    name: null,
    env:  null,

    /////////////////////////////////////////////////////////////////////////////
    //// Time-stamp: <2015-12-06 21:11:59 (melify)>
    /////////////////////////////////////////////////////////////////////////////
    init: function(options) {
	console.group("app.init" + tk.obj2str(options));
	
	app.name  = options.app;
	app.env   = options.env;
	app.local = options.local;
	app.clock = options.clock;

	console.log(JSON.stringify(app))

	console.groupEnd();
    }
};
