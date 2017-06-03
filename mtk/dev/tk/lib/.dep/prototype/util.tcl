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
	namespace eval util {}
    }
}

######################################################
##### 
######################################################
m::proc -public tk::prototype::util::header {
} {
    Documentation goes here...
} {
    Trace
    
    division [style background green padding 5px] class="clearfix" {
	division class="pull-left" {
	    put [img /images/logo.gif]
	}
	division class="pull-right" [style color #FFF] {
	    put "Mel: 646.303.1234"
	}
    }
    
}

######################################################
##### 
######################################################
m::proc -public tk::prototype::util::get:roles {
} {
    Documentation goes here...
} {
    Trace
    
    file mkdir $::starkit::topdir/data/prototype/roles

    set roles [glob -nocomplain $::starkit::topdir/data/prototype/roles/* -type d]

    tk::bugger {
	put $roles
    }

    return $roles
}

######################################################
##### 
######################################################
m::proc -public tk::prototype::util::get:pages {
} {
    Documentation goes here...
} {
    Trace
    
    file mkdir $::starkit::topdir/data/prototype/pages

    set pages [glob $::starkit::topdir/data/prototype/pages/* -type d]

    tk::bugger {
	put $pages
    }

    return $pages
}

######################################################
##### 
######################################################
m::proc -public tk::prototype::util::get:components {
} {
    Documentation goes here...
} {
    Trace
    
    set components [glob -nocomplain $::starkit::topdir/data/prototype/components/* -type d]

    tk::bugger {
	put $components
    }

    return $components
}

######################################################
##### 
######################################################
m::proc -public tk::prototype::util::get:page:parts {
    -page:required
} {
    Documentation goes here...
} {
    Trace
    
    set parts [glob -nocomplain $::starkit::topdir/data/prototype/components/$page/*]

    tk::bugger {
	put $parts
    }

    return $parts
}

######################################################
##### 
######################################################
m::proc -public tk::prototype::util::get:pages {
} {
    Documentation goes here...
} {
    Trace
    
    set pages [glob -nocomplain $::starkit::topdir/data/prototype/pages/* -type d]

    tk::bugger {
	put $pages
    }

    return $pages
}

######################################################
##### 
######################################################
m::proc -public tk::prototype::util::error {
    args
} {
    Documentation goes here...
} {
    Trace
    
    h3 class="error" "<i class=icon-minus-sign></i> [lstring $args]"
}
