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
    namespace eval form {}
}

include "/tk/src/utl/inc/tk.form.js"

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
    
    if {$validate == 1} {
	#VALIDATE FORM AND PROCES RESULT
	include "/tk/jquery/scripts/jquery.form.js"
	include "/tk/jquery/scripts/jquery.validate.js"
	include "/tk/inc/form.css"
    }

    # -custom {
    # 	jQuery(".paswd").rules("add", { 
    # 	    required:true,  
    # 	    minlength: 6,
    # 	    messages: {
    # 		required: "minimum length is 6 alpha numeric characters"
    # 	    }
    # 	});	    
    # }

    set id [expr {($id == "") ? "$name" : "$id"}]
    set en [expr {($enctype == "") ? "" : "enctype=$enctype"}]

    cgi_form [expr {($url == {}) ? "[URL]" : $url}] $en method=$method name="$name" id=$id class="$class" [lstring $args] {
	if {$validate == 0} {
	    export callback=$callback
	}

	uplevel $guts

	division id="result-$id" style=display:none\;padding:5px {
	}
    }

    if {$validate == 1} {
	javascript {
	    put [subst {
		jQuery("#$id").validate({
		    debug: true,
		    errorClass: "form-error",

		    submitHandler: function(form) {
			var qstr = jQuery("#$id").serialize();

			var file = jQuery("#file-upload").val();

			if (file != "") {
			    var extra = "&file=" + escape(file);
			} else {
			    var extra = "";
			}

			console.log("form qstr: " + qstr);
			
			jQuery("#result-$id").load(tk.siteurl + "?callback=$callback&" + qstr + extra).show("slow");
		    }
		});

		$custom
	    }]
	}
    } else {
	javascript {
	    put [subst {
		jQuery("#$id").submit(function(e) {
		    e.preventDefault();
		    
		    var values = jQuery("#$id").serialize();
		    
		    jQuery("#result-$id").load(tk.siteurl + "?ajax=1&callback=$callback&values=" + values).show("slow");
		});
	    }]
	}
    }
}

######################################################
##### 
######################################################
m::proc -public tk::form::init {
    -name:required
    {-id               {}}
    {-url              {}}
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
    
    set id  [expr {($id == "") ? "$name" : "$id"}]
    set en  [expr {($enctype == "") ? "" : "enctype=$enctype"}]
    set url [expr {($url == {}) ? "[URL]" : $url}]
    
    if {$validate == 1} {
	#VALIDATE FORM AND PROCES RESULT
	include "/tk/jquery/scripts/jquery.form.js"
	include "/tk/jquery/scripts/jquery.validate.js"
	include "/tk/inc/form.css"
    }

    cgi_form $url $en method=$method name="$name" id=$id class="$class" [lstring $args] {
	uplevel $guts

	division id="$id-form-result" [style margin-top 20px padding 5px border "1px orange dashed"] {
	    put waiting...
	}
    }

    put "<script>tkForm.init({id:'$id', url:'$url', method:'$method', callback:'$callback', result:'$id-form-result'})</script>"
}

######################################################
##### 
######################################################
m::proc -public tk::form::test {
} {
    DOCUMENTATION GOES HERE...
} {
    Trace
    
    tk::form::init -name "aform" -validate 1 -method "GET" -callback "tk::form::test:cb" -guts {
	foreach i {a b c d} {
	    text v($i)=[lorem 10] class="form-control" required
	}
	
	hr
	put "<button type='submit' class='btn btn-primary'><i class='fa fa-smile-o'></i> PUSH IT</button>"
    }
}

######################################################
##### 
######################################################
m::proc -public tk::form::test:cb {
} {
    Documentation goes here...
} {    
    Trace

    parray ::v
}

