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
    -id:required
    {-file "/Melify/mtk/dev/app/_git/app.vfs/data/form.2.json"}
} {
    Documentation goes here...
} {
    Trace
    
    put {
	<style>
	label {
	    margin-top:5px;
	}
	</style>
    }

    set f [file:read $file]
    set d [json::json2dict $f]
    set d [string range $d 1 end-1]
    #p >>$d<<
    
    foreach k $d {
	division class="form-group clearfix" {
	    foreach j $k {
		set width [dict exist $j width]

		if {$width == 1} {
		    put "<div class=[dict get $j width]>"
		}

		foreach {m n} $j {
		    switch $m {
			"custom" {
			    division class="col-md-12" {
				uplevel $n
			    }
			}
			"html" {
			    division class="col-md-12" {
				put [subst $n]
			    }
			}
			"label" {
			    if {$width == 0} {
				label id="[dict get $n id]" class="[dict get $n width]" for="[dict get $n for]" "[dict get $n text]"
			    } else {
				label id="[dict get $n id]" "[dict get $n text]"
			    }
			}
			"text" {
			    if {[dict exist $n maxlength] == 1} {
				set maxlength "maxlength=[dict get $n maxlength]"
			    } else {
				set maxlength ""
			    }

			    if {$width == 0} {
				put "<div class=[dict get $n width]>"
			    }
			    
			    text [dict get $n id]=[dict get $n value] \
				type="[dict get $n type]" \
				$maxlength\
				class="form-control" \
				pattern="[dict get $n pattern]" \
				placeholder="[dict get $n placeholder]" \
				ng-model="[dict get $n bind]" \
				"[dict get $n required]"

			    if {$width == 0} {
				put "</div>"
			    }
			}
			"textarea" {
			    if {$width == 0} {
				put "<div class=[dict get $n width]>"
			    }
			    
			    textarea [dict get $n id]=[dict get $n value] \
				type="[dict get $n type]" \
				class="form-control" \
				rows="[dict get $n rows]" \
				pattern="[dict get $n pattern]" \
				placeholder="[dict get $n placeholder]" \
				ng-model="[dict get $n bind]" \
				"[dict get $n required]"

			    if {$width == 0} {
				put "</div>"
			    }
			}
			"select" {
			    if {$width == 0} {
				put "<div class=[dict get $n width]>"
			    }

			    if {[dict get $n size] > 1} {
				set size "size=[dict get $n size]"
			    } else {
				set size ""
			    }

			    select [dict get $n id] $size class="form-control" ng-model="[dict get $n bind]" {
				foreach {i j} [dict get $n options] {
				    if {[dict get $n selected] == $i} {
					set state "selected"
				    } else {
					set state ""
				    }

				    option $j value=$i $state
				}
			    }
			    if {$width == 0} {
				put "</div>"
			    }
			}
			"checkboxes" {
			    if {$width == 0} {
				put "<div class=[dict get $n width]>"
			    }
			    
			    foreach p [dict get $n "checkbox"] {
				if {$width == 0} {
				    put "<div class=[dict get $p width]>"
				}
				
				checkbox [dict get $p id] [dict get $p "checked"] ng-model="[dict get $p bind]" id="[dict get $p id]"

				set lbl [dict get $p caption]
				
				label id="[dict get $lbl id]" for="[dict get $lbl for]" class="label-control" "&nbsp;[dict get $lbl text]" 

				if {$width == 0} {
				    put "</div>"
				}
			    }

			    if {$width == 0} {
				put "</div>"
			    }
			}
			"radioboxes" {
			    if {$width == 0} {
				put "<div class=[dict get $n width]>"
			    }
			    
			    foreach p [dict get $n "radiobox"] {
				if {$width == 0} {
				    put "<div class=[dict get $p width]>"
				}
				
				radio_button [dict get $p "id"]=[dict get $p "value"] id=[dict get $p "id"] [dict get $p "checked"] ng-model="[dict get $n bind]"

				set lbl [dict get $p caption]
				
				label id="[dict get $lbl id]" for="[dict get $lbl for]" class="label-control" "&nbsp;[dict get $lbl text]" 

				if {$width == 0} {
				    put "</div>"
				}
			    }

			    if {$width == 0} {
				put "</div>"
			    }
			}
		    }
		}

		if {$width == 1} {
		    put "</div>"
		}
	    }
	}
    }
}
