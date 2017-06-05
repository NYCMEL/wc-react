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

namespace eval tk {
    variable _cnt [clock seconds]
}

######################################################
##### 
######################################################
m::proc -public tk::porturl {
    -url:required
    -fport:required
    -tport:required
} {
    Documentation goes here...
} {    
    Trace
    
    if {[string range $url 0 3] == "http"} {
	regsub "$fport" $url "$tport" url
    } else {
	set url "http://$::env(SERVER_NAME):$tport$url"
    }
    
    return $url
}

######################################################
##### 
######################################################
m::proc -public tk::pop:image {
} {
    Documentation goes here...
} {    
    Trace
    
    if {[info exist ::padding] == 0} {
	set ::padding 0px
    }

    division [style position relative padding $::padding] {
	put [img $::img width=100%]

	division [style position absolute right 10px top 10px] {
	    put [url "<span class='close'>X</span>" "#" onclick="jQuery.unblockUI()"]
	}
    }
}

######################################################
##### 
######################################################
m::proc -public tk::translate {
    {-top     "7px"}
    {-right "100px"}
    {-hidden      0}
} {
    Documentation goes here...
} {    
    Trace

    set display [expr {($hidden == "1") ? "none" : "block"}]

    division id="google_translate_element" [style position absolute top $top right $right z-index 9999 display $display] {
	# GOOGLE TRANSLATE PLACEHOLDER
    }

    put {
	<style>
	.goog-te-banner-frame.skiptranslate {
	    display: none !important;
	} 

	body {
	    top: 0px !important; 
	}
	</style>

	<meta name="google-translate-customization" content="c78679481a22af91-2d34ce791c1e343d-g2a8a98b31d5899f2-a"></meta>

	<script type="text/javascript">
	function googleTranslateElementInit() {
	    new google.translate.TranslateElement({pageLanguage: 'en', layout: google.translate.TranslateElement.InlineLayout.SIMPLE}, 'google_translate_element');
	}
	</script>

	<script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
    }
}

######################################################
##### 
######################################################
m::proc -public waiting {
} {
    DOCUMENTATION GOES HERE...
} {
    Trace

    return [img /tk/img/common/loading.2.gif]
}

######################################################
##### 
######################################################
m::proc -public fakeimage {
    {-width 100%}
    {-height 100%}
} {
    Documentation goes here...
} {
    Trace

    put [img /tk/img/common/placeholder.png [style width $width height $height border-radius 3px]]
}

######################################################
##### 
######################################################
m::proc -public shuffle {
    -data:required
} {
    Documentation goes here...
} {
    Trace

     set length [llength $data]

     for {} {$length > 1} {incr length -1} {
         set idx_1 [expr {$length - 1}]
         set idx_2 [expr {int($length * rand())}]
         set temp [lindex $data $idx_1]
         lset data $idx_1 [lindex $data $idx_2]
         lset data $idx_2 $temp
     }

     return $data
 }
