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
    args
} {
    Documentation goes here...
} {
    Trace

    division class="form-group" {
	if {$label != ""} {
	    label id="$id-label" for="$id-label" "$label"
	}

	put "<input name='$name' class='form-control' id='$id-text' aria-describedby='$id-help' [lstring $args] value='$value'>"

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
	-name "v(email)"\
	-label "Email"\
	-help "help text goes here..."\
	-value "mel@melify.com"\
	placeholder="your email" pattern="$tk::form::pattern(email)" required
}

######################################################
##### 
######################################################
m::proc -public tk::select {
    -id:required
    -name:required
    {-label ""}
    -options:required
    {-selected ""}
    {-help  ""}
    args
} {
    Documentation goes here...
} {    
    Trace

    division class="form-group" {
	if {$label != ""} {
	    label id="$id-label" for="$id-label" "$label"
	}

	cgi_select "$name" id="$id-select" class="form-control" [lstring $args] {
	    foreach {i j} $options {
		option $j value=$i [expr {($i == $selected) ? "selected" : ""}]
	    }
	}

	if {$help != ""} {
	    put "<small id='$id-help' class='form-text text-muted'>$help</small>"
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

    tk::select -id "my-select" -name "v(select)" -options [subst {
	"" ""
	1 "Option 1"
	2 "Option 2"
	3 "Option 3"
	4 "Option 4"
    }] -selected 2 -help "help text goes here..." required
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
    args
} {
    Documentation goes here...
} {
    Trace

    division class="form-group" {
	if {$label != ""} {
	    label for="$id-label" "$label"
	}

	put "<textarea name='$name' class='form-control' id='$id-text' aria-describedby='$id-help' [lstring $args]>$value</textarea>"

	if {$help != ""} {
	    put "<small id='$id-help' class='form-text text-muted'>$help</small>"
	}
    }
}

######################################################
##### TEST
######################################################
m::proc -public tk::textarea:test {
} {
    Documentation goes here...
} {    
    Trace
    
    tk::textarea\
	-id address\
	-name "v(address)"\
	-label "Address"\
	-help "help text goes here..."\
	-value "100 C. Columbus Drive"\
	placeholder="home address" pattern="$tk::form::pattern(email)" rows=5 required 
}

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
    
    tk::radio -id "rb-1" -name "v(rb)" -label "Do you Agree  I?" -value "1" required checked
    tk::radio -id "rb-2" -name "v(rb)" -label "Do you Agree II?" -value "2" required
}

######################################################
#####
######################################################
m::proc -public tk::check {
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
	    	<input type='checkbox' class='form-check-input' name='$name' id='$id-check' value='$value' [lstring $args]>\
		$label\
		</label>"
	}
    }
}

######################################################
##### TEST
######################################################
m::proc -public tk::check:test {
} {
    Documentation goes here...
} {    
    Trace
    
    tk::check -id "cb-1" -name "v(cb)" -label "Do you Agree II?" -value "2" required
}

