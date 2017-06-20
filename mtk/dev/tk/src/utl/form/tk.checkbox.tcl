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

######################################################
#####
######################################################
m::proc -public tk::checkbox {
    -id:required
    -name:required
    {-label ""}
    {-value ""}
    args
} {
    Documentation goes here...
} {
    Trace

    division class="form-group" {
	division class="form-check" {
	    put "\
	    	<label id='$id-label' class='form-check-label'>\
	    	<input type='checkbox' class='form-check-input' name='$name' id='$id-child' value='$value' [lstring $args]>\
		$label\
		</label>"

	    #put "<small id='$id-help' class='form-text help-block with-errors text-muted'></small>"
	}
    }
}

######################################################
##### TEST
######################################################
m::proc -public tk::checkbox:test {
} {
    Documentation goes here...
} {    
    Trace
    
    tk::checkbox -id "cb-1" -name "v(cb)" -label "Do you Agree II?" -value "2" required checked
}

