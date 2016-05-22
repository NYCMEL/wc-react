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
    namespace eval form {
	namespace eval upload {}
    }
}

######################################################
##### 
######################################################
m::proc -public tk::form::upload::init {
    -name:required
    {-id         {}}
    {-callback   {}}
    -guts:required
} {
    DOCUMENTATION GOES HERE...
} {
    Trace
    
    set id [expr {($id == "") ? "$name" : "$id"}]
    
    cgi_form "[URL]" enctype=multipart/form-data method="POST" name="$name" id=$id autocomplete="off" {
	export ajax=1
	export callback=$callback
	
	uplevel $guts
    }
}

######################################################
##### 
######################################################
m::proc -public tk::form::upload::cb {
} {
    Documentation goes here...
} {    
    Trace

    set cgi  [lindex $::file 0]
    set name [file tail [lindex $::file 1]]

    regsub -all {\[} $name "" name
    regsub -all {\]} $name "" name

    division class="alert alert-info" {
	h1 ==$::file==
	h1 "$name <small>- [commify [file size $cgi]](b)</small>"
    }
}

######################################################
##### 
######################################################
m::proc -public tk::form::upload::test {
} {
    DOCUMENTATION GOES HERE...
} {
    Trace
    
    tk::form::upload::init -name "test" -callback tk::form::upload::cb -guts {
	division class="clearfix" {
	    division class="pull-left" {
		file_button file class="btn btn-default" [style width 90%]
	    }
	    division class="pull-right" {
		division [style margin-top -35px] {
		    put "<button type='submit' id='upload-file' class='btn btn-default'><i class='fa fa-cloud-upload'></i></button>"
		}
	    }
	}
    }

    javascript {
	put {
	    jQuery(document).ready(function() {
		$("input[type=file]").addClass("form-control")

		if ($("input[type=file]").val() == "") {
		    $("#upload-file").attr("disabled","disabled");
		}

		$("input[type=file]").on("change", function() {
		    if ($("input[type=file]").val() != "") {
			$("#upload-file").removeAttr("disabled");
		    }
		});
	    });
	}
    }
}

