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

array set patterns {
    text   {[A-Za-z0-9 ]}
    phone  {^(?d{3})?[- ]?d{3}[- ]?d{4}$}
    email  {[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$}
    city   {[A-Za-z ]+}
    state  {[A-Za-z]{1,50}}
    zipcode     {\d{5,5}(-\d{4,4})?}
    ssn         {^(\d{3}-|(\d{3})\s)\d{2}-\d{4}$}
    amount {^[$\-\s]*[\d\,]*?([\.]\d{0,2})?\s*$}
    number {\d*}
}

namespace eval tk {
    namespace eval form {}
}

include "/tk/jquery/scripts/jquery.form.js"
include "/tk/inc/form.css"

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
    {-custom           ""}
    {-host             ""}
    -guts:required
    args
} {
    DOCUMENTATION GOES HERE...
} {
    Trace
    
    #VALIDATE FORM AND PROCES RESULT
    if {$validate == 1} {
	include "/tk/jquery/scripts/jquery.validate.js"
    }
    
    # -custom {
    #      jQuery(".paswd").rules("add", {
    #          required:true, 
    #          minlength: 6,
    #          messages: {
    #           required: "minimum length is 6 alpha numeric characters"
    #          }
    #      });     
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
		jQuery("form").submit(function(e){
		    e.preventDefault(); //prevent submit
		    var self = this;
		    
		    var values = jQuery("#$id").serialize();
		    console.log(values)
		    
		    jQuery("#result-$id").load(tk.siteurl + "?ajax=1&callback=$callback&values=" + values).show("slow");
		});
	    }]
	}
    }
}

######################################################
##### tk::form::init -id "myform" -guts {...}
######################################################
m::proc -public tk::form::init {
    -id:required
    -guts:required
    {-direction "form-horizontal"}
} {
    Documentation goes here...
} {
    Trace
    
    put "<form class='$direction' id='$id' role='form'>"
    
    uplevel $guts
    
    put "</form>"
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
				set pattern "pattern=$::patterns([dict get $n pattern])"
			    }
			    
			    text [dict get $n id]=[dict get $n value] \
				type="[dict get $n type]" \
				$maxlength\
				class="form-control" \
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
				set pattern "pattern=$::patterns([dict get $n pattern])"
			    }
			    
			    textarea [dict get $n id]=[dict get $n value] \
				type="[dict get $n type]" \
				class="form-control" \
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
