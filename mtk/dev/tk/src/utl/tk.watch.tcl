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

######################################################
##### STORE ARRAY IN COOKIES
######################################################
m::proc -public tk::watch:var {
    -variable:required
} {
    Documentation goes here...
} {    
    Trace
    
    catch {
	foreach i [split [unquote_input $::env(HTTP_COOKIE)] ";"] {
	    set x [split "$i" "="]
	    set ::[string trim [lindex $x 0]] [list [lindex $x 1]]
	    #p "set ::[lindex $x 0] [list [lindex $x 1]]"
	}
    }

    trace var ::$variable wu tk::watch
}

######################################################
##### REMOVE AN ARRAY FROM COOKIES
######################################################
m::proc -public tk::watch:rm {
    -variable:required
} {
    Documentation goes here...
} {    
    Trace
    
    foreach i [array names ::$variable] {
	unset ::${variable}($i)
    }
}

######################################################
##### 
######################################################
m::proc -public tk::watch:test {
} {
    Documentation goes here...
} {    
    Trace
    
    tk::watch:var -variable junk

    set c [clock seconds]

    set ::junk(a) [incr c]
    set ::junk(b) [incr c]
    set ::junk(c) [incr c]

    parray ::junk
}

