#!/Melify/bin/mac/tclkit

set x [list]
set ticks 3

proc queue {val} {
    global x
    global ticks
    
    lappend x $val

    if {[llength $x] > $ticks} {
	set x [lrange $x end-[expr $ticks -1] end]
    }
}

proc dir {} {
    global x
    global ticks

    set s1 [lsort -increasing $x]
    set s2 [lsort -decreasing $x]

    if {$s1 == $x} {
	puts UUUUUUUUUUUUU
    }

    if {$s2 == $x} {
	puts DDDDDDDDDDDDDDD
    }
}

queue 50
queue 80
queue 10
queue 55
queue 65
queue 75

puts $x

dir
