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
    proc debug {args} {}
}

##################################################
##### 
##################################################
proc ladybug {} {
    division [tk::style position absolute bottom 10px right 10px] {
	put [url [img /tk/img/debug/ladybug.gif width=20 alt=="Debug"] # onclick="jQuery('.tk-debug').toggle()"]
    }
}

##################################################
##### 
##################################################
proc debug {args} {
    division class="tk-debug ui-helper-clearfix" style="display:none" {
	uplevel [lstring $args]
    }
}

##################################################
##### 
##################################################
if {([info exist tkdebug] == 1) && ($tkdebug == 0)} {
    proc tk::debug:on {args} {}
    proc debug        {args} {}

    return
}

##################################################
##### 
##################################################
proc tk::debug:off {} {
    cgi_debug -off
}

##################################################
##### 
##################################################
proc tk::debug:on {args} {
    cgi_debug -on
    
    if {[info exist ::callback] == 1} {
	return
    }

    tag tk-debug {
	include "/tk/inc/debug.css"
	
	#set onclick "jQuery('#debug #container #content').toggle('blind',300)\;jQuery('#debug #container #handle').toggle()"
	set event "jQuery('tk-debug #container #content').toggle('blind',300)"
	
	division id="container" class="ui-helper-clearfix" {
	    division id="content" class="ui-corner-br ui-helper-clearfix" {
		tk::debug:content
	    }
	    
	    division id="handle" onclick="$event" class="ui-corner-bottom" {
		put "&nbsp"
	    }
	}
    }
}

##################################################
##### 
##################################################
proc tk::debug:content {} {
    Trace

    #ADD DEBUG ICON
    division class="bullet" class="ui-corner-all" onclick="jQuery('.tk-debug').toggle()" {
	set img [img /tk/img/debug/ladybug.gif width=20 alt=="Debug"]
	put "$img<BR>Debug"
    }

    #ADD TRACE ICON
    division class="bullet" class="ui-corner-all" {
	if {$::ENV == "dev"} {
	    set img [img /tk/img/debug/trace.gif width=20 title="Trace"]
	    put [url $img<BR>Trace /Melify/mtk/tmp/trace.dat target="TRACE"]
	}
    }

    #ADD QUERY ICON
    division class="bullet" class="ui-corner-all" {
	set img [img /tk/img/debug/db.gif width=20 title="Database"]
	put [url "$img<BR>DB" [URL page tk::query] target="QUERY"]
    }

    ##################################################
    ##### 
    ##################################################
    proc debug {args} {
	cgi_debug [uplevel division class="tk-debug" "$args"]
    }
}

