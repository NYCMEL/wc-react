###HEADS###################################################################
#
#   COPYRIGHT (C) 1993,2009 Melify                                       
#   EMAIL:        Support@Melify.com                                        
#   URL:          http://www.Melify.com                                    
#   
#   A LICENSE IS REQUIRED FOR ALL PUBLIC FACING USE OF THIS TOOLKIT
#   
#   SOME JAVASCRIPTS INCLUDED IN THIS PACKAGE MAY REQUIRE A SEPARATE         
#   LICENSE, PLEASE COMPLY WITH THEIR LICENSING AGREEMENTS                   
#
###HEADE###################################################################

namespace eval tk {
    namespace eval editable {}
}

sqlite mydbh "../../db/sqlite.db"

######################################################
##### 
######################################################
m::proc -public tk::editable::init {
} {
    Documentation goes here...
} {
    Trace
    
    if {$::role != ""} {
	set ::user(name)  $::role
	set ::user(fname) [lindex $::role 0]
	set ::user(lname) [lindex $::role 1]

	set ::tkpersist(fname) $::user(fname)
	set ::tkpersist(lname) $::user(lname)
	set ::tkpersist(name)  $::user(name)

	set ::tk(fname) $::user(fname)
	set ::tk(lname) $::user(lname)
	set ::tk(name)  $::user(name)

	catch {
	    tk::db::sqlite::query:v -variable v "select * from parts where role='$::role'"

	    for {set i 0} {$i < [lindex [split $v(*)] 0]} {incr i} {
		set ::user($v($i,eid),$v(0,page)) $v($i,value)
	    }

	    array set user [file:read "$::starkit::topdir/data/prototype/pages/$::page/$::role"]

	    tk::bugger {
		parray ::user
	    }
	}
    }

    #DUMMY TO LOAD THE js FILE
}
    
######################################################
##### 
######################################################
m::proc -public tk::editable::show {
} {
    Documentation goes here...
} {
    Trace
    
    division id="tk-editable-dummy" [style background yellow height 200px display none] {
	p [lorem 30]
    }

    division id="tkEditableModal" class="modal hide" [style width 500px] {
	division class="modal-header" {
	    put [url x "#" class="close" data-dismiss="modal"]
	    h3 [strong $::id]
	}

	textarea ta= type=text class="modal-body" [style width 470px min-height 300px border 0 outline none!important background #F9FAD7] eid="$::id"

	division class="modal-footer" {
	    put [url "Update"     "#" class="btn btn-small btn-success pull-left" onclick="doit('$::id')"]
	    put [url "Save"       "#" class="btn btn-small btn-primary pull-left" data-dismiss="modal" id="editable-save" onclick="editableSave()"]
	    put [url "Remove ALL" "#" class="btn btn-small btn-danger pull-right" onclick="jQuery('#sure').slideToggle('slow')" id="ask-me"]
	}

	division [style background yellow padding 10px color steelblue border-top "1px #CCC solid" display none] id="sure" class="clearfix" {
	    division {
		put "This will reset all your changes to all screens back to default settings.<BR>Are you sure you want to do that?"
	    }

	    division [style padding 5px] class="pull-right" {
		put [url "Cancel" "#" class="btn btn-mini pull-right" onclick="jQuery('#sure').slideToggle('slow')"]
	    }
	    division [style padding 5px] class="pull-right" {
		put [url "Yes, Reset All" "#" class="btn btn-mini btn-danger" id="remove-all" data-dismiss="modal" onclick="removeAll()"]
	    }
	}
    }

    javascript {
	put [subst {
	    var v = jQuery("#$::id").html();

	    jQuery("#tkEditableModal .modal-body").focus().val(v);

	    jQuery("#tkEditableModal").modal({keyboard:true, backdrop:false});
	}]
    }
}

######################################################
##### 
######################################################
m::proc -public e {
    {-id  "id"}
    {-class ""}
    args
} {
    Documentation goes here...
} {
    Trace

    set eid [lindex $args 0]
    set val [string trim [lstring [lrange $args 1 end]]]

    #IF WE HAVE THE DATA USE IT 
    if {[info exist ::user($eid,$::page)] == 0} {
	set v ""
    } else {
	set v $::user($eid,$::page)
    }
    
    if {$v == ""} {
	set v $val
    } else {
	set val $v
    }
    
    if {$class != ""} {
	set tmp "class"
    } else {
	set tmp "id"
    }

    set rval "<e $tmp=[lindex $args 0]>$val</e>"

    return $rval
}    

######################################################
##### 
######################################################
m::proc -public tk::editable::removeall {
} {
    Documentation goes here...
} {
    Trace
    
    javascript {
	put "jQuery('#tk-editable-dummy').slideToggle()"
    }

    tk::db::sqlite::query "delete from parts where role='$::role'"
    return
    
    javascript {
	put "document.location.reload()"
    }
}

######################################################
##### 
######################################################
m::proc -public tk::editable::save {
} {
    Documentation goes here...
} {
    Trace
    
    # javascript {
    # 	put {
    # 	    jQuery("#tk-editable-dummy").show();
    # 	}
    # }

    if {[catch {
	set last [lindex [split $::eid -] end]
	set page [join [lrange [split $::eid -] 0 end-1] -]
	
	set x [tk::db::sqlite::query "DELETE FROM parts WHERE role='$::role' AND page='$page' AND eid='$::eid'"]

	if {$x != ""} {
	    javascript {
		put "alert('$x')"
	    }
	}

	set rval [mydbh eval {INSERT OR REPLACE INTO parts (role, page, eid, value) VALUES ($::role, $page, $::eid, $::val)}]

	if {$rval != ""} {
	    javascript {
		put "alert('$rval')"
	    }
	}
    } e] != 0} {
	javascript {
	    put "alert('$e')"
	}
    }
}
