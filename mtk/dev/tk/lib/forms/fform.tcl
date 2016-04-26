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

namespace eval fform {}

######################################################
##### 
######################################################
m::proc -public fform {
    -id:required
    -guts:required
} {
    Documentation goes here...
} {
    Trace
    
    put "<form class='form-horizontal' id='$id' role='form'>"

    uplevel $guts

    put "</form>"
}

######################################################
##### 
######################################################
m::proc -public fform:test {
} {
    Documentation goes here...
} {
    Trace
    
    fform -id "myform" -guts {
    }
}
