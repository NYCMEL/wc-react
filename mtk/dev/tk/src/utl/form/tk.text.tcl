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
m::proc -public tk::text {
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
	label id="$id-label" for="$id-label" class="$c1" "$label"
	
	division class="$c2" {
	    put "<input name='$name' class='form-control' id='$id-child' aria-describedby='$id-help' [lstring $args] value='$value' type='text' autocomplete='off'>"
	    put "<small id='$id-help' class='form-text help-block with-errors text-muted'>$help</small>"
	}
    }
}

######################################################
##### TEST
######################################################
m::proc -public tk::text:test {
} {
    Documentation goes here...
} {    
    Trace
    
    tk::form -name "my-form" -callback "tk::form::test:cb" -guts {
	export ajax=1

	tk::text\
	    -id fname\
	    -name "v(email)"\
	    -label "Email"\
	    -help "help text goes here..."\
	    -value "mel@melify.com"\
	    placeholder="your email" pattern="$tk::form::pattern(email)" required
    }
}
