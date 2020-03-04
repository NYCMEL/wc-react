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

namespace eval mdb {}

##############################################################
##### class:
#####   default primary secondary success info warning danger
#####   unique  pink  purple  deep-purple  indigo  cyan  light-green
#####   lime yellow  amber  orange  deep-orange  brown  blue-grey  mdb  dark-green
##############################################################
m::proc -public mdb::button {
    {-label        ""}
    {-icon         ""}
    {-badge        ""}
    {-class "default"}
    {-rounded       0}
    {-floating      0}
    {-outline       0}
    {-size       "md"}
    {-submit        0}
} {
    Documentation goes here...
} {
    Trace
    
    set fa [expr {($icon      == "") ? "" :         "<i class='fa fa-$icon'></i>"}]
    set b  [expr {($badge     == "") ? "" : "<span class='counter'>$badge</span>"}]
    set r  [expr {($rounded   ==  0) ? "" :                        " btn-rounded"}]
    set fl [expr {($floating  ==  0) ? "" :                       " btn-floating"}]
    set ol [expr {($outline   ==  0) ? "" :                            "outline-"}]
    set sz [expr {($size      == "") ? "" :                           "btn-$size"}]
    
    if {$submit == "1"} {
	set extra {onclick="$(this).closest('form').submit()"}
    } else {
	set extra ""
    }

    if {$floating} {
	put "<a type='button' class='btn $r $fl btn-$ol$class waves-effect' $extra>$fa $label</a>$b"
    } else {
	put "<a type='button' class='btn $sz $r $fl btn-$ol$class waves-effect' $extra>$fa $label</a>$b"
    }
}

##############################################################
#####
##############################################################
m::proc -public mdb::button:test {
} {
    Documentation goes here...
} {
    Trace

    foreach i {sm md lg} {
	division {
	    mdb::button -size $i -label "Hello Mel" -class "lime"
	    mdb::button -size $i -label "Hello Mel" -class "warning" -outline 1
	    mdb::button -size $i -label "Hello Mel" -class "cyan"    -icon "home"
	    mdb::button -size $i -label "Hello Mel" -class "unique"  -icon "home" -badge 3
	    mdb::button -size $i -label "Hello Mel" -class "brown"   -icon "home" -badge 3 -rounded 1
	    mdb::button -class "default" -icon "home" -floating 1
	}
    }
}

##############################################################
#####
##############################################################
m::proc -public mdb::card {
    -id:required
    -top:required
    -bot:required
    {-height 100%}
    {-animation ""}
    {-delay 0}
} {
    Documentation goes here...
} {
    Trace

    division class="card wow $animation" id="$id" [style min-height $height] data-wow-delay="${delay}s" {
	division class="view overlay hm-white-slight" {
	    uplevel $top
	    
	    put {
		<a href="#!">
		<div class="mask waves-effect waves-light"></div>
		</a>
	    }
	}

	division class="card-block text-xs-center" {
	    uplevel $bot
	}
    }
}

##############################################################
#####
##############################################################
m::proc -public mdb::button:card:test {
} {
    Documentation goes here...
} {
    Trace

    division class="container" {
	division class="row" {
	    division class="col-md-4" {
		mdb::card -id "my-card-0" -top {
		    division [style padding 10px background #1C2331] {
			put [img "/tk/img/common/sandbox.png"]
		    }
		} -bot {
		    h4 [strong "Mel Heravi"]
		    p [lorem 10] 
		} -height 350px -animation "slideInLeft"
	    }

	    division class="col-md-4" {
		mdb::card -id "my-card-1" -top {
		    division [style padding 10px background #1C2331] {
			put [img "/tk/img/common/sandbox.png"]
		    }
		} -bot {
		    h4 [strong "Mel Heravi"]
		    p [lorem 10] 
		} -height 350px -animation "pulse" -delay "1.0"
	    }
	    
	    division class="col-md-4" {
		mdb::card -id "my-card-2" -top {
		    division [style padding 10px background #1C2331] {
			put [img "/tk/img/common/sandbox.png"]
		    }
		} -bot {
		    h4 [strong "Mel Heravi"]
		    p [lorem 10] 
		} -height 350px -animation "slideInRight"
	    }
	}
    }
}
