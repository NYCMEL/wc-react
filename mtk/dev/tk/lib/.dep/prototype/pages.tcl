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
	namespace eval pages {}
    }
}

######################################################
##### 
######################################################
m::proc -public tk::prototype::pages::id {
} {
    Documentation goes here...
} {
    Trace
    
    return "1000"
}

######################################################
##### 
######################################################
m::proc -public tk::prototype::pages::narative {
} {
    Documentation goes here...
} {
    Trace

    put "this is a pages page"
}

######################################################
##### 
######################################################
m::proc -public tk::prototype::pages::title {
} {
    Documentation goes here...
} {
    Trace
    
    return "pages"
}

######################################################
##### 
######################################################
m::proc -public tk::prototype::pages::template {
} {
    Documentation goes here...
} {
    Trace

    return "Template::0"
}

######################################################
##### 
######################################################
m::proc -public tk::prototype::pages::init {
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
m::proc -public tk::prototype::pages::guts {
} {
    Documentation goes here...
} {    
    Trace

    set pages [tk::prototype::util::get:pages]

    if {$pages == ""} {
	division [style padding 50px text-align center] {
	    tk::prototype::util::error "No pages found"
	}
	return
    }
    
    division class="container-fluid" [style padding-top 20px] {
	number_list [style font-size 18px] {
	    set cnt 0

	    division class="row-fluid" {
		division class="span2" {
		    foreach i $pages {
			set t [file tail $i]
			set img "<img src=/images/prototypes/$t.png width=100%>"
			
			li [style padding 5px] [url $t "#" onclick="jQuery('#prototype-image').html('$img')"]
		    }
		}
		division class="span10" id="prototype-image" {
		    if {$cnt == 0} {
			h1 "<i class=icon-chevron-left></i> Please select...."
			incr cnt
		    }
		}
	    }
	}
    }
}
