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
    {-id               {}}
    {-url              {}}
    {-callback         {}}
    {-method       "POST"}
    {-enctype          {}}
    {-class            {}}
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

    if {[info exist ::columns] == 0} {
	set ::columns "col-md-2 col-md-4"
    }

    tk::form::show -callback "tk::form::test" -guts {
	division class="well" {
	    tk::form::test:content -id "f1" -columns $::columns
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

######################################################
#####
######################################################
m::proc -public tk::form::test:content {
    -id:required
    -columns:required
} {
    Documentation goes here...
} {
    Trace
    
    tk::text -id "$id-name" -name "v(name)" -label "Name" -value "Mel Heravi" -columns "$columns"\
	placeholder="your name" required\
	data-error="your name is required!" data-key="${id}name"
    
    tk::text -id "$id-email" -name "v(email)" -label "Email" -value "mel@melify.com" -columns "$columns"\
	placeholder="your email" pattern="$tk::form::pattern(email)" required\
	data-error="your email is required!" data-key="${id}email"
    
    tk::text -id "$id-phone" -name "v(phone)" -label "Phone" -value "212-555-1212" -columns "$columns"\
	placeholder="your phone" pattern="$tk::form::pattern(phone)" required\
	data-error="your phone is required!" data-key="${id}phone"
    
    tk::select -id "$id-color" -name "v(color)" -label "Box Color" -options [subst {
	"" "Please Select"
	1 "Red"
	2 "White"
	3 "Blue"
    }] -selected "" -columns "$columns" required data-error="Pick a color from the list..."\
	data-key="${id}color"

    tk::calendar -id "$id-date" -name "v(date)" -label "Shipping Date" -columns "$columns"\
	required placeholder="mm/dd/yyyy" data-error="Shipping date is required!" data-key="${id}date"

    tk::textarea -id "$id-address" -name "v(address)" -label "Address" -columns "$columns"\
	placeholder="Shipping Address" rows="3" required  data-error="An address is required"\
	data-key="${id}address"
    
    tk::groupbox -id "$id-groupbox-1" -label "Select Box Size" -columns $columns -guts {
	division class="pull-left" [style margin-right 30px] {
	    tk::radio -id "$id-rb1" -name "v(size)" -label "Small" -value "1" required data-key="${id}rb1"
	}
	division class="pull-left" [style margin-right 30px] {
	    tk::radio -id "$id-rb2" -name "v(size)" -label "Medium" -value "2" required data-key="${id}rb2"
	}
	division class="pull-left" {
	    tk::radio -id "$id-rb3" -name "v(size)" -label "Large" -value "3" required data-key="${id}rb3"
	}
    }

    tk::groupbox -id "$id-groupbox-2" -label "You must Agree" -columns "$columns" -guts {
	tk::checkbox -id "$id-cb1" -name "v(agree)" -label "I agree with Terms & Conditions" -value "1" required\
	    data-key="${id}agree"
    }
    
    tk::groupbox -id "$id-groupbox-3" -label "" -columns "$columns" -guts {
	submit_button action=Submit class="btn btn-primary"
    }

    javascript {
	put [subst {
	    // CALLBACK FUNCTION WHEN VALUES UPDATED
	    function changeHandler(ev) {
		console.group("changeHandler");
		console.log(this.id, ev.type, ev.data.newValue);
		console.groupEnd();
	    }

	    // BIND ELEMENT WITH A CALLBACK
	    tk.bind("$id-name-child",	changeHandler);
	    tk.bind("$id-phone-child",	changeHandler);
	    tk.bind("$id-email-child",	changeHandler);
	    tk.bind("$id-rb1-child",	changeHandler);
	    tk.bind("$id-rb2-child",	changeHandler);
	    tk.bind("$id-rb3-child",	changeHandler);
	    tk.bind("$id-cb1-child",	changeHandler);
	    tk.bind("$id-address-child",changeHandler);
	    tk.bind("$id-date-child",	changeHandler);
	    tk.bind("$id-color-child",	changeHandler);

	    // INITIALIZE FORM VALUES 
	    app.model.${id}agree	= true;
	    app.model.${id}rb1		= false;
	    app.model.${id}rb2		= false;
	    app.model.${id}rb3		= true;
	    app.model.${id}address	= "100 Columbus Drive";
	    app.model.${id}date		= "12/10/2017"
	    app.model.${id}color	= 1;
	    app.model.${id}email	= "mel@melify.com";
	    app.model.${id}name		= "Mel DaMan";
	    app.model.${id}phone	= "646-303-1234";

	    // UPDATES REQUIRE MANUAL VALIDATOR TRIGGERED
	    jQuery("#$id").validator("validate")
	}]
    }
}

######################################################
#####
######################################################
m::proc -public tk::form::show {
    -guts:required
    -callback:required
} {
    Documentation goes here...
} {
    Trace
    
    #parray ::env

    br
    division class="container" {
	division class="row" {
	    division class="col-md-6" {
		set style [style width 140px]

		set url [URL callback $callback columns "col-md-4 col-md-8"]
		put [url "HORIZONTAL" "#" class="btn btn-default" onclick="document.location.href='$url'" $style]
		space 5 0

		set url [URL callback $callback columns ""]
		put [url "VERTICAL" "#"   class="btn btn-default" onclick="document.location.href='$url'" $style]
		hr

		tk::form -name "my-form" -callback "tk::form::test:cb" -guts {
		    export ajax=1

		    uplevel $guts
		}
	    }
	}
    }
}
