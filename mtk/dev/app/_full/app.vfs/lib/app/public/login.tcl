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
    namespace eval login {}
}

######################################################
##### 
######################################################
m::proc -public public::login::id {
} {
    Documentation goes here...
} {
    Trace
    
    return "1000"
}

######################################################
##### 
######################################################
m::proc -public public::login::narative {
} {
    Documentation goes here...
} {
    Trace

    put "this is a login page"
}

######################################################
##### 
######################################################
m::proc -public public::login::title {
} {
    Documentation goes here...
} {
    Trace
    
    return "Login"
}

######################################################
##### 
######################################################
m::proc -public public::login::template {
} {
    Documentation goes here...
} {
    Trace

    return "template::1"
}

######################################################
##### 
######################################################
m::proc -public public::login::init {
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
m::proc -public public::login::guts {
} {
    Documentation goes here...
} {    
    Trace
    variable _id [id]
    
    br
    mtk::component::login::test
}
