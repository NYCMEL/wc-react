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

include "/tk/src/utl/form/tk.form.css"

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
    {-class "horizontal"}
    args
} {
    Documentation goes here...
} {
    Trace

    set c1 [lindex $columns 0]
    set c2 [lindex $columns 1]
    
    division class="form-group clearfix" {
	division class="form-group-lhs $class" {
	    label id="$id-label" for="$id-label" class="$c1" "$label"
	}
	
	division class="form-group-rhs $class $c2" {
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
    
    br
    division class="container" {
	division class="row" {
	    division class="col-md-12" {
		put [url "Horizontal" "#" class="btn btn-default" onclick="jQuery('.form-group .vertical').removeClass('vertical').addClass('horizontal')"]
		space 20 0
		put [url "Vertical" "#" class="btn btn-default" onclick="jQuery('.form-group .horizontal').removeClass('horizontal').addClass('vertical')"]
		hr

		tk::form -name "my-form" -callback "tk::form::test:cb" -guts {
		    export ajax=1

		    tk::text\
			-id fname\
			-name "v(email)"\
			-label "Email"\
			-help "help text goes here..."\
			-value "mel@melify.com"\
			-columns "col-md-1 col-md-3"\
			-class "vertical"\
			placeholder="your email" pattern="$tk::form::pattern(email)" required
		}
	    }
	}
    }
}
