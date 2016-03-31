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

namespace eval Site {}

if {[info exist ::tk(access)] == 0} {
    set ::tk(access) "public"
}

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
    return "$::company - "
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
	tk::include::angular
	
	include "/inc/angular/ang.js"

	if {$::tk(local) == 1} {
	    tk::include::media
	    
	    include "/tk/jquery/scripts/jquery.hotkeys.js"
	    include "/tk/jquery/scripts/hotkeys.js"
	    
	    # MAKE THINGS EDITABLE
	    tke::editable
	    
	    #EDITABLE STUFF
	    include "/tk/inc/tkedit.js" ;#NEED THIS TO GET UPDATES FROM DB
	    
	    # SHOW COMPONENT ON LEFT HAND MARGIN
	    jq::component::expose::init -callback slider -spage $::page
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

    tk::comment "Site::body" {
	if {[info exist ::callback] == 0} {
	    ${::page}::init
	} else {
	    $::callback
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
