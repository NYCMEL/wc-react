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

put {
    <style>
    .tk-parray table {
	border:2px indianred solid!important;
    }
    .tk-parray table th {
	background: #ebebeb;
    }
    .tk-parray table th,td {
	font-weight:normal!important;
	padding:2px!important;
	margin:0!important;
	font-size:12px!important;
    }
    </style>
}

######################################################
##### 
######################################################
m::proc -public tk::parray {
    args
} {
    DOCUMENTATION GOES HERE...
} {
    Trace
    upvar $args v

    set nrows [lindex $v(*) 0]
    set head  [lrange $v(*) 1 end]

    division class="tk-parray" {
	table class="table table-bordered table-striped" {
	    table_head {
		table_row {
		    table_th width=20 {
		    }
		    foreach h $head {
			table_th {
			    put [string toupper $h]
			}
		    }
		}
	    }

	    for {set r 0} {$r < $nrows} {incr r} {
		table_row {
		    table_data {
			put [expr $r + 1]
		    }

		    foreach c $head {
			table_data {
			    put $v($r,$c)
			}
		    }
		}
	    }
	}
    }
}

######################################################
##### 
######################################################
m::proc -public tk::parray:test {
    args
} {
    DOCUMENTATION GOES HERE...
} {
    Trace

    tk::db::sqlite::query:v -variable v "select * from users"

    division style=padding:50 {
	tk::parray v
    }
}
