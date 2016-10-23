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

namespace eval c {
    ######################################################
    ##### 
    ######################################################
    proc panel {args} {
	cgi_put "<c-panel"
	_cgi_close_proc_push "cgi_put </c-panel>"

	if {[llength $args]} {
	    cgi_put "[_cgi_lrange $args 0 [expr {[llength $args]-2}]]"
	}
	cgi_put ">"
	uplevel 1 [lindex $args end]
	_cgi_close_proc
    }

    ######################################################
    ##### 
    ######################################################
    proc accordion {args} {
	cgi_put "<c-accordion"
	_cgi_close_proc_push "cgi_put </c-accordion>"

	if {[llength $args]} {
	    cgi_put "[_cgi_lrange $args 0 [expr {[llength $args]-2}]]"
	}
	cgi_put ">"
	uplevel 1 [lindex $args end]
	_cgi_close_proc
    }

    ######################################################
    ##### 
    ######################################################
    proc tabs {args} {
	cgi_put "<c-tabs"
	_cgi_close_proc_push "cgi_put </c-tabs>"

	if {[llength $args]} {
	    cgi_put "[_cgi_lrange $args 0 [expr {[llength $args]-2}]]"
	}
	cgi_put ">"
	uplevel 1 [lindex $args end]
	_cgi_close_proc
    }

    ######################################################
    ##### 
    ######################################################
    proc tab {args} {
	cgi_put "<c-tab"
	_cgi_close_proc_push "cgi_put </c-tab>"

	if {[llength $args]} {
	    cgi_put "[_cgi_lrange $args 0 [expr {[llength $args]-2}]]"
	}
	cgi_put ">"
	uplevel 1 [lindex $args end]
	_cgi_close_proc
    }
}
