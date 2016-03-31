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

namespace eval secret {}

set margin "100px"

######################################################
##### 
######################################################
m::proc -public secret::id {
} {
    Documentation goes here...
} {
    Trace
    
    return "1000"
}

######################################################
##### 
######################################################
m::proc -public secret::narative {
} {
    Documentation goes here...
} {
    Trace

    put "this is a secret page"
}

######################################################
##### 
######################################################
m::proc -public secret::title {
} {
    Documentation goes here...
} {
    Trace
    
    return "Welcome"
}

######################################################
##### 
######################################################
m::proc -public secret::template {
} {
    Documentation goes here...
} {
    Trace

    return "Template::0"
}

######################################################
##### 
######################################################
m::proc -public secret::init {
} {
    Documentation goes here...
} {    
    Trace
    variable _id [[namespace current]::id]
    
    put {
	<style>
	body {
	    background:#FFF;
	}
	</style>
    }

    javascript {
	put {
	    jQuery(document).ready(function() {
		$(document).click(function() {
		    jQuery('#secret').focus()
		});
	    });
	}
    }

    division class="span4" style=padding:40px\;position:relative {
	put [img /tk/img/common/melBG.gif]
	
	division [style position absolute top 350px left 80px text-align center] {
	    tk::form -name "secretform" -callback "secret::cb" -guts {
		export ajax=1
		
		text mysecret= id="secret" type="password" placeholder="Say da magic word !" style=padding:10px\;font-size:18px class="span4"
		
		put "<script>jQuery('#secret').focus()</script>"
	    }
	    br
	    put "[url [list Mel: (646) 303-1234] tel:16463031234 style=color:#000]"
	}
    }
}

######################################################
##### 
######################################################
m::proc -public secret::cb {
} {
    Documentation goes here...
} {    
    Trace

    set res [secret::check]

    if {$res == ""} {
	set str [subst {
	    jQuery.cookie("secret","1");
	    
	    document.location.reload();
	}]
	
	put "<script>$str</script>"
    } else {
	put [img "/tk/img/common/password.gif" width=200 [style margin $::margin]]

	put "<script>jQuery('#secret').focus()\;jQuery('#secret').val('')</script>"
    }
}

######################################################
##### 
######################################################
m::proc -public secret::client {
    -sites:required
} {
    Documentation goes here...
} {    
    Trace

    if {[lsearch $sites $::env(SERVER_NAME)] == -1} {
	return
    }

    if {$::secret == ""} {
	secret::init
	exit
    }
}

######################################################
##### 
######################################################
m::proc -public secret::generate {
} {
    Documentation goes here...
} {    
    Trace

    set num [clock format [clock seconds] -format %d%y%m]

    set tmp [list]
    for {set i 0} {$i < [string length $num]} {incr i} {
	lappend tmp [string index $num $i]
    }
    set num $tmp

    set n [llength $num]
    for { set i 1 } { $i < $n } { incr i } {
	set j [expr { int( rand() * $n ) }]
	set temp [lindex $num $i]
	lset num $i [lindex $num $j]
	lset num $j $temp
    }

    regsub -all " " $num "" num

    h1 $num
}

######################################################
##### 
######################################################
m::proc -public secret::check {
} {
    Documentation goes here...
} {    
    Trace

    #set ::secret 415052

    set x [clock format [clock seconds] -format %d%y%m]
    set t [string trim $::mysecret]

    for {set i 0} {$i < [string length $x]} {incr i} {
	regsub [string index $x $i] $t "" t
    }

    return $t
}
