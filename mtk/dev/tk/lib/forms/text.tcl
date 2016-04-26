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

namespace eval form {
    namespace eval component {}
}

######################################################
##### 
######################################################
m::proc -public form::component::ftext {
    -name:required
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
m::proc -public form::component::ftext:test {
} {
    Documentation goes here...
} {
    Trace
    
    br
    division class="container" {
	division class="row" {
	    division class="col-md-12" {
		form::component::ftext -name "fname" -placeholder "Your name ..." -class "form-control input-lg"
	    }
	}
    }
}
