###HEADS###################################################################
#
#  Melify Internet Toolkit (MTK) - Copyright (C) 2015  Melify LLC.
#  
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see http://www.gnu.org/licenses.
#
###HEADE###################################################################


namespace eval math {}

##################################################
##### 
##################################################
m::proc -public math::random {
    args
} {
    DOCUMENTATION GOES HERE...
} {
    set num [expr {rand()}]
    if { [llength $args] == 0 } {
	return $num
    } elseif { [llength $args] == 1 } {
	return [expr {int($num * [lindex $args 0])}]
    } elseif { [llength $args] == 2 } {
	foreach {lower upper} $args break
	set range [expr {$upper - $lower}]
	return [expr {int($num * $range) + $lower}]
    } else {
	set fn [lindex [info level 0] 0]
	error "wrong # args: should be \"$fn ?value1? ?value2?\""
    }
}









