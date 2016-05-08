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

namespace eval fplay {}

include "/GitHub/CodeMirror/lib/codemirror.css"
include "/GitHub/CodeMirror/theme/mdn-like.css"
include "/GitHub/CodeMirror/theme/3024-night.css"

include "/GitHub/CodeMirror/lib/codemirror.js"
include "/GitHub/CodeMirror/addon/edit/matchbrackets.js"
include "/GitHub/CodeMirror/addon/comment/continuecomment.js"
include "/GitHub/CodeMirror/addon/comment/comment.js"
include "/GitHub/CodeMirror/addon/selection/active-line.js"
include "/GitHub/CodeMirror/mode/javascript/javascript.js"

include "/GitHub/js-beautify/js/lib/beautify-html.js"

put {<script src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js"></script>}

include "/tk/lib/forms/inc/fplay.css"
include "/tk/lib/forms/inc/fplay.js"
include "/tk/lib/forms/inc/fvalidate.js"

######################################################
##### 
######################################################
m::proc -public fplay::id {
} {
    Documentation goes here...
} {
    Trace
    
    return "fplay"
}

######################################################
##### 
######################################################
m::proc -public fplay::narrative {
} {
    Documentation goes here...
} {
    Trace

    put "this is our fplay page"
}

######################################################
##### 
######################################################
m::proc -public fplay::title {
} {
    Documentation goes here...
} {
    Trace
    
    return "fplay"
}

######################################################
##### 
######################################################
m::proc -public fplay::template {
} {
    Documentation goes here...
} {
    Trace

    return "template::0"
}

######################################################
##### 
######################################################
m::proc -public fplay::init {
} {
    Documentation goes here...
} {    
    Trace
    variable _id [[namespace current]::id]
    
    [template]
}

######################################################
##### 
######################################################
m::proc -public fplay::guts {
} {
    Documentation goes here...
} {    
    Trace
    variable _id [id]
    
    br

    division id="${_id}" {
	fform -id "ftest" -guts {
	    division class="container" {
		division class="row" {
		    division class="col-md-4" {
			division class="panel panel-default" {
			    division class="panel-heading" {
				h3 class="panel-title" "Json file..."
			    }
			    division class="panel-body" [style margin 0 padding 0 height 600px overflow auto] {
				textarea json=[file:read /Melify/mtk/dev/app/_git/app.vfs/data/form.2.json] id="json"
			    }
			    division class="panel-footer" {
				division class="clearfix" {
				    division class="pull-left" {
					button "Update" class="btn btn-primary btn-big"
				    }
				    division class="pull-right" {
					button "Reset" class="btn btn-warning btn-big pull-right"
				    }
				}
			    }
			}
		    }
		    division class="col-md-8" {
			division class="panel panel-default" {
			    division class="panel-heading" {
				h3 class="panel-title" "Generated Form..."
			    }
			    division class="panel-body" {
				ftest::init -file "/Melify/mtk/dev/app/fannie/app.vfs/data/forms/f1.json"
			    }
			    division class="panel-footer" {
				submit_button action=Validate class="btn btn-success btn-big" onclick="fvalidate('ftest')"
			    }
			}
		    }
		}
	    }

	    javascript {
		put {
		    jQuery(document).ready(function() {
			fplay.init();
		    });
		}
	    }
	}
    }
}

