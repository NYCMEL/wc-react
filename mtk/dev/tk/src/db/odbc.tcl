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



###############################################
##### Database access class
###############################################
namespace eval tk {
    namespace eval odbc {
	variable dbtype {}
	variable dbname {}
    }
}

######################################################
##### 
######################################################
m::proc -public tk::odbc::init {
    -type:required
    -name:required
} {
    Documentation goes here...
} {
    Trace
    variable dbtype $type
    variable dbname $name
    
    #AVOID MULTIPLE DATABASE HANDLE CREATION
    if {[info exist ::tkDBLOADED] == 1} {
	return
    }

    switch $dbtype {
	"sqlite" {
	    package require sqlite
	    sqlite dbh $dbname
	}
	default {
	    if {[catch {
		source /Melify/mtk/dev/tk/kits/snodbc.kit
		package require snodbc
	    } e] != 0} {
		tk::error -error "$e" -proc "tk::odbc::init"
	    }
	    
	    if {[catch {database dbh $dbname} e] != 0} {
		tk::error -error "$e" -proc "tk::odbc::init"
	    }
	}
    }
    
    set ::tkDBLOADED 1
}

######################################################
##### 
######################################################
m::proc -public tk::odbc::query {
    -qstr:required
} {
    Documentation goes here...
} {
    Trace
    variable dbtype
    variable dbname

    set rval ""

    switch $dbtype {
	"sqlite" {
	    if {[catch {set rval [dbh eval $qstr]} e] != 0} {
		return $e
	    }
	}
	"mysql" - "sqlserver" - "postgresql" {
	    if {[catch {
		set rval [dbh $qstr]
	    } e] != 0} {
		center {
		    if {$::ENV == "dev"} {
			put [img /images/misc/bob.gif height=150];br;br
		    }

		    table width=700 cellspacing=0 cellpadding=10 border=0 style="border:1px gray solid" {
			table_row bgcolor=brown id=tk-white {
			    table_data style="border-bottom:1px brown solid" {
				put [img /tk/images/common/error.gif height=25]
			    }
			    table_data style="border-bottom:1px brown solid" align=left width=100% {
				put [font size=larger [bold "There is a database error:"]]
			    }
			}
			table_row bgcolor=#ebebeb {
			    table_data style="border-bottom:1px gray solid" colspan=2 {
				put [bold "Query String&nbsp;:&nbsp;"]
				put [font color=brown $qstr]
			    }
			}
			table_row {
			    table_data bgcolor=khaki colspan=2 {
				put [bold "Returned Error: [font color=brown $e]" ]
			    }
			}
		    }
		}
	    }
	}
	default {
	    division style=padding-top:100 {
		center {
		    if {$::ENV == "dev"} {
			put [img /images/misc/bob.gif height=150];br;br
		    }

		    table width=700 cellspacing=0 cellpadding=10 border=0 style="border:1px gray solid" {
			table_row bgcolor=brown id=tk-white {
			    table_data style="border-bottom:1px brown solid" {
				put [img /tk/images/common/error.gif height=25]
			    }
			    table_data style="border-bottom:1px brown solid" align=left width=100% {
				put [font size=larger [bold "There is a database error:"]]
			    }
			}
			table_row bgcolor=#ebebeb {
			    table_data style="border-bottom:1px gray solid" colspan=2 {
				put [bold "Query String&nbsp;:&nbsp;"]
				put [font color=brown $qstr]
			    }
			}
			table_row {
			    table_data bgcolor=khaki colspan=2 {
				put [bold "Returned Error: [font color=brown {ODBC Unknown DB: No database is selected. Please initialize}]" ]
			    }
			}
		    }
		}
	    }
	}
    }

    return $rval
}

###############################################
##### Query all available tables
###############################################
m::proc -public tk::odbc::table:columns {
    -table:required
} {
    Documentation goes here...
} {
    Trace
    
    return [dbh columns $table]
}

###############################################
##### Query all available tables
###############################################
m::proc -public tk::odbc::tables {
} {
    Documentation goes here...
} {
    Trace
    variable dbtype
    variable dbname

    set rval {}

    switch $dbtype {
	"sqlite" {
	    if {[catch {
		set rval [tk::odbc::sql "SELECT name FROM sqlite_master WHERE type='table' ORDER BY name"]
	    } e] != 0} {
		Trace  $e
		return {}
	    }
	}
	"sqlserver" - "postgresql" {
	    set rval {}
	    
	    foreach i [dbh tables] {
		foreach {j k m n p} $i {
		    if {$n == "TABLE"} {
			lappend rval $m
		    }
		}
	    }
	    return $rval
	}
    }

    Trace  $rval
    return $rval
}

######################################################
##### 
######################################################
m::proc -public tk::odbc::query:v {
    -variable:required
    -qstr:required
} {
    Documentation goes here...
} {
    Trace
    variable dbtype
    variable dbname
    upvar $variable v

    set k 0

    set rows [tk::odbc::query -qstr $qstr]

    set v(*) [llength $rows]

    foreach row $rows {
	incr k
	set v($k) $row
    }
}

######################################################
##### 
######################################################
m::proc -public tk::odbc::query:v:2 {
    -variable:required
    -qstr:required
} {
    Documentation goes here...
} {
    Trace
    upvar $variable v

    set result [tk::odbc::query -qstr $qstr]
    if {$result == {}} {
	set v(*) 0
	return
    }

    set ncols [llength [lindex $result 0]]
    set nrows [llength $result]

    set v(*) "$nrows $ncols"

    for {set r 0} {$r < $nrows} {incr r} {
	set row [lindex $result $r]

	for {set c 0} {$c < $ncols } {incr c} {
	    set v($r,$c) [lindex $row $c]
	}
    }
}










