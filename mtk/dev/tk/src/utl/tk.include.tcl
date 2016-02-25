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


namespace eval tk {}

if {[info exist require] == 0} {
    set require ""
}

switch $require {
    "include" {
	put "<script src='/tk/inc/include.js'></script>"
    }
    "yepnope" {
	put "<script src='/GitHub/yepnope.js/yepnope.1.5.4-min.js'></script>"
    }
}

######################################################
##### 
######################################################
proc include {fname} {
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
	".js" {
	    set func [file tail $fname]
	    regsub -all {\-} $func "" func
	    regsub -all {\_} $func "" func
	    regsub -all {\.} $func "" func

	    switch $::require {
		"include" {
		    put "<script>loadjscssfile('$url','js')</script>"
		}
		"yepnope" {
		    put "<script>yepnope('$url')</script>"
		}
		default {
		    put "<script type='text/javascript' media='all' src='$url'></script>"
		}
	    }
	}
	".css" {
	    switch $::require {
		"include" {
		    put "<script>loadjscssfile('$url','css')</script>"
		}
		"yepnope" {
		    put "<script>yepnope('$url')</script>"
		}
		default {
		    put "<link type='text/css' href='$url' media='all' rel='stylesheet' />\n"
		}
	    }
	}
	".html" {
	    put [file:read $fname]
	}
	".tcl" {
	    source $fname
	}
    }
}
