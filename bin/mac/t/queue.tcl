#!/Melify/bin/mac/tclkit

set x [list]
set ticks 3

######################################################
####
######################################################
proc queue {val} {
    global x
    global ticks
    
    lappend x $val

    if {[llength $x] > $ticks} {
	set x [lrange $x end-[expr $ticks -1] end]
    }
}

######################################################
####
######################################################
proc dir {} {
    global x
    global ticks

    puts ---$x

    set s1 [lsort -increasing $x]
    set s2 [lsort -decreasing $x]

    if {$s1 == $x} {
	puts UUUUUUUUUUUUU
    }

    if {$s2 == $x} {
	puts DDDDDDDDDDDDDDD
    }
}

set x {50 80 10 55 65}
queue 75
dir

set x {50 80 65 55 10}
queue 5
dir
