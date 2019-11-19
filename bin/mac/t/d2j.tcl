#!/Melify/bin/mac/tclkit

source "/Users/melify/Dropbox/Trader/stocks/AAPL/2019-11-19/AAPL.txt"

foreach k [dict key $stocks] {
    foreach {i j} [dict get $stocks $k] {
	set a($i) $j
    }

    process a
}

proc process {a} {
    upvar a b

    parray b
}

