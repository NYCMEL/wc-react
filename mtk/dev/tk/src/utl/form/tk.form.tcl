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

include "/tk/src/utl/form/inc/tk.form.js"
include "/GitHub/bootstrap-validator/docs/dist/validator.min.js"
include "/GitHub/jquery-validation/lib/jquery.form.js"
include "/tk/src/utl/form/inc/tk.form.css"

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
	export ajax=1
	export callback=$callback

	uplevel $guts

	division id="form-result-$id" [style background yellow] {
	    # CONTAINER FOR RESULT
	}
    }

    javascript {
	put [subst {
	    //tkForm.submitState("#$id")

	    jQuery("#$id").on("submit", function(e) {
		e.preventDefault();

		jQuery(this).ajaxSubmit({
		    target: "#form-result-$id"
		});
	    });
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
    set str "[lorem] [lorem] [lorem]"

    division {
	tk::form -method "POST" -name "form-test" -callback "tk::form::test:2:cb" -guts {
	    export v(name)=[list MEL HERAVI]
	    textarea v(ta)=$str class="form-control" rows=10
	    br
	    submit_button action=SUBMIT class="btn btn-default"
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
