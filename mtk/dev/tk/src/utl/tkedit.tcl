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

namespace eval tke {}

if {[info exist language] == 0} {
    set language "en"
}

include "/tk/inc/tkedit.css"

set _eDB "$::starkit::topdir/../db/editable.db"

tk::db::sqlite::query -db "$::_eDB" "CREATE TABLE IF NOT EXISTS tke (id integer primary key, eid, value, lang, page, updated)"

######################################################
##### 
######################################################
m::proc -public tke::editable {
} {
    Documentation goes here...
} {    
    Trace

    javascript {
	put {
	    jQuery(document).ready(function() {
		$("e").dblclick(function() {
		    var tx = $.trim($(this).text());
		    var id = $(this).attr("id");
		    
		    $("#tk-editor-dialog #tk-editor-text").val(tx).attr("eid",id);
		    $("#hidden-id").val(id);
		    $("#tk-editor-dialog").modal();
		    $("#tk-editor-dialog #tk-editor-text").focus();

		    $("#tk-editor-text").keyup(function() {
			$("#tk-editor-save-button").removeAttr("disabled");
			console.log( "I've changed!");
		    });
		});

		tke.check();
	    });
	}
    }

    division id="tk-editor-dialog" class="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display:none" data-backdrop="static" {
	division class="modal-dialog" {
	    division class="modal-content" {
		division class="modal-body" {
		    division class="alert alert-danger" [style margin 0 padding 10px margin-bottom 10px] {
			p align=center [style color brown] {
			    <i class="fa fa-exclamation-triangle"></i>
			    <b>DO NOT</b><BR>Copy & Paste from Excel, Word etc. Funny characters break the database !
			}
		    }

		    tk::form -name "tk-editor-form" -callback "tke::save" -guts {
			put "<input type='hidden' name='id' id='hidden-id'>"
			textarea value= class="form-control" rows="12" id="tk-editor-text"

			division class="modal-footer" {
			    button "Close" type="button" class="btn btn-default" data-dismiss="modal"
			    submit_button action=Restore type="button" class="btn btn-danger"
			    submit_button action=[list Save changes] type="button" class="btn btn-primary" disabled id="tk-editor-save-button"
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
m::proc -public tke::save {
} {
    Documentation goes here...
} {
    Trace
    
    switch $::action {
	"Save changes" {
	    regsub -all "'" $::value "''" ::value

	    set qstr [subst {
		DELETE FROM tke where eid="$::id";
		
		INSERT INTO tke (id,eid,value,lang,page,updated)
		VALUES
		(null,'$::id','$::value','$::language','$::page',[clock seconds])
	    }]

	    set res [tk::db::sqlite::query -db "$::_eDB" $qstr]

	    if {$res == ""} {
		h3 align=center "Your changes are saved successfully"

		javascript {
		    put [subst {
			jQuery("#$::id").text("$::value");

			setTimeout(function(){
			    $("#tk-editor-dialog").modal("hide");
			}, 1000);

			console.log("Your changes are saved...");
		    }]
		}
	    } else {
		javascript {
		    put {
			console.log("ERROR: $res");
			//alert("ERROR: $res");
		    }
		}
	    }
	}
	"Restore" {
	    set qstr [subst {
		DELETE FROM tke where eid="$::id";
	    }]

	    tk::db::sqlite::query -db "$::_eDB" $qstr

	    javascript {
		put {
		    document.location.reload();
		}
	    }
	}
    }
}

######################################################
##### 
######################################################
m::proc -public tke::restore {
} {
    Documentation goes here...
} {
    Trace
    
    foreach eid [split $::ids ,] {
	set value [string trim [lstring [tk::db::sqlite::query -db "$::_eDB" "select value from tke where eid='$eid' and lang='$::language'"]]]
	
	if {$value != ""} {
	    regsub -all {\"} $value {\\"} value

	    javascript {
		put [subst {
		    jQuery("#$eid").text("$value")
		}]
	    }
	}
    }
}
