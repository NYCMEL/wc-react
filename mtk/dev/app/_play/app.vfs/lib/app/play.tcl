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

namespace eval play {}

include "/inc/play.css"
include "/inc/play.js"

include "/GitHub/autosize/dist/autosize.min.js"

######################################################
##### 
######################################################
m::proc -public play::id {
} {
    Documentation goes here...
} {
    Trace
    
    return "play"
}

######################################################
##### 
######################################################
m::proc -public play::narrative {
} {
    Documentation goes here...
} {
    Trace

    put "this is our play page"
}

######################################################
##### 
######################################################
m::proc -public play::title {
} {
    Documentation goes here...
} {
    Trace
    
    return "- play"
}

######################################################
##### 
######################################################
m::proc -public play::template {
} {
    Documentation goes here...
} {
    Trace

    return "template::0"
}

######################################################
##### 
######################################################
m::proc -public play::init {
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
m::proc -public play::guts {
} {
    Documentation goes here...
} {    
    Trace
    variable _id [id]
    
    auto_load $::component

    division id="${_id}" {
	division id="${_id}-code" {
	    mtk::component::form::init -name "mtk-component-form-test" -callback "play::cb" -guts {
		division id="${_id}-header" class="page-header" [style margin-top -10px] {
		    h1 "[string range $::component 0 end-6]"
		}
		division id="${_id}-body" class="${_id}-body" {
		    set code [string trim [info body $::component]]
		    textarea v(play)=$code id="${_id}-text" class="form-control"
		}
		br
		division id="${_id}-controls" {
		    submit_button action=[list Show me] class="btn btn-info" id="${_id}-showme"
		    space 20 0
		    button "Reset" class="btn btn-default" id="${_id}-reset" onclick="document.location.reload()"
		}
	    }
	}
    }

    javascript {
	put {
	    jQuery(document).ready(function() {
		play.init();
	    });
	}
    }
}

######################################################
##### 
######################################################
m::proc -public play::cb {
} {
    Documentation goes here...
} {    
    Trace
    variable _id [id]

    br
    division class="${_id}-view" {
	division class="${_id}-head" {
	    put "<i class='fa fa-chevron-circle-down'></i> Component View:"
	}
	
	if {[catch {
	    eval $::v(play)
	} e] != 0} {
	    tk::error "There is a problem. <small>check your code and try again...</small>"
	}
    }
}    
