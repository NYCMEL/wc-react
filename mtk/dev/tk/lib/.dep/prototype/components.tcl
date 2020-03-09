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
	    variable roles
	    variable pages
	}
    }
}

include "/tk/lib/prototype/inc/prototype.js"

if {[info exist upage] == 0} {
    set upage ""
}

if {[info exist urole] == 0} {
    set urole ""
}

######################################################
##### 
######################################################
m::proc -public tk::prototype::components::id {
} {
    Documentation goes here...
} {
    Trace
    
    return "1000"
}

######################################################
##### 
######################################################
m::proc -public tk::prototype::components::narative {
} {
    Documentation goes here...
} {
    Trace

    put "this is a components page"
}

######################################################
##### 
######################################################
m::proc -public tk::prototype::components::title {
} {
    Documentation goes here...
} {
    Trace
    
    return "Componentsing"
}

######################################################
##### 
######################################################
m::proc -public tk::prototype::components::template {
} {
    Documentation goes here...
} {
    Trace

    return "Template::0"
}

######################################################
##### 
######################################################
m::proc -public tk::prototype::components::init {
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
m::proc -public tk::prototype::components::guts {
} {
    Documentation goes here...
} {    
    Trace
    variable roles
    variable pages

    set dir $::starkit::topdir/data/prototype

    set roles ""
    foreach i [tk::prototype::util::get:roles] {
	lappend roles $i [file rootname [file tail $i]]
    }

    set components ""
    foreach i [tk::prototype::util::get:components] {
	lappend components [file tail $i]
    }

    tk::prototype::components::controls
}

######################################################
##### 
######################################################
m::proc -public tk::prototype::components::controls {
} {
    Documentation goes here...
} {    
    Trace

    set t1 ""
    lappend t1 "" ""
    foreach i [tk::prototype::util::get:roles] {
	lappend t1 "$i" "[file tail $i]"
    }

    lappend t2 "" ""
    foreach i [tk::prototype::util::get:pages] {
	lappend t2 "$i" "[file tail $i]"
    }

    division [style border-bottom "1px #cecece solid" padding 10px padding-left 25px background #f7f7f7 max-height 70px] {
	division [style padding-bottom 10px] {
	    tb::fform -name "prototype-control" -id "control-form" -callback "tb::ftest:cb" -class "form-vertical" -guts {
		division class="pull-left" [style margin-right 30px] {
		    tb::fselect -name "v(role)" -id "role" -label "<b>Select a Role:</b>" -selected $::urole -options $t1
		}

		division class="pull-left" [style padding-right 30px ] {
		    tb::fselect -name "v(page)" -id "page" -label "<b>Select a Page:</b>" -selected $::upage -options $t2
		}
	    }
	}
    }

    division id="prototype-content" [style padding-top 20px] {
	tk::prototype::components::show::init
    }
}

######################################################
##### 
######################################################
m::proc -public tk::prototype::components::save {
} {
    Documentation goes here...
} {    
    Trace

    if {[catch {
	set file $::apage/[file tail $::player]
	
	array set tmp [file:read $file]
	
	# CHANGE THE NAME
	set tmp($::part) "$::code"
	
	# WRITE TO NEW FILE
	file:write $file [array get tmp]
    } e] != 0} {
	h3 class="error"
    }

    h4 class="alert alert-success" "<i class=icon-ok-sign></i> Your changes saved successfully"
}
