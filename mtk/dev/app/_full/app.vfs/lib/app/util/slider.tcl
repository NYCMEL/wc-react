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

include "/inc/util/slider.css"

######################################################
##### 
######################################################
m::proc -public slider {
} {
    Documentation goes here...
} {    
    Trace

    division class="slider" {
	division [style padding 5px] {
	    division [style margin-bottom 5px padding-bottom 5px] {
		${::spage}::narative
	    }
	}

	catch {
	    division [style padding 10px] {
		${::spage}::slider
	    }
	}

	slider:controls

	# javascript {
	#     put {
	# 	app.disableLinks();
	#     }
	# }
    }
}

######################################################
##### 
######################################################
m::proc -public slider:controls {
} {
    Documentation goes here...
} {    
    Trace

    set ctrls [subst {
	code	"<i class='fa fa-code-fork'></i> Show Page Code" "[URL callback tk::code pg $::spage]" "_blank"
	reload	"<i class='fa fa-refresh'></i> Reload Page" "[URL]" ""
    }]

    bullet_list class="list-group" [style margin 10px] {
	foreach {i j k t} $ctrls {
	    put [url "$j" "$k" target=$t id="$i" class="list-group-item"]
	}
    }
}
