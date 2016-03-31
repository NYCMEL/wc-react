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

namespace eval detail {}

include "/inc/detail.css"
include "/inc/detail.js"

include "/GitHub/iframe-resizer/js/iframeResizer.contentWindow.min.js"

######################################################
##### 
######################################################
m::proc -public detail::id {
} {
    Documentation goes here...
} {
    Trace
    
    return "detail"
}

######################################################
##### 
######################################################
m::proc -public detail::narrative {
} {
    Documentation goes here...
} {
    Trace

    put "this is our detail page"
}

######################################################
##### 
######################################################
m::proc -public detail::title {
} {
    Documentation goes here...
} {
    Trace
    
    return "detail"
}

######################################################
##### 
######################################################
m::proc -public detail::template {
} {
    Documentation goes here...
} {
    Trace

    return "template::0"
}

######################################################
##### 
######################################################
m::proc -public detail::init {
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
m::proc -public detail::guts {
} {
    Documentation goes here...
} {    
    Trace
    variable _id [id]
    
    #make sure we have the component
    auto_load $::component

    division id="${_id}" {
	division class="page-header clearfix" [style margin-top -10px] {
	    division class="pull-left" {
		set url [url "click to play" [URL page play component $::component folder $::folder] target=_play]
		set lbl [string range $::component 0 end-6]
		h1 "$lbl <small>- $url</small>"
	    }
	    division class="pull-right" [style margin-top 30px] {
		put [url "<i class='fa fa-close'></i> CLOSE" "#" class="btn btn-warning" onclick="detail.close()"]
	    }
	}

	division id="${_id}-view" {
	    division class="view" {
		h3 class="view-type" "<i class='fa fa-chevron-circle-down'></i> Component View:</span>"
		division id="${_id}-component-view" class="view-container" {
		    eval $::component
		}
	    }

	    br
	    division class="view" {
		h3 class="view-type" "<i class='fa fa-chevron-circle-down'></i> Component Code:"

		division class="view-container" {
		    preformatted class="prettyprint lang-html linenums" {
			set body [info body $::component]
			#regsub -all { \-} $body "<BR>\t-" body
			
			put $body
		    }
		}
	    }

	    br
	    division class="view" {
		h3 class="view-type" "<i class='fa fa-chevron-circle-down'></i> HTML Code:"

		division class="view-container" {
		    preformatted class="prettyprint lang-html linenums" id="${_id}-component-html" {
			h1 waiting...
		    }
		}
	    }
	}

	division id="${_id}-play" [style display none] {
	    h1 "PLAY"
	}
    }

    javascript {
	put [subst {
	    jQuery(document).ready(function() {
		detail.init();

		var code = jQuery("#${_id}-component-view").html();

		jQuery("#${_id}-component-html").text(jQuery.htmlClean(code, {format:true}));
	    });
	}]
    }
}
