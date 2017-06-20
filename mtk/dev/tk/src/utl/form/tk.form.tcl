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
    namespace eval form {
	array set pattern {
	    phone	{\d{3}[\-]\d{3}[\-]\d{4}}
	    text	{[a-zA-Z ]+}
	    alnum	{[a-zA-Z][a-zA-Z0-9\s]*}
	    email	{[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$}
	    city	{[A-Za-z ]+}
	    state	{[A-Za-z]{2}}
	    zipcode     {\d{5,5}(-\d{4,4})?}
	    ssn         {^(\d{3}-|(\d{3})\s)\d{2}-\d{4}$}
	    amount	{^[$\-\s]*[\d\,]*?([\.]\d{0,2})?\s*$}
	    number	{\d*}
	    date	{\d{1,2}/\d{1,2}/\d{4}}
	}
    }
}

include "/GitHub/form/dist/jquery.form.min.js"
include "/GitHub/bootstrap-validator/dist/validator.min.js"

put "<style>.has-error label {color: #A94442;}</style>"

######################################################
##### 
######################################################
m::proc -public tk::form {
    -name:required
    {-url              {}}
    {-id               {}}
    {-callback         {}}
    {-method       "POST"}
    {-enctype          {}}
    {-class            {}}
    {-custom	       ""}
    {-host             ""}
    -guts:required
    args
} {
    DOCUMENTATION GOES HERE...
} {
    Trace
    
    set id [expr {($id == "") ? "$name" : "$id"}]
    set en [expr {($enctype == "") ? "" : "enctype=$enctype"}]

    cgi_form [expr {($url == {}) ? "[URL]" : $url}] $en method=$method name="$name" id=$id class="$class" [lstring $args] {
	export callback=$callback

	uplevel $guts

	division id="form-result-$id" {
	    # CONTAINER FOR RESULT
	}
    }

    javascript {
	put [subst {
	    jQuery("#$id").validator().on('submit', function (e) {
		if (e.isDefaultPrevented()) {
		    console.error("INVALID FORM");
		} else {
		    e.preventDefault();

		    jQuery(this).ajaxSubmit({
			target: "#form-result-$id"
		    });
		}
	    })
	}]
    }
}

######################################################
#####
######################################################
m::proc -public tk::form::test {
} {
    Documentation goes here...
} {
    br
    division class="container" {
	division class="row" {
	    division class="col-md-4 well" {
		tk::form -name "form-name" -callback "tk::form::test:cb" -guts {
		    export ajax=1

		    tk::text -id fname -name "v(email)" -label "Email" -value "mel@melify.com"\
			placeholder="your email" pattern="$tk::form::pattern(email)" required
		    
		    tk::calendar -id "my-select" -name "v(calendar)" -label "Shipping Date" required placeholder="mm/dd/yyyy"

		    tk::select -id "my-select" -name "v(select)" -label "Box Color" -options [subst {
			"" "Please Select"
			1 "Red"
			2 "White"
			3 "Blue"
		    }] -selected "" required

		    tk::textarea -id address -name "v(address)" -label "Address" placeholder="Shipping Address" rows="3" required 
		    
		    label "Select Box Size:"
		    division class="clearfix" {
			division class="pull-left" [style margin-right 30px] {
			    tk::radio -id "rb-1" -name "v(rb)" -label "Small" -value "1" required
			}
			division class="pull-left" {
			    tk::radio -id "rb-2" -name "v(rb)" -label "Large" -value "2" required
			}
		    }

		    tk::checkbox -id "cb-1" -name "v(cb)" -label "I Agree with Terms & Conditions" -value "2" required
		    
		    submit_button action=Submit class="btn btn-primary"
		}
	    }
	}
    }
}

######################################################
#####
######################################################
m::proc -public tk::form::test:cb {
} {
    Documentation goes here...
} {
    parray ::v
}
