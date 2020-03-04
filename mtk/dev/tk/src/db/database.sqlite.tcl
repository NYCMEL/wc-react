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
    namespace eval db {
	namespace eval sqlite {}
    }
}

###############################################
##### 
###############################################
m::proc -public tk::db::sqlite::select {
    -path:required
} {
    DOCUMENTATION GOES HERE...
} {
    Trace
    
    set ::DB $path
}

###########################################
##### 
###########################################
m::proc -public tk::db::sqlite::query {
    {-db ""}
    qstr
    args
} {
    DOCUMENTATION GOES HERE...
} {
    Trace

    foreach i $args {
	upvar $i $i
    }

    if {$db == ""} {
	sqlite dbh $::DB;dbh timeout 60000
    } else {
	sqlite dbh $db;dbh timeout 60000
    }

    set rval [dbh eval $qstr]

    tk::bugger {
	put [font color=brown [bold [info level -1]]];br
	put [bold [cite "QSTR = $qstr"]];br
	put "[bold {RESLULT =}] $rval"
    }

    return $rval
}

###############################################
##### 
###############################################
m::proc -public tk::db::sqlite::query:v {
    {-db ""}
    -variable:required
    qstr
    args
} {
    DOCUMENTATION GOES HERE...
} {
    Trace
    upvar $variable v

    #TAKE CARE OF SINGLE QUOTE PROBLEM BEFORE PROCEEDING
    #regsub -all {'([^']+)'} $qstr {[dbstr \1]} qstr

    foreach i $args {
	upvar $i $i
    }

    if {$db == ""} {
	sqlite dbh $::DB;dbh timeout 60000
    } else {
	sqlite dbh $db;dbh timeout 60000
    }

    set header {}

    set k 0
    dbh eval $qstr values {
	foreach i [array names values] {
	    if {$i == "*"} {
		if {$k == 0} {
		    set header $values($i)
		}
	    } else {
		catch {set v($k,$i) $values($i)}
	    }
	}
	incr k
    } 

    set v(*) "$k $header"

    # tk::bugger {
    # 	put "$qstr"
    # 	tk::parray v
    # }
}

###############################################
##### 
###############################################
m::proc -public tk::db::sqlite::query:v:2 {
    -variable:required
    qstr
} {
    DOCUMENTATION GOES HERE...
} {
    Trace
    upvar $variable v

    sqlite dbh $::DB;dbh timeout 60000

    set header {}

    set r -1
    dbh eval $qstr values {
	incr r

	set header $values(*)
	set ncols [array size values]

	set c -1
	foreach i $header {
	    if {$i != "*"} {
		set v($r,[incr c]) $values($i)
	    }
	}
    } 

    set v(*) "$r $ncols $header"
}

##############################################
##### 
##############################################
m::proc -public tk::db::sqlite::check:str {
    string
} {
    DOCUMENTATION GOES HERE...
} {
    Trace
    
    regsub -all {([\[\]\}\{\;\"\'])} $string {\\\1} newstring

    return $newstring
}

###############################################
##### 
###############################################
m::proc -public tk::db::sqlite::next:id {
    -tablename:required
} {
    DOCUMENTATION GOES HERE...
} {
    Trace

    set rval [tk::db::sqlite::query "select max(id) from $tablename"]
    if {$rval == "{}"} {
	set rval 1000
    }
    
    return [incr rval]
}

###############################################
##### 
###############################################
m::proc -public tk::db::sqlite::tables {
    {-db ""}
} {
    DOCUMENTATION GOES HERE...
} {
    Trace

    if {$db == ""} {
	set result [tk::db::sqlite::query -db $::DB "SELECT name FROM sqlite_master WHERE type='table' ORDER BY name"]
    } else {
	set result [tk::db::sqlite::query -db $db "SELECT name FROM sqlite_master WHERE type='table' ORDER BY name"]
    }

    return $result
}

###############################################
##### 
###############################################
proc dbstr {args} {
    return "'[string map {{'} {''} {\"} {\"\"}} $args]'"
}
