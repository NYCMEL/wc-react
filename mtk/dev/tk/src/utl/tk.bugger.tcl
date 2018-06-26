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

namespace eval tk {}

if {$::ajax == 0} {
    include "/tk/inc/tk.bugger.css"
}

##################################################
##### 
##################################################
proc tk::bugger {args} {
    division class="clearfix tk-bugger" {
	uplevel eval $args
    }
}

if {$::env(SERVER_ADDR) != "127.0.0.1"} {
    ##################################################
    ##### 
    ##################################################
    proc tk::bugger {args} {
	#DUMMY PROC
    }
}
