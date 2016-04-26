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

namespace eval ftext {}

######################################################
##### 
######################################################
m::proc -public ftext {
    -name:required
    {-label ""}
    {-value ""}
    {-placeholder ""}
    {-class "form-control"}
    {-required ""}
} {
    Documentation goes here...
} {
    Trace
    
    text $name=$value id="$name" placeholder="$placeholder" class="$class" $required
}

######################################################
##### 
######################################################
m::proc -public ftext:test {
} {
    Documentation goes here...
} {
    Trace
    
    division [style margin 100px] {
	tk::form -name "form-name" -callback "form-callback" -class "form-inline" -guts {
	    foreach i {1 2 3} {
		division class="form-group" {
		    division class="input-group" {
			label for="fname" "Your Name:"
			ftext -name "fname" -placeholder "Your name ..."
		    }
		}
	    }
	}
    }
}
