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
    namespace eval session {
	variable root $::starkit::topdir/data/sessions; file mkdir $root
    }
}

include "/tk/inc/tk.session.js"

##############################################
##### 
##############################################
proc tk::session::save {} {
    Trace
    variable root 
    upvar #0 $::APP sid

    if {$sid != ""} {
	tk::array::save $root/$sid ::tk

	tk::bugger {
	    parray ::tk
	}
    }
}

##############################################
##### 
##############################################
proc tk::session::restore {} {
    Trace
    variable root 
    upvar #0 $::APP sid

    set c [math::random 1000000000 [clock seconds]]

    if {$sid == ""} {
	javascript {
	    put [subst {
		tkSession.init({id:"$::APP", seed:"$c.$::env(REMOTE_ADDR)"});
	    }]
	}
    }

    if {[file exist $root/$sid] == 1} {
	catch {
	    uplevel #0 source $root/$sid

	    tk::bugger {
	    	h3 "TK BEFORE..."
	    	parray ::tk
	    }
	}
    }
}

###################################################################
#### 
###################################################################
m::proc -public tk::session::cleanup {
} {
    DOCUMENTATION GOES HERE...
} {
    Trace
    variable root 
    
    set td [clock format [clock seconds] -format "%d"]

    #GET RID OF ALL SESSIONS PRIOR TO TODAYS DATE
    foreach i [glob -nocomplain $root/*] {
	set fd [clock format [file mtime $i] -format %d]

	if {$td != $fd} {
	    file delete -force $i
	    #puts "deleted $i";br
	}
    }
}

###################################################################
#### 
###################################################################
m::proc -public tk::session::restricted {
} {
    DOCUMENTATION GOES HERE...
} {
    Trace

    if {[info exist ::tk(user)] == 0} {
	put "<script>document.location.href='[URL]'</script>"
    }
}

# CLEAN ALL OLD SESSSIONS
tk::session::cleanup
