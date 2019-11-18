#!/Melify/bin/mac/tclkit

source "/Melify/mtk/dev/tk/src/utl/json2dict.tcl"

if {$argc != 1} {
    puts "\nUSAGE: trader <symbol>"
    puts "EXAMPLE: trader AAPL\n"
    exit
}

set symbol [string toupper [lindex $argv 0]]

######################################################
##### 
######################################################
proc process {} {
    set suffix [clock format [clock seconds] -format "%Y-%m-%d"]
    set fo [open /tmp/stocks-$suffix.dat w]

    while {1} {
	if {[catch {
	    regsub -all "," $::symbol "%2C" ::symbol
	    exec curl -X GET --header "Authorization: " "https://api.tdameritrade.com/v1/marketdata/quotes?apikey=N6RSFI69A6DPXUVJM22BB8T7HFUMXOIW&symbol=$::symbol"
	} e] != 0} {
	    set stocks [json::json2dict $e]

	    foreach i [lsort [dict keys $stocks]] {
		if {[info exist tmp($i)] == 0} {
		    set tmpo($i) ""
		}

		set j [dict get $stocks $i]
		set tmp($i) [dict get $j lastPrice]

		if {$tmpo($i) != $tmp($i)} {
		    puts $fo "dict set stocks $i [list $j]\n"
		} else {
		    puts -nonewline ".";flush stdout
		}

		set tmpo($i) $tmp($i)
	    }
	}

	after 1000
    }
}

######################################################
##### 
######################################################
process
