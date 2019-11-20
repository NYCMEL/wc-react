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

queue 50
queue 80
queue 10
queue 55
queue 65
queue 75

puts $x
