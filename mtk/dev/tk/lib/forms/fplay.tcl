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

include "/tk/lib/forms/inc/fplay.css"
include "/tk/lib/forms/inc/fplay.js"

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
    
    division id="${_id}" {
	br
	division class="container" {
	    division class="row" {
		division class="col-md-4" {
		    division class="panel panel-default" {
			division class="panel-heading" {
			    h3 class="panel-title" "Json file..."
			}
			division class="panel-body" [style margin 0 padding 0 height 600px overflow auto] {
			    put "<pre style=font-size:10px>"
			    put [file:read /Melify/mtk/dev/app/_git/app.vfs/data/form.2.json]
			    put "</pre>"
			}
			# division class="panel-footer" {
			# 	put [lorem 10]
			# }
		    }
		}
		division class="col-md-8" {
		    division class="panel panel-default" {
			division class="panel-heading" {
			    h3 class="panel-title" "Generated Form..."
			}
			division class="panel-body" [style height 600px] {
			    ftest::init
			}
			# division class="panel-footer" {
			# 	put [lorem 10]
			# }
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


