#!/Melify/bin/mac/tclkit

source "/Users/melify/Dropbox/Trader/stocks/AAPL/2019-11-19/AAPL.txt"

set ticks 4

######################################################
##### 
######################################################
proc reset {} {
    global ticks
    upvar stock s

    for {set i 0} {$i < $ticks} {incr i} {
	set s($i) ""
    }
}


######################################################
##### 
######################################################
proc trader {} {
    upvar stock s

    # RESET BACK ARRAY
    reset

    parray stock

    set keys [dict keys $::stocks]
}

######################################################
##### 
######################################################
trader
