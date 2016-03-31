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

namespace eval public {
    namespace eval home {}
}

######################################################
##### 
######################################################
m::proc -public public::home::id {
} {
    Documentation goes here...
} {
    Trace
    
    return "home"
}

######################################################
##### 
######################################################
m::proc -public public::home::narrative {
} {
    Documentation goes here...
} {
    Trace

    put "this is our home page"
}

######################################################
##### 
######################################################
m::proc -public public::home::title {
} {
    Documentation goes here...
} {
    Trace
    
    return "Public Home"
}

######################################################
##### 
######################################################
m::proc -public public::home::template {
} {
    Documentation goes here...
} {
    Trace

    return "template::1"
}

######################################################
##### 
######################################################
m::proc -public public::home::init {
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
m::proc -public public::home::guts {
} {
    Documentation goes here...
} {    
    Trace
    variable _id [id]
    
    h1 "[namespace current] <small>{{msg}}</small>"
    hr
    
    division class="container$::fluid" {
	division class="row$::fluid" {
	    division class="col-md-3 visible-lg visible-md" {
		h1 LHS
		p [lorem 50]
	    }
	    division class="{{display}} col-md-6 show-large" {
		h1 MID
		p [lorem 150]
	    }
	    division class="col-md-3 visible-lg visible-md" {
		h1 RHS
		p [lorem 50]
	    }
	}
    }
}
