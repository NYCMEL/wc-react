###HEADS###################################################################
#
#  Melify Internet Toolkit (MTK) - Copyright (C) 2015  Melify LLC.
#  
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Private License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Private License for more details.
#  
#  You should have received a copy of the GNU General Private License
#  along with this program.  If not, see http://www.gnu.org/licenses.
#
###HEADE###################################################################

namespace eval private {
    namespace eval home {}
}

######################################################
##### 
######################################################
m::proc -private private::home::id {
} {
    Documentation goes here...
} {
    Trace
    
    return "home"
}

######################################################
##### 
######################################################
m::proc -private private::home::narrative {
} {
    Documentation goes here...
} {
    Trace

    put "this is our home page"
}

######################################################
##### 
######################################################
m::proc -private private::home::title {
} {
    Documentation goes here...
} {
    Trace
    
    return "Private Home"
}

######################################################
##### 
######################################################
m::proc -private private::home::template {
} {
    Documentation goes here...
} {
    Trace

    return "template::1"
}

######################################################
##### 
######################################################
m::proc -private private::home::init {
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
m::proc -private private::home::guts {
} {
    Documentation goes here...
} {    
    Trace
    variable _id [id]
    
    h1 "[namespace current] <small>subtext goes here...</small>"
    hr

    tk::dummy::2
}
