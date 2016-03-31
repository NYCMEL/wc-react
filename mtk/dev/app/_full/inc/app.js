var app = {
    name: null,
    env:  null,

    /////////////////////////////////////////////////////////////////////////////
    //// Time-stamp: <2015-12-06 21:12:25 (melify)>
    /////////////////////////////////////////////////////////////////////////////
    init: function(options) {
	console.group("app.init: " + JSON.stringify(options));
	
	app.name  = options.app;
	app.env   = options.env;
	app.local = options.local;
	app.clock = options.clock;

	jQuery.subscribe('mediaChange', app.mediaChange);  // SUBSCRIBE

	console.groupEnd();
    },

    /////////////////////////////////////////////////////////////////////////////
    //// Time-stamp: <2014-07-07 08:38:31 (a527951)>
    /////////////////////////////////////////////////////////////////////////////
    mediaChange: function(event, action, id) {
	console.group("mediaChange: " + action + ", " + id);

	console.groupEnd();
    }	
};
