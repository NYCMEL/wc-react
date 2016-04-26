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

namespace eval ftest {}

######################################################
##### 
######################################################
m::proc -public ftest::init {
} {
    Documentation goes here...
} {
    Trace
    
    set f [file:read /Melify/mtk/dev/app/_git/app.vfs/data/form.json]
    set q [json::json2dict $f]
    set q [string range $q 1 end-1]
    # p $q
    # hr
    # p $g
    
    br
    fform -id "[dict get $q name]" -direction "[dict get $q direction]" -guts {
	foreach rows [dict get $q guts] {
	    foreach row $rows {
		p "<PRE>$row</PRE>"

		switch [dict get $row type] {
		    "text" {
			ftext\
			    -name "[dict get $row id]" \
			    -placeholder "[dict get $row placeholder]" \
			    -value "[dict get $row value]" \
			    -required "[dict get $row required]" \
			    -validate "[dict get $row validate]" \
			    -labelwidth "[dict get $row labelwidth]" \
			    -textwidth "[dict get $row textwidth]" \
			    -required "[dict get $row required]" \
			    -label "[dict get $row label]"
		    }
		}
	    }
	}
    }
}
