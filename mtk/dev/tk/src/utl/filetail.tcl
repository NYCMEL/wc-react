#!/Melify/bin/mac/tclkit

namespace eval filetail {
    proc readHandler {handle delay} {
	set line [read $handle]

	# PROCESS NONE-BLANK LINES
	if {[string trim $line] != ""} {
	    process $line
	}

	# TO REDUCE CPU OVERHEAD...
	after 1000
    }

    proc init {fname delay} {
	set hFile [open $fname "r"]
	# seek to the end of file if needed
	# seek $hFile 0 end 

	fconfigure $hFile -buffering none -eofchar "" -blocking no
	fileevent $hFile readable [subst {filetail::readHandler $hFile $delay}]

	proc process {line} {
	    puts -nonewline $line; flush stdout
	}

	#just for exiting into main event loop
	vwait forever
    }
}

################################################
#### EXAMPLE:
####   filetail::init "/tmp/z.json" 1000
################################################


