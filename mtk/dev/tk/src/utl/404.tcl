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

namespace eval 404 {}

######################################################
##### 
######################################################
m::proc -public 404::id {
} {
    Documentation goes here...
} {
    Trace
    
    return "404"
}

######################################################
##### 
######################################################
m::proc -public 404::narrative {
} {
    Documentation goes here...
} {
    Trace

    put "this is our 404 page"
}

######################################################
##### 
######################################################
m::proc -public 404::title {
} {
    Documentation goes here...
} {
    Trace
    
    return "404"
}

######################################################
##### 
######################################################
m::proc -public 404::template {
} {
    Documentation goes here...
} {
    Trace

    return "template::0"
}

######################################################
##### 
######################################################
m::proc -public 404::init {
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
m::proc -public 404::guts {
} {
    Documentation goes here...
} {    
    Trace
    variable _id [id]
    
    division {
	put [img /tk/img/common/404.png width=100%]

	division [style text-align center] {
	    put [url "Home Page" "[URL]" class="btn btn-default"]

	    division [style padding 25px] {
		p $::env(REQUEST_URI)
	    }
	}
    }
}

