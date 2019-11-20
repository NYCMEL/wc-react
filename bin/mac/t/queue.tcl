set x [list]

proc queue {val} {
    global x
    
    lappend x $val

    set x [lrange $x end-4 end]
}

queue apple
queue orange
queue peach
queue mel
queue heravi

puts $x
