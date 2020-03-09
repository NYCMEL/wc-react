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

namespace eval tk {
    namespace eval logout {}
}

include "/tk/inc/logout.js"

######################################################
##### 
######################################################
m::proc -public tk::logout::id {
} {
    Documentation goes here...
} {
    Trace
    
    return "1000"
}

######################################################
##### 
######################################################
m::proc -public tk::logout::narative {
} {
    Documentation goes here...
} {
    Trace

    put "this is a test page"
}

######################################################
##### 
######################################################
m::proc -public tk::logout::title {
} {
    Documentation goes here...
} {
    Trace
    
    return "Testing"
}

######################################################
##### 
######################################################
m::proc -public tk::logout::template {
} {
    Documentation goes here...
} {
    Trace

    return "Template::0"
}

######################################################
##### 
######################################################
m::proc -public tk::logout::init {
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
m::proc -public tk::logout::guts {
} {
    Documentation goes here...
} {    
    Trace

    tk::session::cleanup

    javascript {
	put [subst {
	    tkCleanCookies();
	    tkStorage.flush();
	    
	    document.location.href="[URL]";
	}]
    }
}
