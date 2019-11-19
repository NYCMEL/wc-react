#!/Melify/bin/mac/tclkit

source "/Melify/mtk/dev/tk/src/utl/json2dict.tcl"

if {$argc != 1} {
    puts "\nUSAGE: trader <symbol>"
    puts "EXAMPLE: trader AAPL\n"
    exit
}

set symbols [string toupper [lindex $argv 0]]

######################################################
##### 
######################################################
proc process {} {
    # OLD PRICES
    foreach i [split $::symbols ,] {
	set fo($i) [open /tmp/$i.[clock format [clock seconds] -format "%Y-%m-%d"].dat w]

	set tmpo($i) ""
    }

    set cnt 0

    while {1} {
	if {[catch {
	    regsub -all "," $::symbols "%2C" ::symbols
	    exec curl -X GET --header "Authorization: " "https://api.tdameritrade.com/v1/marketdata/quotes?apikey=N6RSFI69A6DPXUVJM22BB8T7HFUMXOIW&symbol=$::symbols"
	} e] != 0} {
	    set stocks [json::json2dict $e]

	    foreach i [lsort [dict keys $stocks]] {
		# GET INDIVIDUAL SYMBOL STOCK INFO
		set d [dict get $stocks $i]

		# SAVE LAST PRICE FOR SYMBOL
		set tmp($i) [dict get $d lastPrice]

		# DO NOT PROCESS IF WE HAVE PRICE ALREADY
		if {$tmpo($i) != $tmp($i)} {
		    incr cnt
		    puts $fo($i) "dict set stocks $i [list $d]\n";flush $fo($i)
		} else {
		    puts -nonewline ".";flush stdout
		}

		# OLD PRICES
		set tmpo($i) $tmp($i)
	    }
	}

	after 1000
    }
}

######################################################
##### 
######################################################
puts "PROCESSING: $symbols"
process
