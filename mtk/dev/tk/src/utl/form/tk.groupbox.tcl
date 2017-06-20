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
m::proc -public tk::groupbox {
    -id:required
    -guts:required
    {-label ""}
    {-columns ""}
} {
    Documentation goes here...
} {
    Trace

    set c1 [lindex $columns 0]
    set c2 [lindex $columns 1]

    division class="form-group" {
	division class="$c1" {
	    label id="$id-label" for="$id-label" class="$c1" "$label"
	}
	
	division class="$c2" {
	    uplevel $guts
	}
    }
}

######################################################
##### TEST
######################################################
m::proc -public tk::groupbox:test {
} {
    Documentation goes here...
} {    
    Trace
    
    division [style padding 50px] {
	tk::groupbox -id "my-groupbox" -label "Please select" -columns "col-sm-3 col-sm-9" -guts {
	    division class="pull-left" [style margin-right 30px] {
		tk::radio -id "rb-1" -name "v(rb)" -label "Apples" -value "1" required
	    }
	    division class="pull-left" {
		tk::radio -id "rb-2" -name "v(rb)" -label "Oranges" -value "2" required
	    }
	}
    }
}
