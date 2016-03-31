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


namespace eval tk {
    namespace eval create {}
}

##############################################
##### 
##############################################
proc platform {} {
    global tcl_platform
    set plat [lindex $tcl_platform(os) 0]
    set mach $tcl_platform(machine)

    switch -glob -- $mach {
	sun4* { set mach sparc }
	intel -
	i*86* { set mach x86 }
	x86_64 {set mach mac}
	"Power Macintosh" { set mach ppc }
    }

    switch -- $plat {
	AIX    { set mach ppc }
	HP-UX  { set mach hppa }
	Darwin { set mach mac }
    }

    return "$plat-$mach"
}

###############################################
##### USED FOR build COMMAND 
###############################################
m::proc -public tk::create::db {
} {
    DOCUMENTATION GOES HERE...
} {
    uplevel {
	set plat [platform]

	# if {$plat == "Darwin-mac"} {
	#     source /Melify/mtk/dev/tk/kits/sqlite-3_2_7.kit
	#     load /Melify/mtk/dev/tk/lib/mac/sqlite/libtclsqlite3.dylib
	#     package require sqlite3
	# } else {
	#     source /Melify/mtk/dev/tk/kits/sqlite-3_2_7.kit
	# }

	source /Melify/mtk/dev/tk/kits/sqlite-3_2_7.kit
	package require sqlite3
	
	if {[catch {
	    if {$::tcl_platform(platform) == "windows"} {
		source ../bin/win/app.cfg
	    } else {
		source ../bin/app.cfg
	    }
	} e] != 0} {
	    #puts $e
	}
	
	file delete -force sqlite.db
	sqlite dbh [pwd]/sqlite.db

	if {$argc == 1} {
	    #IF DUMP FILENAME PROVIDED RESTORE IT
	    puts " USING: $argv file..."

	    set f [open $argv r];set r [read $f];close $f

	    if {[catch {dbh eval $r} e] != 0} {
		puts ">>>$e"
	    }
	} else {
	    #USE THE LATEST DUMP
	    set new 0
	    foreach i [glob setup.*] {
		if {[file mtime $i] > $new} {
		    set new [file mtime $i]
		    set fil $i
		}
	    }

	    puts " USING: latest dump file $fil..."
	    set f [open $fil r];set r [read $f];close $f

	    if {[catch {dbh eval $r} e] != 0} {
		puts ">>>$e\n$r";exit
	    }
	}
    }
}
