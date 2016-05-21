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
	    text	{[a-zA-Z ]+}
	    alnum	{[a-zA-Z][a-zA-Z0-9\s]*}
	    phone	{^(?d{3})?[- ]?d{3}[- ]?d{4}$}
	    email	{[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$}
	    city	{[A-Za-z ]+}
	    state	{[A-Za-z]{1,50}}
	    zipcode     {\d{5,5}(-\d{4,4})?}
	    ssn         {^(\d{3}-|(\d{3})\s)\d{2}-\d{4}$}
	    amount	{^[$\-\s]*[\d\,]*?([\.]\d{0,2})?\s*$}
	    number	{\d*}
	}
    }
}

include "/tk/inc/form.css"
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
    
    cgi_form $url $en method=$method name="$name" id=$id class="$class" [lstring $args] {
	uplevel $guts

	division id="$id-form-result" [style margin-top 20px padding 5px border "1px orange dashed"] {
	    put waiting...
	}
    }

    javascript {
	put [subst {
	    tkForm.init({
		id:"$id",
		url:"$url",
		method:"$method",
		callback:"$callback",
		result:"$id-form-result"
	    })
	}]
    }
}

######################################################
##### 
######################################################
m::proc -public tk::form::test {
} {
    DOCUMENTATION GOES HERE...
} {
    Trace
    variable pattern
    
    h1 >>>$pattern(text)<<<

    tk::form::init -name "aform" -method "GET" -callback "tk::form::test:cb" -guts {
	foreach i {a b c d} {
	    text v($i)=[lorem 10] class="form-control" required
	}
	
	hr
	put "<button type='submit' class='btn btn-default'>PUSH IT <i class='fa fa-chevron-right'></i></button>"
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

######################################################
#####
######################################################
m::proc -public tk::form::create {
    {-file "/Melify/mtk/dev/tk/src/utl/dat/form.json"}
} {
    Documentation goes here...
} {
    Trace
    variable pattern
    
    if {[info exist ::file] == 1} {
	set file $::file
    }
    
    put {
	<style>
	label {
	    margin-top:5px;
	}
	</style>
    }
    
    set f [file:read $file]
    set d [json::json2dict $f]
    set d [string range $d 1 end-1]
    #p >>$d<<
    
    foreach k $d {
	division class="form-group clearfix" {
	    foreach j $k {
		set width [dict exist $j width]
		
		if {$width == 1} {
		    put "<div class=[dict get $j width]>"
		}
		
		foreach {m n} $j {
		    switch $m {
			"custom" {
			    division class="col-md-12" {
				uplevel $n
			    }
			}
			"html" {
			    division class="col-md-12" {
				put [subst $n]
			    }
			}
			"label" {
			    if {$width == 0} {
				label id="[dict get $n id]" class="[dict get $n width]" for="[dict get $n for]" "[dict get $n text]"
			    } else {
				label id="[dict get $n id]" "[dict get $n text]"
			    }
			}
			"text" {
			    if {[dict exist $n maxlength] == 1} {
				set maxlength "maxlength=[dict get $n maxlength]"
			    } else {
				set maxlength ""
			    }
			    
			    if {$width == 0} {
				put "<div class=[dict get $n width]>"
			    }
			    
			    if {[dict get $n pattern] == ""} {
				set pattern ""
			    } else {
				set pattern "pattern=$pattern([dict get $n pattern])"
			    }
			    
			    text [dict get $n id]=[dict get $n value] \
				type="[dict get $n type]" \
				$maxlength\
				class="form-control [dict get $n required]" \
				$pattern\
				placeholder="[dict get $n placeholder]" \
				ng-model="[dict get $n bind]" \
				"[dict get $n required]"
			    
			    if {$width == 0} {
				put "</div>"
			    }
			}
			"textarea" {
			    if {$width == 0} {
				put "<div class=[dict get $n width]>"
			    }
			    
			    if {[dict get $n pattern] == ""} {
				set pattern ""
			    } else {
				set pattern "pattern=$pattern([dict get $n pattern])"
			    }
			    
			    textarea [dict get $n id]=[dict get $n value] \
				type="[dict get $n type]" \
				class="form-control [dict get $n required]" \
				rows="[dict get $n rows]" \
				$pattern\
				placeholder="[dict get $n placeholder]" \
				ng-model="[dict get $n bind]" \
				"[dict get $n required]"
			    
			    if {$width == 0} {
				put "</div>"
			    }
			}
			"select" {
			    if {$width == 0} {
				put "<div class=[dict get $n width]>"
			    }
			    
			    if {[dict get $n size] > 1} {
				set size "size=[dict get $n size]"
			    } else {
				set size ""
			    }
			    
			    select [dict get $n id] $size class="form-control" ng-model="[dict get $n bind]" {
				foreach {i j} [dict get $n options] {
				    if {[dict get $n selected] == $i} {
					set state "selected"
				    } else {
					set state ""
				    }
				    
				    option $j value=$i $state
				}
			    }
			    if {$width == 0} {
				put "</div>"
			    }
			}
			"checkboxes" {
			    if {$width == 0} {
				put "<div class=[dict get $n width]>"
			    }
			    
			    foreach p [dict get $n "checkbox"] {
				if {$width == 0} {
				    put "<div class=[dict get $p width]>"
				}
				
				checkbox [dict get $p id] [dict get $p "checked"] ng-model="[dict get $p bind]" id="[dict get $p id]"
				
				set lbl [dict get $p caption]
				
				label id="[dict get $lbl id]" for="[dict get $lbl for]" class="label-control" "&nbsp;[dict get $lbl text]"
				
				if {$width == 0} {
				    put "</div>"
				}
			    }
			    
			    if {$width == 0} {
				put "</div>"
			    }
			}
			"radioboxes" {
			    if {$width == 0} {
				put "<div class=[dict get $n width]>"
			    }
			    
			    foreach p [dict get $n "radiobox"] {
				if {$width == 0} {
				    put "<div class=[dict get $p width]>"
				}
				
				radio_button [dict get $p "id"]=[dict get $p "value"] id=[dict get $p "id"] [dict get $p "checked"] ng-model="[dict get $n bind]"
				
				set lbl [dict get $p caption]
				
				label id="[dict get $lbl id]" for="[dict get $lbl for]" class="label-control" "&nbsp;[dict get $lbl text]"
				
				if {$width == 0} {
				    put "</div>"
				}
			    }
			    
			    if {$width == 0} {
				put "</div>"
			    }
			}
		    }
		}
		
		if {$width == 1} {
		    put "</div>"
		}
	    }
	}
    }
}
