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
    return "Melify.com"
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
	
	include "/tk/inc/angular/angular.js"
	include "/GitHub/htmlclean/jquery.htmlClean.min.js"

	put {
	    <script src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js"></script>
	}

	javascript {
	    put [subst {
		jQuery(document).ready(function() {
		    app.init({app:"$::APP", env:"$::ENV"});
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
