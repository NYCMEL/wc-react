#############################################
#### USAGE: delay::delay-bw 2000
#############################################
namespace eval delay {
    variable _i
    variable c/ms
    
    proc calibrate {} {
        variable c/ms
        #puts "calibrating clock clicks.."
        set start [clock clicks]
        after 1000
        set end [clock clicks]
        set c/ms [expr {($end-$start)/1000.0}]
        #puts "speed: [expr {${c/ms}*1000}] clicks per second"
    }
    
    calibrate
    
    # busywaiting delay
    proc delay-bw {sec} {
        variable c/ms
	# do nothing
    }
    
    # busywaiting "after idle" delay, using event loop
    proc delay-ev {sec} {
	variable c/ms
	set s [clock clicks]
	set e [expr {$s+$sec*${c/ms}}]
	evwait ::delay::_i $e
	vwait ::delay::_i
	unset ::delay::_i
    }
    
    # worker for delay-ev
    # continually reschedules itself via "after idle" until end time
    proc evwait {var {end 0}} {
	set ct [clock clicks]
	if {$ct < $end} {
	    after idle [list ::delay::evwait $var $end]
	    return
	} else {
	    set $var 0
	}
    }
}
