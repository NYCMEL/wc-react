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


package provide RedOlive 1.0

set traceFD stdout
######################################################
##### 
######################################################
namespace eval tk {
    proc _trace_end {args} {
	global tp
	
	set x {}
	for {set i 2} {$i<$tp([lindex $args 1])} {incr i} {
	    append x "  "
	}

	puts $::traceFD "$x\}"
	flush $::traceFD
    }

    #################################################
    ##### 
    #################################################
    proc TraceOff {} {
	uplevel \#0 {
	    proc Trace {args} {}
	}
    }

    #################################################
    ##### 
    #################################################
    proc TraceOn {args} {
	set fn "/tmp/MTK.trace.$::APP"
	set ::traceFD [open $fn w]
	
	uplevel \#0 {
	    #########################################
	    ##### 
	    #########################################
	    proc Trace {args} {
		global tp
		
		set x {}
		for {set i 2} {$i<[info level]} {incr i} {
		    append x "  "
		}
		
		if {[catch {set level [info level -1]} e] != 0} {
		    set level 0
		}

		if {$args == {}} {#EITHER ENTER OR LEAVE
		    set obj {}
		    set ::errorInfo {}

		    puts $::traceFD "$x$obj[lindex $level 0]\{[lrange $level 1 end]\}"
		    flush $::traceFD
		    
		    #FOR CLOSED BRACE
		    set tp($obj[lindex $level 0]) [info level]
		    uplevel trace variable tp($obj[lindex $level 0]) u tk::_trace_end
		} else {
		    puts $::traceFD "$x  [lstring $args]"
		    flush $::traceFD
		}
	    }
	}
    }

    #################################################
    ##### 
    #################################################
    proc trace:example {} {
	p class=tk-normal {
	    <b>Trace is used to for debugging purposes.</b>

	    <pre>
	    proc mycalculator {args} {
		Trace

		Trace this is a test...
	    }
	    </pre>
	}
    }
}









