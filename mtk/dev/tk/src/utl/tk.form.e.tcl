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
    {-label ""}
    {-help  ""}
    {-value ""}
    args
} {
    Documentation goes here...
} {
    Trace

    division class="form-group" {
	if {$label != ""} {
	    label for="$id-label" "$label"
	}

	put "<input class='form-control' id='$id-text' aria-describedby='$id-help' [lstring $args] value='$value'>"

	if {$help != ""} {
	    put "<small id='$id-help' class='form-text text-muted'>$help</small>"
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
    
    tk::text\
	-id fname\
	-label "Email"\
	-help "We'll never share your email with anyone else."\
	-value "mel@melify.com"\
	placeholder="your email" pattern="$tk::form::pattern(email)" required
}

######################################################
##### 
######################################################
m::proc -public tk::select {
    -id:required
    {-label ""}
    -options:required
    {-selected ""}
    args
} {
    Documentation goes here...
} {    
    Trace

    division class="form-group" {
	if {$label != ""} {
	    label for="$id-label" "$label"
	}

	cgi_select id="$id-select" class="form-control" [lstring $args] {
	    foreach {i j} $options {
		option $j value=$i [expr {($i == $selected) ? "selected" : ""}]
	    }
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

    tk::select -id "my-select" -options [subst {
	"" ""
	1 "Option 1"
	2 "Option 2"
	3 "Option 3"
	4 "Option 4"
    }] -selected 2 required
}
