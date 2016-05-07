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
    
    set f [file:read /Melify/mtk/dev/app/_git/app.vfs/data/form.2.json]
    set d [json::json2dict $f]
    set d [string range $d 1 end-1]
    p >>$d<<
    hr
    
    division [style background wheat] {
	fform -id "my-form" -guts {
	    foreach k $d {
		p ==$k==

		division class="form-group" {
		    foreach j $k {
			if {[dict exist $j class] == 1} {
			    put "<div class=[dict get $j class]>"
			}

			foreach {m n} $j {
			    switch $m {
				"label" {
				    if {[dict exist $m class] == 0} {
					label class="[dict get $n width]" for="[dict get $n for]" "[dict get $n text]"
				    } else {
					label "[dict get $n text]"
				    }
				}
				"text" {
				    if {[dict exist $m class] == 0} {
					put "<div class=[dict get $n width]>"
				    }
				    
				    text [dict get $n id]=[dict get $n value] \
					type="[dict get $n type]" \
					class="form-control" \
					expression="[dict get $n expression]" \
					placeholder="[dict get $n placeholder]" \
					ng-bind="[dict get $n bind]" \
					"[dict get $n required]"

				    if {[dict exist $m class] == 0} {
					put "</div>"
				    }
				}
			    }
			}

			if {[dict exist $m class] == 1} {
			    put "</div>"
			}
		    }
		}
	    }
	}
    }
}