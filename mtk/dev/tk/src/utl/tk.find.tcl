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


##############################################
##### 
##############################################
m::proc -public tk::find {
    -rootdir:required
    -pattern:required
    {-start 0}
} {
    DOCUMENTATION GOES HERE...
} {
    Trace
    global _FILES_

    if {$start == 0} {
	set _FILES_ {}
    }
    
    set pwd [pwd]
    
    if [catch {cd $rootdir} err] {
	puts stderr $err
	return
    }

    foreach match [glob -nocomplain -- $pattern] {
	lappend _FILES_ $rootdir/$match
    }
    
    foreach file [glob -nocomplain *] {
	if {([file isdirectory $file] == 1) && ([file tail $file] != ".svn")} {
	    tk::find -rootdir $rootdir/$file -pattern $pattern -start 1
	}
    }

    cd $pwd

    return $_FILES_
}

##############################################
##### 
##############################################
m::proc -public tk::find:test {
} {
    DOCUMENTATION GOES HERE...
} {
    Trace

    h1 "FIND ANY 'calendar*.tcl' FILE IN /Melify/mtk/dev/tk/src FOLDER"

    set result [tk::find -rootdir "/Melify/mtk/dev/tk/src" -pattern "calendar*.tcl"]

    foreach i $result {
	put >>$i<BR>
    }
}









