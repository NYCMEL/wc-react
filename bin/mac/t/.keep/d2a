#!/Melify/bin/mac/tclkit

source ./stocks/AAPL/2019-11-19/AAPL.dat

proc process {a} {
    upvar a b

    parray b
}

foreach k [dict key $stocks] {
    foreach {i j} [dict get $stocks $k] {
	set a($i) $j
    }

    process a
}

