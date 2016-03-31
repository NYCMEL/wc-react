###HEADS###################################################################
#
#   COPYRIGHT (C) 1993,2009 Melify                                       
#   EMAIL:        Support@Melify.com                                        
#   URL:          http://www.Melify.com                                    
#   
#   A LICENSE IS REQUIRED FOR ALL PUBLIC FACING USE OF THIS TOOLKIT
#   
#   SOME JAVASCRIPTS INCLUDED IN THIS PACKAGE MAY REQUIRE A SEPARATE         
#   LICENSE, PLEASE COMPLY WITH THEIR LICENSING AGREEMENTS                   
#
###HEADE###################################################################

namespace eval Site {}

##################################################
##### 
##################################################
m::proc -private Site::doctype {
} {
    Documentaion goes here
} {
    Trace

    #GENERAL TITLE FOR OUR WEBSITE
    put "<!DOCTYPE HTML>\n"
}

##################################################
##### 
##################################################
m::proc -private Site::title {
} {
    Documentaion goes here
} {
    Trace

    #GENERAL TITLE FOR OUR WEBSITE
    return "$::company -"
}

##################################################
##### 
##################################################
m::proc -private Site::cookies {
} {
    Documentaion goes here
} {
    Trace

    #NO COOKIES FOR TEMPLATE

    return "userid"
}

##################################################
##### 
##################################################
m::proc -private Site::head {
} {
    Documentaion goes here
} {
    Trace

    tk::comment "Site::head" {
	tk::include::viewport
	tk::include::common
	tk::include::bootstrap
	
	# DISPLAY DEBUG INFORMATION IF LOCAL
	if {$::tk(local) == 1} {
	    include "/tk/jquery/scripts/jquery.hotkeys.js"
	    include "/tk/jquery/scripts/hotkeys.js"
	}

	javascript {
	    put [subst {
		jQuery(document).ready(function() {
		    app.init({app:"$::APP", env:"$::ENV", local:"$::tk(local)", clock:"$::tk(clock)"});
		});
	    }]
	}
    }
}

##################################################
##### 
##################################################
m::proc -private Site::body {
} {
    Documentaion goes here
} {
    Trace

    if {$::userid == ""} {
	set ::access "public"
    } else {
	set ::access "private"
    }

    tk::comment "Site::body" {
	# ADD SPINNING WHEEL ON AJAX CALLS
	tk::loading
	
	if {[catch {
	    if {[info exist ::callback] == 0} {
		${::page}::init
	    } else {
		$::callback
	    }
	} e] != 0} {
	    tk::error "$e"
	}
    }
}

##################################################
##### 
##################################################
m::proc -private Site::init {
} {
    Documentaion goes here
} {
    Trace

    #LETS START OUR APPLICATION
    tk::site::setup\
	-page		Home\
	-admin		MelifyIT@gmail.com
}
