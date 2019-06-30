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

set cdn [expr {([info exist     cdn] == "0") ? "0" : "$::cdn"}]

######################################################
##### type can be set to "is='custom-style'"
######################################################
proc include {fname {type ""}} {
    Trace

    # DO NOT ALLOW DUPLICATES
    set t $fname

    if {[info exist ::_jscss_($t)] != 0} {
 	return
    }

    set ::_jscss_($t) 1
    
    if {[string range $fname 0 3] == "http"} {
	set url "$fname"
    } else {
	set url "http://$::env(HTTP_HOST)$fname"
    }

    switch [file extension $t] {
	".js" - ".es5" - ".json" {
	    set func [file tail $fname]
	    regsub -all {\-} $func "" func
	    regsub -all {\_} $func "" func
	    regsub -all {\.} $func "" func

	    put "<script type='text/javascript' media='all' src='$url'></script>"
	}
	".style" {
	    put "<style $type>[file:read $fname]</style>"
	}
	".css" {
	    put "<link type='text/css' href='$url' media='all' rel='stylesheet' />\n"
	}
	".html" {
	    if {$type == ""} {
		put [file:read $fname]
	    } else {
		put "<link rel='$type' href='$fname' />"
	    }
	}
	".tcl" {
	    source $fname
	}
    }
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
m::proc -private tk::include::angular:light {
} {
    Documentaion goes here
} {
    Trace

    include "/GitHub/light-angularjs/lib/Utils.js"
    include "/GitHub/light-angularjs/lib/Scope.js"
    include "/GitHub/light-angularjs/lib/Provider.js"
    include "/GitHub/light-angularjs/lib/DOMCompiler.js"
    include "/GitHub/light-angularjs/lib/directives/ngl-click.js"
    include "/GitHub/light-angularjs/lib/directives/ngl-repeat.js"
    include "/GitHub/light-angularjs/lib/directives/ngl-controller.js"
    include "/GitHub/light-angularjs/lib/directives/ngl-bind.js"
    include "/GitHub/light-angularjs/lib/directives/ngl-model.js"
}

##################################################
##### 
##################################################
m::proc -private tk::include::polymer {
} {
    Documentaion goes here
} {
    Trace

    put {
	<meta charset="utf-8">
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Chrome for Android theme color -->
	<meta name="theme-color" content="#2E3AA1">

	<!-- Web Application Manifest -->
	<link rel="manifest" href="/manifest.json">

	<!-- Tile color for Win8 -->
	<meta name="msapplication-TileColor" content="#3372DF">
	
	<!-- Add to homescreen for Chrome on Android -->
	<meta name="mobile-web-app-capable" content="yes">
	<meta name="application-name" content="PSK">
	<link rel="icon" sizes="192x192" href="images/touch/chrome-touch-icon-192x192.png">
	
	<!-- Add to homescreen for Safari on iOS -->
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-title" content="Polymer Starter Kit">
	<link rel="apple-touch-icon" href="/images/touch/apple-touch-icon.png">

	<!-- Tile icon for Win8 (144x144) -->
	<meta name="msapplication-TileImage" content="/images/touch/ms-touch-icon-144x144-precomposed.png">

	<!-- build:css styles/main.css -->
	<link rel="stylesheet" href="/inc/styles/main.css">
	<!-- endbuild-->

	<script src="/MTK/Polymer/webcomponentsjs/webcomponents-lite.js"></script>

	<!-- Because this project uses vulcanize this should be your only html import
	in this file. All other imports should go in elements.html -->
	<link rel="import" href="/elements/elements.html">

	<!-- For shared styles, shared-styles.html import in elements.html -->
	<style is="custom-style" include="shared-styles"></style>
    }
}

##################################################
##### 
##################################################
m::proc -private tk::include::codemirror {
} {
    Documentaion goes here
} {
    Trace

    put {
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.10.0/codemirror.min.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.10.0/theme/ambiance.min.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.10.0/theme/mdn-like.min.css" />	    
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.10.0/theme/3024-night.min.css" />
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.10.0/codemirror.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.10.0/addon/edit/matchbrackets.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.10.0/addon/comment/continuecomment.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.10.0/addon/comment/comment.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.10.0/addon/selection/active-line.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.10.0/mode/javascript/javascript.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.10.0/mode/htmlembedded/htmlembedded.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.10.0/addon/search/searchcursor.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.10.0/addon/search/search.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.10.0/keymap/emacs.min.js"></script>

	<script src="/tk/inc/codemirror.autoformat.js"></script>
    }
}

##################################################
##### 
##################################################
m::proc -private tk::include::prettify {
} {
    Documentaion goes here
} {
    Trace

    put {
	<style>
	.prettyprint {padding:10px; border-radius:0;}
	.prettyprint ol.linenums > li {list-style-type: decimal;}
	</style>
    }

    include "/tk/inc/prettify.css"
    include "/tk/inc/prettify.js"
    
    # $("#form-code-container").removeClass("prettyprinted");
    # prettyPrint();

    # EXAMPLE CODE
    # preformatted class="prettyprint prettify lang-html linenums" {
    # 	put [quote_html [dtcc::component::box::spec]]
    # }
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

    switch $::cdn {
	"0" {
	    include "/GitHub/bootstrap/dist/css/bootstrap.min.css"
	    include "/GitHub/bootstrap/dist/js/bootstrap.bundle.min.js"
	}
	"1" {
	    include "https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	    include "https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.bundle.min.js"
	}
    }
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

    include "/tk/inc/min/media.min.css"
    include "/tk/inc/min/media.min.js"
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
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=5, user-scalable=yes">
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
    {-ga "/tk/inc/min/gAnalytics.min.js"}
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
    include "/GitHub/font-awesome/css/all.css"
    include "/tk/inc/min/tk.common.min.css"

    include "$jqv"

    # REQUIRED BY ALL APPS
    include "/GitHub/pushState/js/pjax.js";# Browser pushState
    include "/GitHub/jquery-cookie/src/jquery.cookie.js"
    include "/GitHub/jquery-tiny-pubsub/dist/ba-tiny-pubsub.min.js"
    include "/GitHub/pace/themes/blue/pace-theme-minimal.css"
    include "/GitHub/pace/pace.min.js"

    # TK FUNCTIONS ARE HERE
    include "/tk/inc/common.js"
    include "/tk/inc/min/mtk.buffer.min.js"

    # MELIFY ANALYTICS
    #include "/tk/inc/min/ma.js"
    
    # APPLICATION SPECIFIC STUFF
    include "/inc/app.css"
    include "/inc/app.js"

    # TWO WAY DATA BINDING
    include "/GitHub/databind/src/DataBind.min.js"

    # GOOGLE ANALYTICS
    include "$ga"
    
    # EDITABLE AND HOTKEYS
    switch $::env(SERVER_ADDR) {
	"127.0.0.1" {
	    tk::include::media

	    if {$hotkeys == 1} {
		include "/tk/inc/min/hotkeys.min.css"
		include "/tk/jquery/scripts/jquery.hotkeys.min.js"
		include "/tk/jquery/scripts/hotkeys.min.js"
	    }
		
	    if {$editable == 1} {
		# MAKE THINGS EDITABLE
		tke::editable
		
		#EDITABLE STUFF
		include "/tk/inc/min/tkedit.min.js" ;#NEED THIS TO GET UPDATES FROM DB
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
