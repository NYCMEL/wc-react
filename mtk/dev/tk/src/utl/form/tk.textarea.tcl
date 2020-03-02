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

namespace eval tk {
    namespace eval textarea {}
}

######################################################
#####
######################################################
m::proc -public tk::textarea {
    -id:required
    -name:required
    {-label ""}
    {-help  ""}
    {-value ""}
    {-columns ""}
    args
} {
    Documentation goes here...
} {
    Trace

    set c1 [lindex $columns 0]
    set c2 [lindex $columns 1]
    
    division class="form-group clearfix" {
	label for="$id-label" class="$c1" "$label"

	division class="$c2" {
	    put "<textarea name='$name' class='form-control' id='$id-child' aria-describedby='$id-help' [lstring $args]>$value</textarea>"
	    put "<small id='$id-help' class='form-text help-block with-errors text-muted'>$help</small>"
	}
    }
}

######################################################
##### TEST
######################################################
m::proc -public tk::textarea::test {
} {
    Documentation goes here...
} {    
    Trace
    
    if {[info exist ::columns] == 0} {
	set ::columns "col-md-3 col-md-6"
    }

    tk::form::show -callback "tk::textarea::test" -guts {
	tk::textarea\
	    -id address\
	    -name "v(address)"\
	    -label "Address"\
	    -help "help text goes here..."\
	    -value "100 C. Columbus Drive"\
	    -columns $::columns\
	    placeholder="home address" pattern="$tk::form::pattern(email)" rows=5 required 
    }
}
