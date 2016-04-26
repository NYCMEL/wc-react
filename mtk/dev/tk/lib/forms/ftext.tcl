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
    
    put {
	<style>
	form {
	    margin:0;
	    padding:0;
	    padding-top:10px;
	    width:100%;
	    border:1px red solid;
	    clear:both;
	}
	</style>
    }

    division [style margin 50px] {
	fform -id "my-form" -guts {
	    foreach i {1 2 3} {
		division class="form-group" [style margin-left 0px] {
		    label for="name" class="col-md-2 control-label" "Your Name:"
		    
		    division class="col-md-6" {
			ftext -name "fname" -placeholder "your name..."
		    }
		}
	    }
	}
    }
}