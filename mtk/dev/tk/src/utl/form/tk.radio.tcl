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
m::proc -public tk::radio {
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
	    	<input type='radio' class='form-check-input' name='$name' id='$id-radio' value='$value' [lstring $args]>\
		$label\
		</label>"

	    #put "<small id='$id-help' class='form-text help-block with-errors text-muted'></small>"
	}
    }
}

######################################################
##### TEST
######################################################
m::proc -public tk::radio:test {
} {
    Documentation goes here...
} {    
    Trace
    
    division class="clearfix" {
	division class="pull-left" [style margin-right 30px] {
	    tk::radio -id "rb-1" -name "v(rb)" -label "Do you Agree  I?" -value "1" required
	}
	division class="pull-left" {
	    tk::radio -id "rb-2" -name "v(rb)" -label "Do you Agree II?" -value "2" required
	}
    }
}
