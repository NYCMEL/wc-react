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

		foreach r $row {
		    switch [dict get $r type] {
			"text" {
			    ftext\
				-name "[dict get $r id]" \
				-placeholder "[dict get $r placeholder]" \
				-value "[dict get $r value]" \
				-required "[dict get $r required]" \
				-validate "[dict get $r validate]" \
				-labelwidth "[dict get $r labelwidth]" \
				-textwidth "[dict get $r textwidth]" \
				-required "[dict get $r required]" \
				-label "[dict get $r label]"
			}
		    }
		}
	    }
	}
    }
}
