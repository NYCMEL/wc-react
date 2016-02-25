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
if {[catch {
    #FOR ORION UBUNTU SERVER
    load /usr/lib/mysqltcl-3.05/libmysqltcl3.051.so
} e] != 0} {
    #FOR MAC
    lappend auto_path /usr/lib/mysqltcl-3.05
}

package require mysqltcl

namespace eval tk {
    namespace eval db {
	namespace eval mysql {
	    variable connection "UNDEFINED"
	}
    }
}

###############################################
##### 
###############################################
m::proc -public tk::db::mysql::init {
    -user:required
    -database:required
    -host:required
    {-port "3306"}
    {-paswd    ""}
} {
    DOCUMENTATION GOES HERE...
} {
    Trace
    variable connection
    
    #CHECK FOR EMPTY PASSWORD
    set password [expr {($paswd == "") ? "" : "-password $paswd"}]

    if {[catch {
	set connection [eval mysql::connect -user "$user" $password -host "$host" -db "$database" -port "$port" -noschema 0]
    } e] != 0} {
	division [style padding 40px margin 100px background yellow color indianred border-radius 10px text-align center] {
	    h1 "$e"
	    hr
	    h3 "HOST:$host, PORT:$port, DB:$database"
	}
	exit
    }

    return $connection
}

###########################################
##### 
###########################################
m::proc -public tk::db::mysql::query {
    qstr
    args
} {
    DOCUMENTATION GOES HERE...
} {
    Trace
    variable connection

    mysql::sel $connection $qstr
    
    set rows [mysql::result $connection rows]
    set cols [mysql::result $connection cols]

    set rval ""
    for {set r 0} {$r < $rows} {incr r} {
	lappend rval [mysql::fetch $connection]
    }

    return $rval
}

###########################################
##### 
###########################################
m::proc -public tk::db::mysql::query:v {
    -variable:required
    qstr
    args
} {
    DOCUMENTATION GOES HERE...
} {
    Trace
    upvar $variable rval
    variable connection

    mysql::sel $connection $qstr
    
    set rows [mysql::result $connection rows]
    set cols [mysql::result $connection cols]

    for {set r 0} {$r < $rows} {incr r} {
	set row [mysql::fetch $connection]
	
	for {set c 0} {$c - $cols} {incr c} {
	    set rval($r,$c) [lindex $row $c]
	}
    }

    # MYSQL DOES NOT PROVIDE HEADERS
    set rval(*) "$r"

    for {set c 0} {$c - $cols} {incr c} {
	lappend rval(*) "$c"
    }
}

