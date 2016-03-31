######################################################
##### USED IN ALL pages.init FILES
######################################################
m::proc -public tk::config {
    -id:required
    args
} {
    Documentation goes here...
} {
    Trace
    
    set r -1

    division class="container$::fluid" {
	foreach tmp [split [uplevel subst $args] \n] {
	    if {[string trim $tmp] == ""} {continue}

	    division class="row$::fluid" id="$id-row-[incr r]" {
		set c -1

		foreach {m n} $tmp {
		    division class="$m" id="$id-row-$r-col-[incr c]" {
			uplevel $n
		    }
		}
	    }
	}
    }
}

