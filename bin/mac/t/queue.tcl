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

queue apple
queue orange
queue peach
queue mel
queue heravi
queue red
queue white
queue blue

puts $x
