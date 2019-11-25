#!/Melify/bin/mac/tclkit

source "/Melify/mtk/dev/tk/src/utl/json2dict.tcl"

if {$argc != 1} {
    puts "\nUSAGE: trader <symbol>"
    puts "EXAMPLE: trader AAPL\n"
    exit
}

set symbols [string toupper [lindex $argv 0]]
set gd "/Users/melify/Dropbox/Trader/stocks"; file mkdir $gd

######################################################
##### 
######################################################
proc save {} {
    global gd

    # OLD PRICES
    foreach i [split $::symbols ,] {
	file mkdir $gd/$i/[clock format [clock seconds] -format "%Y-%m-%d"]
	
	set fo($i) [open $gd/$i/[clock format [clock seconds] -format "%Y-%m-%d"]/$i.txt w]

	set tmpo($i) ""
    }

    while {1} {
	if {[catch {
	    regsub -all "," $::symbols "%2C" ::symbols
	    exec curl -X GET --header "Authorization: " "https://api.tdameritrade.com/v1/marketdata/quotes?apikey=N6RSFI69A6DPXUVJM22BB8T7HFUMXOIW&symbol=$::symbols"
	} e] != 0} {
	    if {[catch {
		set stocks [json::json2dict $e]

		foreach i [lsort [dict keys $stocks]] {
		    # GET INDIVIDUAL SYMBOL STOCK INFO
		    set d [dict get $stocks $i]

		    # SAVE LAST PRICE FOR SYMBOL
		    set tmp($i) [dict get $d lastPrice]

		    # DO NOT SAVE IF WE HAVE PRICE ALREADY
		    if {$tmpo($i) != $tmp($i)} {
			set time [dict get $d tradeTimeInLong]
			puts $fo($i) "dict set stocks $time [list $d]\n";flush $fo($i)
			puts -nonewline " $i ";flush stdout
		    } else {
			#puts -nonewline ".";flush stdout
		    }

		    # OLD PRICES
		    set tmpo($i) $tmp($i)
		}
	    } e] != 0} {
		puts "\nERROR: $stocks"
	    }
	}

	after 1000
    }
}

######################################################
##### 
######################################################
puts "SAVEING: $symbols"
save
