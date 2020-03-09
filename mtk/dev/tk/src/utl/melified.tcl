namespace eval util {}

######################################################
##### 
######################################################
m::proc -public util::melified {
} {
    Documentation goes here...
} {
    Trace
    
    if {[catch {
	eval $::code
    } e] != 0} {
	h1 "util::melified ERROR: $e"
    }
}
