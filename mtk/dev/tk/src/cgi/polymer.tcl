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

include "/MTK/Polymer/polymer/polymer.html"			"import"
include "/MTK/Polymer/paper-button/paper-button.html"		"import"
include "/MTK/Polymer/paper-card/paper-card.html"		"import"

include "/Melify/mtk/dev/app/_samples/inc/polymer/button.style" is="custom-style"

namespace eval polymer {
    ######################################################
    ##### 
    ######################################################
    proc button {args} {
	cgi_put "<paper-button"
	if {[llength $args] > 1} {
	    cgi_put "[_cgi_lrange $args 0 [expr [llength $args]-2]]"
	    set args [lrange $args end end]
	}
	cgi_put ">[lindex $args 0]</paper-button>"
    }
}
