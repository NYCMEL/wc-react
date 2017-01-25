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

include "/GitHub/bootstrap-select/dist/css/bootstrap-select.min.css"
include "/GitHub/bootstrap-select/dist/js/bootstrap-select.min.js"

######################################################
##### 
######################################################
m::proc -public tk::select {
    -id:required
    -name:required
    {-label ""}
    -options:required
    {-selected ""}
    {-help  ""}
    args
} {
    Documentation goes here...
} {    
    Trace

    division class="form-group" {
	if {$label != ""} {
	    label id="$id-label" for="$id-label" "$label"
	}
	
	cgi_select "$name" id="$id-select" class="selectpicker form-control" [lstring $args] type="select" {
	    foreach {i j} $options {
		option $j value=$i [expr {($i == $selected) ? "selected" : ""}]
	    }
	}

	if {$help != ""} {
	    put "<small id='$id-help' class='form-text text-muted'>$help</small>"
	}
    }    
}

######################################################
##### TEST
######################################################
m::proc -public tk::select:test {
} {
    Documentation goes here...
} {    
    Trace

    tk::select -id "my-select" -name "v(select)" -options [subst {
	"" "PLEASE SELECT"
	1 "Option 1"
	2 "Option 2"
	3 "Option 3"
	4 "Option 4"
    }] -selected 2 -help "help text goes here..." required
}
