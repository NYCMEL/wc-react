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
    namespace eval prototype {}
}

if {[info exist pid] == 0} {
    set pid "components"
}

#include "/tk/lib/prototype/inc/prototype.css"

######################################################
##### 
######################################################
m::proc -public tk::prototype::id {
} {
    Documentation goes here...
} {
    Trace
    
    return "1000"
}

######################################################
##### 
######################################################
m::proc -public tk::prototype::narative {
} {
    Documentation goes here...
} {
    Trace

    put "this is a prototype page"
}

######################################################
##### 
######################################################
m::proc -public tk::prototype::title {
} {
    Documentation goes here...
} {
    Trace
    
    return "prototype"
}

######################################################
##### 
######################################################
m::proc -public tk::prototype::template {
} {
    Documentation goes here...
} {
    Trace

    return "Template::0"
}

######################################################
##### 
######################################################
m::proc -public tk::prototype::init {
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
m::proc -public tk::prototype::guts {
} {
    Documentation goes here...
} {    
    Trace

    if {[info exist ::app] == 0} {
	set bar navbar.html
    } else {
	set bar navbar.roles.html
    }

    tb::component::navbar::init -id "navbar" -active "$::pid" -file "/Melify/mtk/dev/tk/lib/prototype/inc/$bar" -class "navbar-inverse"
    
    division [style padding-top 40px] {
	tk::prototype::${::pid}::init
    }

    put {
	<script>jQuery("body").css("max-width","10000px")</script>
    }
}
