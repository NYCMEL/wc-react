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
    namespace eval register {}
}

######################################################
##### 
######################################################
m::proc -public public::register::id {
} {
    Documentation goes here...
} {
    Trace
    
    return "register"
}

######################################################
##### 
######################################################
m::proc -public public::register::narative {
} {
    Documentation goes here...
} {
    Trace

    put "this is a register page"
}

######################################################
##### 
######################################################
m::proc -public public::register::title {
} {
    Documentation goes here...
} {
    Trace
    
    return "Register"
}

######################################################
##### 
######################################################
m::proc -public public::register::template {
} {
    Documentation goes here...
} {
    Trace

    return "template::1"
}

######################################################
##### 
######################################################
m::proc -public public::register::init {
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
m::proc -public public::register::guts {
} {
    Documentation goes here...
} {    
    Trace
    variable _id [id]
    
    br
    mtk::component::register::test
}
