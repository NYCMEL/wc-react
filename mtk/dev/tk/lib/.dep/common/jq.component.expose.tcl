###HEADS###################################################################
#
#   COPYRIGHT (C) 1993,2009 Melify                                       
#   EMAIL:        Support@Melify.com                                        
#   URL:          http://www.Melify.com                                    
#   
#   A LICENSE IS REQUIRED FOR ALL PUBLIC FACING USE OF THIS TOOLKIT
#   
#   SOME JAVASCRIPTS INCLUDED IN THIS PACKAGE MAY REQUIRE A SEPARATE         
#   LICENSE, PLEASE COMPLY WITH THEIR LICENSING AGREEMENTS                   
#
###HEADE###################################################################

namespace eval jq {
    namespace eval component {
	namespace eval expose {
	}
    }
}

include "/tk/lib/common/inc/jq.component.expose.css"
include "/tk/lib/common/inc/jq.component.expose.js"

######################################################
##### 
######################################################
m::proc -public jq::component::expose::init {
    -callback:required
    -spage:required
    {-show 1}
} {
    Documentation goes here...
} {
    Trace
    
    #DUMMY PLACEHOLDER FOR SLIDER

    javascript {
	put [subst {
	    jQuery(document).ready(function() {
		jqComponentExpose.init({callback:"$callback", page:"$spage", show: $show});
	    });
	}]
    }
}

######################################################
##### 
######################################################
m::proc -public jq::component::expose::show {
} {
    Documentation goes here...
} {
    Trace
    
    tk::prettify

    division id="comp-display" {
	uplevel $::comp
    }

    division [style padding 50px width 995px margin "0 auto"] {
	division class="clearfix" {
	    division class="pull-left" {
		set e1 "<i class='fa fa-smile-o'></i> <span style=color:brown;font-size:12px>View interactions in your browser console</span>"
		p "<b>COMPONENT API</b>: $e1"
	    }
	    division class="pull-right" {
		division class="edit-btn" {
		    put [url "Edit" "#" class="btn btn-warning btn-xs" onclick="jqComponentExpose.toggle()" [style width 60px]]
		}
		division class="cancel-btn" [style display none] {
		    put [url "Cancel" "#" class="btn btn-danger btn-xs" onclick="jqComponentExpose.toggle()" [style width 60px]]
		}
	    }
	}
	division id="actual" {
	    p "<pre>[info body $::comp]</pre>"
	}
	division id="edit" [style display none] {
	    textarea ta=[info body $::comp] [style width 100% height 400px background seashell border "1px #ebebeb solid"] id="edit-text"

	    division [style padding-top 10px] {
		button "Show Me" class="btn btn-primary btn-sm" [style width 80px] onclick="jqComponentExpose.showme()"
		space 20 0
		button "Reset" class="btn btn-default btn-sm" [style width 80px] onclick="document.location.reload()"
	    }
	}
    }
}

######################################################
##### 
######################################################
m::proc -public jq::component::expose::showme {
} {
    Documentation goes here...
} {
    eval $::txt
}

######################################################
##### 
######################################################
m::proc -public jq::component::expose::test {
} {
    Documentation goes here...
} {
    jq::component::expose::init -callback "tk::dummy::3"
}

