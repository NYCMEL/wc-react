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

#<mtk-panel title="Hello Mel 1" id="my-panel-1" heading="HELLO PANEL 1" footer="THIS IS A PANEL FOOTER 1" collapsible="true">

namespace eval mtk {
    ######################################################
    ##### 
    ######################################################
    proc panel {args} {
	cgi_put "<mtk-panel"
	_cgi_close_proc_push "cgi_put </mtk-panel>"

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
	cgi_put "<mtk-accordion"
	_cgi_close_proc_push "cgi_put </mtk-accordion>"

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
	cgi_put "<mtk-tabs"
	_cgi_close_proc_push "cgi_put </mtk-tabs>"

	if {[llength $args]} {
	    cgi_put "[_cgi_lrange $args 0 [expr {[llength $args]-2}]]"
	}
	cgi_put ">"
	uplevel 1 [lindex $args end]
	_cgi_close_proc
    }
}
