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

tk::include::codemirror

######################################################
#####
######################################################
m::proc -public tk::mirror {
    {-height 400px}
    -id:required
    -guts:required
} {
    Documentation goes here...
} {  
    Trace
    
    # ID OF "mycode-2" WILL RETURN EDITOR OF "mycode_2" FOR JS REASONS
    
    textarea v($id)=$guts id="$id" class="form-control"
    
    regsub -all {\-} $id "_" editor
    
    javascript {
	put [subst {
	    // MAKE TEXT AREA PRETTY
	    editor = CodeMirror.fromTextArea(document.getElementById("$id"), {
		lineWrapping: true,
		lineNumbers: true,
		matchBrackets: true,
		continueComments: "Enter",
		extraKeys: {"Ctrl-Q": "toggleComment"},
		styleActiveLine: true,
		mode : "javascript",
		htmlMode: true
	    });
	    
	    jQuery("#$id").next(".CodeMirror").css({
		"height":"$height",
		"border":"1px #CCC solid",
		"font-size": "13px"
	    });
	}]
    }
}

######################################################
##### 
######################################################
m::proc -public tk::editor {
    -file:required
} {
    Documentation goes here...
} {
    Trace
    
    division [style margin-bottom 50px border 0] {
	division [style padding-left 25px position fixed top 0 left 0 width 100% z-index 100 background #f7f7f7 border-bottom "1px #cecece solid" line-height 70px] {
	    button "Save Changes" class="btn btn-outline-primary" [style min-width 120px] onclick="publishIt()"
	    space 20 0
	    button "Format" class="btn btn-outline-success" onclick="autoformat()" [style min-width 120px]
	}

	division [style margin-top 68px] {
	    tk::mirror -height 100% -id "card" -guts [file:read $file]
	}

	javascript {
	    put {
		autoformat();

		function publishIt() {
		    var o = $({});
		    
		    jQuery.publish = function() {
			o.trigger.apply(o, arguments);
		    };
		    
		    console.log("PUBLISHED name: click", "card");
		    jQuery.publish("tk-editor", ["click", "card"]);
		}
	    }
	}
    }
}

