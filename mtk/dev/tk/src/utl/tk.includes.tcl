###HEADS###################################################################
#
#  Melify Internet Toolkit (MTK) - Copyright (C) 2015  Melify LLC.
#  
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see http://www.gnu.org/licenses.
#
###HEADE###################################################################

namespace eval tk {
    namespace eval include {}
}

##################################################
##### 
##################################################
m::proc -private tk::include::angular {
    {-bootstrap "0"}
} {
    Documentaion goes here
} {
    Trace

    include "/tk/angular/1.3.15/angular.min.js"
    include "/tk/angular/1.3.15/angular.min.js.map"
    include "/tk/angular/1.3.15/angular-animate.min.js"
    include "/tk/angular/1.3.15/angular-animate.min.js.map"
    include "/tk/angular/1.3.15/angular-route.js"
    include "/tk/angular/1.3.15/angular-resource.js"
    include "/tk/angular/1.3.15/angular-sanitize.js"

    if {$bootstrap == 1} {
	include "/tk/angular/bootstrap/bootstrap.min.css"
	include "/tk/angular/bootstrap/ui-bootstrap.min.js"
	include "/tk/angular/bootstrap/ui-bootstrap-tpls.min.js"
    }
}

##################################################
##### 
##################################################
m::proc -private tk::include::bootstrap {
    {-local 0}
} {
    Documentaion goes here
} {
    Trace

    if {$local == 0} {
	if {1} {
	    include "/GitHub/bootstrap/dist/css/bootstrap.min.css"
	    include "/GitHub/bootstrap/dist/js/bootstrap.min.js"
	} else {
	    tk::include::bootstrap:4
	}
    } else {
	include "/inc/bootstrap/css/bootstrap.min.css"
	include "/inc/bootstrap/js/bootstrap.min.js"
    }
}

##################################################
##### 
##################################################
m::proc -private tk::include::bootstrap:4 {
} {
    Documentaion goes here
} {
    Trace

    include "/GitHub/bootstrap.4/dist/css/bootstrap-theme.min.css"
    include "/GitHub/bootstrap.4/dist/js/bootstrap.min.js"
}

##################################################
##### 
##################################################
m::proc -private tk::include::waypoints {
    {-local 0}
} {
    Documentaion goes here
} {
    Trace

    if {0} {
	include "/GitHub/jquery-waypoints/waypoints.min.js"
	include "/GitHub/jquery-waypoints/shortcuts/sticky-elements/waypoints-sticky.min.js"
    } else {
	include "/GitHub/waypoints/lib/jquery.waypoints.min.js"
	include "/GitHub/waypoints/lib/shortcuts/sticky.min.js"
    }
}

##################################################
##### 
##################################################
m::proc -private tk::include::media {
} {
    Documentaion goes here
} {
    Trace

    include "/tk/inc/media.css"
    include "/tk/inc/media.js"
}

##################################################
##### 
##################################################
m::proc -private tk::include::viewport {
} {
    Documentaion goes here
} {
    Trace

    put {
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=2, user-scalable=no">
	<meta name="apple-mobile-web-app-capable" content="yes" />
	
	<meta name="description" content="applications at the speed of thought">
	<meta name="author" content="Melify.com">
    }
}

##################################################
##### 
##################################################
m::proc -private tk::include::modernizer {
} {
    Documentaion goes here
} {
    Trace

    include "/GitHub/Modernizr/src/Modernizr.js"
    include "/GitHub/Modernizr/src/ModernizrProto.js"
}

##################################################
##### 
##################################################
m::proc -private tk::include::common {
    {-jqv "/tk/jquery/scripts/jquery.min.js"}
    {-ga "/tk/inc/gAnalytics.js"}
    {-hotkeys  0} 
    {-editable 0} 
} {
    Documentaion goes here
} {
    Trace

    # NEED THIS FOR IE TO WORK
    put {
	<!--[if lt IE 9]>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<![endif]-->

	<!--[if IE]>
	<script type="text/javascript">
	document.location.href="/tk/noie.html";
	</script>
	<![endif]-->
    }

    # THESE COME AHEAD OF THEM ALL
    include "/GitHub/Font-Awesome/css/font-awesome.min.css"
    include "/tk/inc/tk.common.css"

    include "$jqv"

    # REQUIRED BY ALL APPS
    include "/GitHub/pushState/js/pjax.js";# Browser pushState
    include "/GitHub/jquery-cookie/src/jquery.cookie.js"
    include "/GitHub/jquery-tiny-pubsub/dist/ba-tiny-pubsub.min.js"
    include "/GitHub/pace/themes/black/pace-theme-big-counter.css"
    include "/GitHub/pace/pace.min.js"

    # TK FUNCTIONS ARE HERE
    include "/tk/inc/common.js"
    include "/tk/inc/mtk.buffer.js"

    # MELIFY ANALYTICS
    #include "/tk/inc/ma.js"
    
    # APPLICATION SPECIFIC STUFF
    include "/inc/app.css"
    include "/inc/app.js"

    # GOOGLE ANALYTICS
    include "$ga"
    
    # EDITABLE AND HOTKEYS
    switch $::env(SERVER_ADDR) {
	"127.0.0.1" {
	    tk::include::media

	    if {$hotkeys == 1} {
		include "/tk/inc/hotkeys.css"
		include "/tk/jquery/scripts/jquery.hotkeys.js"
		include "/tk/jquery/scripts/hotkeys.js"
	    }
		
	    if {$editable == 1} {
		# MAKE THINGS EDITABLE
		tke::editable
		
		#EDITABLE STUFF
		include "/tk/inc/tkedit.js" ;#NEED THIS TO GET UPDATES FROM DB
	    }
	}
    }
}

##################################################
##### 
##################################################
m::proc -private tk::include::editable {
} {
    Documentaion goes here
} {
    Trace

    ################################################
    # DONT FORGET TO DO THIS IN app.js
    #  if ($("e").length != 0) {
    #     tke.init();
    #     tke.check();
    #  }
    ################################################

    include "/tk/jquery/scripts/jquery.hotkeys.js"
    include "/GitHub/jquery-editable/jquery.editable.min.js"
    include "/tk/lib/components/jq/inc/jq.component.editable.js"

    put {
	<style>
	.tkedit-bg {
	    -webkit-box-shadow:5px 5px 5px rgba(0,0,0,0.5);
	    -moz-box-shadow:5px 5px 5px rgba(0,0,0,0.5);
	    box-shadow:5px 5px 5px rgba(0,0,0,0.5);
	    -webkit-border-radius:3px;
	    -moz-border-radius:3px;
	    border-radius:3px;
	    -webkit-box-shadow:0 0 3px green;
	    -moz-box-shadow:0 0 3px green;
	    box-shadow:0 0 3px green
	}
	</style>
    }

    javascript {
	put {
	    jQuery(document).ready(function() {
		jqComponentEditable.init({callback: "tke.save"});
		jQuery(document).bind("keydown", "ctrl+e", tke.showEdits);
	    });
	}
    }
}
