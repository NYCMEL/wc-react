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
    {-label              ""}
    {-labelwidth "col-md-2"}
    {-textwidth  "col-md-6"}
    {-value              ""}
    {-placeholder        ""}
    {-class  "form-control"}
    {-required           ""}
    {-validate           ""}
} {
    Documentation goes here...
} {
    Trace
    
    division class="form-group" [style margin-left 0px] {
	label for="name" class="$labelwidth control-label" "$label"
	
	division class="$textwidth" {
	    text $name=$value id="$name" placeholder="$placeholder" class="$class" $required
	}
    }
}

######################################################
##### 
######################################################
m::proc -public ftext:test {
} {
    Documentation goes here...
} {
    Trace
    
    ftext -name "fname" -label "Your Name:" -placeholder "your name goes here" -required "required"
}