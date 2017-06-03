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

namespace eval tk {
    namespace eval prototype {
	namespace eval components {
	    namespace eval show {}
	}
    }
}

division id="dummy" {
    # FOR AJAX PURPOSES
}

######################################################
##### 
######################################################
m::proc -public tk::prototype::components::show::id {
} {
    Documentation goes here...
} {
    Trace
    
    return "1000"
}

######################################################
##### 
######################################################
m::proc -public tk::prototype::components::show::narative {
} {
    Documentation goes here...
} {
    Trace

    put "this is a components page"
}

######################################################
##### 
######################################################
m::proc -public tk::prototype::components::show::title {
} {
    Documentation goes here...
} {
    Trace
    
    return "Componentsing"
}

######################################################
##### 
######################################################
m::proc -public tk::prototype::components::show::template {
} {
    Documentation goes here...
} {
    Trace

    return "Template::0"
}

######################################################
##### 
######################################################
m::proc -public tk::prototype::components::show::init {
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
m::proc -public tk::prototype::components::show::guts {
} {
    Documentation goes here...
} {    
    Trace

    include "/tk/lib/prototype/inc/show.css"
    include "/tk/lib/prototype/inc/show.js"

    if {[info exist ::urole] == 0} {
	h1 [clock seconds]

	return
    }

    if {($::urole == "") || ($::upage == "")} {
	return
    }

    set player [file tail $::urole]
    set file "[file dirname [file dirname $::urole]]/pages/[file tail $::upage]"

    javascript {
	put "jQuery.cookie('player','$file/$player')"
    }

    if {[file exist "$file/$player"] == 0} {
	if {[file exist "$file/default"] == 0} {
	    tk::prototype::util::error "&lt;[file tail $::upage]&gt; is not setup and has not &lt;default&gt; settings"
	    return
	}

	file copy "$file/default" "$file/$player"

	tk::bugger {
	    p "CREATED: $file/$player"
	}
    }

    array set parts [file:read "$file/$player"]

    set p    ""
    set code ""

    foreach i [array names parts] {
	lappend p [file tail "$i"]
    }

    division class="container-fluid" id="show" {
	division class="row-fluid" {
	    division class="span3" {
		division class="banner" {
		    h3 [file tail "$::upage"]
		}
		
		division class="well well-small" {
		    bullet_list class="nav nav-list" [style font-size 11px] {
			set cnt 0

			foreach i $p {
			    li [url "[incr cnt]: $i" "#" class="alink" part="$i"]
			}
		    }
		}
	    }
	    division class="span8" {
		division class="banner" {
		    h3 "Code <i class=icon-angle-right></i> <span></span>"
		}
		
		textarea code=$code id="code" class="code"

		division [style padding 10px] {
		    put [url "<i class=icon-eye-open></i> Show Me" "#" class="btn btn-info" id="showme"]
		    space 10 0
		    put [url "<i class=icon-refresh></i> Undo All" "#" class="btn btn-warning" id="refresh"]
		    space 10 0
		    put [url "<i class=icon-undo></i> Default" # class="btn btn-inverse" id="default"]
		    space 10 0
		    put [url "<i class=icon-save></i> Save" "#" class="btn btn-success" id="save"]
		}
	    }
	    division class="span5" {
		division class="banner" {
		    h3 "View <i class=icon-angle-right></i> <span></span>"
		}

		division id="preview" {
		}
	    }
	}
    }
}

######################################################
##### 
######################################################
m::proc -public tk::prototype::components::show::part {
} {
    Documentation goes here...
} {    
    Trace

    tk::bugger {
	h4 $::player
    }

    array set parts [file:read $::player]
    
    set tmp $parts($::part)

    regsub -all {\n} $tmp {\r} tmp
    regsub -all {'}  $tmp {\'} tmp
    
    javascript {
	put "jQuery('#code').val('$tmp')"
    }
}

######################################################
##### 
######################################################
m::proc -public tk::prototype::components::show::preview {
} {
    Documentation goes here...
} {    
    Trace

    if {[auto_load tk::part::$::part] == 0} {
	if {[catch {tk::part::unknown} e] != 0} {
	    p [style color brown] "[clock format [clock seconds] -format %T]<BR><b>NO VIEW AVAILABLE</b>"
	    p [style color #cecece font-size 10px] $e

	    javascript {
		put "jQuery('#preview').html(jQuery('#code').val())"
	    }
	}
    } else {
	if {[catch {
	    eval tk::part::$::part

	    javascript {
		put "jQuery('#save').show()"
	    }
	} e] != 0} {
	    h3 [style width 100% padding 10px] class="alert alert-error" "<i class='icon-minus-sign icon-large'></i> Houston, We have a Problem !"
	    p $e

	    javascript {
		put "jQuery('#save').hide()"
	    }
	}
    }
}

######################################################
##### 
######################################################
m::proc -public tk::prototype::components::default {
} {
    Documentation goes here...
} {    
    Trace

    array set tmp [file:read $::apage/default]

    regsub -all {\n} $tmp($::part) {\r} code

    javascript {
	put "jQuery('#code').val('$code')"
    }
}
