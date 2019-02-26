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

namespace eval tk {}

######################################################
##### ZIP AND DOWNLOAD FILES
######################################################
m::proc -public tk::zip {
    {-src ""}
    {-ele ""}
} {
    Documentation goes here...
} {  
    Trace

    if {[info exist ::src] == 1} {set src $::src}
    if {[info exist ::ele] == 1} {set ele $::ele}

    set root [file rootname $src]
    set dir  [file dirname  $src]
    set fname [lindex [split $src "/"] end]

    set d [clock format [clock seconds] -format %D]
    regsub -all "/" $d "." d

    if {[catch {
	cd $dir
	exec zip -r /tmp/$fname.$d.zip $fname
    } e] != 0} {
	h5 "ERROR(tk::zip): $e"
	exit
    }

    if {$ele != ""} {
	javascript {
	    put [subst {
		jQuery("#$ele").append("<a href='/tmp/$fname.$d.zip' class='btn btn-primary'>DOWNLOAD</a>")
	    }]
	}
    }

    return "/tmp/$fname.$d.zip"
}

