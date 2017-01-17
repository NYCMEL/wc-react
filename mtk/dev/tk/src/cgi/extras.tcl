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

# proc cgi_style {args} {
#     cgi_put "<style>[lstring $args]</style>"
# }

# proc style {args} {
#     cgi_put "<style>[lstring $args]</style>"
# }

proc acronym {helpstr value} {
    return "<acronym title=\"$helpstr\">$value</acronym>" 
}

proc cgi_iframe {args} {
    cgi_put "<iframe $args></iframe>"
}

proc iframe {args} {
    cgi_put "<iframe $args></iframe>"
}

proc ajax {args} {
    cgi_put "<ajax>"
    uplevel eval $args
    cgi_put "</ajax>"
}

proc optgroup {label args} {
    cgi_put "<optgroup label=\"$label\">"
    uplevel eval $args
    cgi_put "</OPTGROUP>"
}

proc label {args} {
    cgi_put "<label"
    _cgi_close_proc_push "cgi_put </label>"
    
    if {[llength $args]} {
	cgi_put "[_cgi_lrange $args 0 [expr [llength $args]-2]]"
    }
    cgi_put ">"
    uplevel 1 cgi_put [list [lindex $args end]]
    _cgi_close_proc
}

proc cgi_table_foot {args} {
    cgi_put "<tfoot"
    _cgi_close_proc_push "cgi_put </tfoot>"

    if {[llength $args]} {
	cgi_put "[_cgi_lrange $args 0 [expr [llength $args]-2]]"
    }
    cgi_put ">"
    uplevel 1 [lindex $args end]
    _cgi_close_proc
}

##################################################
#### 
##################################################
proc tk-span {args} {
    cgi_put "<span"
    _cgi_close_proc_push "cgi_put </span>"
    
    if {[llength $args]} {
	cgi_put "[_cgi_lrange $args 0 [expr [llength $args]-2]]"
    }
    cgi_put ">"
    uplevel 1 [lindex $args end]
    _cgi_close_proc
}

##################################################
#### 
##################################################
proc tk-li {args} {
    cgi_put "<li"
    _cgi_close_proc_push "cgi_put </li>"
    
    if {[llength $args]} {
	cgi_put "[_cgi_lrange $args 0 [expr [llength $args]-2]]"
    }
    cgi_put ">"
    uplevel 1 [lindex $args end]
    _cgi_close_proc
}

##################################################
#### 
##################################################
proc fieldset {args} {
    cgi_put "<fieldset"
    _cgi_close_proc_push "cgi_put </fieldset>"

    if {[llength $args]} {
	cgi_put "[_cgi_lrange $args 0 [expr {[llength $args]-2}]]"
    }
    cgi_put ">"
    uplevel 1 [lindex $args end]
    _cgi_close_proc
}

##################################################
#### 
##################################################
proc table_th {args} {
    cgi_put "<th"
    _cgi_close_proc_push "cgi_put </th>"

    if {[llength $args]} {
	cgi_put "[_cgi_lrange $args 0 [expr [llength $args]-2]]"
    }
    cgi_put ">"
    uplevel 1 [lindex $args end]
    _cgi_close_proc
}

##################################################
#### 
##################################################
proc legend {args} {
    cgi_put "<legend $args>[lstring $args]</legend>"
}

######################################################
##### 
######################################################
proc href {args} {
    Trace

    set rval "$::env(SCRIPT_NAME)?"

    foreach {i j} $args {
	append rval [cgi_set $i $j]&
    }
    
    return [string replace $rval end end]
}

######################################################
##### 
######################################################
proc URL {args} {
    Trace

    set rval "$::env(SCRIPT_NAME)?"

    foreach {i j} $args {
	append rval [cgi_set $i $j]&
    }
    
    return "http://$::env(HTTP_HOST)[string replace $rval end end]"
}

##################################################
#### 
##################################################
proc component {args} {
    cgi_put "<component"
    _cgi_close_proc_push "cgi_put </component>"
    
    if {[llength $args]} {
	cgi_put "[_cgi_lrange $args 0 [expr [llength $args]-2]]"
    }
    cgi_put ">"
    uplevel 1 [lindex $args end]
    _cgi_close_proc
}

##################################################
#### 
##################################################
proc style {args} {
    set tmp "style=\""
    
    foreach {i j} $args {
	append tmp ${i}:${j}\;
    }
    
    return "$tmp\""
}

######################################################
##### 
######################################################
proc tag {args} {
    set t [lindex $args 0]

    cgi_put "<$t"
    _cgi_close_proc_push "cgi_put </$t>"

    if {[llength $args]} {
	cgi_put "[_cgi_lrange $args 1 [expr {[llength $args]-2}]]"
    }
    cgi_put ">"
    uplevel 1 [lindex $args end]
    _cgi_close_proc
}

######################################################
##### 
######################################################
proc section {args} {
    cgi_put "<section"
    _cgi_close_proc_push "cgi_put </section>"

    if {[llength $args]} {
	cgi_put "[_cgi_lrange $args 0 [expr {[llength $args]-2}]]"
    }
    cgi_put ">"
    uplevel 1 [lindex $args end]
    _cgi_close_proc
}

proc button {value args} {
    cgi_put "<button"
    foreach a $args {
	if {[regexp "^onClick=(.*)" $a dummy str]} {
	    cgi_put " onClick=\"$str\""
	} else {
	    cgi_put " $a"
	}
    }
    cgi_put ">$value</button>"
}
