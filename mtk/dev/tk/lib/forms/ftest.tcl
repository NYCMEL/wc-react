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
    set q [json::json2dict $f]
    set q [string range $q 1 end-1]
    p $q
    hr
    
    fform -id "my-form" -guts {
	foreach i $q {
	    foreach {m n} $i {
		division class="form-group" {
		    switch $m {
			"label" {
			    division class="[dict get $n width]" {
				label for="[dict get $n for]" "[dict get $n text]"
			    }
			}
			"text" {
			    division class="[dict get $n width]" {
				text [dict get $n id]=[dict get $n value] \
				    type="[dict get $n type]" \
				    class="form-control" \
				    expression="[dict get $n expression]" \
				    placeholder="[dict get $n placeholder]" \
				    ng-bind="[dict get $n bind]" \
				    "[dict get $n required]"
			    }
			}
		    }
		}
	    }
	}
    }
}
