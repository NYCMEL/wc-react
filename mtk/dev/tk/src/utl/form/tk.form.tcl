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

    division class="container" {
	division class="row" {
	    division class="col-md-6" {
		h3 "Form <small>- vertical + two way data binding</small>"
		division class="well" {
		    tk::form::test:content -id "form-1" -columns ""
		}
	    }
	    division class="col-md-6" {
		h3 "Form <small>- horizontal</small>"
		division class="well" {
		    tk::form::test:content -id "form-1" -columns "col-sm-4 col-sm-8"
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
    
    tk::form -name "$id" -callback "tk::form::test:cb" -guts {
	export ajax=1

	tk::text -id email -name "v(email)" -label "Email" -value "mel@melify.com" -columns "$columns"\
	    placeholder="your email" pattern="$tk::form::pattern(email)" required\
	    data-error="your email is required!" data-key="email"
	
	tk::select -id "color" -name "v(color)" -label "Box Color" -options [subst {
	    "" "Please Select"
	    1 "Red"
	    2 "White"
	    3 "Blue"
	}] -selected "" -columns "$columns" required data-error="Pick a color from the list..."\
	    data-key="color"

	tk::calendar -id "date" -name "v(date)" -label "Shipping Date" -columns "$columns"\
	    required placeholder="mm/dd/yyyy" data-error="Shipping date is required!" data-key="date"

	tk::textarea -id "address" -name "v(address)" -label "Address" -columns "$columns"\
	    placeholder="Shipping Address" rows="3" required  data-error="An address is required"\
	    data-key="address"
	
	tk::groupbox -id "groupbox-1" -label "Select Box Size" -columns $columns -guts {
	    division class="pull-left" [style margin-right 30px] {
		tk::radio -id "rb1" -name "v(size)" -label "Small" -value "1" required data-key="rb1"
	    }
	    division class="pull-left" [style margin-right 30px] {
		tk::radio -id "rb2" -name "v(size)" -label "Medium" -value "2" required data-key="rb2"
	    }
	    division class="pull-left" {
		tk::radio -id "rb3" -name "v(size)" -label "Large" -value "3" required data-key="rb3"
	    }
	}

	tk::groupbox -id "groupbox-2" -label "You must Agree" -columns "$columns" -guts {
	    tk::checkbox -id "cb1" -name "v(agree)" -label "I agree with Terms & Conditions" -value "1" required\
		data-key="agree"
	}
	
	tk::groupbox -id "groupbox-3" -label "" -columns "$columns" -guts {
	    submit_button action=Submit class="btn btn-primary"
	}
    }

    javascript {
	put {
	    function changeHandler(ev) {
		console.group("changeHandler");
		console.log(this.id, ev.type, ev.data.newValue);
		console.groupEnd();
	    }

	    tk.bind("email-child",	changeHandler);
	    tk.bind("rb1-child",	changeHandler);
	    tk.bind("rb2-child",	changeHandler);
	    tk.bind("rb3-child",	changeHandler);
	    tk.bind("cb1-child",	changeHandler);
	    tk.bind("address-child",	changeHandler);
	    tk.bind("date-child",	changeHandler);
	    tk.bind("color-child",	changeHandler);

	    app.model.agree = true;
	    app.model.rb1 = false;
	    app.model.rb2 = false;
	    app.model.rb3 = true;
	    app.model.address = "100 Columbus Drive";
	    app.model.date = "12/10/2017"
	    app.model.color = 1;
	    app.model.email = "mel.heravi@gmail.com";
	}
    }
}
