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

namespace eval tcl {
    namespace eval dict {}
}

######################################################
##### 
######################################################
proc tcl::dict::init {} {
    #ADD IT TO DICTIONARY
    namespace ensemble configure dict -map [dict replace [namespace ensemble configure dict -map] getnull ::tcl::dict::getnull]
    namespace ensemble configure dict -map [dict replace [namespace ensemble configure dict -map] save       ::tcl::dict::save]
    namespace ensemble configure dict -map [dict replace [namespace ensemble configure dict -map] restore ::tcl::dict::restore]
}

######################################################
##### 
######################################################
proc tcl::dict::save {dict fname} {
    file:write $fname $dict
}

######################################################
##### 
######################################################
proc tcl::dict::restore {fname} {
    return "[file:read $fname]"
}

####################################################################
##### http://wiki.tcl.tk/19948
####################################################################
proc ::tcl::dict::getnull {dictionary args} {
    if {[exists $dictionary {*}$args]} {
        get $dictionary {*}$args
    }
}

####################################################################
#### PRETTY PRINT A DICT SIMILAR TO PARRAY
####
#### WHERE:
####   d - dict to be printed
####   i - indent level
####   p - prefix string for one level of indent
####   s - seperator string between key and value
####
####  USAGE:
####     preformatted {
####         put [pdict $db]
####     }
####################################################################
proc ::pdict { d {i 0} {p "  "} {s " -> "} } {
    if { [catch {dict keys ${d}}] } {
	error "error: pdict - argument is not a dict"
    }
    set result ""
    set prefix [string repeat ${p} ${i}]
    set max 0

    foreach key [dict keys ${d}] {
	if { [string length ${key}] > ${max} } {
	    set max [string length ${key}]
	}
    }

    dict for {key val} ${d} {
	append result "${prefix}[format "%-${max}s" ${key}]${s}"

	if { [catch {dict keys ${val}}] } {
	    append result "'${val}'\n"
	} else {
	    append result "\n"
	    append result "[pdict ${val} [expr ${i}+1] ${p} ${s}]\n"
	}
    }

    return ${result}
}
