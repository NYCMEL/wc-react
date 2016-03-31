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

namespace eval menus {
    variable excludes {
	jq.component.video.2.tcl
	jq.component.bricks.tcl
	jq.component.expander.tcl
	jq.component.expose.tcl
	jq.component.faq.2.tcl
	jq.component.flyout.tcl
	jq.component.form.select.multi.tcl
	jq.component.grid.responsive.tcl
	jq.component.ios.page.slider.tcl
	jq.component.mmenus.tcl
	jq.component.page.slide.tcl
	jq.component.page.transition.tcl
	jq.component.pager.tcl
	jq.component.parallax.tcl
	jq.component.radio.combo.tcl
	jq.component.reader.tcl
	jq.component.rss.tcl
	jq.component.scroller.tcl
	jq.component.share.tcl
	jq.component.slick.select.tcl
	jq.component.slider.2.tcl
	jq.component.slider.3.tcl
	jq.component.sliding.panel.tcl
	jq.component.stack.pages.tcl
	jq.component.swiper.tcl
	jq.component.tabs.1.tcl
	jq.component.tabs.liquid.slide.tcl

	jqw.component.grid.tcl

	mtk.component.bricks.tcl
	mtk.component.card.tcl
	mtk.component.datepicker.tcl
	mtk.component.editor.tcl
	mtk.component.hierarchy.tcl
	mtk.component.media.tcl
	mtk.component.portfolio.tcl
	mtk.component.spa.tcl
	mtk.component.tree.tcl

	tb.component.container.tcl
	tb.component.dialog.tcl
	tb.component.form.login.tcl
	tb.component.form.register.tcl
	tb.component.responsive.indicator.tcl
	tb.component.nav.stacked.tcl
	tb.component.reader.tcl
	tb.component.resizer.tcl
	tb.component.social.tcl
	tb.component.table.datatable.tcl
	tb.component.tabs.1.tcl
	tb.component.tabs.2.tcl
	tb.component.tabs.3.tcl
	tb.component.tags.tcl
	tb.component.video.tcl
	tb.component.typeahead.tcl
	tb.component.tabs.2.static.tcl
    }
}

include "/inc/menus.css"
include "/inc/menus.js"

######################################################
##### 
######################################################
m::proc -public menus::id {
} {
    Documentation goes here...
} {
    Trace
    
    return "menus"
}

######################################################
##### 
######################################################
m::proc -public menus::narrative {
} {
    Documentation goes here...
} {
    Trace

    put "this is our menus page"
}

######################################################
##### 
######################################################
m::proc -public menus::title {
} {
    Documentation goes here...
} {
    Trace
    
    return "menus"
}

######################################################
##### 
######################################################
m::proc -public menus::template {
} {
    Documentation goes here...
} {
    Trace

    return "template::0"
}

######################################################
##### 
######################################################
m::proc -public menus::init {
} {
    Documentation goes here...
} {    
    Trace
    variable _id [[namespace current]::id]
    
    [template]
}

######################################################
##### 
######################################################
m::proc -public menus::guts {
} {
    Documentation goes here...
} {    
    Trace
    variable _id [id]
    variable excludes

    set files ""
    foreach i [glob -nocomplain /Melify/mtk/$::ENV/tk/lib/components/*] {
	if {[file isdir $i] == 1} {
	    set t [file tail $i]

	    switch $t {
		"inc" - "template" - "pl" - "ang" {
		    #IGNORE THESE FOLDERS
		}
		default {
		    lappend files $i
		}
	    }
	}
    }

    set cnt 0
    
    division id="${_id}" {
	foreach f $files {
	    set t [file tail $f]

	    division class="${_id}-part" {
		division class="${_id}-part-head" {
		    set d [file tail $f]
		    set len [expr [string length $d] + [string length ".component"] + 1]
		    
		    put [span class="badge" [string toupper "$d"]]
		}

		division {
		    foreach j [glob -nocomplain [file join $f *.tcl]] {
			# DO NOT DISPLAY ITEMS IN excludes
			if {[lsearch $excludes [file tail $j]] != -1} {
			    continue
			}

			regsub -all {\.} [string range [file tail $j] 0 end-4] "::" test
			
			set lbl [string range [file tail $j] $len end-4]
			set style [style min-width 110px margin 3px border 0 text-align left margin 0]
			put [url $lbl "#" target=_blank component="${test}::test" folder="$f" class="component btn btn-xs btn-default" $style]
		    }
		}
	    }
	}
    }

    javascript {
	put {
	    menus.init();
	}
    }
}
