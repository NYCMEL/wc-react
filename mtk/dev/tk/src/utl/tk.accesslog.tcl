###HEADS###################################################################
#
#   COPYRIGHT (C) 1993,2009 Melify                                       
#   EMAIL:        Support@Melify.com                                        
#   URL:          http://www.Melify.com                                    
#   
#   A LICENSE IS REQUIRED FOR ALL PUBLIC FACING USE OF THIS TOOLKIT
#   
#   Time-stamp: <2017-10-15 09:17:56 (melify)>
#
#   SOME JAVASCRIPTS INCLUDED IN THIS PACKAGE MAY REQUIRE A SEPARATE         
#   LICENSE, PLEASE COMPLY WITH THEIR LICENSING AGREEMENTS                   
#
###HEADE###################################################################

namespace eval tk {}

######################################################
##### 
######################################################
m::proc -public tk::accesslog {
} {
    Documentation goes here...
} {    
    Trace
    
    if {[info exist ::site] == 0} {
	h1 align=center "add 'site=<f3>' name and try again"
	exit
    }

    set ::root "/var/log/apache2/$::site.access.log"

    if {[catch {set f [open "$::root" r]} e] != 0} {
	division [style text-align center] {
	    h2 [cite $e]
	}
	return
    }
    
    while {[gets $f line] >= 0} {
	set x [split $line -]

	set ip [string trim [lindex $x 0]]

	if {$ip != "127.0.0.1"} {
	    lappend a($ip) [string range [lindex [split [lindex [lindex $x 2] 0] :] 0] 1 end]
	}
    }
    
    foreach i [array names a] {
	set a($i) [lsort -unique $a($i)]
    }

    close $f

    set xid -1

    table class="table table-bordered table-striped" {
	table_head {
	    table_row style=background:#333\;color:#FFF {
		table_data {
		    put "&nbsp; [file tail $::site]"
		}
		table_data style=text-align:center {
		    put [font color=white "IP Address"]
		}
	    }
	}

	foreach i [lsort -decreasing [array names a]] {
	    table_row {
		table_data style=padding-left:10px width=100% {
		    set cnt [llength $a($i)]
		    
		    if {$cnt > 1} {
			incr xid

			put [url "$cnt: [lindex $a($i) end]" "#" onclick="jQuery('#expand-$xid').toggle()"]

			division id="expand-$xid" style=display:none {
			    foreach j [lsort -decreasing $a($i)] {
				division {
				    put "&nbsp;&nbsp;&nbsp; $j"
				}
			    }
			}
		    } else {
			foreach j [lsort -decreasing $a($i)] {
			    division {
				put "&nbsp;&nbsp;&nbsp; $j"
			    }
			}
		    }
		}
		table_data valign=top align=right {
		    put [url $i "http://$i" target="ipaddress"]
		}
	    }
	}
    }
}
