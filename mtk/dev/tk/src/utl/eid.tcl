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

######################################################
##### 
######################################################
proc tkeid {} {
     set f [open $::fname r]
     set r [read $f]
     close $f

    while {[regsub "TKEID" $r "e \[id\]-[math::random 1000000 9999999]" r] > 0} {}

    set f [open $::fname w]
    puts $f $r
    close $f

    division align=center [style padding 30px] {
	h1 [clock format [clock seconds] -format %T]
	h2 "$::fname"
    }
}

######################################################
##### 
######################################################
proc tkeclass {} {
     set f [open $::fname r]
     set r [read $f]
     close $f

    while {[regsub "TKCLASS" $r "e \[id\]-[math::random 1000000 9999999]" r] > 0} {}
    
    set f [open $::fname w]
    puts $f $r
    close $f

    division align=center [style padding 30px] {
	h1 [clock format [clock seconds] -format %T]
	h2 "$::fname"
    }
}
