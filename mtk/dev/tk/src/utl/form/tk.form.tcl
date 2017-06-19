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
    {-validate          1}
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
	export ajax=0
	export callback=$callback

	uplevel $guts

	division id="form-result-$id" [style background yellow] {
	    # CONTAINER FOR RESULT
	}
    }

    javascript {
	put [subst {
	    jQuery("form").validator().on('submit', function (e) {
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
m::proc -public tk::form::test:2 {
} {
    Documentation goes here...
} {
    br

    division class="col-md-4" {
	tk::form -name "form-name" -callback "test::form:callback" -guts {
	    export ajax=1

	    tk::text -id fname -name "v(email)" -label "Email" -help "help text goes here..." -value "mel@melify.com"\
		placeholder="your email" pattern="$tk::form::pattern(email)" required
	    
	    tk::calendar -id "my-select" -name "v(calendar)" -help "help text goes here..." -label "Which Date?" required 

	    tk::select -id "my-select" -name "v(select)" -options [subst {
		"" "PLEASE SELECT"
		1 "Option 1"
		2 "Option 2"
		3 "Option 3"
		4 "Option 4"
	    }] -selected "" -help "help text goes here..." -label "Pick One" required

	    tk::textarea\
		-id address\
		-name "v(address)"\
		-label "Address"\
		-help "help text goes here..."\
		-value "100 C. Columbus Drive"\
		placeholder="home address" pattern="$tk::form::pattern(email)" rows=5 required 

	    label "Please select your Gender:"
	    division class="clearfix" {
		division class="pull-left" [style margin-right 30px] {
		    tk::radio -id "rb-1" -name "v(rb)" -label "I am a Male" -value "1" required
		}
		division class="pull-left" {
		    tk::radio -id "rb-2" -name "v(rb)" -label "I am a Female" -value "2" required
		}
	    }

	    tk::checkbox -id "cb-1" -name "v(cb)" -label "Do you Agree ?" -value "2" required
	    
	    submit_button action=Submit class="btn btn-default"
	}
    }
}

######################################################
#####
######################################################
m::proc -public tk::form::test:2:cb {
} {
    Documentation goes here...
} {
    parray ::v
}
