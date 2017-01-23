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

include "/tk/src/utl/inc/tk.form.css"
include "/tk/src/utl/inc/tk.form.js"
include "/tk/jquery/scripts/jquery.validate.js"

#include "/GitHub/bootstrap-select/dist/css/bootstrap-select.min.css"
#include "/GitHub/bootstrap-select/dist/js/bootstrap-select.min.js"

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
			
			jQuery("#result-$id").load(tk.siteurl + "?ajax=1&callback=$callback&" + qstr + extra).show("slow");
		    }
		});

		$custom
	    }]
	}
    } else {
	switch [string tolower $method] {
	    "get" {
		javascript {
		    put [subst {
			jQuery("#$id").submit(function(e) {
			    e.preventDefault();
			    
			    var values = jQuery("#$id").serialize();
			    
			    jQuery("#result-$id").load(tk.siteurl + "?callback=$callback&values=" + values).show("slow");
			});
		    }]
		}
	    }
	    "post" {
		javascript {
		    put [subst {
			jQuery("#$id").submit(function(e) {
			    e.preventDefault();
			    
			    let obj = jQuery(this);

			    jQuery.ajax({
				data: obj.serialize(),
				type: "POST",
				url: obj.attr('action'),
				success: function(response) {
				    jQuery("#result-$id").html(response).show();
				}
			    });
			});
		    }]
		}
	    }
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

 	division id="$id-form-result" [style margin-top 20px padding 5px border "1px orange dashed" font-family oswald-light] {
	    put "Nothing submitted yet! ..."
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
    
    put {
	<style>
	hr {
	    border-top: 1px #cecece solid;
	}

	h4 {
	    font-family: Oswald!important;
	    color:#827717;
	}

	h4 small {
	    font-family: Oswald-light!important;
	    color:#827717;
	}
	</style>
    }

    br
    division class="container" {
	division class="row" {
	    division class="col-md-6" {
		division {
		    division class="well" {
			tk::form::init -name "aform" -method "GET" -callback "tk::form::test:cb" -guts {
			    if {0} {
				foreach i {A B C D} {
				    text v($i)=$i>[lorem 10] class="form-control" required
				}
			    }
			    
			    division class="clearfix" {
				foreach i [array names pattern] {
				    division class="col-md-6" {
					label [string totitle $i]
					text v($i)= class="form-control" required pattern="$pattern($i)"
				    }
				}
			    }
			    hr
			    division class="clearfix" {
				put "<button type='submit' class='btn btn-default'>PUSH IT <i class='fa fa-chevron-right'></i></button>"
			    }
			}
		    }
		}
	    }
	    division class="col-md-6" {
		division class="well" {
		    tk::form::init -name "bform" -method "GET" -callback "tk::form::test:cb" -guts {
			tk::form::create
			hr
			division [style margin-left 20px] {
			    put "<button type='submit' class='btn btn-info btn-wide'><i class='fa fa-smile-o fa-lg'></i> PUSH IT NOW</button>"
			}
		    }
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
				set ptrn ""
			    } else {
				set ptrn "pattern=$pattern([dict get $n pattern])"
			    }
			    
			    text [dict get $n id]=[dict get $n value] \
				type="[dict get $n type]" \
				$maxlength\
				class="form-control [dict get $n required]" \
				$ptrn\
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
				set ptrn ""
			    } else {
				set ptrn "pattern=$pattern([dict get $n pattern])"
			    }
			    
			    textarea [dict get $n id]=[dict get $n value] \
				type="[dict get $n type]" \
				class="form-control [dict get $n required]" \
				rows="[dict get $n rows]" \
				$ptrn\
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
			    
			    if {[dict exists $n selected] == 1} {
				set selected [dict exists $n selected]
			    } else {
				set selected ""
			    }

			    select [dict get $n id] $size class="selectpicker show-menu-arrow form-control" ng-model="[dict get $n bind]" {
				foreach {i j} [dict get $n options] {
				    if {$selected == $i} {
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
				
				checkbox [dict get $p id] [dict get $p "checked"] [dict get $p required] ng-model="[dict get $p bind]" id="[dict get $p id]"
				
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
				
				radio_button [dict get $p "id"]=[dict get $p "value"] id=[dict get $p "id"]\
				    [dict get $p required] [dict get $p "checked"] ng-model="[dict get $n bind]"
				
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

######################################################
##### 
######################################################
m::proc -public tk::form::upload:cb {
} {
    Documentation goes here...
} {    
    Trace

    set cgi  [lindex $::file 0]
    set name [file tail [lindex $::file 1]]

    regsub -all {\[} $name "" name
    regsub -all {\]} $name "" name

    catch {file rename -force $cgi "/tmp/$name"}

    put "$name <small>- [commify [file size /tmp/$name]](b)</small>"

    javascript {
	put {
	    $("#uploader-form-result").slideDown("slow");
	}
    }
}

######################################################
#####
######################################################
m::proc -public tk::form::uploader {
} {
    Documentation goes here...
} {
    include "/GitHub/form/jquery.form.js"
    include "/GitHub/jasny/dist/css/jasny-bootstrap.min.css"
    include "/GitHub/jasny/dist/js/jasny-bootstrap.min.js"
    
    division [style margin 100px] {
	division [style width 500px] {
	    cgi_form "[URL]" id="form-uploader" {
		export ajax=1
		export callback=tk::form::upload:cb
		
		include "/Melify/mtk/dev/tk/src/utl/html/upload.html"
		
		division id="uploader-form-result" class="alert alert-success" [style text-align center display none] {
		    h1 "WAITING..."
		}
	    }
	    
	    javascript {
	    	put {
	    	    $(document).ready(function () {
			$("#form-uploader").on("submit", function(e) {
			    e.preventDefault(); // <-- important

			    $(this).ajaxSubmit({
				target: "#uploader-form-result"
			    });
			});
	    	    });
	    	}
	    }
	}
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
	tk::form -method "POST" -name "form-test" -callback "tk::form::test:2:cb" -validate 0 -guts {
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
